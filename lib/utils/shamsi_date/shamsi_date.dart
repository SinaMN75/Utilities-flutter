import 'package:u/utils/shamsi_date/src/jalali/jalali_date.dart';
import 'package:u/utils/shamsi_date/src/jalali/jalali_formatter.dart';

export 'src/date.dart';
export 'src/date_exception.dart';
export 'src/date_formatter.dart';
export 'src/gregorian/gregorian_date.dart';
export 'src/gregorian/gregorian_formatter.dart';
export 'src/jalali/jalali_date.dart';
export 'src/jalali/jalali_formatter.dart';

extension DateTimeExt on DateTime {
  Jalali toJalali() => Jalali.fromDateTime(this);
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

  static List<String> narrowWeekdays = <String>[
    'ش',
    'ی',
    'د',
    'س',
    'چ',
    'پ',
    'ج',
  ];

  static List<String> shortDayName = <String>[
    'شنبه',
    '۱شنبه',
    '۲شنبه',
    '۳شنبه',
    '۴شنبه',
    '۵شنبه',
    'جمعه',
  ];

  int get millisecondsSinceEpoch {
    final DateTime dateTime = toDateTime();

    return dateTime.millisecondsSinceEpoch;
  }

  bool isBefore(Jalali date) => date.compareTo(this) > 0;

  bool isAfter(Jalali date) => date.compareTo(this) < 0;

  bool isAtSameMomentAs(Jalali other) => other.compareTo(this) == 0;

  String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  String datePickerMediumDate() => '${shortDayName[weekDay - saturday]} '
      '${formatter.mN} '
      '${day.toString().padRight(2)}';

  String formatMediumDate() {
    final JalaliFormatter f = formatter;
    return '${shortDayName[weekDay - 1]} ${f.d} ${f.mN}';
  }

  String formatFullDate() {
    final JalaliFormatter f = formatter;
    return '${f.wN} ${f.d} ${f.mN} ${f.yyyy}';
  }

  String toJalaliDateTime() {
    final JalaliFormatter f = formatter;
    return '${f.yyyy}-${f.mm}-${f.dd} ${_twoDigits(hour)}:${_twoDigits(minute)}:${_twoDigits(second)}';
  }

  String formatYear() {
    final JalaliFormatter f = formatter;
    return f.yyyy;
  }

  String formatCompactDate() {
    final JalaliFormatter f = formatter;
    final String month = f.mm;
    final String day = f.dd;
    final String year = f.yyyy;
    return '$year/$month/$day';
  }

  String formatShortDate() {
    final JalaliFormatter f = formatter;
    return '${f.dd} ${f.mN}  ,${f.yyyy}';
  }

  String formatMonthYear() {
    final JalaliFormatter f = formatter;
    return '${f.yyyy}/${f.mm}';
  }

  String formatShortMonthDay() {
    final JalaliFormatter f = formatter;
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
  }) =>
      Jalali(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
      );

  Jalali addHours(int hours) {
    final int newHour = (hour + hours) % 24;
    final int dayOverflow = (hour + hours) ~/ 24;

    final Jalali newDateTime = copyWith(
      hour: newHour,
    );

    return dayOverflow > 0 ? newDateTime.addDays(dayOverflow) : newDateTime;
  }
}