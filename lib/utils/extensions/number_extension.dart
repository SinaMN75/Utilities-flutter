import 'package:u/utilities.dart';

extension DoubleExtionsion on double {
  String toStringAsSmartRound({final int maxPrecision = 2}) {
    final String str = toString();
    try {
      if (str.contains('.')) {
        final List<String> split = str.split('');
        final List<String> mantissa = <String>[];
        final int periodIndex = str.indexOf('.');
        final String wholePart = str.substring(0, periodIndex);
        int numChars = 0;
        for (int i = periodIndex + 1; i < str.length; i++) {
          if (numChars >= maxPrecision) break;
          final String char = split[i];
          mantissa.add(char);
          numChars++;
        }
        if (mantissa.isNotEmpty) {
          int i = mantissa.length - 1;
          while (mantissa.isNotEmpty) {
            if (mantissa[i] != '0') break;
            i--;
            mantissa.removeLast();
          }
          if (mantissa.isNotEmpty) {
            return '$wholePart.${mantissa.join()}';
          }
        }
        return wholePart;
      }
    } catch (e) {}
    return str;
  }

  int toSafeInt({
    final int? minValue,
    final int? maxValue,
  }) {
    if (minValue == null && maxValue == null) {
      return toInt();
    }
    if (minValue != null) {
      if (this < minValue) {
        return minValue;
      }
    }
    if (maxValue != null) {
      if (this > maxValue) {
        return maxValue;
      }
    }
    return toInt();
  }
}

extension IntExtesion on int {
  int subtractClamping(
    final int subtract, {
    final int minValue = 0,
    final int maxValue = 999999999,
  }) =>
      (this - subtract).clamp(
        minValue,
        maxValue,
      );

  String toKMB() {
    if (this > 999 && this < 99999) {
      return "${(this / 1000).toStringAsFixed(1)} K";
    } else if (this > 99999 && this < 999999)
      return "${(this / 1000).toStringAsFixed(0)} K";
    else if (this > 999999 && this < 999999999)
      return "${(this / 1000000).toStringAsFixed(1)} M";
    else if (this > 999999999)
      return "${(this / 1000000000).toStringAsFixed(1)} B";
    else
      return toString();
  }

  String toRialMoneyPersian({final bool removeNegative = false}) => "${toString().separateNumbers3By3()} ریال".replaceAll(removeNegative ? "" : "-", "");

  String toTomanMoneyPersian({final bool removeNegative = false}) => "${toString().separateNumbers3By3()} تومان".replaceAll(removeNegative ? "" : "-", "");

  String rialToTomanMoneyPersian({final bool removeNegative = false}) => "${(this / 10).toString().separateNumbers3By3()} تومان ";

  String secondsToTimeLeft() {
    final int h = this ~/ 3600;
    final int m = (this - h * 3600) ~/ 60;
    final int s = this - (h * 3600) - (m * 60);

    final String hourLeft = h.toString().length < 2 ? "0$h" : h.toString();
    final String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();
    final String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    String result = "";

    if (minuteLeft == "00") {
      result = secondsLeft;
    } else if (hourLeft == "00") {
      result = "$minuteLeft:$secondsLeft";
    } else {
      result = "$hourLeft:$minuteLeft:$secondsLeft";
    }
    return result;
  }

  String getMonthName(final bool isJalali) => isJalali ? jalaliMonthName : gregorianMonthName;

  String get jalaliMonthName {
    switch (this) {
      case 1:
        return "فروردین";
      case 2:
        return "اردیبهشت";
      case 3:
        return "خرداد";
      case 4:
        return "تیر";
      case 5:
        return "مرداد";
      case 6:
        return "شهریور";
      case 7:
        return "مهر";
      case 8:
        return "آبان";
      case 9:
        return "آذر";
      case 10:
        return "دی";
      case 11:
        return "بهمن";
      case 12:
        return "اسفند";
      default:
        return '$this';
    }
  }

  String get gregorianMonthName {
    switch (this) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return '$this';
    }
  }
}

extension OptionalIntExtension on int? {
  String toRialMoneyPersian({final bool removeNegative = false}) => "${(this ?? 0).toString().separateNumbers3By3()} ریال".replaceAll(removeNegative ? "" : "-", "").trim();

  String toTomanMoneyPersian({final bool removeNegative = false}) => "${(this ?? 0).toString().separateNumbers3By3()} تومان".replaceAll(removeNegative ? "" : "-", "").trim();

  String rialToTomanMoneyPersian({final bool removeNegative = false}) => "${((this ?? 0) / 10).toString().separateNumbers3By3()} تومان".replaceAll(removeNegative ? "" : "-", "").trim();
}
