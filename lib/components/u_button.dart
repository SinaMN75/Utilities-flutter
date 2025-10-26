import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

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
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: foregroundColor ?? Colors.white,
            ),
          )
        : _buildContent();

    Widget button;
    switch (type) {
      case UButtonType.elevated:
        button = _buildMaterialButton(ElevatedButton(onPressed: onTap, child: content), context);
        break;
      case UButtonType.outlined:
        button = _buildMaterialButton(OutlinedButton(onPressed: onTap, child: content), context);
        break;
      case UButtonType.text:
        button = _buildMaterialButton(TextButton(onPressed: onTap, child: content), context);
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
        );
        break;
      case UButtonType.cupertino:
        button = CupertinoButton(
          onPressed: enabled && !isLoading ? onTap : null,
          child: content,
          color: backgroundColor,
          padding: padding,
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
    children.add(Flexible(child: Text(title, textAlign: TextAlign.center, style: textStyle)));
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

  Widget _buildMaterialButton(Widget button, BuildContext context) => SizedBox(
        width: width ?? double.infinity,
        height: height ?? 46,
        child: button,
      );
}
