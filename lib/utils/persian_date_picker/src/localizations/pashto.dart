import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:u/utils/shamsi_date/shamsi_date.dart';

import '../material/date.dart';

class PashtoMaterialLocalizations extends DefaultMaterialLocalizations {
  const PashtoMaterialLocalizations();

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _PashtoMaterialLocalizationsDelegate();

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
    'حمل',
    'ثور',
    'غبرګ',
    'چنګاښ',
    'زمری',
    'وږی',
    'تله',
    'لړم',
    'لیندۍ',
    'مرغ',
    'سلواغه',
    'كب',
  ];

  static const List<String> _months = <String>[
    'حمل',
    'ثور',
    'غبرګولی',
    'چنګاښ',
    'زمری',
    'وږی',
    'تله',
    'لړم',
    'لیندۍ',
    'مرغومی',
    'سلواغه',
    'كب',
  ];

  @override
  List<String> get narrowWeekdays => _narrowWeekdays;

  @override
  String get okButtonLabel => 'تاييد';

  @override
  String get cancelButtonLabel => 'لغو';

  @override
  String get datePickerHelpText => 'نیټه انتخاب کړئ';

  @override
  String get nextMonthTooltip => "راتلونکې میاشت";

  @override
  String get previousMonthTooltip => "مخکېنۍ میاشت";

  @override
  int get firstDayOfWeekIndex => 0;

  @override
  String get saveButtonLabel => "تاييد";

  @override
  String get dateRangePickerHelpText => "د نېټې موده انتخاب کړئ";

  @override
  String get dateRangeStartLabel => "د پیل نېټه";

  @override
  String get dateRangeEndLabel => "د پای نېټه";

  @override
  String get closeButtonTooltip => "بندول";

  @override
  String get inputDateModeButtonLabel => "ورودي حالت";

  @override
  String get calendarModeButtonLabel => "جنتری حالت";

  @override
  String get dateInputLabel => "نیټه";

  @override
  String get timePickerDialHelpText => "وخت انتخاب کړئ";

  @override
  String get anteMeridiemAbbreviation => "غ.م";

  @override
  String get postMeridiemAbbreviation => "م.غ";

  @override
  String get timePickerInputHelpText => "وخت";

  @override
  String get timePickerHourLabel => "ساعت";

  @override
  String get timePickerMinuteLabel => "دقيقه";

  @override
  String get inputTimeModeButtonLabel => "ورودي حالت";

  @override
  String get dialModeButtonLabel => "د ډایل حالت";

  @override
  String get invalidDateFormatLabel => "ناسم فارمیټ.";

  @override
  String get invalidDateRangeLabel => "ناسم تاریخونه.";

  @override
  String get invalidTimeLabel => "ناسم وخت.";

  @override
  String get unspecifiedDate => "نیټه";

  @override
  String get unspecifiedDateRange => "د نېټې موده";

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

class _PashtoMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _PashtoMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ps';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return SynchronousFuture<MaterialLocalizations>(const PashtoMaterialLocalizations());
  }

  @override
  bool shouldReload(_PashtoMaterialLocalizationsDelegate old) => false;
}

class PashtoCupertinoLocalizations extends DefaultCupertinoLocalizations {
  const PashtoCupertinoLocalizations();

  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _PashtoCupertinoLocalizationsDelegate();

  static const List<String> shortWeekdays = <String>[
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
    'غبرګولی',
    'چنګاښ',
    'زمری',
    'وږی',
    'تله',
    'لړم',
    'لیندۍ',
    'مرغومی',
    'سلواغه',
    'كب',
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
  String datePickerMinute(int minute) => minute.toString();

  @override
  String datePickerMinuteSemanticsLabel(int minute) => "$minute دقیقه";

  @override
  String get todayLabel => "نن";
}

class _PashtoCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _PashtoCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ps';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return SynchronousFuture<CupertinoLocalizations>(const PashtoCupertinoLocalizations());
  }

  @override
  bool shouldReload(_PashtoCupertinoLocalizationsDelegate old) => false;
}
