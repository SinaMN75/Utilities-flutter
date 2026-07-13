import "package:u/utilities.dart";

/// Detected category of a file for compression routing.
enum UCompressType {
  image,
  video,
  unsupported,
}

/// One-stop cross-platform, `Uint8List`-based file-size reducer.
///
/// Everything is bytes in / bytes out so it works the same on every platform
/// and integrates with `FileData.bytes`, network uploads, etc.
///
/// - Images: `flutter_image_compress` `compressWithList` — fully cross-platform
///   INCLUDING web (Android/iOS/macOS/web). Lossy re-encode, still a valid image.
/// - Video: `video_compress` (Android/iOS/macOS) via a temp-file round-trip.
///   There is NO native web video codec in Flutter, so on web `video`/`compress`
///   return the bytes unchanged unless you pass a [webVideoCompressor] hook
///   (e.g. a server endpoint or an ffmpeg.wasm implementation).
///
/// Example:
/// ```dart
/// // 1. Auto-detect by extension, bytes in / bytes out.
/// final Uint8List smaller = await UCompress.compress(
///   bytes: file.bytes!,
///   extension: file.extension ?? "jpg",
/// );
///
/// // 2. Image only (works on web too).
/// final Uint8List img = await UCompress.image(bytes: pickedBytes, quality: 70);
///
/// // 3. Video on Android/iOS/macOS; server fallback for web.
/// final Uint8List vid = await UCompress.video(
///   bytes: videoBytes,
///   extension: "mp4",
///   webVideoCompressor: (Uint8List b) async => myServerCompress(b),
/// );
///
/// // 4. Watch progress while a video compresses.
/// UCompress.onVideoProgress((double p) => debugPrint("video: $p%"));
/// ```
abstract class UCompress {
  static const Set<String> _imageExtensions = <String>{"jpg", "jpeg", "png", "webp", "heic", "heif"};
  static const Set<String> _videoExtensions = <String>{"mp4", "mov", "m4v", "avi", "mkv", "3gp", "webm"};

  /// Classify a file by its extension so [compress] can route it.
  static UCompressType typeOf(final String? extension) {
    if (extension == null) return UCompressType.unsupported;
    final String ext = extension.toLowerCase().replaceFirst(".", "");
    if (_imageExtensions.contains(ext)) return UCompressType.image;
    if (_videoExtensions.contains(ext)) return UCompressType.video;
    return UCompressType.unsupported;
  }

  /// Reduce [bytes], auto-detecting image vs video from [extension].
  ///
  /// Always returns usable bytes: the compressed result, or the original bytes
  /// when the type is unsupported (or web video without a [webVideoCompressor]).
  static Future<Uint8List> compress({
    required final Uint8List bytes,
    required final String extension,
    final int imageQuality = 80,
    final int imageMinWidth = 1080,
    final int imageMinHeight = 1080,
    final CompressFormat imageFormat = CompressFormat.jpeg,
    final VideoQuality videoQuality = VideoQuality.MediumQuality,
    final bool videoIncludeAudio = true,
    final Future<Uint8List> Function(Uint8List bytes)? webVideoCompressor,
  }) async {
    switch (typeOf(extension)) {
      case UCompressType.image:
        return image(bytes: bytes, quality: imageQuality, minWidth: imageMinWidth, minHeight: imageMinHeight, format: imageFormat);
      case UCompressType.video:
        return video(bytes: bytes, extension: extension, quality: videoQuality, includeAudio: videoIncludeAudio, webVideoCompressor: webVideoCompressor);
      case UCompressType.unsupported:
        return bytes;
    }
  }

  /// Compress image [bytes] on ANY platform (web included).
  ///
  /// `minWidth`/`minHeight` cap the largest dimension while preserving aspect
  /// ratio; `quality` is 1-100. Falls back to JPEG if the requested [format]
  /// is unsupported on the current device. Returns the original bytes if the
  /// result would be larger.
  static Future<Uint8List> image({
    required final Uint8List bytes,
    final int quality = 80,
    final int minWidth = 1080,
    final int minHeight = 1080,
    final CompressFormat format = CompressFormat.jpeg,
  }) async {
    Uint8List result;
    try {
      result = await FlutterImageCompress.compressWithList(bytes, quality: quality, minWidth: minWidth, minHeight: minHeight, format: format);
    } on UnsupportedError {
      // Device lacks the requested encoder (e.g. heic/webp) -> retry as jpeg.
      result = await FlutterImageCompress.compressWithList(bytes, quality: quality, minWidth: minWidth, minHeight: minHeight);
    }
    return result.lengthInBytes < bytes.lengthInBytes ? result : bytes;
  }

  /// Compress video [bytes] and get compressed bytes back.
  ///
  /// Native platforms (Android/iOS/macOS): writes [bytes] to a temp file with
  /// [extension], runs `video_compress`, then reads the result back. Web has no
  /// native video codec, so it defers to [webVideoCompressor] if supplied,
  /// otherwise returns [bytes] unchanged.
  static Future<Uint8List> video({
    required final Uint8List bytes,
    final String extension = "mp4",
    final VideoQuality quality = VideoQuality.MediumQuality,
    final bool includeAudio = true,
    final Future<Uint8List> Function(Uint8List bytes)? webVideoCompressor,
  }) async {
    if (kIsWeb) return webVideoCompressor != null ? webVideoCompressor(bytes) : bytes;

    // video_compress is path-based, so round-trip through a temp file that
    // keeps the real extension (some decoders rely on it).
    final Directory dir = await getTemporaryDirectory();
    final File input = await File("${dir.path}/uc_${DateTime.now().microsecondsSinceEpoch}.$extension").writeAsBytes(bytes);
    try {
      final MediaInfo? info = await VideoCompress.compressVideo(input.path, quality: quality, includeAudio: includeAudio);
      final String? outPath = info?.path;
      if (outPath == null) return bytes;
      final Uint8List result = await File(outPath).readAsBytes();
      return result.lengthInBytes < bytes.lengthInBytes ? result : bytes;
    } finally {
      if (await input.exists()) await input.delete();
    }
  }

  /// Subscribe to live video-compression progress (0-100).
  static void onVideoProgress(final void Function(double progress) onProgress) => VideoCompress.compressProgress$.subscribe(onProgress);

  /// Cancel an in-flight video compression.
  static Future<void> cancelVideo() => VideoCompress.cancelCompression();

  /// Delete temporary files created by video compression.
  static Future<bool?> clearVideoCache() => VideoCompress.deleteAllCache();
}
