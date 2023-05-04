library date;

import 'date_formatter.dart';

abstract class Date {
  static const int MIN_JULIAN_DAY_NUMBER = 1925675;

  static const int MAX_JULIAN_DAY_NUMBER = 3108616;

  int get year;

  int get month;

  int get day;

  int get julianDayNumber;

  int get weekDay;

  int get monthLength;

  DateFormatter get formatter;

  int? daysInMonth(int monthNum, int year);

  String dayName(int weekDay);

  String monthName(int month);

  String stringDate();

  bool isLeapYear();
}
