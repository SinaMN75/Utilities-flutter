import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:u/utils/shamsi_date/shamsi_date.dart';

import '../material/date.dart';

class PersianMaterialLocalizations extends DefaultMaterialLocalizations {
  const PersianMaterialLocalizations();

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _PersianMaterialLocalizationsDelegate();

  static const List<String> _narrowWeekdays = <String>[
    'ش',
    'ی',
    'د',
    'س',
    'چ',
    'پ',
    'ج',
  ];

  static const List<String> _shortMonths = <String>[
    'فر',
    'ارد',
    'خرد',
    'تیر',
    'مرد',
    'شه',
    'مهر',
    'آبا',
    'آذر',
    'دی',
    'بهمن',
    'اسف',
  ];

  static const List<String> _months = <String>[
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

  @override
  List<String> get narrowWeekdays => _narrowWeekdays;

  @override
  String get okButtonLabel => 'تأیید';

  @override
  String get cancelButtonLabel => 'لغو';

  @override
  String get datePickerHelpText => 'انتخاب تاریخ';

  @override
  String get nextMonthTooltip => "ماه بعد";

  @override
  String get previousMonthTooltip => "ماه قبل";

  @override
  int get firstDayOfWeekIndex => 0;

  @override
  String get saveButtonLabel => "تایید";

  @override
  String get dateRangePickerHelpText => "انتخاب بازه زمانی";

  @override
  String get dateRangeStartLabel => "تاریخ شروع";

  @override
  String get dateRangeEndLabel => "تاریخ پایان";

  @override
  String get closeButtonTooltip => "بستن";

  @override
  String get inputDateModeButtonLabel => "تغییر به ورودی";

  @override
  String get calendarModeButtonLabel => "تغییر به تقویم";

  @override
  String get dateInputLabel => "تاریخ";

  @override
  String get timePickerDialHelpText => "انتخاب زمان";

  @override
  String get anteMeridiemAbbreviation => "ق.ظ";

  @override
  String get postMeridiemAbbreviation => "ب.ظ";

  @override
  String get timePickerInputHelpText => "زمان";

  @override
  String get timePickerHourLabel => "ساعت";

  @override
  String get timePickerMinuteLabel => "دقیقه";

  @override
  String get inputTimeModeButtonLabel => "تغییر به حالت ورودی";

  @override
  String get dialModeButtonLabel => "تغییر به حالت انتخابگر دیال";

  @override
  String get invalidDateFormatLabel => "فرمت اشتباه.";

  @override
  String get invalidDateRangeLabel => "فرمت اشتباه.";

  @override
  String get invalidTimeLabel => "فرمت اشتباه.";

  @override
  String get unspecifiedDate => "تاریخ";

  @override
  String get unspecifiedDateRange => "بازه زمانی";

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
  String formatShortDate(DateTime date) {
    Jalali jdate = Jalali.fromDateTime(date);
    final String month = _shortMonths[jdate.month - 1];
    return '${jdate.day} $month, ${jdate.year}';
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

class _PersianMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _PersianMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'fa' && locale.countryCode == "IR";

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return SynchronousFuture<MaterialLocalizations>(const PersianMaterialLocalizations());
  }

  @override
  bool shouldReload(_PersianMaterialLocalizationsDelegate old) => false;
}

class PersianCupertinoLocalizations extends DefaultCupertinoLocalizations {
  const PersianCupertinoLocalizations();

  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _PersianCupertinoLocalizationsDelegate();

  static const List<String> shortWeekdays = <String>[
    'ش',
    'ی',
    'د',
    'س',
    'چ',
    'پ',
    'ج',
  ];

  static const List<String> _shortMonths = <String>[
    'فرو',
    'اردی',
    'خرد',
    'تیر',
    'مرد',
    'شهری',
    'مهر',
    'آبا',
    'آذر',
    'دی',
    'بهم',
    'اسف',
  ];

  static const List<String> _months = <String>[
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
  String get anteMeridiemAbbreviation => 'ق.ظ';

  @override
  String get postMeridiemAbbreviation => 'ب.ظ';

  @override
  String get todayLabel => 'امروز';

  @override
  String get alertDialogLabel => 'هشدار';

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    assert(tabIndex >= 1);
    assert(tabCount >= 1);
    return 'زبانه $tabIndex از $tabCount';
  }

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => 'ساعت';

  @override
  List<String> get timerPickerHourLabels => const <String>['ساعت', 'ساعت'];

  @override
  String timerPickerMinuteLabel(int minute) => 'دقیقه.';

  @override
  List<String> get timerPickerMinuteLabels => const <String>['دقیقه.'];

  @override
  String timerPickerSecondLabel(int second) => 'ثانیه.';

  @override
  List<String> get timerPickerSecondLabels => const <String>['ثانیه.'];

  @override
  String get cutButtonLabel => 'برش';

  @override
  String get copyButtonLabel => 'کپی';

  @override
  String get pasteButtonLabel => 'چسباندن';

  @override
  String get clearButtonLabel => 'پاک کردن';
}

class _PersianCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _PersianCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'fa';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return SynchronousFuture<CupertinoLocalizations>(const PersianCupertinoLocalizations());
  }

  @override
  bool shouldReload(_PersianCupertinoLocalizationsDelegate old) => false;
}
