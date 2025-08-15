import 'package:u/utilities.dart';

enum _PickerMode { calendar, selectYear, selectMonth }

class JalaliDatePickerDialog extends StatefulWidget {
  const JalaliDatePickerDialog({
    required this.initialDate,
    required this.onDateSelected,
    super.key,
  });

  final Jalali initialDate;
  final Function(DateTime, Jalali) onDateSelected;

  @override
  _JalaliDatePickerDialogState createState() => _JalaliDatePickerDialogState();
}

class _JalaliDatePickerDialogState extends State<JalaliDatePickerDialog> {
  late Jalali selectedDate;
  late int currentYear;
  late int currentMonth;
  _PickerMode mode = _PickerMode.selectYear;

  final List<String> monthNames = <String>[
    "فروردین",
    "اردیبهشت",
    "خرداد",
    "تیر",
    "مرداد",
    "شهریور",
    "مهر",
    "آبان",
    "آذر",
    "دی",
    "بهمن",
    "اسفند",
  ];

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    currentYear = selectedDate.year;
    currentMonth = selectedDate.month;
  }

  Widget _buildHeader() => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "$currentYear",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            monthNames[currentMonth - 1],
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ).container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        backgroundColor: Colors.blueAccent,
      );

  Widget _buildCalendarNavigation() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                // Go to previous month
                if (currentMonth == 1) {
                  currentMonth = 12;
                  currentYear--;
                } else {
                  currentMonth--;
                }
              });
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Text(
            "${monthNames[currentMonth - 1]} $currentYear",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                // Go to next month
                if (currentMonth == 12) {
                  currentMonth = 1;
                  currentYear++;
                } else {
                  currentMonth++;
                }
              });
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      );

  /// Builds the calendar grid of days.
  Widget _buildCalendarGrid() {
    final List<Widget> dayWidgets = <Widget>[];

    // Weekday headers (you may adjust the labels to local language as needed)
    const List<String> weekDays = <String>["شنبه", "یکشنبه", "دوشنبه", "سه‌شنبه", "چهارشنبه", "پنجشنبه", "جمعه"];
    dayWidgets.addAll(
      weekDays
          .map(
            (String day) => Text(day).labelSmall(fontWeight: FontWeight.bold).container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                ),
          )
          .toList(),
    );

    // Determine the first weekday offset for the month (Jalali weeks start on Saturday)
    final Jalali firstDayOfMonth = Jalali(currentYear, currentMonth);
    // In shamsi_date, weekday returns 1 for Saturday ... 7 for Friday.
    final int weekdayOffset = firstDayOfMonth.weekDay - 1;

    // Add empty containers for offset days.
    for (int i = 0; i < weekdayOffset; i++) {
      dayWidgets.add(const SizedBox());
    }

    // Add buttons for each day in the month
    final int daysInMonth = Jalali(currentYear, currentMonth).monthLength;
    for (int day = 1; day <= daysInMonth; day++) {
      final bool isSelected = (selectedDate.year == currentYear && selectedDate.month == currentMonth && selectedDate.day == day);
      dayWidgets.add(
        InkWell(
          onTap: () => setState(() => selectedDate = Jalali(currentYear, currentMonth, day)),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blueAccent : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "$day",
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }

    return Flexible(
      child: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 7,
        shrinkWrap: true,
        children: dayWidgets,
      ),
    );
  }

  /// Builds a grid view for selecting the year.
  Widget _buildYearSelection() {
    final int startYear = currentYear - 20;
    final int endYear = currentYear + 20;
    final List<Widget> yearWidgets = <Widget>[];
    for (int year = startYear; year <= endYear; year++) {
      yearWidgets.add(
        InkWell(
          onTap: () => setState(() {
            currentYear = year;
            selectedDate = Jalali(currentYear, currentMonth, selectedDate.day);
            mode = _PickerMode.selectMonth;
          }),
          child: Text(
            "$year",
            style: TextStyle(color: (year == currentYear) ? Colors.white : Colors.black87),
          ).container(
            backgroundColor: (year == currentYear) ? Colors.blueAccent : Colors.grey.shade200,
            radius: 6,
            margin: const EdgeInsets.all(2),
            alignment: Alignment.center,
          ),
        ),
      );
    }
    return Flexible(
      child: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 5,
        shrinkWrap: true,
        children: yearWidgets,
      ),
    );
  }

  /// Builds a grid view for selecting the month.
  Widget _buildMonthSelection() {
    final List<Widget> monthWidgets = <Widget>[];
    for (int i = 0; i < 12; i++) {
      monthWidgets.add(
        InkWell(
          onTap: () => setState(() {
            currentMonth = i + 1;
            selectedDate = Jalali(currentYear, currentMonth, selectedDate.day);
            mode = _PickerMode.calendar;
          }),
          child: Text(
            monthNames[i],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (currentMonth == i + 1) ? Colors.white : Colors.black87,
            ),
          ).container(
            backgroundColor: (currentMonth == i + 1) ? Colors.blueAccent : Colors.grey.shade200,
            radius: 6,
            margin: const EdgeInsets.all(2),
            alignment: Alignment.center,
          ),
        ),
      );
    }
    return Flexible(
      child: GridView.count(
        padding: const EdgeInsets.all(4),
        crossAxisCount: 4,
        shrinkWrap: true,
        children: monthWidgets,
      ),
    );
  }

  Widget _buildContent() {
    switch (mode) {
      case _PickerMode.selectYear:
        return _buildYearSelection();
      case _PickerMode.selectMonth:
        return _buildMonthSelection();
      case _PickerMode.calendar:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildCalendarNavigation(),
            _buildCalendarGrid(),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                _buildHeader().alignAtCenter(),
                IconButton(
                  onPressed: () => setState(() => mode = _PickerMode.selectYear),
                  icon: const Icon(Icons.calendar_month),
                ).alignAtCenterLeft().pOnly(top: 12, left: 12),
              ],
            ),
            Expanded(child: _buildContent()),
          ],
        ).container(width: 350, height: 500),
        actions: <Widget>[
          TextButton(
            onPressed: () => UNavigator.back(),
            child: const Text("انصراف"),
          ),
          TextButton(
            onPressed: () {
              widget.onDateSelected.call(selectedDate.toDateTime(), selectedDate);
              UNavigator.back(selectedDate);
            },
            child: const Text("تایید"),
          )
        ],
      );
}
