library jalali_formatter;

import '../date_formatter.dart';
import 'jalali_date.dart';

class JalaliFormatter extends DateFormatter {
  JalaliFormatter(Jalali date) : super(date);

  static const List<String> _monthNames = [
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

  static const List<String> _weekDayNames = [
    'شنبه',
    'یک شنبه',
    'دو شنبه',
    'سه شنبه',
    'چهار شنبه',
    'پنج شنبه',
    'جمعه',
  ];

  @override
  String get mN {
    return _monthNames[date.month - 1];
  }

  @override
  String get wN {
    return _weekDayNames[date.weekDay - 1];
  }
}
