import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:u/utils/shamsi_date/shamsi_date.dart';

import '../material/date.dart';

class SoraniMaterialLocalizations extends DefaultMaterialLocalizations {
  const SoraniMaterialLocalizations();

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _SoraniMaterialLocalizationsDelegate();

  static const List<String> _narrowWeekdays = <String>[
    'ش',
    'ی',
    'دو',
    'سه',
    'چ',
    'پ',
    'ه',
  ];

  static const List<String> _shortMonths = <String>[
    'شبا',
    'ئادا',
    'حوز',
    'تمو',
    'ئاب',
    'ئەیلو',
    'تشر',
    'تشر',
    'كان',
    'كان',
    'شبا',
    'ئایار',
  ];

  static const List<String> _months = <String>[
    'شبا',
    'ئادا',
    'حوز',
    'تموز',
    'ئاب',
    'ئەیلو',
    'تشر',
    'تشر',
    'كان',
    'كان',
    'شبا',
    'ئایار',
  ];

  @override
  List<String> get narrowWeekdays => _narrowWeekdays;

  @override
  String get okButtonLabel => 'پەسەندکردن';

  @override
  String get cancelButtonLabel => 'پاشگەزبوونەوە';

  @override
  String get datePickerHelpText => 'دیاریکردنی بەروار';

  @override
  String get nextMonthTooltip => "مانگی داهاتوو";

  @override
  String get previousMonthTooltip => "مانگی پێشووی";

  @override
  int get firstDayOfWeekIndex => 0;

  @override
  String get saveButtonLabel => "پاشگەزبوونەوە";

  @override
  String get dateRangePickerHelpText => "دیاریکردنی بازه‌";

  @override
  String get dateRangeStartLabel => "دەستپێکردنی بەروار";

  @override
  String get dateRangeEndLabel => "کۆتایی بەروار";

  @override
  String get closeButtonTooltip => "داخستن";

  @override
  String get inputDateModeButtonLabel => "گۆڕین بۆ داخڵکردن";

  @override
  String get calendarModeButtonLabel => "گۆڕین بۆ خول";

  @override
  String get dateInputLabel => "بەروار";

  @override
  String get timePickerDialHelpText => "دیاریکردنی کات";

  @override
  String get anteMeridiemAbbreviation => "پ.ن";

  @override
  String get postMeridiemAbbreviation => "د.ن";

  @override
  String get timePickerInputHelpText => "کات";

  @override
  String get timePickerHourLabel => "کاتژمێر";

  @override
  String get timePickerMinuteLabel => "خولەک";

  @override
  String get inputTimeModeButtonLabel => "گۆڕین بۆ داخڵکردنی کات";

  @override
  String get dialModeButtonLabel => "گۆڕین بۆ گەڕانی دیال";

  @override
  String get invalidDateFormatLabel => "فۆرماتی هەڵە";

  @override
  String get invalidDateRangeLabel => "فۆرماتی هەڵە";

  @override
  String get invalidTimeLabel => "فۆرماتی هەڵە";

  @override
  String get unspecifiedDate => "بەروار";

  @override
  String get unspecifiedDateRange => "بازه‌ی بەروار";

  @override
  String formatYear(DateTime date) {
    return Jalali.fromDateTime(date).year.toString();
  }

  @override
  String formatMediumDate(DateTime date) {
    final jalaliDate = Jalali.fromDateTime(date);
    return '${jalaliDate.day} ${_months[jalaliDate.month - 1]} ${jalaliDate.year}';
  }

  @override
  String formatShortMonthDay(DateTime date) {
    final jalaliDate = Jalali.fromDateTime(date);
    return '${jalaliDate.day} ${_shortMonths[jalaliDate.month - 1]}';
  }

  @override
  String formatMonthYear(DateTime date) {
    final jalaliDate = Jalali.fromDateTime(date);
    return '${_months[jalaliDate.month - 1]} ${jalaliDate.year}';
  }

  @override
  String formatFullDate(DateTime date) {
    final jalaliDate = Jalali.fromDateTime(date);
    return '${jalaliDate.day} ${_months[jalaliDate.month - 1]} ${jalaliDate.year}';
  }

  @override
  String formatCompactDate(DateTime date) {
    final jalaliDate = Jalali.fromDateTime(date);
    return '${jalaliDate.day}/${jalaliDate.month}/${jalaliDate.year}';
  }
}

class _SoraniMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _SoraniMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ku';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return SynchronousFuture<MaterialLocalizations>(const SoraniMaterialLocalizations());
  }

  @override
  bool shouldReload(_SoraniMaterialLocalizationsDelegate old) => false;
}

class SoraniCupertinoLocalizations extends DefaultCupertinoLocalizations {
  const SoraniCupertinoLocalizations();

  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _SoraniCupertinoLocalizationsDelegate();

  static const List<String> shortWeekdays = <String>[
    'ش',
    'ی',
    'دو',
    'سه',
    'چ',
    'پ',
    'ه',
  ];

  static const List<String> _shortMonths = <String>[
    'شبا',
    'ئادا',
    'حوز',
    'تموز',
    'ئاب',
    'ئەیلو',
    'تشر',
    'تشر',
    'كان',
    'كان',
    'شبا',
    'ئایار',
  ];

  static const List<String> _months = <String>[
    'شبا',
    'ئادا',
    'حوز',
    'تموز',
    'ئاب',
    'ئەیلو',
    'تشر',
    'تشر',
    'كان',
    'كان',
    'شبا',
    'ئایار',
  ];

  @override
  String get alertDialogLabel => 'ئاگادارکردنەوە';

  @override
  String get todayLabel => 'ئەمڕۆ';

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerStandaloneMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) {
    if (weekDay != null) {
      return ' ${shortWeekdays[weekDay - JalaliExt.saturday]} $dayIndex ';
    }

    return dayIndex.toString();
  }

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => "$hour ساعت";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    return '$minute دقیقه';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    Jalali jdate = Jalali.fromDateTime(date);
    return '${shortWeekdays[jdate.weekDay - JalaliExt.saturday]} '
        '${jdate.day.toString().padRight(2)}'
        '${_shortMonths[jdate.month - JalaliExt.farvardin]} ';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get modalBarrierDismissLabel => 'داخستن';
}

class _SoraniCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _SoraniCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ku';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return SynchronousFuture<CupertinoLocalizations>(const SoraniCupertinoLocalizations());
  }

  @override
  bool shouldReload(_SoraniCupertinoLocalizationsDelegate old) => false;
}
