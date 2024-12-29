import '../date.dart';
import '../date_exception.dart';
import '../gregorian/gregorian_date.dart';
import '../jalali/jalali_formatter.dart';

part 'jalali_calculation.dart';

class Jalali extends Date {
  static const Jalali min = Jalali._raw(1925675, -61, 1, 1, 0, 0, 0, 0, true);

  static const Jalali max = Jalali._raw(3108616, 3177, 10, 11, 23, 59, 59, 999, false);

  const Jalali._raw(
    this.julianDayNumber,
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
    this._isLeap,
  );

  @override
  final int julianDayNumber;

  @override
  final int year;

  @override
  final int month;

  @override
  final int day;

  @override
  final int hour;

  @override
  final int minute;

  @override
  final int second;

  @override
  final int millisecond;

  final bool _isLeap;

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
      return _isLeap ? 30 : 29;
    }
  }

  @override
  JalaliFormatter get formatter {
    return JalaliFormatter(this);
  }

  factory Jalali(
    final int year, [
    final int month = 1,
    final int day = 1,
    final int hour = 0,
    final int minute = 0,
    final int second = 0,
    final int millisecond = 0,
  ]) {
    return _Algo.createFromYearMonthDay(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  factory Jalali.fromJulianDayNumber(
    final int julianDayNumber, [
    final int hour = 0,
    final int minute = 0,
    final int second = 0,
    final int millisecond = 0,
  ]) {
    return _Algo.createFromJulianDayNumber(
      julianDayNumber,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  factory Jalali.fromDateTime(DateTime dateTime) {
    return Gregorian.fromDateTime(dateTime).toJalali();
  }

  factory Jalali.fromGregorian(Gregorian date) {
    return Jalali.fromJulianDayNumber(
      date.julianDayNumber,
      date.hour,
      date.minute,
      date.second,
      date.millisecond,
    );
  }

  factory Jalali.fromMillisecondsSinceEpoch(
    int milliseconds, {
    bool isUtc = false,
  }) {
    return Jalali.fromDateTime(
      DateTime.fromMillisecondsSinceEpoch(
        milliseconds,
        isUtc: isUtc,
      ),
    );
  }

  factory Jalali.now() {
    return Gregorian.now().toJalali();
  }

  @override
  Jalali copy({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
  }) {
    if (year == null && month == null && day == null && hour == null && minute == null && second == null && millisecond == null) {
      return this;
    } else {
      return Jalali(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
      );
    }
  }

  @override
  DateTime toDateTime() {
    return toGregorian().toDateTime();
  }

  @override
  DateTime toUtcDateTime() {
    return toGregorian().toUtcDateTime();
  }

  Gregorian toGregorian() {
    return Gregorian.fromJulianDayNumber(
      julianDayNumber,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  @override
  bool isLeapYear() {
    return _isLeap;
  }

  @override
  String toString() {
    return 'Jalali($year, $month, $day, $hour, '
        '$minute, $second, $millisecond)';
  }

  @override
  Jalali operator +(int days) {
    return addDays(days);
  }

  @override
  Jalali operator -(int days) {
    return addDays(-days);
  }

  @override
  Jalali add({
    int years = 0,
    int months = 0,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
  }) {
    if (years == 0 && months == 0 && days == 0 && hours == 0 && minutes == 0 && seconds == 0 && milliseconds == 0) {
      return this;
    } else {
      return Jalali(
        year + years,
        month + months,
        day + days,
        hour + hours,
        minute + minutes,
        second + seconds,
        millisecond + milliseconds,
      );
    }
  }

  @override
  Jalali addYears(int years) {
    if (years == 0) {
      return this;
    } else {
      return Jalali(
        year + years,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  @override
  Jalali addMonths(int months) {
    if (months == 0) {
      return this;
    } else {
      final int sum = month + months - 1;
      final int mod = sum % 12;
      final int deltaYear = (sum - mod) ~/ 12;

      return Jalali(
        year + deltaYear,
        mod + 1,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  @override
  Jalali addDays(int days) {
    if (days == 0) {
      return this;
    } else {
      return Jalali.fromJulianDayNumber(
        julianDayNumber + days,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  @override
  Jalali withYear(int year) {
    if (year == this.year) {
      return this;
    } else {
      return Jalali(
        year,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  @override
  Jalali withMonth(int month) {
    if (month == this.month) {
      return this;
    } else {
      return Jalali(
        year,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  @override
  Jalali withDay(int day) {
    if (day == this.day) {
      return this;
    } else {
      return Jalali(
        year,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }
}
