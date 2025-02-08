import 'package:u/utilities.dart';

abstract class UMessages {
  static String error() {
    if (UApp.locale() == "fa") return "خطا";
    return "Error";
  }

  static String userWithThisInfoAlreadyExist() {
    if (UApp.locale() == "fa") return "کاربر با این اطلاعات قبلا ثبت نام کرده است";
    return "User with this information is already exists.";
  }
}