import 'dart:math' as math;

import 'package:u/utilities.dart';
typedef TextMapper = String Function(String numberText);

class LinearDatePicker extends StatefulWidget {
  const LinearDatePicker({
    required this.onDateChanged,
    super.key,
    this.startDate = '',
    this.endDate = '',
    this.initialDate = '',
    this.showDay = true,
    this.labelStyle,
    this.selectedRowStyle,
    this.unselectedRowStyle,
    this.yearText = 'سال',
    this.monthText = 'ماه',
    this.dayText = 'روز',
    this.showLabels = true,
    this.columnWidth = 55.0,
    this.isJalaali = false,
    this.showMonthName = false,
    this.addLeadingZero = false,
  });

  final bool showDay;
  final ValueChanged<String> onDateChanged;

  final String startDate;
  final String endDate;
  final String initialDate;

  final TextStyle? labelStyle;
  final TextStyle? selectedRowStyle;
  final TextStyle? unselectedRowStyle;

  final String yearText;
  final String monthText;
  final String dayText;

  final bool showLabels;
  final double columnWidth;
  final bool isJalaali;
  final bool showMonthName;
  final bool addLeadingZero;

  @override
  State<LinearDatePicker> createState() => _LinearDatePickerState();
}

class _LinearDatePickerState extends State<LinearDatePicker> {
  late int _selectedYear;
  late int _selectedMonth;
  late int _selectedDay;

  late final int _minYear;
  late final int _maxYear;
  final int _minMonth = 1;
  final int _maxMonth = 12;
  final int _minDay = 1;

  @override
  void initState() {
    super.initState();
    _initializeDateRange();
    _initializeSelectedDate();
  }

  void _initializeDateRange() {
    final now = widget.isJalaali ? Jalali.now().year : Gregorian.now().year;
    _minYear = now - 100;
    _maxYear = now;
  }

  void _initializeSelectedDate() {
    if (widget.initialDate.isNotEmpty) {
      final parts = widget.initialDate.split('/');
      _selectedYear = int.parse(parts[0]);
      _selectedMonth = int.parse(parts[1]);
      _selectedDay = widget.showDay ? int.parse(parts[2]) : _getCurrentDay();
    } else {
      final now = widget.isJalaali ? Jalali.now() : Gregorian.now();
      _selectedYear = now.year;
      _selectedMonth = now.month;
      _selectedDay = now.day;
    }
  }

  int _getCurrentDay() => widget.isJalaali ? Jalali.now().day : Gregorian.now().day;

