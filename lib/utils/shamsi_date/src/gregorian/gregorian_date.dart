import "package:u/utils/shamsi_date/src/date.dart";
import "package:u/utils/shamsi_date/src/date_exception.dart";
import "package:u/utils/shamsi_date/src/gregorian/gregorian_formatter.dart";
import "package:u/utils/shamsi_date/src/jalali/jalali_date.dart";

part "gregorian_calculation.dart";

class Gregorian extends Date {
  factory Gregorian(
    final int year, [
    final int month = 1,
    final int day = 1,
    final int hour = 0,
    final int minute = 0,
    final int second = 0,
    final int millisecond = 0,
  ]) =>
      _Algo.createFromYearMonthDay(
        year,
        month,
        day,
      hour,
      minute,
      second,
      millisecond,
    );

  const Gregorian._raw(
    this.julianDayNumber,
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
  );

  factory Gregorian.fromJulianDayNumber(
    final int julianDayNumber, [
    final int hour = 0,
    final int minute = 0,
    final int second = 0,
    final int millisecond = 0,
  ]) =>
      _Algo.createFromJulianDayNumber(
        julianDayNumber,
        hour,
        minute,
      second,
      millisecond,
    );

  factory Gregorian.fromDateTime(DateTime dateTime) => Gregorian(
        dateTime.year,
        dateTime.month,
        dateTime.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
      dateTime.millisecond,
    );

  factory Gregorian.fromJalali(Jalali date) => Gregorian.fromJulianDayNumber(
        date.julianDayNumber,
        date.hour,
        date.minute,
      date.second,
      date.millisecond,
    );

  factory Gregorian.fromMillisecondsSinceEpoch(
    int milliseconds, {
    bool isUtc = false,
  }) =>
      Gregorian.fromDateTime(
        DateTime.fromMillisecondsSinceEpoch(
          milliseconds,
          isUtc: isUtc,
      ),
    );

  factory Gregorian.now() => Gregorian.fromDateTime(DateTime.now());

  static const Gregorian min = Gregorian._raw(1925675, 560, 3, 20, 0, 0, 0, 0);

  static const Gregorian max = Gregorian._raw(3108616, 3798, 12, 31, 23, 59, 59, 999);

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

  @override
  int get weekDay => julianDayNumber % 7 + 1;

  @override
  int get monthLength => _Algo.getMonthLength(year, month);

  @override
  GregorianFormatter get formatter => GregorianFormatter(this);

  @override
  Gregorian copy({
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
      return Gregorian(
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
  DateTime toDateTime() => DateTime(
        year,
        month,
        day,
      hour,
      minute,
      second,
      millisecond,
    );

  @override
  DateTime toUtcDateTime() => DateTime.utc(
        year,
        month,
        day,
      hour,
      minute,
      second,
      millisecond,
    );

  Jalali toJalali() => Jalali.fromJulianDayNumber(
        julianDayNumber,
        hour,
        minute,
      second,
      millisecond,
    );

  @override
  bool isLeapYear() => _Algo.isLeapYear(year);

  @override
  String toString() => "Gregorian($year, $month, $day, $hour, "
      "$minute, $second, $millisecond)";

  @override
  Gregorian operator +(int days) => addDays(days);

  @override
  Gregorian operator -(int days) => addDays(-days);

  @override
  Gregorian add({
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
      return Gregorian(
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
  Gregorian addYears(int years) {
    if (years == 0) {
      return this;
    } else {
      return Gregorian(
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
  Gregorian addMonths(int months) {
    if (months == 0) {
      return this;
    } else {
      final int sum = month + months - 1;
      final int mod = sum % 12;
      final int deltaYear = (sum - mod) ~/ 12;

      return Gregorian(
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
  Gregorian addDays(int days) {
    if (days == 0) {
      return this;
    } else {
      return Gregorian.fromJulianDayNumber(
        julianDayNumber + days,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  @override
  Gregorian withYear(int year) {
    if (year == this.year) {
      return this;
    } else {
      return Gregorian(
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
  Gregorian withMonth(int month) {
    if (month == this.month) {
      return this;
    } else {
      return Gregorian(
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
  Gregorian withDay(int day) {
    if (day == this.day) {
      return this;
    } else {
      return Gregorian(
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
