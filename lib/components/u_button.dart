import "package:u/utilities.dart";

enum UButtonType { elevated, text, outlined, icon, fab, cupertino, custom }

enum UButtonIconPosition { leading, trailing }

class UButton extends StatefulWidget {
  const UButton({
    required this.title,
    super.key,
    this.type = UButtonType.elevated,
    this.onTap,
    this.onLongPress,
    this.icon,
    this.iconPosition = UButtonIconPosition.leading,
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.textStyle,
    this.backgroundColor,
    this.gradient,
    this.foregroundColor,
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.elevation = 2,
    this.isLoading = false,
    this.enabled = true,
    this.tooltip,
    this.counter,
    this.counterDescription = "",
    this.onCounting,
  });

  final String title;
  final UButtonType type;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? icon;
  final UButtonIconPosition iconPosition;
  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? foregroundColor;
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final EdgeInsets padding;
  final double elevation;
  final bool isLoading;
  final bool enabled;
  final String? tooltip;
  final int? counter;
  final String? counterDescription;
  final Function(int)? onCounting;

  @override
  State<UButton> createState() => _UButtonState();
}

class _UButtonState extends State<UButton> {
  int counter = 0;
  late Timer timer;
  late String title;
  VoidCallback? onTap;
  bool enabled = true;

  @override
  void initState() {
    title = widget.title;
    onTap = widget.onTap;
    enabled = widget.enabled;
    if (widget.counter != null) {
      startTimer();
    }
    super.initState();
  }

  void startTimer() {
    counter = widget.counter!;
    onTap = null;
    enabled = false;
    timer = Timer.periodic(const Duration(seconds: 1), (final Timer timer) {
      setState(() {
        counter--;
        title = "$counter ${widget.counterDescription}";
        if (widget.onCounting != null) widget.onCounting!(counter);
        if (counter <= 1) {
          title = widget.title;
          timer.cancel();
          enabled = true;
          onTap = widget.onTap;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget content = widget.isLoading
        ? SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2, color: widget.foregroundColor ?? Colors.white),
          )
        : _buildContent();

    Widget button;

    switch (widget.type) {
      case UButtonType.elevated:
        button = ElevatedButton(
          onPressed: enabled && !widget.isLoading ? onTap : null,
          onLongPress: enabled && !widget.isLoading ? widget.onLongPress : null,
          style: _buildButtonStyle(),
          child: content,
        );
        break;
      case UButtonType.outlined:
        button = OutlinedButton(
          onPressed: enabled && !widget.isLoading ? onTap : null,
          onLongPress: enabled && !widget.isLoading ? widget.onLongPress : null,
          style: _buildButtonStyle(isOutlined: true),
          child: content,
        );
        break;
      case UButtonType.text:
        button = TextButton(
          onPressed: enabled && !widget.isLoading ? onTap : null,
          onLongPress: enabled && !widget.isLoading ? widget.onLongPress : null,
          style: _buildButtonStyle(),
          child: content,
        );
        break;
      case UButtonType.icon:
        button = IconButton(
          onPressed: enabled && !widget.isLoading ? onTap : null,
          icon: widget.icon ?? const SizedBox(),
          tooltip: widget.tooltip,
          color: widget.foregroundColor,
          splashRadius: widget.height != null ? widget.height! / 2 : 24,
        );
        break;
      case UButtonType.fab:
        button = FloatingActionButton.extended(
          onPressed: enabled && !widget.isLoading ? onTap : null,
          label: content,
          icon: widget.icon,
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.foregroundColor,
          elevation: widget.elevation,
        );
        break;
      case UButtonType.cupertino:
        button = CupertinoButton(
          onPressed: enabled && !widget.isLoading ? onTap : null,
          color: widget.backgroundColor,
          padding: widget.padding,
          disabledColor: widget.backgroundColor?.withValues(alpha: 0.5) ?? CupertinoColors.quaternarySystemFill,
          child: content,
        );
        break;
      case UButtonType.custom:
        button = InkWell(
          onTap: enabled && !widget.isLoading ? onTap : null,
          onLongPress: enabled && !widget.isLoading ? widget.onLongPress : null,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: Container(
            width: widget.width ?? double.infinity,
            height: widget.height ?? 46,
            padding: widget.padding,
            decoration: BoxDecoration(
              color: widget.gradient == null ? widget.backgroundColor : null,
              gradient: widget.gradient,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: widget.borderColor != null ? Border.all(color: widget.borderColor!, width: widget.borderWidth) : null,
            ),
            alignment: Alignment.center,
            child: content,
          ),
        );
        break;
    }

    if (widget.tooltip != null && widget.tooltip!.isNotEmpty && widget.type != UButtonType.icon) {
      return Tooltip(message: widget.tooltip, child: button);
    }

    return button;
  }

  Widget _buildContent() {
    if (widget.icon == null) return Text(title, textAlign: TextAlign.center, style: widget.textStyle);

    final List<Widget> children = <Widget>[];
    if (widget.iconPosition == UButtonIconPosition.leading) {
      children.add(widget.icon!);
      children.add(const SizedBox(width: 8));
    }
    children.add(
      Flexible(
        child: Text(title, textAlign: TextAlign.center, style: widget.textStyle),
      ),
    );
    if (widget.iconPosition == UButtonIconPosition.trailing) {
      children.add(const SizedBox(width: 8));
      children.add(widget.icon!);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  ButtonStyle _buildButtonStyle({bool isOutlined = false}) {
    final Color effectiveBackground = widget.backgroundColor ?? (widget.type == UButtonType.elevated ? Theme.of(navigatorKey.currentContext!).colorScheme.primary : Colors.transparent);
    final Color effectiveForeground = widget.foregroundColor ?? (widget.type == UButtonType.elevated ? Colors.white : Theme.of(navigatorKey.currentContext!).colorScheme.primary);

    return ButtonStyle(
      textStyle: WidgetStateProperty.all(widget.textStyle),
      backgroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (widget.gradient != null) return null;
        if (!enabled) return effectiveBackground.withAlpha(50);
        if (states.contains(WidgetState.pressed)) return effectiveBackground.withAlpha(50);
        return effectiveBackground;
      }),
      foregroundColor: WidgetStateProperty.all(effectiveForeground),
      padding: WidgetStateProperty.all(widget.padding),
      minimumSize: WidgetStateProperty.all(Size(widget.minWidth ?? 0, widget.minHeight ?? 0)),
      maximumSize: WidgetStateProperty.all(Size(widget.maxWidth ?? double.infinity, widget.maxHeight ?? double.infinity)),
      fixedSize: WidgetStateProperty.all(Size(widget.width ?? double.infinity, widget.height ?? 46)),
      elevation: WidgetStateProperty.all(widget.type == UButtonType.elevated ? widget.elevation : 0),
      side: WidgetStateProperty.all(BorderSide(color: widget.borderColor ?? Colors.transparent, width: widget.borderWidth)),
    );
  }
}
