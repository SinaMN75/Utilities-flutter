import 'package:flutter/material.dart';

import 'effects/indicator_effect.dart';
import 'effects/worm_effect.dart';

typedef OnDotClicked = void Function(int index);

class SmoothPageIndicator extends AnimatedWidget {
  final PageController controller;

  final IndicatorEffect effect;

  final Axis axisDirection;

  final int count;

  final TextDirection? textDirection;

  final OnDotClicked? onDotClicked;

  SmoothPageIndicator({
    Key? key,
    required this.controller,
    required this.count,
    this.axisDirection = Axis.horizontal,
    this.textDirection,
    this.onDotClicked,
    this.effect = const WormEffect(),
  }) : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    return SmoothIndicator(
      offset: _offset,
      count: count,
      effect: effect,
      textDirection: textDirection,
      axisDirection: axisDirection,
      onDotClicked: onDotClicked,
    );
  }

  double get _offset {
    try {
      var offset = controller.page ?? controller.initialPage.toDouble();
      return offset % count;
    } catch (_) {
      return controller.initialPage.toDouble();
    }
  }
}

class SmoothIndicator extends StatelessWidget {
  final double offset;

  final IndicatorEffect effect;

  final Axis axisDirection;

  final int count;

  final TextDirection? textDirection;

  final OnDotClicked? onDotClicked;

  final Size _size;

  SmoothIndicator({
    Key? key,
    required this.offset,
    required this.count,
    this.axisDirection = Axis.horizontal,
    this.effect = const WormEffect(),
    this.textDirection,
    this.onDotClicked,
  })  : _size = effect.calculateSize(count),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final isRTL = (textDirection ?? Directionality.of(context)) == TextDirection.rtl;

    return RotatedBox(
      quarterTurns: axisDirection == Axis.vertical
          ? 1
          : isRTL
              ? 2
              : 0,
      child: GestureDetector(
        onTapUp: _onTap,
        child: CustomPaint(
          size: _size,
          painter: effect.buildPainter(count, offset),
        ),
      ),
    );
  }

  void _onTap(details) {
    if (onDotClicked != null) {
      var index = effect.hitTestDots(
        details.localPosition.dx,
        count,
        offset,
      );
      if (index != -1 && index != offset.toInt()) {
        onDotClicked?.call(index);
      }
    }
  }
}

class AnimatedSmoothIndicator extends ImplicitlyAnimatedWidget {
  final int activeIndex;

  final IndicatorEffect effect;

  final Axis axisDirection;

  final int count;

  final TextDirection? textDirection;

  final Function(int index)? onDotClicked;

  AnimatedSmoothIndicator({
    Key? key,
    required this.activeIndex,
    required this.count,
    this.axisDirection = Axis.horizontal,
    this.textDirection,
    this.onDotClicked,
    this.effect = const WormEffect(),
    Curve curve = Curves.easeInOut,
    Duration duration = const Duration(milliseconds: 300),
    VoidCallback? onEnd,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
        );

  @override
  _AnimatedSmoothIndicatorState createState() => _AnimatedSmoothIndicatorState();
}

class _AnimatedSmoothIndicatorState extends AnimatedWidgetBaseState<AnimatedSmoothIndicator> {
  Tween<double>? _offset;

  @override
  void forEachTween(visitor) {
    _offset = visitor(
      _offset,
      widget.activeIndex.toDouble(),
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>;
  }

  @override
  Widget build(BuildContext context) {
    final offset = _offset;
    if (offset == null) {
      throw 'Offset has not been initialized';
    }

    return SmoothIndicator(
      offset: offset.evaluate(animation),
      count: widget.count,
      effect: widget.effect,
      textDirection: widget.textDirection,
      axisDirection: widget.axisDirection,
      onDotClicked: widget.onDotClicked,
    );
  }
}