  @override
  Widget build(BuildContext context) {
    final maxDay = _getMonthLength(_selectedYear, _selectedMonth);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showLabels) _buildLabels(),
        _buildDatePickers(maxDay),
      ],
    );
  }

  Widget _buildLabels() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildLabel(widget.yearText),
      _buildLabel(widget.monthText),
      if (widget.showDay) _buildLabel(widget.dayText),
    ],
  );

  Widget _buildLabel(String text) => SizedBox(
    width: widget.columnWidth,
    child: Text(
      text,
      style: widget.labelStyle,
      textAlign: TextAlign.center,
    ),
  );

  Widget _buildDatePickers(int maxDay) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildYearPicker(),
      _buildMonthPicker(),
      if (widget.showDay) _buildDayPicker(maxDay),
    ],
  );

  Widget _buildYearPicker() => NumberPicker.integer(
    listViewWidth: widget.columnWidth,
    initialValue: _selectedYear,
    minValue: _getMinimumYear(),
    maxValue: _getMaximumYear(),
    selectedRowStyle: widget.selectedRowStyle,
    unselectedRowStyle: widget.unselectedRowStyle,
    onChanged: (value) => _handleYearChange(value as int),
  );

  Widget _buildMonthPicker() => NumberPicker.integer(
    listViewWidth: widget.columnWidth,
    initialValue: _selectedMonth,
    minValue: _getMinimumMonth(),
    maxValue: _getMaximumMonth(),
    selectedRowStyle: widget.selectedRowStyle,
    unselectedRowStyle: widget.unselectedRowStyle,
    isShowMonthName: widget.showMonthName,
    isJalali: widget.isJalaali,
    onChanged: (value) => _handleMonthChange(value as int),
  );

  Widget _buildDayPicker(int maxDay) => NumberPicker.integer(
    listViewWidth: widget.columnWidth,
    initialValue: _selectedDay,
    minValue: _getMinimumDay(),
    maxValue: math.min(maxDay, _getMaximumDay()),
    selectedRowStyle: widget.selectedRowStyle,
    unselectedRowStyle: widget.unselectedRowStyle,
    onChanged: (value) => _handleDayChange(value as int),
  );

  void _handleYearChange(int year) {
    if (year != _selectedYear) {
      setState(() {
        _selectedYear = year;
        _notifyDateChange();
      });
    }
  }

  void _handleMonthChange(int month) {
    if (month != _selectedMonth) {
      setState(() {
        _selectedMonth = month;
        _selectedDay = math.min(_selectedDay, _getMonthLength(_selectedYear, _selectedMonth));
        _notifyDateChange();
      });
    }
  }

  void _handleDayChange(int day) {
    if (day != _selectedDay) {
      setState(() {
        _selectedDay = day;
        _notifyDateChange();
      });
    }
  }

  void _notifyDateChange() {
    final year = _selectedYear.toString().padLeft(widget.addLeadingZero ? 4 : 1, '0');
    final month = _selectedMonth.toString().padLeft(widget.addLeadingZero ? 2 : 1, '0');

    if (widget.showDay) {
      final day = _selectedDay.toString().padLeft(widget.addLeadingZero ? 2 : 1, '0');
      widget.onDateChanged('$year/$month/$day');
    } else {
      widget.onDateChanged('$year/$month');
    }
  }

  int _getMonthLength(int year, int month) {
    if (widget.isJalaali) {
      if (month <= 6) return 31;
      if (month < 12) return 30;
      return Jalali(year).isLeapYear() ? 30 : 29;
    } else {
      final nextMonth = month == 12
          ? DateTime(year + 1, 1, 1)
          : DateTime(year, month + 1, 1);
      return nextMonth.subtract(const Duration(days: 1)).day;
    }
  }

  int _getMinimumMonth() {
    if (widget.startDate.isEmpty) return _minMonth;

    final startMonth = int.parse(widget.startDate.split('/')[1]);
    return _selectedYear == _getMinimumYear() ? startMonth : _minMonth;
  }

  int _getMaximumMonth() {
    if (widget.endDate.isEmpty) return _maxMonth;

    final endMonth = int.parse(widget.endDate.split('/')[1]);
    return _selectedYear == _getMaximumYear() ? endMonth : _maxMonth;
  }

  int _getMinimumYear() {
    return widget.startDate.isEmpty
        ? _minYear
        : int.parse(widget.startDate.split('/')[0]);
  }

  int _getMaximumYear() {
    return widget.endDate.isEmpty
        ? _maxYear
        : int.parse(widget.endDate.split('/')[0]);
  }

  int _getMinimumDay() {
    if (!widget.showDay || widget.startDate.isEmpty) return _minDay;

    final startDay = int.parse(widget.startDate.split('/')[2]);
    return (_selectedYear == _getMinimumYear() && _selectedMonth == _getMinimumMonth())
        ? startDay
        : _minDay;
  }

  int _getMaximumDay() {
    if (!widget.showDay || widget.endDate.isEmpty) {
      return _getMonthLength(_selectedYear, _selectedMonth);
    }

    final endDay = int.parse(widget.endDate.split('/')[2]);
    return (_selectedYear == _getMaximumYear() && _selectedMonth == _getMaximumMonth())
        ? endDay
        : _getMonthLength(_selectedYear, _selectedMonth);
  }
}

