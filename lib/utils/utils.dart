import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart' as intl;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_html/html.dart' as html;
import 'package:utilities/utilities.dart';
import 'package:utilities/utilities2.dart';

import 'persian_date_picker/persian_datetime_picker.dart';

part 'constants.dart';
part 'enums.dart';
part 'extensions/align_extension.dart';
part 'extensions/color_extension.dart';
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
part 'firebase.dart';
part 'fonts.dart';
part 'get.dart';
part 'http_interceptor.dart';
part 'internet_connection_checker.dart';
part 'launch.dart';
part 'local_auth.dart';
part 'local_storage.dart';
part 'location.dart';
part 'notification.dart';
part 'u_app_utils.dart';
part 'uuid.dart';
part 'view_models.dart';

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

String getPrice(final int i) => intl.NumberFormat('###,###,###,###,000').format(i);

bool hasMatch(final String? value, final String pattern) => (value == null) ? false : RegExp(pattern).hasMatch(value);

void logout({
  required final VoidCallback onLoggedOut,
  final String title = "خروج از سیستم",
  final String description = "آیا از خروج از سیستم اطمینان دارید؟",
  final VoidCallback? onCancelButtonTap,
  final String? yesButtonTitle = "بله",
  final String? cancelButtonTitle = 'انصراف',
}) =>
    showYesCancelDialog(
      title: title,
      description: description,
      onYesButtonTap: onLoggedOut,
      cancelButtonTitle: cancelButtonTitle,
      onCancelButtonTap: onCancelButtonTap,
      yesButtonTitle: yesButtonTitle,
    );

FormFieldValidator<String> validateMinLength(
  final int minLength, {
  final String minLengthMessage = "مقدار وارد شده صحیح نیست",
}) =>
    (final String? value) {
      if (value!.length < minLength) return minLengthMessage;
      return null;
    };

FormFieldValidator<String> validateNotEmpty({
  final String requiredMessage = "مقدار وارد شده صحیح نیست",
}) =>
    (final String? value) {
      if (value!.isEmpty) return requiredMessage;
      return null;
    };

FormFieldValidator<String> validateEmail({
  final String requiredMessage = "مقدار وارد شده صحیح نیست",
  final String notEmailMessage = "ایمیل وارد شده صحیح نیست",
}) =>
    (final String? value) {
      if (value!.isEmpty) return requiredMessage;
      if (!value.isEmail) return notEmailMessage;
      return null;
    };

FormFieldValidator<String> validatePhone({
  final String requiredMessage = "مقدار وارد شده صحیح نیست",
  final String notMobileMessage = "شماره موبایل وارد شده صحیح نیست",
}) =>
    (final String? value) {
      if (value!.isEmpty) return requiredMessage;
      if (!isPhoneNumber(value.englishNumber())) return notMobileMessage;
      return null;
    };

FormFieldValidator<String> validateNumber({
  final String requiredMessage = "مقدار وارد شده صحیح نیست",
  final String notMobileMessage = "شماره موبایل وارد شده صحیح نیست",
}) =>
    (final String? value) {
      if (value!.isEmpty) return requiredMessage;
      if (!GetUtils.isNumericOnly(value.englishNumber())) return notMobileMessage;
      return null;
    };

void showYesCancelDialog({
  required final String title,
  required final String description,
  required final VoidCallback onYesButtonTap,
  final VoidCallback? onCancelButtonTap,
  final String? yesButtonTitle = "بله",
  final String? cancelButtonTitle = 'انصراف',
}) =>
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (final BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(title).bodyLarge(),
        content: Text(description).bodyMedium(),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          SizedBox(
            child: button(
              width: MediaQuery.sizeOf(navigatorKey.currentContext!).width / 4,
              backgroundColor: Theme.of(navigatorKey.currentContext!).primaryColorDark,
              onTap: onCancelButtonTap ?? back,
              title: cancelButtonTitle,
              textStyle: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
            ),
          ),
          SizedBox(
            child: button(
              width: MediaQuery.sizeOf(navigatorKey.currentContext!).width / 4,
              onTap: onYesButtonTap,
              title: yesButtonTitle,
              textStyle: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );

bool isLoggedIn() => getString(UtilitiesConstants.token) == null ? false : true;

bool isPhoneNumber(final String s) {
  if (s.length > 16 || s.length < 9) return false;
  return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
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
