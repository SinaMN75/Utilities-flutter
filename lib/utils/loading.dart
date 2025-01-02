import 'package:u/utilities.dart';

abstract class ULoading {
  static void showLoading() => EasyLoading.show();

  static void dismissLoading() => EasyLoading.dismiss();

  static void showError() => EasyLoading.showError("");

  bool isLoadingShow() => EasyLoading.isShow;
}