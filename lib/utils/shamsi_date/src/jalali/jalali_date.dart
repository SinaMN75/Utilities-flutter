library jalali_date;

import '../date.dart';
import '../date_exception.dart';
import '../gregorian/gregorian_date.dart';
import 'jalali_formatter.dart';

class Jalali implements Date, Comparable<Jalali> {
  static final Jalali MIN = Jalali(-61, 1, 1);

  static final Jalali MAX = Jalali(3177, 10, 11);

  @override
  final int year;

  @override
  final int month;

  @override
  final int day;

  @override
  int get julianDayNumber {
    final r = _JalaliCalculation.calculate(year);

    return Gregorian(r.gy!, 3, r.march!).julianDayNumber + (month - 1) * 31 - (month ~/ 7) * (month - 7) + day - 1;
  }

  @override
  int get weekDay {
    return (julianDayNumber + 2) % 7 + 1;
  }

  @override
  int get monthLength {
    if (month <= 6) {
      return 31;
    } else if (month <= 11) {
      return 30;
    } else {
      return isLeapYear() ? 30 : 29;
    }
  }

  @override
  JalaliFormatter get formatter {
    return JalaliFormatter(this);
  }

  Jalali(int year, [int month = 1, int day = 1])
      : year = year,
        month = month,
        day = day {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    if (year < -61 || year > 3177) {
      throw DateException('Jalali date is out of computable range.');
    }

    if (month < 1 || month > 12) {
      throw DateException('Jalali month is out of valid range.');
    }

    if (month != 12 || day == 30) {
      final ml = monthLength;

      if (day < 1 || day > ml) {
        throw DateException('Jalali day is out of valid range.');
      }
    } else {
      if (day < 1 || day > 30) {
        throw DateException('Jalali day is out of valid range.');
      }
    }

    if (year == 3177) {
      if (month > 10 || (month == 10 && day > 11)) {
        throw DateException('Jalali date is out of computable range.');
      }
    }
  }

  factory Jalali.fromJulianDayNumber(int julianDayNumber) {
    ArgumentError.checkNotNull(julianDayNumber, 'julianDayNumber');

    if (julianDayNumber < 1925675 || julianDayNumber > 3108616) {
      throw DateException('Julian day number is out of computable range.');
    }

    int gy = Gregorian.fromJulianDayNumber(julianDayNumber).year;
    int jy = gy - 621;
    final r = _JalaliCalculation.calculate(jy);
    int jdn1f = Gregorian(gy, 3, r.march!).julianDayNumber;
    int jd, jm, k;

    k = julianDayNumber - jdn1f;
    if (k >= 0) {
      if (k <= 185) {
        jm = 1 + (k ~/ 31);
        jd = (k % 31) + 1;

        return Jalali(jy, jm, jd);
      } else {
        k -= 186;
      }
    } else {
      jy -= 1;
      k += 179;
      if (r.leap == 1) k += 1;
    }
    jm = 7 + (k ~/ 30);
    jd = (k % 30) + 1;

    return Jalali(jy, jm, jd);
  }

  factory Jalali.fromDateTime(DateTime dateTime) {
    ArgumentError.checkNotNull(dateTime, 'dateTime');

    return Gregorian.fromDateTime(dateTime).toJalali();
  }

  factory Jalali.fromGregorian(Gregorian date) {
    ArgumentError.checkNotNull(date, 'date');

    return Jalali.fromJulianDayNumber(date.julianDayNumber);
  }

  Jalali copy({int? year, int? month, int? day}) {
    if (year == null && month == null && day == null) {
      return this;
    } else {
      return Jalali(year ?? this.year, month ?? this.month, day ?? this.day);
    }
  }

  factory Jalali.now() {
    return Gregorian.now().toJalali();
  }

  DateTime toDateTime() {
    return toGregorian().toDateTime();
  }

  Gregorian toGregorian() {
    return Gregorian.fromJulianDayNumber(julianDayNumber);
  }

  @override
  bool isLeapYear() {
    return _JalaliCalculation.calculate(year).leap == 0;
  }

  @override
  String toString() => "$year-$month-$day";

  @override
  int compareTo(Jalali other) {
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

  bool operator >(Jalali other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) > 0;
  }

