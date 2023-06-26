import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class DottedBorder extends StatelessWidget {
  DottedBorder({required this.child, super.key, this.color = Colors.black, this.strokeWidth = 1, this.borderType = BorderType.Rect, this.dashPattern = const <double>[3, 1], this.padding = const EdgeInsets.all(2), this.radius = Radius.zero, this.strokeCap = StrokeCap.butt, this.customPath}) {
    assert(_isValidDashPattern(dashPattern), 'Invalid dash pattern');
  }

  final Widget child;
  final EdgeInsets padding;
  final double strokeWidth;
  final Color color;
  final List<double> dashPattern;
  final BorderType borderType;
  final Radius radius;
  final StrokeCap strokeCap;
  final PathBuilder? customPath;

  @override
  Widget build(final BuildContext context) => Stack(children: <Widget>[Positioned.fill(child: CustomPaint(painter: _DashPainter(strokeWidth: strokeWidth, radius: radius, color: color, borderType: borderType, dashPattern: dashPattern, customPath: customPath, strokeCap: strokeCap))), Padding(padding: padding, child: child)]);

  bool _isValidDashPattern(final List<double>? dashPattern) {
    final Set<double>? _dashSet = dashPattern?.toSet();
    if (_dashSet == null) return false;
    if (_dashSet.length == 1 && _dashSet.elementAt(0) == 0.0) return false;
    if (_dashSet.isEmpty) return false;
    return true;
  }
}

enum BorderType { Circle, RRect, Rect, Oval }

typedef PathBuilder = Path Function(Size);

class _DashPainter extends CustomPainter {
  _DashPainter({this.strokeWidth = 2, this.dashPattern = const <double>[3, 1], this.color = Colors.black, this.borderType = BorderType.Rect, this.radius = Radius.zero, this.strokeCap = StrokeCap.butt, this.customPath}) {
    assert(dashPattern.isNotEmpty, 'Dash Pattern cannot be empty');
  }

  final double strokeWidth;
  final List<double> dashPattern;
  final Color color;
  final BorderType borderType;
  final Radius radius;
  final StrokeCap strokeCap;
  final PathBuilder? customPath;

  @override
  void paint(final Canvas canvas, final Size size) {
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;

    Path _path;
    if (customPath != null) {
      _path = dashPath(customPath!(size), dashArray: CircularIntervalList(dashPattern));
    } else {
      _path = _getPath(size);
    }

    canvas.drawPath(_path, paint);
  }

  Path _getPath(final Size size) {
    Path path;
    switch (borderType) {
      case BorderType.Circle:
        path = _getCirclePath(size);
        break;
      case BorderType.RRect:
        path = _getRRectPath(size, radius);
        break;
      case BorderType.Rect:
        path = _getRectPath(size);
        break;
      case BorderType.Oval:
        path = _getOvalPath(size);
        break;
    }

    return dashPath(path, dashArray: CircularIntervalList(dashPattern));
  }

  Path _getCirclePath(final Size size) {
    final double w = size.width;
    final double h = size.height;
    final double s = size.shortestSide;

    return Path()..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(w > s ? (w - s) / 2 : 0, h > s ? (h - s) / 2 : 0, s, s), Radius.circular(s / 2)));
  }

  Path _getRRectPath(final Size size, final Radius radius) => Path()..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), radius));

  Path _getRectPath(final Size size) => Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

  Path _getOvalPath(final Size size) => Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

  @override
  bool shouldRepaint(final _DashPainter oldDelegate) => oldDelegate.strokeWidth != strokeWidth || oldDelegate.color != color || oldDelegate.dashPattern != dashPattern || oldDelegate.borderType != borderType;
}

class DottedLine extends StatelessWidget {
  const DottedLine({final Key? key, this.dashHeight = 1, this.color = Colors.grey, this.dashWidth = 5, this.dashRadius = 0, this.space = 2.5}) : super(key: key);
  final double dashHeight;
  final Color color;
  final double dashWidth;
  final double dashRadius;
  final double space;

  @override
  Widget build(final BuildContext context) => LayoutBuilder(builder: (final BuildContext context, final BoxConstraints constraints) {
        final double boxWidth = constraints.constrainWidth();
        final int dashCount = (boxWidth / (dashWidth + space)).floor();
        return Flex(direction: Axis.horizontal, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: List<Widget>.generate(dashCount, (final _) => ClipRRect(borderRadius: BorderRadius.circular(dashRadius), child: SizedBox(width: dashWidth, height: dashHeight, child: DecoratedBox(decoration: BoxDecoration(color: color))))));
      });
}
