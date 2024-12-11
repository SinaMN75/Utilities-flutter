
import 'package:intl/intl.dart' as intl;
import 'package:utilities/utilities.dart';
import 'package:utilities/utilities2.dart';

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
