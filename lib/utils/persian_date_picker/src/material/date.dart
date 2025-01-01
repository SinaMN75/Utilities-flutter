import 'package:flutter/material.dart';
import 'package:u/utils/shamsi_date/shamsi_date.dart';

abstract final class PersianDateUtils {
  static Jalali dateOnly(Jalali date) {
    return Jalali(date.year, date.month, date.day);
  }

  static JalaliRange datesOnly(JalaliRange range) {
    return JalaliRange(start: dateOnly(range.start), end: dateOnly(range.end));
  }

  static bool isSameDay(Jalali? dateA, Jalali? dateB) {
    return dateA?.year == dateB?.year && dateA?.month == dateB?.month && dateA?.day == dateB?.day;
  }

  static bool isSameMonth(Jalali? dateA, Jalali? dateB) {
    return dateA?.year == dateB?.year && dateA?.month == dateB?.month;
  }

  static int monthDelta(Jalali startDate, Jalali endDate) {
    return (endDate.year - startDate.year) * 12 + endDate.month - startDate.month;
  }

  static Jalali addMonthsToMonthDate(Jalali monthDate, int monthsToAdd) {
    return Jalali(monthDate.year, monthDate.month).addMonths(monthsToAdd);
  }

  static Jalali addDaysToDate(Jalali date, int days) {
    return Jalali(date.year, date.month, date.day).addDays(days);
  }

  static int firstDayOffset(int year, int month, MaterialLocalizations localizations) {
    final int weekdayFromSaturday = (Jalali(year, month, 1).weekDay % 7);
    int firstDayOfWeekIndex = localizations.firstDayOfWeekIndex;

    firstDayOfWeekIndex = (firstDayOfWeekIndex - 6) % 7;
    return (weekdayFromSaturday - firstDayOfWeekIndex) % 7;
  }

  static int getDaysInMonth(int year, int month) {
    if (month == 12) {
      final bool isLeapYear = Jalali(year).isLeapYear();
      if (isLeapYear) return 30;
      return 29;
    }
    const List<int> daysInMonth = <int>[31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, -1];
    return daysInMonth[month - 1];
  }
}

enum PersianDatePickerEntryMode {
  calendar,
  input,
  calendarOnly,
  inputOnly,
}

enum PersianDatePickerMode {
  day,
  year,
}

typedef PersianSelectableDayPredicate = bool Function(Jalali day);

@immutable
class JalaliRange {
  const JalaliRange({
    required this.start,
    required this.end,
  });

  final Jalali start;

  final Jalali end;

  Duration get duration => end.toDateTime().difference(start.toDateTime());

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is JalaliRange && other.start == start && other.end == end;
  }

  @override
  int get hashCode => Object.hash(start, end);

  @override
  String toString() => '$start - $end';
}

extension JalaliExt on Jalali {
  static const int monday = 3;
  static const int tuesday = 4;
  static const int wednesday = 5;
  static const int thursday = 6;
  static const int friday = 7;
  static const int saturday = 1;
  static const int sunday = 2;
  static const int daysPerWeek = 7;

  static const int farvardin = 1;
  static const int ordibehesht = 2;
  static const int khordad = 3;
  static const int tir = 4;
  static const int mordad = 5;
  static const int shahrivar = 6;
  static const int mehr = 7;
  static const int aban = 8;
  static const int azar = 9;
  static const int dey = 10;
  static const int bahman = 11;
  static const int esfand = 12;
  static const int monthsPerYear = 12;

  static const List<String> months = <String>[
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];

  static List<String> narrowWeekdays = [
    'ش',
    'ی',
    'د',
    'س',
    'چ',
    'پ',
    'ج',
  ];

  static List<String> shortDayName = [
    'شنبه',
    '۱شنبه',
    '۲شنبه',
    '۳شنبه',
    '۴شنبه',
    '۵شنبه',
    'جمعه',
  ];

  int get millisecondsSinceEpoch {
    DateTime dateTime = toDateTime();

    return dateTime.millisecondsSinceEpoch;
  }

  bool isBefore(Jalali date) {
    return date.compareTo(this) > 0;
  }

  bool isAfter(Jalali date) {
    return date.compareTo(this) < 0;
  }

  bool isAtSameMomentAs(Jalali other) {
    return other.compareTo(this) == 0;
  }

  String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  String datePickerMediumDate() {
    return '${shortDayName[weekDay - saturday]} '
        '${formatter.mN} '
        '${day.toString().padRight(2)}';
  }

  String formatMediumDate() {
    final f = formatter;
    return '${shortDayName[weekDay - 1]} ${f.d} ${f.mN}';
  }

  String formatFullDate() {
    final f = formatter;
    return '${f.wN} ${f.d} ${f.mN} ${f.yyyy}';
  }

  String toJalaliDateTime() {
    final f = formatter;
    return '${f.yyyy}-${f.mm}-${f.dd} ${_twoDigits(hour)}:${_twoDigits(minute)}:${_twoDigits(second)}';
  }

  String formatYear() {
    final f = formatter;
    return f.yyyy;
  }

  String formatCompactDate() {
    final f = formatter;
    final String month = f.mm;
    final String day = f.dd;
    final String year = f.yyyy;
    return '$year/$month/$day';
  }

  String formatShortDate() {
    final f = formatter;
    return '${f.dd} ${f.mN}  ,${f.yyyy}';
  }

  String formatMonthYear() {
    final f = formatter;
    return '${f.yyyy}/${f.mm}';
  }

  String formatShortMonthDay() {
    final f = formatter;
    return '${f.dd} ${f.mN}';
  }

  Jalali copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
  }) {
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

  Jalali addHours(int hours) {
    int newHour = (hour + hours) % 24;
    int dayOverflow = (hour + hours) ~/ 24;

    Jalali newDateTime = copyWith(
      hour: newHour,
    );

    return dayOverflow > 0 ? newDateTime.addDays(dayOverflow) : newDateTime;
  }
}

Jalali? parseCompactJalaliDate(String? inputString) {
  if (inputString == null) {
    return null;
  }

  final List<String> inputParts = inputString.split('/');
  if (inputParts.length != 3) {
    return null;
  }

  final int? year = int.tryParse(inputParts[0], radix: 10);
  if (year == null || year < 1) {
    return null;
  }

  final int? month = int.tryParse(inputParts[1], radix: 10);
  if (month == null || month < 1 || month > 12) {
    return null;
  }

  final int? day = int.tryParse(inputParts[2], radix: 10);
  if (day == null || day < 1 || day > PersianDateUtils.getDaysInMonth(year, month)) {
    return null;
  }

  try {
    return Jalali(year, month, day);
  } on ArgumentError {
    return null;
  }
}

String? jalaliStringToGregorianString(String? jalaliDateString, String seprator) {
  if (jalaliDateString == null || jalaliDateString.isEmpty) {
    return null;
  }

  try {
    final List<String> parts = jalaliDateString.split(seprator);
    if (parts.length != 3) {
      throw FormatException("Invalid Jalali date format");
    }

    final int year = int.parse(parts[0]);
    final int month = int.parse(parts[1]);
    final int day = int.parse(parts[2]);

    Jalali jalaliDate = Jalali(year, month, day);

    DateTime dateTime = jalaliDate.toDateTime();

    return '${dateTime.year.toString().padLeft(4, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}';
  } catch (e) {
    return null;
  }
}

extension DateTimeExt on DateTime {
  Jalali toJalali() {
    return Jalali.fromDateTime(this);
  }
}
