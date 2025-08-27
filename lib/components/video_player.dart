import "package:u/utilities.dart";

class UVideoPlayer extends StatefulWidget {
  const UVideoPlayer({
    required this.source,
    super.key,
    this.aspectRatio,
    this.autoPlay = false,
    this.looping = false,
    this.showControls = true,
    this.allowFullScreen = true,
    this.allowPlaybackSpeedChanging = true,
    this.controlsSafeArea = EdgeInsets.zero,
    this.onError,
    this.loadingIndicator,
    this.errorIndicator,
    this.showLoading = true,
    this.constraints,
    this.padding = EdgeInsets.zero,
    this.controller,
    this.customControls,
    this.placeholder,
    this.overlay,
  });

  final VideoPlayerSource source;
  final double? aspectRatio;
  final bool autoPlay;
  final bool looping;
  final bool showControls;
  final bool allowFullScreen;
  final bool allowPlaybackSpeedChanging;
  final EdgeInsets controlsSafeArea;
  final void Function(dynamic)? onError;
  final Widget? loadingIndicator;
  final Widget? errorIndicator;
  final bool showLoading;
  final BoxConstraints? constraints;
  final EdgeInsets padding;
  final ChewieController? controller;
  final Widget? customControls;
  final Widget? placeholder;
  final Widget? overlay;

  @override
  State<UVideoPlayer> createState() => _UVideoPlayerState();
}

class _UVideoPlayerState extends State<UVideoPlayer> {
  late final VideoPlayerController _videoController;
  late final ChewieController _chewieController;
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _videoController = widget.source.toVideoPlayerController()
      ..addListener(() {
        if (_videoController.value.isInitialized && widget.showLoading) {
          setState(() => _isLoading = false);
        }
        if (_videoController.value.hasError) {
          setState(() {
            _hasError = true;
            _errorMessage = _videoController.value.errorDescription ?? "Video playback failed";
          });
          widget.onError?.call(_errorMessage);
          if (context.mounted && widget.onError == null) {
            UNavigator.snackbar(message: _errorMessage ?? "Video playback failed");
          }
        }
      })
      ..initialize().then((_) => setState(() {}));

    _chewieController = widget.controller ??
        ChewieController(
          videoPlayerController: _videoController,
          aspectRatio: widget.aspectRatio ?? _videoController.value.aspectRatio,
          autoPlay: widget.autoPlay,
          looping: widget.looping,
          showControls: widget.showControls,
          allowFullScreen: widget.allowFullScreen,
          allowPlaybackSpeedChanging: widget.allowPlaybackSpeedChanging,
          controlsSafeAreaMinimum: widget.controlsSafeArea,
          customControls: widget.customControls,
          placeholder: widget.placeholder,
          overlay: widget.overlay,
          errorBuilder: (BuildContext context, String errorMessage) {
            setState(() {
              _hasError = true;
              _errorMessage = errorMessage;
            });
            return widget.errorIndicator ??
                Center(
                  child: Text(
                    errorMessage,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
                  ),
                );
          },
        );
  }

  @override
  void dispose() {
    _videoController.dispose();
    if (widget.controller == null) _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => UContainer(
        padding: widget.padding,
        constraints: widget.constraints,
        child: Stack(
          children: <Widget>[
            if (_hasError && widget.errorIndicator != null)
              widget.errorIndicator!
            else if (_hasError)
              Center(
                child: Text(
                  _errorMessage ?? "Video playback failed",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
                ),
              )
            else
              Chewie(controller: _chewieController),
            if (widget.showLoading && _isLoading && !_hasError) widget.loadingIndicator ?? const Center(child: CircularProgressIndicator()),
          ],
        ),
      );
}

// Helper class to unify video source types (file, network, asset)
class VideoPlayerSource {
  final String? url;
  final String? assetPath;
  final File? file;

  VideoPlayerSource.network(this.url)
      : assetPath = null,
        file = null;

  VideoPlayerSource.asset(this.assetPath)
      : url = null,
        file = null;

  VideoPlayerSource.file(this.file)
      : url = null,
        assetPath = null;

  VideoPlayerController toVideoPlayerController() {
    if (url != null) {
      return VideoPlayerController.networkUrl(Uri.parse(url!));
    } else if (assetPath != null) {
      return VideoPlayerController.asset(assetPath!);
    } else if (file != null) {
      return VideoPlayerController.file(file!);
    }
    throw ArgumentError("Invalid video source: At least one source type must be provided.");
  }
}
