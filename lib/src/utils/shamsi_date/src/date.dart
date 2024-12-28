import 'date_formatter.dart';

abstract class Date implements Comparable<Date> {
  static const int minJulianDayNumber = 1925675;

  static const int maxJulianDayNumber = 3108616;

  const Date();

  int get year;

  int get month;

  int get day;

  int get hour;

  int get minute;

  int get second;

  int get millisecond;

  Duration get time {
    return Duration(
      hours: hour,
      minutes: minute,
      seconds: second,
      milliseconds: millisecond,
    );
  }

  int get julianDayNumber;

  int get weekDay;

  int get monthLength;

  DateFormatter get formatter;

  bool isLeapYear();

  DateTime toDateTime();

  DateTime toUtcDateTime();

  Date copy({int? year, int? month, int? day});

  Date withYear(int year);

  Date withMonth(int month);

  Date withDay(int day);

  Date add({int years = 0, int months = 0, int days = 0});

  Date addYears(int years);

  Date addMonths(int months);

  Date addDays(int days);

  Date operator +(int days);

  Date operator -(int days);

  @override
  String toString();

  int operator ^(Date other) {
    return julianDayNumber - other.julianDayNumber;
  }

  int distanceTo(Date other) {
    return other.julianDayNumber - julianDayNumber;
  }

  int distanceFrom(Date other) {
    return julianDayNumber - other.julianDayNumber;
  }

  @override
  bool operator ==(Object other) {
    return other is Date && compareTo(other) == 0;
  }

  @override
  int get hashCode {
    return julianDayNumber.hashCode ^ time.hashCode;
  }

  @override
  int compareTo(Date other) {
    if (identical(this, other)) {
      return 0;
    } else if (julianDayNumber == other.julianDayNumber) {
      return time.compareTo(other.time);
    } else if (julianDayNumber > other.julianDayNumber) {
      return 1;
    } else {
      return -1;
    }
  }

  bool operator >(Date other) {
    return compareTo(other) > 0;
  }

  bool operator >=(Date other) {
    return compareTo(other) >= 0;
  }

  bool operator <(Date other) {
    return compareTo(other) < 0;
  }

  bool operator <=(Date other) {
    return compareTo(other) <= 0;
  }
}
