library gregorian_date;

import '../date.dart';
import '../date_exception.dart';
import '../jalali/jalali_date.dart';
import 'gregorian_formatter.dart';

class Gregorian implements Date, Comparable<Gregorian> {
  static const List<int> _MONTH_LENGTHS = <int>[31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  static final Gregorian MIN = Gregorian(560, 3, 20);

  static final Gregorian MAX = Gregorian(3798, 12, 31);

  @override
  final int year;

  @override
  final int month;

  @override
  final int day;

  @override
  int get julianDayNumber {
    int d = (((year + ((month - 8) ~/ 6) + 100100) * 1461) ~/ 4) + ((153 * ((month + 9) % 12) + 2) ~/ 5) + day - 34840408;
    d = d - ((((year + 100100 + ((month - 8) ~/ 6)) ~/ 100) * 3) ~/ 4) + 752;

    return d;
  }

  @override
  int get weekDay {
    return julianDayNumber % 7 + 1;
  }

  @override
  int get monthLength {
    if (month == 2) {
      return isLeapYear() ? 29 : 28;
    } else {
      return _MONTH_LENGTHS[month - 1];
    }
  }

  @override
  GregorianFormatter get formatter {
    return GregorianFormatter(this);
  }

  Gregorian(int year, [int month = 1, int day = 1])
      : year = year,
        month = month,
        day = day {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    if (year < 560 || year > 3798) {
      throw DateException('Gregorian date is out of computable range.');
    }

    if (month < 1 || month > 12) {
      throw DateException('Gregorian month is out of valid range.');
    }

    final ml = monthLength;

    if (day < 1 || day > ml) {
      throw DateException('Gregorian day is out of valid range.');
    }

    if (year == 560) {
      if (month < 3 || (month == 3 && day < 20)) {
        throw DateException('Gregorian date is out of computable range.');
      }
    }
  }

  factory Gregorian.fromJulianDayNumber(int julianDayNumber) {
    ArgumentError.checkNotNull(julianDayNumber, 'julianDayNumber');

    if (julianDayNumber < 1925675 || julianDayNumber > 3108616) {
      throw DateException('Julian day number is out of computable range.');
    }

    int j, i, gd, gm, gy;

    j = 4 * julianDayNumber + 139361631;
    j = j + ((((4 * julianDayNumber + 183187720) ~/ 146097) * 3) ~/ 4) * 4 - 3908;
    i = (((j % 1461)) ~/ 4) * 5 + 308;
    gd = (((i % 153)) ~/ 5) + 1;
    gm = (((i) ~/ 153) % 12) + 1;
    gy = ((j) ~/ 1461) - 100100 + ((8 - gm) ~/ 6);

    return Gregorian(gy, gm, gd);
  }

  factory Gregorian.fromDateTime(DateTime dateTime) {
    ArgumentError.checkNotNull(dateTime, 'dateTime');

    return Gregorian(dateTime.year, dateTime.month, dateTime.day);
  }

  factory Gregorian.fromJalali(Jalali date) {
    ArgumentError.checkNotNull(date, 'date');

    return Gregorian.fromJulianDayNumber(date.julianDayNumber);
  }

  factory Gregorian.now() {
    return Gregorian.fromDateTime(DateTime.now());
  }

  Gregorian copy({int? year, int? month, int? day}) {
    if (year == null && month == null && day == null) {
      return this;
    } else {
      return Gregorian(year ?? this.year, month ?? this.month, day ?? this.day);
    }
  }

  DateTime toDateTime() {
    return DateTime(year, month, day);
  }

  Jalali toJalali() {
    return Jalali.fromJulianDayNumber(julianDayNumber);
  }

  @override
  bool isLeapYear() {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        return year % 400 == 0;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  @override
  String toString() {
    return 'Gregorian($year, $month, $day)';
  }

  @override
  int compareTo(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

    if (year != other.year) {
      return year > other.year ? 1 : -1;
    }

    if (month != other.month) {
      return month > other.month ? 1 : -1;
    }

    if (day != other.day) {
      return day > other.day ? 1 : -1;
    }

    return 0;
  }

  bool operator >(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) > 0;
  }

  bool operator >=(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) >= 0;
  }

  bool operator <(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) < 0;
  }

  bool operator <=(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) <= 0;
  }

  Gregorian operator +(int days) {
    ArgumentError.checkNotNull(days, 'days');

    return addDays(days);
  }

  Gregorian operator -(int days) {
    ArgumentError.checkNotNull(days, 'days');

    return addDays(-days);
  }

  Gregorian add({int years = 0, int months = 0, int days = 0}) {
    ArgumentError.checkNotNull(years, 'years');
    ArgumentError.checkNotNull(months, 'months');
    ArgumentError.checkNotNull(days, 'days');

    if (years == 0 && months == 0 && days == 0) {
      return this;
    } else {
      return Gregorian(year + years, month + months, day + days);
    }
  }

  Gregorian addYears(int years) {
    ArgumentError.checkNotNull(years, 'years');

    if (years == 0) {
      return this;
    } else {
      return Gregorian(year + years, month, day);
    }
  }

  Gregorian addMonths(int months) {
    ArgumentError.checkNotNull(months, 'months');

    if (months == 0) {
      return this;
    } else {
      final int sum = month + months - 1;
      final int mod = sum % 12;
      final int deltaYear = (sum - mod) ~/ 12;

      return Gregorian(year + deltaYear, mod + 1, day);
    }
  }

  Gregorian addDays(int days) {
    ArgumentError.checkNotNull(days, 'days');

    if (days == 0) {
      return this;
    } else {
      return Gregorian.fromJulianDayNumber(julianDayNumber + days);
    }
  }

  Gregorian withYear(int year) {
    ArgumentError.checkNotNull(year, "year");

    if (year == this.year) {
      return this;
    } else {
      return Gregorian(year, month, day);
    }
  }

  Gregorian withMonth(int month) {
    ArgumentError.checkNotNull(month, "month");

    if (month == this.month) {
      return this;
    } else {
      return Gregorian(year, month, day);
    }
  }

  Gregorian withDay(int day) {
    ArgumentError.checkNotNull(day, "day");

    if (day == this.day) {
      return this;
    } else {
      return Gregorian(year, month, day);
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is Gregorian && runtimeType == other.runtimeType && year == other.year && month == other.month && day == other.day;
  }

  @override
  int get hashCode {
    return year.hashCode ^ month.hashCode ^ day.hashCode;
  }

  @override
  int daysInMonth(int monthNum, int year) {
    throw UnimplementedError();
  }

  @override
  String dayName(int weekDay) {
    throw UnimplementedError();
  }

  @override
  String monthName(int month) {
    throw UnimplementedError();
  }

  @override
  String stringDate() {
    throw UnimplementedError();
  }
}
