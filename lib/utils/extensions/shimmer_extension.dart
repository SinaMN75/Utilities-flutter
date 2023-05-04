import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:utilities/utilities.dart';

extension ShimmerEffect on Widget {
  Widget applyShimmer({final bool enable = true, final Color? baseColor, final Color? highlightColor}) {
    if (enable)
      return Shimmer.fromColors(
        baseColor: baseColor == null ? context.theme.cardColor : baseColor,
        highlightColor: highlightColor == null ? context.theme.primaryColor : highlightColor,
        enabled: enable,
        child: this,
      );
    else
      return this;
  }
}

enum ShimmerDirection { ltr, rtl, ttb, btt }

@immutable
class Shimmer extends StatefulWidget {
  final Widget child;
  final Duration period;
  final ShimmerDirection direction;
  final Gradient gradient;
  final int loop;
  final bool enabled;

  const Shimmer({
    required final this.child,
    required final this.gradient,
    final Key? key,
    final this.direction = ShimmerDirection.ltr,
    final this.period = const Duration(milliseconds: 1500),
    final this.loop = 0,
    final this.enabled = true,
  }) : super(key: key);

  Shimmer.fromColors({
    required final this.child,
    required final Color baseColor,
    required final Color highlightColor,
    final Key? key,
    final this.period = const Duration(milliseconds: 1500),
    final this.direction = ShimmerDirection.ltr,
    final this.loop = 0,
    final this.enabled = true,
  })  : gradient = LinearGradient(
          begin: Alignment.topLeft,
          colors: <Color>[baseColor, baseColor, highlightColor, baseColor, baseColor],
          stops: const <double>[0, 0.35, 0.5, 0.65, 1],
        ),
        super(key: key);

  @override
  _ShimmerState createState() => _ShimmerState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Gradient>('gradient', gradient, defaultValue: null));
    properties.add(EnumProperty<ShimmerDirection>('direction', direction));
    properties.add(DiagnosticsProperty<Duration>('period', period, defaultValue: null));
    properties.add(DiagnosticsProperty<bool>('enabled', enabled, defaultValue: null));
    properties.add(DiagnosticsProperty<int>('loop', loop, defaultValue: 0));
  }
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..addStatusListener((final AnimationStatus status) {
        if (status != AnimationStatus.completed) {
          return;
        }
        _count++;
        if (widget.loop <= 0) {
          _controller.repeat();
        } else if (_count < widget.loop) {
          _controller.forward(from: 0);
        }
      });
    if (widget.enabled) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(final Shimmer oldWidget) {
    if (widget.enabled) {
      _controller.forward();
    } else {
      _controller.stop();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(final BuildContext context) => AnimatedBuilder(
        animation: _controller,
        child: widget.child,
        builder: (final BuildContext context, final Widget? child) => _Shimmer(
          direction: widget.direction,
          gradient: widget.gradient,
          percent: _controller.value,
          child: child,
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

@immutable
class _Shimmer extends SingleChildRenderObjectWidget {
  final double percent;
  final ShimmerDirection direction;
  final Gradient gradient;

  const _Shimmer({
    required final this.percent,
    required final this.direction,
    required final this.gradient,
    final Widget? child,
  }) : super(child: child);

  @override
  _ShimmerFilter createRenderObject(final BuildContext context) => _ShimmerFilter(percent, direction, gradient);

  @override
  void updateRenderObject(final BuildContext context, final _ShimmerFilter shimmer) {
    shimmer.percent = percent;
    shimmer.gradient = gradient;
    shimmer.direction = direction;
  }
}

class _ShimmerFilter extends RenderProxyBox {
  ShimmerDirection _direction;
  Gradient _gradient;
  double _percent;

  _ShimmerFilter(this._percent, this._direction, this._gradient);

  @override
  ShaderMaskLayer? get layer => super.layer as ShaderMaskLayer?;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percent(final double newValue) {
    if (newValue == _percent) {
      return;
    }
    _percent = newValue;
    markNeedsPaint();
  }

  set gradient(final Gradient newValue) {
    if (newValue == _gradient) {
      return;
    }
    _gradient = newValue;
    markNeedsPaint();
  }

  set direction(final ShimmerDirection newDirection) {
    if (newDirection == _direction) {
      return;
    }
    _direction = newDirection;
    markNeedsLayout();
  }

  @override
  void paint(final PaintingContext context, final Offset offset) {
    if (child != null) {
      assert(needsCompositing, "");

      final double width = child!.size.width;
      final double height = child!.size.height;
      Rect rect;
      double dx, dy;
      if (_direction == ShimmerDirection.rtl) {
        dx = _offset(width, -width, _percent);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
      } else if (_direction == ShimmerDirection.ttb) {
        dx = 0.0;
        dy = _offset(-height, height, _percent);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else if (_direction == ShimmerDirection.btt) {
        dx = 0.0;
        dy = _offset(height, -height, _percent);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else {
        dx = _offset(-width, width, _percent);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
      }
      layer ??= ShaderMaskLayer();
      layer!
        ..shader = _gradient.createShader(rect)
        ..maskRect = offset & size
        ..blendMode = BlendMode.srcIn;
      context.pushLayer(layer!, super.paint, offset);
    } else {
      layer = null;
    }
  }

  double _offset(final double start, final double end, final double percent) => start + (end - start) * percent;
}
