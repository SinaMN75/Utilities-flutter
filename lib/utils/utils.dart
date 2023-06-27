import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:utilities/utilities.dart';

export 'constants.dart';
export 'dio_interceptor.dart';
export 'enums.dart';
export 'excel_to_json.dart';
export 'extensions/extension.dart';
export 'file.dart';
export 'get.dart';
export 'launch.dart';
export 'local_storage.dart';

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );

Color hexStringToColor(final String hexString) {
  if (hexString.isEmpty) return Colors.transparent;
  final StringBuffer buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String stringToHexColor(final Color color) => '#${color.value.toRadixString(16)}';

void copyToClipboard(final String text) async => await Clipboard.setData(ClipboardData(text: text));

void validateForm({required final GlobalKey<FormState> key, required final VoidCallback action}) {
  if (key.currentState!.validate()) action();
}

void shareText(final String text, {final String? subject}) => Share.share(text, subject: subject);

void shareFile(final List<String> file, final String text) => Share.shareXFiles(file.map(XFile.new).toList());

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


Future<String> appName() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.appName;
}

Future<String> appPackageName() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.packageName;
}

Future<String> appVersion() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

Future<String> appBuildNumber() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.buildNumber;
}

Future<void> showEasyLoading() => EasyLoading.show();

Future<void> dismissEasyLoading() => EasyLoading.dismiss();

Future<void> showEasyError() => EasyLoading.showError("");

bool isEasyLoadingShow() => EasyLoading.isShow;