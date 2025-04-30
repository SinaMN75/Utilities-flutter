import 'dart:ui' as ui;

import 'package:u/utilities.dart';

class WidgetToImageController {
  GlobalKey? _globalKey;

  void bind(GlobalKey globalKey) {
    _globalKey = globalKey;
  }

  Future<Uint8List?> capture() async {
    if (_globalKey?.currentContext == null) return null;

    try {
      RenderRepaintBoundary boundary = _globalKey!.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      debugPrint('Error capturing widget: $e');
      return null;
    }
  }
}

class WidgetToImage extends StatefulWidget {
  final Widget child;
  final WidgetToImageController controller;

  const WidgetToImage({
    super.key,
    required this.child,
    required this.controller,
  });

  @override
  State<WidgetToImage> createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.controller.bind(_globalKey);
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(key: _globalKey, child: widget.child);
}
