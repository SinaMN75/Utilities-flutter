import 'package:utilities/utilities.dart';
import 'package:utilities/utilities3.dart';

bool _isEmpty(double? d) {
  return d == null || d == 0.0;
}

/// cornerdart migrate
class FDottedLineCorner {
  final double leftTopCorner;
  final double rightTopCorner;
  final double rightBottomCorner;
  final double leftBottomCorner;

  /// Specify the size of each rounded corner
  const FDottedLineCorner({
    this.leftTopCorner = 0,
    this.rightTopCorner = 0,
    this.rightBottomCorner = 0,
    this.leftBottomCorner = 0,
  });

  /// Set all rounded corners to one size
  FDottedLineCorner.all(double radius)
      : leftTopCorner = radius,
        rightTopCorner = radius,
        rightBottomCorner = radius,
        leftBottomCorner = radius;
}

class FDottedLine extends StatefulWidget {
  /// Dotted line color
  final Color color;

  /// height. If there is only [height] and no [width], you will get a dotted line in the vertical direction
  /// If there are both [width] and [height], you will get a dotted border.
  final double? height;

  /// width. If there is only [width] and no [height], you will get a dotted line in the horizontal direction
  /// If there are both [width] and [height], you will get a dotted border.
  final double? width;

  /// The thickness of the dotted line
  final double strokeWidth;

  /// The length of each small segment in the dotted line
  final double dottedLength;

  /// The distance between each segment in the dotted line
  final double space;

  /// The corners of the dotted border. See [FDottedLineCorner] for details
  final FDottedLineCorner? corner;

  /// If [child] is set, [FDottedLine] will serve as the dotted border of [child].
  /// At this time, [width] and [height] will no longer be valid.
  final Widget? child;

  /// [FDottedLine] provides developers with the ability to create dashed lines. It also supports creating a dashed border for a [Widget]. Support for controlling the thickness, spacing, and corners of the dotted border.
  FDottedLine({
    Key? key,
    this.color = Colors.black,
    this.height,
    this.width,
    this.dottedLength = 5.0,
    this.space = 3.0,
    this.strokeWidth = 1.0,
    this.corner,
    this.child,
  }) : super(key: key) {
    assert(width != null || height != null || child != null);
  }

  @override
  _FDottedLineState createState() => _FDottedLineState();
}

class _FDottedLineState extends State<FDottedLine> {
  double? childWidth;
  double? childHeight;
  GlobalKey childKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (_isEmpty(widget.width) && _isEmpty(widget.height) && widget.child == null) return Container();
    if (widget.child != null) {
      tryToGetChildSize();
      List<Widget> children = [];
      children.add(Container(
        clipBehavior: widget.corner == null ? Clip.none : Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.corner != null ? widget.corner!.leftTopCorner : 0.0),
            topRight: Radius.circular(widget.corner != null ? widget.corner!.rightTopCorner : 0.0),
            bottomLeft: Radius.circular(widget.corner != null ? widget.corner!.leftBottomCorner : 0.0),
            bottomRight: Radius.circular(widget.corner != null ? widget.corner!.rightBottomCorner : 0.0),
          ),
        ),
        key: childKey,
        child: widget.child,
      ));
      if (childWidth != null && childHeight != null) {
        children.add(dashPath(width: childWidth, height: childHeight));
      }
      return Stack(children: children);
    } else {
      return dashPath(width: widget.width, height: widget.height);
    }
  }

  void tryToGetChildSize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      try {
        RenderBox box = childKey.currentContext!.findRenderObject() as RenderBox;
        double tempWidth = box.size.width;
        double tempHeight = box.size.height;
        bool needUpdate = tempWidth != childWidth || tempHeight != childHeight;
        if (needUpdate) {
          setState(() {
            childWidth = tempWidth;
            childHeight = tempHeight;
          });
        }
      } catch (e) {}
    });
  }

  CustomPaint dashPath({double? width, double? height}) {
    return CustomPaint(
      size: Size(_isEmpty(width) ? widget.strokeWidth : width!, _isEmpty(height) ? widget.strokeWidth : height!),
      foregroundPainter: _DottedLinePainter()
        ..color = widget.color
        ..dottedLength = widget.dottedLength
        ..space = widget.space
        ..strokeWidth = widget.strokeWidth
        ..corner = widget.corner
        ..isShape = !_isEmpty(height) && !_isEmpty(width),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  late Color color;
  double? dottedLength;
  double? space;
  late double strokeWidth;
  late bool isShape;
  FDottedLineCorner? corner;
  Radius topLeft = Radius.zero;
  Radius topRight = Radius.zero;
  Radius bottomRight = Radius.zero;
  Radius bottomLeft = Radius.zero;

  @override
  void paint(Canvas canvas, Size size) {
    var isHorizontal = size.width > size.height;
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    /// line
    if (!isShape) {
      double length = isHorizontal ? size.width : size.height;
      double count = (length) / (dottedLength! + space!);
      if (count < 2.0) return;
      var startOffset = Offset(0, 0);
      for (int i = 0; i < count.toInt(); i++) {
        canvas.drawLine(startOffset, startOffset.translate((isHorizontal ? dottedLength! : 0), (isHorizontal ? 0 : dottedLength!)), paint);
        startOffset = startOffset.translate((isHorizontal ? (dottedLength! + space!) : 0), (isHorizontal ? 0 : (dottedLength! + space!)));
      }
    }

    /// shape
    else {
      Path path = Path();
      path.addRRect(
        RRect.fromLTRBAndCorners(
          0,
          0,
          size.width,
          size.height,
          topLeft: Radius.circular(corner != null ? corner!.leftTopCorner : 0.0),
          topRight: Radius.circular(corner != null ? corner!.rightTopCorner : 0.0),
          bottomLeft: Radius.circular(corner != null ? corner!.leftBottomCorner : 0.0),
          bottomRight: Radius.circular(corner != null ? corner!.rightBottomCorner : 0.0),
        ),
      );

      Path draw = buildDashPath(path, dottedLength, space);
      canvas.drawPath(draw, paint);
    }
  }

  Path buildDashPath(Path path, double? dottedLength, double? space) {
    final Path r = Path();
    for (PathMetric metric in path.computeMetrics()) {
      double start = 0.0;
      while (start < metric.length) {
        double end = start + dottedLength!;
        r.addPath(metric.extractPath(start, end), Offset.zero);
        start = end + space!;
      }
    }
    return r;
  }

  @override
  bool shouldRepaint(_DottedLinePainter oldDelegate) => true;
}
