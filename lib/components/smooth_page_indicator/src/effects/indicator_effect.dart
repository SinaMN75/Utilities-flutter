import 'package:flutter/material.dart';
import 'package:utilities/components/smooth_page_indicator/src/painters/indicator_painter.dart';

abstract class IndicatorEffect {
  const IndicatorEffect();

  IndicatorPainter buildPainter(int count, double offset);

  Size calculateSize(int count);

  int hitTestDots(double dx, int count, double current);
}

abstract class BasicIndicatorEffect extends IndicatorEffect {
  final double dotWidth;

  final double dotHeight;

  final double spacing;

  final double radius;

  final Color dotColor;

  final Color activeDotColor;

  final PaintingStyle paintStyle;

  final double strokeWidth;

  const BasicIndicatorEffect({
    required this.strokeWidth,
    required this.dotWidth,
    required this.dotHeight,
    required this.spacing,
    required this.radius,
    required this.dotColor,
    required this.paintStyle,
    required this.activeDotColor,
  }) : assert(dotWidth >= 0 && dotHeight >= 0 && spacing >= 0 && strokeWidth >= 0);

  @override
  Size calculateSize(int count) {
    return Size(dotWidth * count + (spacing * (count - 1)), dotHeight);
  }

  @override
  int hitTestDots(double dx, int count, double current) {
    var offset = -spacing / 2;
    for (var index = 0; index < count; index++) {
      if (dx <= (offset += dotWidth + spacing)) {
        return index;
      }
    }
    return -1;
  }
}
