import 'package:u/utilities.dart';

extension WidgetsExtension on Widget {
  Widget pAll(final double padding) => Padding(padding: EdgeInsets.all(padding), child: this);

  Widget pSymmetric({final double horizontal = 0.0, final double vertical = 0.0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget pOnly({
    final double left = 0.0,
    final double top = 0.0,
    final double right = 0.0,
    final double bottom = 0.0,
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

  Widget onTapInk(final GestureTapCallback? onPressed) => InkWell(onTap: onPressed, child: this);

  Widget showMenus(final List<PopupMenuEntry<int>> items) => GestureDetector(
        onTapDown: (final TapDownDetails details) async {
          final Size screenSize = MediaQuery.of(navigatorKey.currentContext!).size;
          final double left = details.globalPosition.dx;
          final double top = details.globalPosition.dy;
          final double right = screenSize.width - details.globalPosition.dx;
          final double bottom = screenSize.height - details.globalPosition.dy;
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
        scrollDirection: scrollDirection,
        child: this,
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

  Align alignAtBottomCenter({final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment.bottomCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtTopLeft({final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment.topLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtBottomLeft({final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment.bottomLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtBottomRight({final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment.bottomRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtCenterLeft({final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment.centerLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtCenter({final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtCenterRight({final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment.centerRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtLERP(final Alignment a, final Alignment b, final double t, {final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment.lerp(a, b, t)!,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignXY(final double x, final double y, {final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment(x, y),
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtTopCenter({final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment.topCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  Align alignAtTopRight({final Key? key, final double? heightFactor, final double? widthFactor}) => Align(
        key: key,
        alignment: Alignment.topRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );
}
