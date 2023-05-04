import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

class AdminGradeWidget {
  static Widget gridHeader(final String title, {final double? fontSize}) => Center(
    child: Text(title, textAlign: TextAlign.center).displaySmall(fontSize: fontSize ?? 14),
  );

  static Widget gridRow(final String title) => Container(
    alignment: Alignment.center,
    child: Text(title, textAlign: TextAlign.center).bodyLarge(),
  );

  static Widget gridSwipeButton({
    required final String title,
    required final VoidCallback onTap,
    required final Color backgroundColor,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          color: backgroundColor,
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 15)),
        ),
      );

  static Widget getRow(final String value, {final double? fontSize, final Color? textColor, final AlignmentGeometry? alignment, final FontWeight? fontWeight}) => Container(
    alignment: alignment ?? Alignment.centerLeft,
    child: Text(value ).bodyLarge(fontSize: fontSize ?? 12, color: textColor ?? Colors.black87, fontWeight: fontWeight ?? FontWeight.w500),
  );

  static Widget getRowImage({
    required final String imageUrl,
    final Widget? imageDefault,
    final double imageRadius = 32,
    final Color? backgroundColor,
  }) =>
      Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            color: backgroundColor??const Color(0xff6898ff),
            child: imageUrl != "--"
                ? image(imageUrl, width: imageRadius, height: imageRadius)
                : Container(
              width: imageRadius,
              height: imageRadius,
              padding: const EdgeInsets.all(4),
              child: imageDefault ?? Icon(Icons.image_outlined, size: imageRadius - 8, color: Colors.white),
            ),
          ),
        ),

      );

  static Widget getRowColor(final String value, {final double? radius}) => Center(
      child: Container(
        width: radius ?? 36,
        height: radius ?? 36,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: hexStringToColor(value)),
      ));

  static Widget getRowEdit({
    required final GestureTapCallback onEditTap,
    required final GestureTapCallback onDeleteTap,
    final Widget? editWidgetDefault,
    final Widget? deleteWidgetDefault,
    final double? iconSize,
  }) =>
      Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.green,
                child: editWidgetDefault ?? Icon(Icons.edit, size: iconSize),
              ).onTap(onEditTap),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.red,
                child: deleteWidgetDefault ?? Icon(Icons.delete, size: iconSize),
              ).onTap(onDeleteTap),
            ],
          ));
}
