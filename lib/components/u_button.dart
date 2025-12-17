import "package:u/utilities.dart";

enum UButtonType { elevated, text, outlined, icon, fab, cupertino, custom }

enum UButtonIconPosition { leading, trailing }

class UButton extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final Widget content = isLoading
        ? SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2, color: foregroundColor ?? Colors.white),
          )
        : _buildContent();

    Widget button;

    switch (type) {
      case UButtonType.elevated:
        button = ElevatedButton(
          onPressed: enabled && !isLoading ? onTap : null,
          onLongPress: enabled && !isLoading ? onLongPress : null,
          style: _buildButtonStyle(),
          child: content,
        );
        break;
      case UButtonType.outlined:
        button = OutlinedButton(
          onPressed: enabled && !isLoading ? onTap : null,
          onLongPress: enabled && !isLoading ? onLongPress : null,
          style: _buildButtonStyle(isOutlined: true),
          child: content,
        );
        break;
      case UButtonType.text:
        button = TextButton(
          onPressed: enabled && !isLoading ? onTap : null,
          onLongPress: enabled && !isLoading ? onLongPress : null,
          style: _buildButtonStyle(),
          child: content,
        );
        break;
      case UButtonType.icon:
        button = IconButton(
          onPressed: enabled && !isLoading ? onTap : null,
          icon: icon ?? const SizedBox(),
          tooltip: tooltip,
          color: foregroundColor,
          splashRadius: height != null ? height! / 2 : 24,
        );
        break;
      case UButtonType.fab:
        button = FloatingActionButton.extended(
          onPressed: enabled && !isLoading ? onTap : null,
          label: content,
          icon: icon,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: elevation,
        );
        break;
      case UButtonType.cupertino:
        button = CupertinoButton(
          onPressed: enabled && !isLoading ? onTap : null,
          color: backgroundColor,
          padding: padding,
          disabledColor: backgroundColor?.withValues(alpha: 0.5) ?? CupertinoColors.quaternarySystemFill,
          child: content,
        );
        break;
      case UButtonType.custom:
        button = InkWell(
          onTap: enabled && !isLoading ? onTap : null,
          onLongPress: enabled && !isLoading ? onLongPress : null,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            width: width ?? double.infinity,
            height: height ?? 46,
            padding: padding,
            decoration: BoxDecoration(
              color: gradient == null ? backgroundColor : null,
              gradient: gradient,
              borderRadius: BorderRadius.circular(borderRadius),
              border: borderColor != null ? Border.all(color: borderColor!, width: borderWidth) : null,
            ),
            alignment: Alignment.center,
            child: content,
          ),
        );
        break;
    }

    if (tooltip != null && tooltip!.isNotEmpty && type != UButtonType.icon) {
      return Tooltip(message: tooltip, child: button);
    }

    return button;
  }

  Widget _buildContent() {
    if (icon == null) return Text(title, textAlign: TextAlign.center, style: textStyle);

    final List<Widget> children = <Widget>[];
    if (iconPosition == UButtonIconPosition.leading) {
      children.add(icon!);
      children.add(const SizedBox(width: 8));
    }
    children.add(
      Flexible(
        child: Text(title, textAlign: TextAlign.center, style: textStyle),
      ),
    );
    if (iconPosition == UButtonIconPosition.trailing) {
      children.add(const SizedBox(width: 8));
      children.add(icon!);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  ButtonStyle _buildButtonStyle({bool isOutlined = false}) {
    final Color effectiveBackground = backgroundColor ?? (type == UButtonType.elevated ? Theme.of(navigatorKey.currentContext!).colorScheme.primary : Colors.transparent);
    final Color effectiveForeground = foregroundColor ?? (type == UButtonType.elevated ? Colors.white : Theme.of(navigatorKey.currentContext!).colorScheme.primary);

    return ButtonStyle(
      textStyle: WidgetStateProperty.all(textStyle),
      backgroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (gradient != null) return null;
        if (!enabled) return effectiveBackground.withAlpha(50);
        if (states.contains(WidgetState.pressed)) return effectiveBackground.withAlpha(50);
        return effectiveBackground;
      }),
      foregroundColor: WidgetStateProperty.all(effectiveForeground),
      padding: WidgetStateProperty.all(padding),
      minimumSize: WidgetStateProperty.all(Size(minWidth ?? 0, minHeight ?? 0)),
      maximumSize: WidgetStateProperty.all(Size(maxWidth ?? double.infinity, maxHeight ?? double.infinity)),
      fixedSize: WidgetStateProperty.all(Size(width ?? double.infinity, height ?? 46)),
      elevation: WidgetStateProperty.all(type == UButtonType.elevated ? elevation : 0),
      side: WidgetStateProperty.all(BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth)),
    );
  }
}
