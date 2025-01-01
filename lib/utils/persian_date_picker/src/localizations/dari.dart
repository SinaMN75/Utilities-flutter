import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:u/utils/shamsi_date/shamsi_date.dart';

import '../material/date.dart';

class DariMaterialLocalizations extends DefaultMaterialLocalizations {
  const DariMaterialLocalizations();

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _DariMaterialLocalizationsDelegate();

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
    'حم',
    'ثو',
    'جوز',
    'سر',
    'اسد',
    'سنب',
    'میز',
    'عق',
    'قوس',
    'جد',
    'دلو',
    'حوت',
  ];

  static const List<String> _months = <String>[
    'حمل',
    'ثور',
    'جوزا',
    'سرطان',
    'اسد',
    'سنبله',
    'میزان',
    'عقرب',
    'قوس',
    'جدی',
    'دلو',
    'حوت',
  ];

  @override
  List<String> get narrowWeekdays => _narrowWeekdays;

  @override
  String get okButtonLabel => 'تایید';

  @override
  String get cancelButtonLabel => 'لغو';

  @override
  String get datePickerHelpText => 'انتخاب تاریخ';

  @override
  String get nextMonthTooltip => "ماه بعد";

  @override
  String get previousMonthTooltip => "ماه قبل";

  @override
  int get firstDayOfWeekIndex => 6;

  @override
  String get saveButtonLabel => "ذخیره";

  @override
  String get dateRangePickerHelpText => "انتخاب بازهٔ زمانی";

  @override
  String get dateRangeStartLabel => "تاریخ شروع";

  @override
  String get dateRangeEndLabel => "تاریخ پایان";

  @override
  String get closeButtonTooltip => "بستن";

  @override
  String get inputDateModeButtonLabel => "ورودی تاریخ";

  @override
  String get calendarModeButtonLabel => "تقویم";

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
  String get inputTimeModeButtonLabel => "ورودی زمان";

  @override
  String get dialModeButtonLabel => "حالت انتخابگر دیال";

  @override
  String get invalidDateFormatLabel => "قالب نادرست.";

  @override
  String get invalidDateRangeLabel => "قالب بازه نادرست.";

  @override
  String get invalidTimeLabel => "قالب زمان نادرست.";

  @override
  String get unspecifiedDate => "تاریخ نامشخص";

  @override
  String get unspecifiedDateRange => "بازهٔ زمانی نامشخص";

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

class _DariMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _DariMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'fa' && locale.countryCode == 'AF';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return SynchronousFuture<MaterialLocalizations>(const DariMaterialLocalizations());
  }

  @override
  bool shouldReload(_DariMaterialLocalizationsDelegate old) => false;
}

class DariCupertinoLocalizations extends DefaultCupertinoLocalizations {
  const DariCupertinoLocalizations();

  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _DariCupertinoLocalizationsDelegate();

  static const List<String> _shortWeekdays = <String>[
    'ش',
    'ی',
    'د',
    'س',
    'چ',
    'پ',
    'ج',
  ];

  static const List<String> _months = <String>[
    'حمل',
    'ثور',
    'جوزا',
    'سرطان',
    'اسد',
    'سنبله',
    'میزان',
    'عقرب',
    'قوس',
    'جدی',
    'دلو',
    'حوت',
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
      return ' ${_shortWeekdays[weekDay - JalaliExt.saturday]} $dayIndex ';
    }
    return dayIndex.toString();
  }

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String get anteMeridiemAbbreviation => 'ق.ظ';

  @override
  String get postMeridiemAbbreviation => 'ب.ظ';

  @override
  String get todayLabel => 'امروز';

  @override
  String get alertDialogLabel => 'هشدار';
}

class _DariCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _DariCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'fa' && locale.countryCode == 'AF';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return SynchronousFuture<CupertinoLocalizations>(const DariCupertinoLocalizations());
  }

  @override
  bool shouldReload(_DariCupertinoLocalizationsDelegate old) => false;
}
