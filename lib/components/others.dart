import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

Widget divider({double? width, double height = 0.6, Color color = Colors.grey, EdgeInsets? padding}) => Container(
      margin: padding,
      width: width != null ? width : screenWidth,
      height: height,
      color: color,
    );

Widget dashedDivider({double? height}) => Row(
      children: <Widget>[
        for (int i = 0; i < 40; i++)
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: Divider(thickness: 1, height: height)),
                Expanded(child: Container()),
              ],
            ),
          ),
      ],
    );

Widget centerProgress() => const Center(child: CircularProgressIndicator());

Widget centerProgressCupertino() => const Center(child: CupertinoActivityIndicator());

Widget directionality({required final bool rtl, required final Widget child}) => Directionality(
      textDirection: rtl ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: child,
    );
