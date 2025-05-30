import '../date_formatter.dart';
import '../gregorian/gregorian_date.dart';

class GregorianFormatter extends DateFormatter {
  const GregorianFormatter(Gregorian super.date);

  static const List<String> _monthNames = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static const List<String> _weekDayNames = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
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
