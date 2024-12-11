import 'package:utilities/utilities.dart';

extension DoubleExtionsion on double {
  String toStringAsSmartRound({int maxPrecision = 2}) {
    final str = toString();
    try {
      if (str.contains('.')) {
        final split = str.split('');
        final mantissa = <String>[];
        final periodIndex = str.indexOf('.');
        final wholePart = str.substring(0, periodIndex);
        int numChars = 0;
        for (var i = periodIndex + 1; i < str.length; i++) {
          if (numChars >= maxPrecision) break;
          final char = split[i];
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
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return str;
  }

  int toSafeInt({
    int? minValue,
    int? maxValue,
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
    int subtract, {
    int minValue = 0,
    int maxValue = 999999999,
  }) =>
      (this - subtract).clamp(
        minValue,
        maxValue,
      );

  String toKMB() {
    if (this > 999 && this < 99999)
      return "${(this / 1000).toStringAsFixed(1)} K";
    else if (this > 99999 && this < 999999)
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
}

extension OptionalIntExtension on int? {
  String toRialMoneyPersian({final bool removeNegative = false}) => "${(this ?? 0).toString().separateNumbers3By3()} ریال".replaceAll(removeNegative ? "" : "-", "").trim();

  String toTomanMoneyPersian({final bool removeNegative = false}) => "${(this ?? 0).toString().separateNumbers3By3()} تومان".replaceAll(removeNegative ? "" : "-", "").trim();

  String rialToTomanMoneyPersian({final bool removeNegative = false}) => "${((this ?? 0) / 10).toString().separateNumbers3By3()} تومان".replaceAll(removeNegative ? "" : "-", "").trim();
}
