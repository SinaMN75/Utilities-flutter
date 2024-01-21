part of '../utils.dart';

extension WidgetsExtension on Widget {
  Widget withTooltip(
    final String message, {
    final Decoration? decoration,
    final double? height,
    final bool? preferBelow,
    final EdgeInsetsGeometry? padding,
    final TextStyle? textStyle,
    final Duration? waitDuration,
    final EdgeInsetsGeometry? margin,
  }) =>
      Tooltip(
        message: message,
        decoration: decoration,
        height: height,
        padding: padding,
        preferBelow: preferBelow,
        textStyle: textStyle,
        waitDuration: waitDuration,
        margin: margin,
        child: this,
      );

  Widget fit() => FittedBox(key: key, fit: BoxFit.scaleDown, child: this);

  Widget expanded({final int flex = 1}) => Expanded(flex: flex, child: this);

  Widget shimmer({
    final Color? baseColor,
    final Color? highlightColor,
  }) =>
      Shimmer.fromColors(
        baseColor: baseColor ?? Get.context!.theme.primaryColorDark.withOpacity(0.1),
        highlightColor: highlightColor ?? Get.context!.theme.primaryColorDark.withOpacity(0.3),
        child: this,
      );

  Widget onTap(final GestureTapCallback? onPressed) => GestureDetector(onTap: onPressed, child: this);

  Widget showMenus(final List<PopupMenuEntry<int>> items, {bool? isActive}) => GestureDetector(
      onTapDown: (details) async {
        if (isActive ?? true) {
          final screenSize = MediaQuery.of(context).size;
          double left = details.globalPosition.dx; //
          double top = details.globalPosition.dy;
          double right = screenSize.width - details.globalPosition.dx;
          double bottom = screenSize.height - details.globalPosition.dy;
          await showMenu<int>(
            context: context,
            position: RelativeRect.fromLTRB(left, top, right, bottom),
            items: items,
          );
        }
      },
      child: this);


  Widget copyTextToClipboardOnTap(final String text, {final VoidCallback? action}) => onTap(() {
        copyToClipboard(text);
        if (action != null) action();
      });


  Widget onLongPress(final GestureTapCallback? onPressed) => GestureDetector(onLongPress: onPressed, child: this);

  Widget onDoubleTap(final GestureTapCallback? onPressed) => GestureDetector(onDoubleTap: onPressed, child: this);

  Widget ltr() => Directionality(textDirection: TextDirection.ltr, child: this);

  Widget rtl() => Directionality(textDirection: TextDirection.rtl, child: this);

  Widget scale(final double scale) => Transform.scale(scale: scale, child: this);

  Widget translate(final Offset offset) => Transform.translate(offset: offset, child: this);

  Widget rotate(final double scale) => Transform.rotate(angle: scale, child: this);

  Widget safeArea() => SafeArea(child: this);

  Widget scrollable({final Axis scrollDirection = Axis.vertical}) => SingleChildScrollView(
        child: this,
        scrollDirection: scrollDirection,
      );

  Widget cornerRadius({
    final double? all,
    final double topLeft = 0,
    final double topRight = 0,
    final double bottomLeft = 0,
    final double bottomRight = 0,
  }) =>
      radius(child: this, radius: all, bottomRight: bottomRight, bottomLeft: bottomLeft, topRight: topRight, topLeft: topLeft);

  Widget container({
    final double? width,
    final double? height,
    final Alignment? alignment,
    final Color? backgroundColor,
    final double borderWidth = 1,
    final double radius = 1,
    final Color borderColor = Colors.transparent,
    final EdgeInsets? padding,
    final EdgeInsets? margin,
    final BoxConstraints? constraints,
  }) =>
      Container(
        constraints: constraints,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        alignment: alignment,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: this,
      );
}
