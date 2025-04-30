import 'package:http/http.dart' as http;
import 'package:u/utilities.dart';

class CachedNetworkImage extends StatefulWidget {
  final String imageUrl;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.placeholder,
    this.errorWidget,
    this.width,
    this.height,
    this.fit,
  });

  @override
  _CachedNetworkImageState createState() => _CachedNetworkImageState();
}

class _CachedNetworkImageState extends State<CachedNetworkImage> {
  late Future<Uint8List?> _imageDataFuture;

  @override
  void initState() {
    super.initState();
    _imageDataFuture = _loadImage();
  }

  Future<Uint8List?> _loadImage() async {
    // Check if cached in SharedPreferences
    final String? cachedBase64 = ULocalStorage.getString(widget.imageUrl);
    if (cachedBase64 != null) {
      return base64.decode(cachedBase64);
    }

    // If not cached, download and store
    try {
      final http.Response response = await http.get(Uri.parse(widget.imageUrl));
      if (response.statusCode == 200) {
        final Uint8List bytes = response.bodyBytes;
        // Cache as base64
        ULocalStorage.set(widget.imageUrl, base64.encode(bytes));
        return bytes;
      }
    } catch (e) {
      print("Failed to load image: $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _imageDataFuture,
      builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.placeholder ?? const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return widget.errorWidget ?? const Icon(Icons.error);
        } else {
          return Image.memory(
            snapshot.data!,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
          );
        }
      },
    );
  }
}
