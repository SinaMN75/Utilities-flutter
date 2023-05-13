import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:utilities/components/components.dart';
import 'package:utilities/utils/extensions/shimmer_extension.dart';

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

  Widget fit() => FittedBox(key: key, child: this, fit: BoxFit.scaleDown);

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

  Widget ltr() => Directionality(textDirection: ui.TextDirection.ltr, child: this);

  Widget rtl() => Directionality(textDirection: ui.TextDirection.rtl, child: this);

  Widget scale(final double scale) => Transform.scale(scale: scale, child: this);

  Widget translate(final Offset offset) => Transform.translate(offset: offset, child: this);

  Widget rotate(final double scale) => Transform.rotate(angle: scale, child: this);

  Widget cornerRadius({
    final double? all,
    final double topLeft = 0,
    final double topRight = 0,
    final double bottomLeft = 0,
    final double bottomRight = 0,
  }) =>
      radius(child: this, radius: all, bottomRight: bottomRight, bottomLeft: bottomLeft, topRight: topRight, topLeft: topLeft);
}
