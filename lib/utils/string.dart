part of '../utilities.dart';

int getDay(String date) => int.parse(date.substring(8, 10).append0());

int getMonth(String date) => int.parse(date.substring(5, 7).append0());

int getYear(String date) => int.parse(date.substring(0, 4).append0());

int getHour(String time) => int.parse(time.substring(0, 2).append0());

int getMinute(String time) => int.parse(time.substring(3, 5).append0());

extension StringExtension on String {
  bool isNumeric() {
    if (this == null) return false;
    return double.tryParse(this) != null;
  }

  String separateNumbers3By3() => this.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

  String append0() {
    if (this.length == 1)
      return "0$this";
    else
      return this;
  }

  String persianNumber() {
    var number = this;
    number = number.replaceAll("1", "۱");
    number = number.replaceAll("2", "۲");
    number = number.replaceAll("3", "۳");
    number = number.replaceAll("4", "۴");
    number = number.replaceAll("5", "۵");
    number = number.replaceAll("6", "۶");
    number = number.replaceAll("7", "۷");
    number = number.replaceAll("8", "۸");
    number = number.replaceAll("9", "۹");
    number = number.replaceAll("0", "۰");
    return number;
  }

  String englishNumber() {
    var number = this;
    number = number.replaceAll("۱", "1");
    number = number.replaceAll("۲", "2");
    number = number.replaceAll("۳", "3");
    number = number.replaceAll("۴", "4");
    number = number.replaceAll("۵", "5");
    number = number.replaceAll("۶", "6");
    number = number.replaceAll("۷", "7");
    number = number.replaceAll("۸", "8");
    number = number.replaceAll("۹", "9");
    number = number.replaceAll("۰", "0");
    return number;
  }

  String persianDayDay() {
    var day = this;
    day = day.replaceAll("Sunday", "یک شنبه");
    day = day.replaceAll("Monday", "دو شنبه");
    day = day.replaceAll("Tuesday", "سه شنبه");
    day = day.replaceAll("Wednesday", "چهار شنبه");
    day = day.replaceAll("Thursday", "پنج شنبه");
    day = day.replaceAll("Friday", "جمعه");
    day = day.replaceAll("Saturday", "شنبه");
    return day;
  }

  String englishDay() {
    var day = this;
    day = day.replaceAll("یک شنبه", "Sunday");
    day = day.replaceAll("دو‌شنبه", "Monday");
    day = day.replaceAll("سه‌شنبه", "Tuesday");
    day = day.replaceAll("چهار‌شنبه", "Tuesday");
    day = day.replaceAll("پنج‌شنبه", "Thursday");
    day = day.replaceAll("جمعه", "Friday");
    day = day.replaceAll("جمعه", "Friday");
    day = day.replaceAll("شنبه", "Saturday");
    return day;
  }

  String persianMonth() {
    var month = this;
    month = month.replaceAll("01", "فروردین");
    month = month.replaceAll("02", "اردیبهشت");
    month = month.replaceAll("03", "خرداد");
    month = month.replaceAll("04", "تیر");
    month = month.replaceAll("05", "مرداد");
    month = month.replaceAll("06", "شهریور");
    month = month.replaceAll("07", "مهر");
    month = month.replaceAll("08", "آبان");
    month = month.replaceAll("09", "آذر");
    month = month.replaceAll("10", "دی");
    month = month.replaceAll("11", "بهمن");
    month = month.replaceAll("12", "اسفند");
    return month;
  }

  String englishMonth() {
    var month = this;
    month = month.replaceAll("01", "January");
    month = month.replaceAll("02", "February");
    month = month.replaceAll("03", "March");
    month = month.replaceAll("04", "April");
    month = month.replaceAll("05", "May");
    month = month.replaceAll("06", "June");
    month = month.replaceAll("07", "July");
    month = month.replaceAll("08", "August");
    month = month.replaceAll("09", "September");
    month = month.replaceAll("10", "October");
    month = month.replaceAll("11", "November");
    month = month.replaceAll("12", "December");
    return month;
  }
}
