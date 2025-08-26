import "package:u/utils/shamsi_date/src/date_formatter.dart";
import "package:u/utils/shamsi_date/src/gregorian/gregorian_date.dart";

class GregorianFormatter extends DateFormatter {
  const GregorianFormatter(Gregorian super.date);

  static const List<String> _monthNames = <String>[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  static const List<String> _weekDayNames = <String>[
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  String get mN => _monthNames[date.month - 1];

  @override
  String get wN => _weekDayNames[date.weekDay - 1];
}
