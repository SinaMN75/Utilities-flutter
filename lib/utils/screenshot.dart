import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

Future<Uint8List> screenshot({required final Widget widget}) async => await ScreenshotController().captureFromWidget(widget);

void shareWidget({
  required final Widget widget,
}) async =>
    await ScreenshotController().capture(delay: const Duration(milliseconds: 10)).then((
      final Uint8List? image,
    ) async {
      if (image != null) {
        final Directory directory = await getApplicationDocumentsDirectory();
        final File imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);
        shareFile(<String>[imagePath.path], "");
      }
    });
