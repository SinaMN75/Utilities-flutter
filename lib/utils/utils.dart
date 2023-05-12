import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:utilities/utilities.dart';

export 'constants.dart';
export 'dio_interceptor.dart';
export 'enums.dart';
export 'extensions/align_extension.dart';
export 'extensions/date_extension.dart';
export 'extensions/extension.dart';
export 'extensions/file_extension.dart';
export 'extensions/iterable_extension.dart';
export 'extensions/number_extension.dart';
export 'extensions/shimmer_extension.dart';
export 'extensions/string_extension.dart';
export 'extensions/text_extension.dart';
export 'extensions/widget_extension.dart';
export 'file.dart';
export 'get.dart';
export 'launch.dart';
export 'local_storage.dart';
export 'share.dart';

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );

Future<XFile> getCompressImageFile({
  required final File file,
  final int quality = 70,
  final bool advanceCompress = true,
}) async {
  int advanceQuality = 20;

  advanceQuality = (100 - ((file.lengthSync() / 1000000) * 0.85)).toInt();

  final Directory dir = Directory.systemTemp;
  final String targetPath = "${dir.absolute.path}/temp.jpg";
  final XFile? result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: advanceCompress ? advanceQuality : quality,
  );

  return result ?? XFile("--");
}

Future<Uint8List> getCompressImageFileWeb({
  required final Uint8List bytes,
  final int quality = 70,
  final bool advanceCompress = true,
}) async {
  int advanceQuality = 20;

  final Uint8List result = await FlutterImageCompress.compressWithList(
    bytes,
    quality: advanceCompress ? advanceQuality : quality,
  );

  return result;
}

Color hexStringToColor(final String hexString) {
  if (hexString.isEmpty) return Colors.transparent;
  final StringBuffer buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String stringToHexColor(final Color color) => '#${color.value.toRadixString(16)}';

void copyToClipboard(final String text) async => await Clipboard.setData(ClipboardData(text: text));
