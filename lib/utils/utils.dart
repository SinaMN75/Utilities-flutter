import 'dart:developer' as developer;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:utilities/utilities.dart';
import 'package:utilities/utilities2.dart';

part 'constants.dart';

part 'contacts.dart';

part 'enums.dart';

part 'extensions/align_extension.dart';

part 'extensions/color_extension.dart';

part 'extensions/comment_extension.dart';

part 'extensions/date_extension.dart';

part 'extensions/enums_extension.dart';

part 'extensions/file_extension.dart';

part 'extensions/iterable_extension.dart';

part 'extensions/number_extension.dart';

part 'extensions/shimmer_extension.dart';

part 'extensions/string_extension.dart';

part 'extensions/text_extension.dart';

part 'extensions/widget_extension.dart';

part 'file.dart';

part 'fonts.dart';

part 'get.dart';

part 'http_interceptor.dart';

part 'internet_connection_checker.dart';

part 'launch.dart';

part 'local_auth.dart';

part 'local_storage.dart';

part 'location.dart';

part 'notification.dart';

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

String colorToHexColor(final Color color) => color.value.toRadixString(16);

void copyToClipboard(final String text) async => await Clipboard.setData(ClipboardData(text: text));

void validateForm({required final GlobalKey<FormState> key, required final VoidCallback action}) {
  if (key.currentState!.validate()) action();
}

bool isNumeric(final String? s) {
  if (s == null) {
    return false;
  }
  final int res = int.tryParse(s) ?? 10000;
  return res != 10000;
}

void shareText(final String text, {final String? subject}) => Share.share(text, subject: subject);

void shareFile(final List<String> file, final String text) => Share.shareXFiles(file.map(XFile.new).toList());

void shareWidget({required final Widget widget}) async => await ScreenshotController().capture().then((final Uint8List? image) async {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File imagePath = await File('${directory.path}/image.png').create();
      await imagePath.writeAsBytes(image!);
      shareFile(<String>[imagePath.path], "");
    });

Future<Uint8List> screenshot({required final Widget widget}) => ScreenshotController().captureFromWidget(widget);

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

class MaskedTextInputFormatter extends TextInputFormatter {
  MaskedTextInputFormatter({required this.mask, required this.separator});

  final String? mask;
  final String? separator;

  @override
  TextEditingValue formatEditUpdate(final TextEditingValue oldValue, final TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask!.length) return oldValue;
        if (newValue.text.length < mask!.length && mask![newValue.text.length - 1] == separator)
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
          );
      }
    }
    return newValue;
  }
}

Future<bool> backToHomeWhenIndexIsNot0({required final int currentBottomNavigationIndex, required final VoidCallback action}) {
  final RxInt currentIndex = currentBottomNavigationIndex.obs;
  if (currentIndex.value == 0) {
    return Future<bool>.value(true);
  } else {
    currentIndex(0);
    action();
    return Future<bool>.value(false);
  }
}