class NumberPicker extends StatelessWidget {
  NumberPicker.integer({
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    super.key,
    this.enabled = true,
    this.textMapper,
    this.itemExtent = kDefaultItemExtent,
    this.listViewWidth = kDefaultListViewCrossAxisSize,
    this.step = 1,
    this.scrollDirection = Axis.vertical,
    this.zeroPad = false,
    this.highlightSelectedValue = true,
    this.decoration,
    this.haptics = false,
    this.selectedRowStyle,
    this.unselectedRowStyle,
    this.isShowMonthName = false,
    this.isJalali = false,
  })  : assert(maxValue >= minValue, 'maxValue must be >= minValue'),
        assert(step > 0, 'step must be > 0'),
        selectedIntValue = initialValue.clamp(minValue, maxValue),
        selectedDecimalValue = -1,
        decimalPlaces = 0,
        intScrollController = ScrollController(
          initialScrollOffset: ((initialValue - minValue) ~/ step) * itemExtent,
        ),
        decimalScrollController = null,
        listViewHeight = 3 * itemExtent,
        integerItemCount = ((maxValue - minValue) ~/ step) + 1;

  static const double kDefaultItemExtent = 50;
  static const double kDefaultListViewCrossAxisSize = 100;

  final int initialValue;
  final int minValue;
  final int maxValue;
  final ValueChanged<num> onChanged;
  final bool enabled;
  final TextMapper? textMapper;
  final int decimalPlaces;
  final double itemExtent;
  final double listViewHeight;
  final double? listViewWidth;
  final ScrollController intScrollController;
  final ScrollController? decimalScrollController;
  final int selectedIntValue;
  final int selectedDecimalValue;
  final bool highlightSelectedValue;
  final Decoration? decoration;
  final int step;
  final Axis scrollDirection;
  final bool zeroPad;
  final int integerItemCount;
  final bool haptics;
  final TextStyle? selectedRowStyle;
  final TextStyle? unselectedRowStyle;
  final bool isShowMonthName;
  final bool isJalali;

  void animateInt(int valueToSelect) {
    final index = (valueToSelect - minValue) ~/ step;
    _animate(intScrollController, index * itemExtent);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = unselectedRowStyle ?? theme.textTheme.bodyMedium!;
    final selectedStyle = selectedRowStyle ?? theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700);
    final listItemCount = integerItemCount + 2;

