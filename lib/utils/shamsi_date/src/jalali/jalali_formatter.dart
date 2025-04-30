import '../date_formatter.dart';
import '../jalali/jalali_date.dart';

class JalaliFormatter extends DateFormatter {
  const JalaliFormatter(Jalali super.date);

  static const List<String> _monthNames = <String>[
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

  static const List<String> _monthNamesAfghanistan = <String>[
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

  static const List<String> _weekDayNames = <String>[
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

  String get mNAf {
    return _monthNamesAfghanistan[date.month - 1];
  }

  @override
  String get wN {
    return _weekDayNames[date.weekDay - 1];
  }
}
