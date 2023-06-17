import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

Future<Uint8List> screenshot({required final Widget widget}) async {
  final ScreenshotController screenshotController = ScreenshotController();
  return await screenshotController.captureFromWidget(widget);
}
