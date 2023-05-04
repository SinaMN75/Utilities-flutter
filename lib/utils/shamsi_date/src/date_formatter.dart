library date_formatter;

import 'date.dart';

abstract class DateFormatter {
  DateFormatter(this.date) {
    ArgumentError.checkNotNull(date, 'date');
  }

  final Date date;

  String get y {
    final int year = date.year;

    if (year < 0) {
      throw StateError('date.year = $year < 0');
    }

    return year.toString();
  }

  String get yyyy {
    final int year = date.year;

    if (year < 0) {
      throw StateError('date.year = $year < 0');
    }

    if (year > 9999) {
      throw StateError('date.year = $year > 9999');
    }

    final String str = year.toString();

    switch (str.length) {
      case 4:
        return str;
      case 3:
        return '0$str';
      case 2:
        return '00$str';
      case 1:
        return '000$str';
      default:
        return '0000';
    }
  }

  String get yy {
    final int year = date.year;

    if (year < 1000) {
      throw StateError("date.year = $year < 1000");
    }

    if (year > 9999) {
      throw StateError("date.year = $year > 9999");
    }

    final String str = (year % 100).toString();
    return str.length == 1 ? '0$str' : str;
  }

  String get m => date.month.toString();

  String get mm {
    final String str = m;
    return str.length == 1 ? '0$str' : str;
  }

  String get mN;

  String get d => date.day.toString();

  String get dd {
    final String str = d;
    return str.length == 1 ? '0$str' : str;
  }

  String get wN;
}