    return Listener(
      onPointerUp: (_) {
        if (intScrollController.position is HoldScrollActivity) {
          animateInt(selectedIntValue);
        }
      },
      child: NotificationListener(
        onNotification: _onIntegerNotification,
        child: SizedBox(
          height: listViewHeight,
          width: listViewWidth,
          child: Stack(
            children: [
              ListView.builder(
                scrollDirection: scrollDirection,
                controller: intScrollController,
                itemExtent: itemExtent,
                physics: enabled ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
                itemCount: listItemCount,
                cacheExtent: _calculateCacheExtent(listItemCount),
                itemBuilder: (context, index) {
                  final value = _intValueFromIndex(index);
                  final isExtra = index == 0 || index == listItemCount - 1;

                  return isExtra
                      ? Container()
                      : Center(
                    child: Text(
                      getDisplayedValue(value),
                      style: value == selectedIntValue && highlightSelectedValue
                          ? selectedStyle
                          : defaultStyle,
                    ),
                  );
                },
              ),
              _NumberPickerSelectedItemDecoration(
                axis: scrollDirection,
                itemExtent: itemExtent,
                decoration: decoration,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getDisplayedValue(int value) {
    if (isShowMonthName) {
      return value.getMonthName(isJalali);
    }
    return zeroPad
        ? value.toString().padLeft(maxValue.toString().length, '0')
        : value.toString();
  }

  int _intValueFromIndex(int index) {
    index--;
    index %= integerItemCount;
    return minValue + index * step;
  }

  bool _onIntegerNotification(Notification notification) {
    if (notification is ScrollNotification) {
      var middleIndex = (notification.metrics.pixels / itemExtent).round().clamp(0, integerItemCount - 1);
      var middleValue = _normalizeIntegerMiddleValue(_intValueFromIndex(middleIndex + 1));

      if (_userStoppedScrolling(notification, intScrollController)) {
        animateInt(middleValue);
      }

      if (middleValue != selectedIntValue) {
        if (haptics) HapticFeedback.selectionClick();
        onChanged(middleValue);
      }
    }
    return true;
  }

  double _calculateCacheExtent(int itemCount) {
    final cacheExtent = 250.0;
    return (itemCount - 2) * kDefaultItemExtent <= cacheExtent
        ? (itemCount - 3) * kDefaultItemExtent
        : cacheExtent;
  }

  int _normalizeIntegerMiddleValue(int value) => value.clamp(minValue, (maxValue ~/ step) * step);

  bool _userStoppedScrolling(Notification notification, ScrollController controller) =>
      notification is UserScrollNotification &&
          notification.direction == ScrollDirection.idle &&
          controller.position is! HoldScrollActivity;

  void _animate(ScrollController controller, double value) {
    controller.animateTo(
      value,
      duration: const Duration(seconds: 1),
      curve: const ElasticOutCurve(),
    );
  }
}

class _NumberPickerSelectedItemDecoration extends StatelessWidget {
  const _NumberPickerSelectedItemDecoration({
    required this.axis,
    required this.itemExtent,
    required this.decoration,
  });

  final Axis axis;
  final double itemExtent;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) => Center(
    child: IgnorePointer(
      child: Container(
        width: isVertical ? double.infinity : itemExtent,
        height: isVertical ? itemExtent : double.infinity,
        decoration: decoration,
      ),
    ),
  );

  bool get isVertical => axis == Axis.vertical;
}

class NumberPickerDialog extends StatefulWidget {
  const NumberPickerDialog.integer({
    required this.minValue,
    required this.maxValue,
    required this.initialIntegerValue,
    super.key,
    this.title,
    this.titlePadding,
    this.step = 1,
    this.zeroPad = false,
    this.highlightSelectedValue = true,
    this.decoration,
    this.textMapper,
    this.haptics = false,
    this.confirmWidget = const Text('OK'),
    this.cancelWidget = const Text('CANCEL'),
    this.isShowMonthName = false,
    this.isJalali = false,
  }) : decimalPlaces = 0;

  final int minValue;
  final int maxValue;
  final int initialIntegerValue;
  final int decimalPlaces;
  final Widget? title;
  final EdgeInsets? titlePadding;
  final Widget confirmWidget;
  final Widget cancelWidget;
  final int step;
  final bool zeroPad;
  final bool highlightSelectedValue;
  final Decoration? decoration;
  final TextMapper? textMapper;
  final bool haptics;
  final bool isShowMonthName;
  final bool isJalali;

  @override
  State<NumberPickerDialog> createState() => _NumberPickerDialogState();
}

class _NumberPickerDialogState extends State<NumberPickerDialog> {
  late int selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialIntegerValue;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title,
      titlePadding: widget.titlePadding,
      content: NumberPicker.integer(
        initialValue: selectedValue,
        minValue: widget.minValue,
        maxValue: widget.maxValue,
        step: widget.step,
        zeroPad: widget.zeroPad,
        highlightSelectedValue: widget.highlightSelectedValue,
        decoration: widget.decoration,
        onChanged: (value) => setState(() => selectedValue = value as int),
        textMapper: widget.textMapper,
        haptics: widget.haptics,
        isShowMonthName: widget.isShowMonthName,
        isJalali: widget.isJalali,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: widget.cancelWidget,
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, selectedValue),
          child: widget.confirmWidget,
        ),
      ],
    );
  }
}