  bool operator >=(Jalali other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) >= 0;
  }

  bool operator <(Jalali other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) < 0;
  }

  bool operator <=(Jalali other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) <= 0;
  }

  Jalali operator +(int days) {
    ArgumentError.checkNotNull(days, 'days');

    return addDays(days);
  }

  Jalali operator -(int days) {
    ArgumentError.checkNotNull(days, 'days');

    return addDays(-days);
  }

  Jalali add({int years = 0, int months = 0, int days = 0}) {
    ArgumentError.checkNotNull(years, 'years');
    ArgumentError.checkNotNull(months, 'months');
    ArgumentError.checkNotNull(days, 'days');

    if (years == 0 && months == 0 && days == 0) {
      return this;
    } else {
      return Jalali(year + years, month + months, day + days);
    }
  }

  Jalali addYears(int years) {
    ArgumentError.checkNotNull(years, 'years');

    if (years == 0) {
      return this;
    } else {
      return Jalali(year + years, month, day);
    }
  }

  Jalali addMonths(int months) {
    ArgumentError.checkNotNull(months, 'months');

    if (months == 0) {
      return this;
    } else {
      final int sum = month + months - 1;
      final int mod = sum % 12;
      final int deltaYear = (sum - mod) ~/ 12;

      return Jalali(year + deltaYear, mod + 1, day);
    }
  }

  Jalali addDays(int days) {
    ArgumentError.checkNotNull(days, 'days');

    if (days == 0) {
      return this;
    } else {
      return Jalali.fromJulianDayNumber(julianDayNumber + days);
    }
  }

  Jalali withYear(int year) {
    ArgumentError.checkNotNull(year, "year");

    if (year == this.year) {
      return this;
    } else {
      return Jalali(year, month, day);
    }
  }

  Jalali withMonth(int month) {
    ArgumentError.checkNotNull(month, "month");

    if (month == this.month) {
      return this;
    } else {
      return Jalali(year, month, day);
    }
  }

  Jalali withDay(int day) {
    ArgumentError.checkNotNull(day, "day");

    if (day == this.day) {
      return this;
    } else {
      return Jalali(year, month, day);
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is Jalali && runtimeType == other.runtimeType && year == other.year && month == other.month && day == other.day;
  }

  @override
  int get hashCode {
    return year.hashCode ^ month.hashCode ^ day.hashCode;
  }

  @override
  int? daysInMonth(int monthNum, int year) {
    List<int?> monthLength = new List.filled(12, null, growable: false);
    final now = Jalali.now();

    monthLength[0] = 31;
    monthLength[1] = 31;
    monthLength[2] = 31;
    monthLength[3] = 31;
    monthLength[4] = 31;
    monthLength[5] = 31;
    monthLength[6] = 30;
    monthLength[7] = 30;
    monthLength[8] = 30;
    monthLength[9] = 30;
    monthLength[10] = 30;

    if (Jalali(year, monthNum, now.day).isLeapYear())
      monthLength[11] = 30;
    else
      monthLength[11] = 29;

    return monthLength[monthNum - 1];
  }

  @override
  String dayName(int weekDay) {
    if (weekDay == 1) return "شنبه";
    if (weekDay == 2) return "یکشنبه";
    if (weekDay == 3) return "دوشنبه";
    if (weekDay == 4) return "سه‌شنبه";
    if (weekDay == 5) return "چهار‌شنبه";
    if (weekDay == 6) return "پنج‌شنبه";
    if (weekDay == 7) return "جمعه";
    return "";
  }

  @override
  String monthName(int month) {
    if (month == 1) return "فروردین";
    if (month == 2) return "اردیبهشت";
    if (month == 3) return "خرداد";
    if (month == 4) return "تیر";
    if (month == 5) return "مرداد";
    if (month == 6) return "شهریور";
    if (month == 7) return "مهر";
    if (month == 8) return "آبان";
    if (month == 9) return "آذر";
    if (month == 10) return "دی";
    if (month == 11) return "بهمن";
    if (month == 12) return "اسفند";
    return "";
  }

  @override
  String stringDate() {
    return "${dayName(weekDay)}، ${day.toString()} ${monthName(month)} ${year.toString()}";
  }
}

class _JalaliCalculation {
  final int? leap;

  final int? gy;

  final int? march;

  _JalaliCalculation({this.leap, this.gy, this.march});

  factory _JalaliCalculation.calculate(int jy) {
    ArgumentError.checkNotNull(jy, "jy");

    final List<int> breaks = [-61, 9, 38, 199, 426, 686, 756, 818, 1111, 1181, 1210, 1635, 2060, 2097, 2192, 2262, 2324, 2394, 2456, 3178];

    int? bl = breaks.length, gy = jy + 621, leapJ = -14, jp = breaks[0], jm, jump, leap, leapG, march, n, i;

    if (jy < -61 || jy >= 3178) {
      throw StateError('should not happen');
    }

    for (i = 1; i! < bl; i += 1) {
      jm = breaks[i];
      jump = jm - jp!;
      if (jy < jm) {
        break;
      }
      leapJ = leapJ! + (jump ~/ 33) * 8 + (((jump % 33)) ~/ 4);
      jp = jm;
    }
    n = jy - jp!;

    leapJ = leapJ! + ((n) ~/ 33) * 8 + (((n % 33) + 3) ~/ 4);
    if ((jump! % 33) == 4 && jump - n == 4) {
      leapJ += 1;
    }

    leapG = ((gy) ~/ 4) - (((((gy) ~/ 100) + 1) * 3) ~/ 4) - 150;

    march = 20 + leapJ - leapG;

    if (jump - n < 6) {
      n = n - jump + ((jump + 4) ~/ 33) * 33;
    }
    leap = ((((n + 1) % 33) - 1) % 4);
    if (leap == -1) {
      leap = 4;
    }

    return _JalaliCalculation(leap: leap, gy: gy, march: march);
  }
}
