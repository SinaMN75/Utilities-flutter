import 'package:utilities/utilities.dart';

class ULoading {
  static void showLoading() => EasyLoading.show();

  static void dismissLoading() => EasyLoading.dismiss();

  static void showError() => EasyLoading.showError("");

  bool isLoadingShow() => EasyLoading.isShow;
}
