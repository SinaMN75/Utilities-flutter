import 'package:u/utilities.dart';

abstract class UMessages {
  static String error() => UApp.locale() == "fa" ? "خطا" : "Error";

  static String userWithThisInfoAlreadyExist() {
    if (UApp.locale() == "fa") return "کاربر با این اطلاعات قبلا ثبت نام کرده است";
    return "User with this information is already exists.";
  }
}