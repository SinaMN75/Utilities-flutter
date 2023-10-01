part of '../utils.dart';

extension AlignExtensions on Widget {
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
        alignment: Alignment.center,
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
