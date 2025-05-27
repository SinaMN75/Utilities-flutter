import 'package:flutter/material.dart';

class USegmentedControl<T> extends StatefulWidget {
  final Map<T, Widget> children;
  final T initialValue;
  final ValueChanged<T> onValueChanged;
  final Duration duration;
  final Curve curve;
  final bool isStretch;
  final BoxDecoration? decoration;
  final BoxDecoration? thumbDecoration;
  final EdgeInsets padding;
  final double innerPadding;
  final double? height;
  final double? width;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;

  const USegmentedControl({
    Key? key,
    required this.children,
    required this.initialValue,
    required this.onValueChanged,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.isStretch = true,
    this.decoration,
    this.thumbDecoration,
    this.padding = const EdgeInsets.all(8),
    this.innerPadding = 8.0,
    this.height,
    this.width,
    this.selectedTextStyle,
    this.unselectedTextStyle,
  }) : super(key: key);

  @override
  State<USegmentedControl<T>> createState() => _USegmentedControlState<T>();
}

class _USegmentedControlState<T> extends State<USegmentedControl<T>> with TickerProviderStateMixin {
  late T _currentValue;
  late AnimationController _controller;
  late Animation<double> _animation;
  double _thumbWidth = 0;
  double _thumbStart = 0;
  final GlobalKey _containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = const AlwaysStoppedAnimation<double>(0);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateThumbPosition(animated: false));
  }

  @override
  void didUpdateWidget(covariant USegmentedControl<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _currentValue = widget.initialValue;
      WidgetsBinding.instance.addPostFrameCallback((_) => _updateThumbPosition());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateThumbPosition({bool animated = true}) {
    final RenderBox? box = _containerKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;

    final double totalWidth = box.size.width;
    final int index = widget.children.keys.toList().indexOf(_currentValue);
    final double itemWidth = totalWidth / widget.children.length;
    final double newThumbPos = index * itemWidth;

    if (!animated) {
      setState(() {
        _thumbStart = newThumbPos;
        _thumbWidth = itemWidth;
        _animation = AlwaysStoppedAnimation<double>(_thumbStart);
      });
    } else {
      _animation = Tween<double>(begin: _thumbStart, end: newThumbPos).animate(
        CurvedAnimation(parent: _controller, curve: widget.curve),
      )..addListener(() => setState(() {}));
      _controller.forward(from: 0);
      _thumbWidth = itemWidth;
      _thumbStart = newThumbPos; // Update after animation starts
    }
  }

  void _onTap(T value) {
    if (value == _currentValue) return;

    setState(() {
      _currentValue = value;
    });
    _updateThumbPosition();
    widget.onValueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final List<T> keys = widget.children.keys.toList();
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final BoxDecoration defaultDecoration = widget.decoration ??
        BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
        );

    final BoxDecoration defaultThumbDecoration = widget.thumbDecoration ??
        BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        );

    final TextStyle defaultSelectedTextStyle = widget.selectedTextStyle ??
        theme.textTheme.labelLarge!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );

    final TextStyle defaultUnselectedTextStyle = widget.unselectedTextStyle ??
        theme.textTheme.labelLarge!.copyWith(
          color: theme.textTheme.labelLarge!.color,
        );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        key: _containerKey,
        width: widget.width ?? (widget.isStretch ? double.infinity : null),
        height: widget.height ?? 48,
        padding: widget.padding,
        decoration: defaultDecoration,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: _animation.value,
              width: _thumbWidth,
              top: 0,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.all(widget.innerPadding),
                decoration: defaultThumbDecoration,
              ),
            ),
            Row(
              children: keys.map((dynamic key) {
                final bool selected = key == _currentValue;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => _onTap(key),
                    behavior: HitTestBehavior.translucent,
                    child: Center(
                      child: DefaultTextStyle(
                        style: selected ? defaultSelectedTextStyle : defaultUnselectedTextStyle,
                        child: widget.children[key]!,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
