import 'package:utilities/utilities.dart';

extension WidgetsExtension on Widget {
  Widget pAll(double padding) => Padding(padding: EdgeInsets.all(padding), child: this);

  Widget pSymmetric({double horizontal = 0.0, double vertical = 0.0}) => Padding(padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: this);

  Widget pOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(padding: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom), child: this);

  Widget get pZero => Padding(padding: EdgeInsets.zero, child: this);

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

  Widget fit({final Alignment alignment = Alignment.center}) => FittedBox(
        key: key,
        alignment: alignment,
        fit: BoxFit.scaleDown,
        child: this,
      );

  Widget expanded({final int flex = 1}) => Expanded(flex: flex, child: this);

  Widget onTap(final GestureTapCallback? onPressed) => GestureDetector(onTap: onPressed, child: this);

  Widget showMenus(final List<PopupMenuEntry<int>> items) => GestureDetector(
        onTapDown: (details) async {
          final screenSize = MediaQuery.of(navigatorKey.currentContext!).size;
          double left = details.globalPosition.dx;
          double top = details.globalPosition.dy;
          double right = screenSize.width - details.globalPosition.dx;
          double bottom = screenSize.height - details.globalPosition.dy;
          await showMenu<int>(
            context: navigatorKey.currentContext!,
            position: RelativeRect.fromLTRB(left, top, right, bottom),
            items: items,
          );
        },
        child: this,
      );

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
        clipBehavior: Clip.hardEdge,
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
