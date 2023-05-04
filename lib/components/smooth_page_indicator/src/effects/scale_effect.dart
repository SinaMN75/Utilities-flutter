import 'package:flutter/material.dart';
import 'package:utilities/components/smooth_page_indicator/src/painters/indicator_painter.dart';
import 'package:utilities/components/smooth_page_indicator/src/painters/scale_painter.dart';

import 'indicator_effect.dart';

class ScaleEffect extends BasicIndicatorEffect {
  final PaintingStyle activePaintStyle;

  final double activeStrokeWidth;

  final double scale;

  const ScaleEffect({
    Color activeDotColor = Colors.indigo,
    this.activePaintStyle = PaintingStyle.fill,
    this.scale = 1.4,
    this.activeStrokeWidth = 1.0,
    double offset = 16.0,
    double dotWidth = 16.0,
    double dotHeight = 16.0,
    double spacing = 10.0,
    double radius = 16,
    Color dotColor = Colors.grey,
    double strokeWidth = 1.0,
    PaintingStyle paintStyle = PaintingStyle.fill,
  }) : super(
          dotWidth: dotWidth,
          dotHeight: dotHeight,
          spacing: spacing,
          radius: radius,
          strokeWidth: strokeWidth,
          paintStyle: paintStyle,
          dotColor: dotColor,
          activeDotColor: activeDotColor,
        );

  @override
  Size calculateSize(int count) {
    final scaledWidth = (dotWidth + (dotWidth * scale)) - dotWidth;
    return Size((dotWidth * count) + (spacing * (count - 1)) + scaledWidth, (dotHeight + scaledWidth));
  }

  @override
  IndicatorPainter buildPainter(int count, double offset) {
    return ScalePainter(count: count, offset: offset, effect: this);
  }
}
