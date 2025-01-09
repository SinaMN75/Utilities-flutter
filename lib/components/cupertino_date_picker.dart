import 'dart:math' as math;

import 'package:u/utilities.dart';

class LinearDatePicker extends StatefulWidget {
  const LinearDatePicker({
    required this.dateChangeListener,
    super.key,
    this.startDate = "",
    this.endDate = "",
    this.initialDate = "",
    this.showDay = true,
    this.labelStyle,
    this.selectedRowStyle,
    this.unselectedRowStyle,
    this.yearText = "سال",
    this.monthText = "ماه",
    this.dayText = "روز",
    this.showLabels = true,
    this.columnWidth = 55.0,
    this.isJalaali = false,
    this.showMonthName = false,
    this.addLeadingZero = false,
  });

  final bool showDay;
  final Function(String date) dateChangeListener;

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
  _LinearDatePickerState createState() => _LinearDatePickerState();
}

class _LinearDatePickerState extends State<LinearDatePicker> {
  int? _selectedYear;
  int? _selectedMonth;
  late int _selectedDay;

  int? minYear;
  int? maxYear;

  int minMonth = 01;
  int maxMonth = 12;

  int minDay = 01;
  int maxDay = 31;

  @override
  initState() {
    super.initState();
    if (widget.isJalaali) {
      minYear = Jalali.now().year - 100;
      maxYear = Jalali.now().year;
    } else {
      minYear = Gregorian.now().year - 100;
      maxYear = Gregorian.now().year;
    }
    if (widget.initialDate.isNotEmpty) {
      final List<String> initList = widget.initialDate.split("/");
      _selectedYear = int.parse(initList[0]);
      _selectedMonth = int.parse(initList[1]);
      if (widget.showDay) {
        _selectedDay = int.parse(initList[2]);
      } else {
        _selectedDay = widget.isJalaali ? Jalali.now().day : Jalali.now().day;
      }
    } else {
      if (widget.isJalaali) {
        _selectedYear = Jalali.now().year;
        _selectedMonth = Jalali.now().month;
        _selectedDay = Jalali.now().day;
      } else {
        _selectedYear = Gregorian.now().year;
        _selectedMonth = Gregorian.now().month;
        _selectedDay = Gregorian.now().day;
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    maxDay = _getMonthLength(_selectedYear, _selectedMonth);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Visibility(
          visible: widget.showLabels,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: widget.columnWidth,
                  child: Text(
                    widget.yearText,
                    style: widget.labelStyle,
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                  width: widget.columnWidth,
                  child: Text(
                    widget.monthText,
                    style: widget.labelStyle,
                    textAlign: TextAlign.center,
                  )),
              Visibility(
                visible: widget.showDay,
                child: SizedBox(
                    width: widget.columnWidth,
                    child: Text(
                      widget.dayText,
                      style: widget.labelStyle,
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NumberPicker.integer(
                listViewWidth: widget.columnWidth,
                initialValue: _selectedYear!,
                minValue: _getMinimumYear()!,
                maxValue: _getMaximumYear(),
                selectedRowStyle: widget.selectedRowStyle,
                unselectedRowStyle: widget.unselectedRowStyle,
                onChanged: (final num value) {
                  if (value != _selectedYear) {
                    setState(() {
                      _selectedYear = value as int?;
                      if (widget.showDay) {
                        widget.dateChangeListener("${_selectedYear.toString().padLeft(widget.addLeadingZero ? 4 : 1, "0")}/${_selectedMonth.toString().padLeft(widget.addLeadingZero ? 2 : 1, "0")}/${_selectedDay.toString().padLeft(widget.addLeadingZero ? 2 : 1, "0")}");
                      } else {
                        widget.dateChangeListener("${_selectedYear.toString().padLeft(widget.addLeadingZero ? 4 : 1, "0")}/${_selectedMonth.toString().padLeft(widget.addLeadingZero ? 2 : 1, "0")}");
                      }
                    });
                  }
                }),
            NumberPicker.integer(
                listViewWidth: widget.columnWidth,
                initialValue: _selectedMonth!,
                minValue: _getMinimumMonth(),
                maxValue: _getMaximumMonth(),
                selectedRowStyle: widget.selectedRowStyle,
                unselectedRowStyle: widget.unselectedRowStyle,
                isShowMonthName: widget.showMonthName,
                isJalali: widget.isJalaali,
                onChanged: (final num value) {
                  if (value != _selectedMonth) {
                    setState(() {
                      _selectedMonth = value as int?;
                      if (widget.showDay) {
                        widget.dateChangeListener("${_selectedYear.toString().padLeft(widget.addLeadingZero ? 4 : 1, "0")}/${_selectedMonth.toString().padLeft(widget.addLeadingZero ? 2 : 1, "0")}/${_selectedDay.toString().padLeft(widget.addLeadingZero ? 2 : 1, "0")}");
                      } else {
                        widget.dateChangeListener("${_selectedYear.toString().padLeft(widget.addLeadingZero ? 4 : 1, "0")}/${_selectedMonth.toString().padLeft(widget.addLeadingZero ? 2 : 1, "0")}");
                      }
                    });
                  }
                }),
            Visibility(
              visible: widget.showDay,
              child: NumberPicker.integer(
                  listViewWidth: widget.columnWidth,
                  initialValue: _selectedDay,
                  minValue: _getMinimumDay(),
                  maxValue: _getMaximumDay(),
                  selectedRowStyle: widget.selectedRowStyle,
                  unselectedRowStyle: widget.unselectedRowStyle,
                  onChanged: (final num value) {
                    if (value != _selectedDay) {
                      setState(() {
                        _selectedDay = value as int;
                        if (widget.showDay) {
                          widget.dateChangeListener("${_selectedYear.toString().padLeft(widget.addLeadingZero ? 4 : 1, "0")}/${_selectedMonth.toString().padLeft(widget.addLeadingZero ? 2 : 1, "0")}/${_selectedDay.toString().padLeft(widget.addLeadingZero ? 2 : 1, "0")}");
                        } else {
                          widget.dateChangeListener("${_selectedYear.toString().padLeft(widget.addLeadingZero ? 4 : 1, "0")}/${_selectedMonth.toString().padLeft(widget.addLeadingZero ? 2 : 1, "0")}");
                        }
                      });
                    }
                  }),
            )
          ],
        ),
      ],
    );
  }

  int _getMonthLength(final int? selectedYear, final int? selectedMonth) {
    if (widget.isJalaali) {
      if (selectedMonth! <= 6) {
        return 31;
      }
      if (selectedMonth > 6 && selectedMonth < 12) {
        return 30;
      }
      if (Jalali(selectedYear!).isLeapYear()) {
        return 30;
      } else {
        return 29;
      }
    } else {
      DateTime firstOfNextMonth;
      if (selectedMonth == 12) {
        firstOfNextMonth = DateTime(selectedYear! + 1, 1, 1, 12);
      } else {
        firstOfNextMonth = DateTime(selectedYear!, selectedMonth! + 1, 1, 12);
      }
      final int numberOfDaysInMonth = firstOfNextMonth.subtract(const Duration(days: 1)).day;

      return numberOfDaysInMonth;
    }
  }

  int _getMinimumMonth() {
    if (widget.startDate.isNotEmpty) {
      final List<String> startList = widget.startDate.split("/");
      final int startMonth = int.parse(startList[1]);

      if (_selectedYear == _getMinimumYear()) {
        return startMonth;
      }
    }

    return minMonth;
  }

  int _getMaximumMonth() {
    if (widget.endDate.isNotEmpty) {
      final List<String> endList = widget.endDate.split("/");
      final int endMonth = int.parse(endList[1]);
      if (_selectedYear == _getMaximumYear()) {
        return endMonth;
      }
    }
    return maxMonth;
  }

  int? _getMinimumYear() {
    if (widget.startDate.isNotEmpty) {
      final List<String> startList = widget.startDate.split("/");
      return int.parse(startList[0]);
    }
    return minYear;
  }

  _getMaximumYear() {
    if (widget.endDate.isNotEmpty) {
      final List<String> endList = widget.endDate.split("/");
      return int.parse(endList[0]);
    }
    return maxYear;
  }

  int _getMinimumDay() {
    if (widget.startDate.isNotEmpty && widget.showDay) {
      final List<String> startList = widget.startDate.split("/");
      final int startDay = int.parse(startList[2]);

      if (_selectedYear == _getMinimumYear() && _selectedMonth == _getMinimumMonth()) {
        return startDay;
      }
    }

    return minDay;
  }

  int _getMaximumDay() {
    if (widget.endDate.isNotEmpty && widget.showDay) {
      final List<String> endList = widget.endDate.split("/");
      final int endDay = int.parse(endList[2]);
      if (_selectedYear == _getMaximumYear() && _selectedMonth == _getMaximumMonth()) {
        return endDay;
      }
    }
    return _getMonthLength(_selectedYear, _selectedMonth);
  }
}

typedef TextMapper = String Function(String numberText);

class NumberPicker extends StatelessWidget {
  NumberPicker.integer({
    required final int initialValue,
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
  })  : assert(maxValue >= minValue, ""),
        assert(step > 0, ""),
        selectedIntValue = (initialValue < minValue) ? minValue : ((initialValue > maxValue) ? maxValue : initialValue),
        selectedDecimalValue = -1,
        decimalPlaces = 0,
        intScrollController = ScrollController(
          initialScrollOffset: (initialValue - minValue) ~/ step * itemExtent,
        ),
        decimalScrollController = null,
        listViewHeight = 3 * itemExtent,
        integerItemCount = (maxValue - minValue) ~/ step + 1 {
    onChanged(selectedIntValue);
  }

  static const double kDefaultItemExtent = 50;

  static const double kDefaultListViewCrossAxisSize = 100;

  final ValueChanged<num> onChanged;

  final int minValue;

  final int maxValue;

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

  final bool? isShowMonthName;

  final bool? isJalali;

  void animateInt(final int valueToSelect) {
    final int diff = valueToSelect - minValue;
    final int index = diff ~/ step;
    animateIntToIndex(index);
  }

  void animateIntToIndex(final int index) {
    _animate(intScrollController, index * itemExtent);
  }

  void animateDecimal(final int decimalValue) {
    _animate(decimalScrollController!, decimalValue * itemExtent);
  }

  void animateDecimalAndInteger(final double valueToSelect) {
    animateInt(valueToSelect.floor());
    animateDecimal(((valueToSelect - valueToSelect.floorToDouble()) * math.pow(10, decimalPlaces)).round());
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return _integerListView(themeData);
  }

  Widget _integerListView(final ThemeData themeData) {
    TextStyle defaultStyle;
    TextStyle selectedStyle;

    defaultStyle = unselectedRowStyle ?? themeData.textTheme.bodyMedium!;
    selectedStyle = selectedRowStyle ?? themeData.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700);

    final int listItemCount = integerItemCount + 2;

    return Listener(
      onPointerUp: (final PointerUpEvent ev) {
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
            children: <Widget>[
              ListView.builder(
                scrollDirection: scrollDirection,
                controller: intScrollController,
                itemExtent: itemExtent,
                physics: enabled ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
                itemCount: listItemCount,
                cacheExtent: _calculateCacheExtent(listItemCount),
                itemBuilder: (final BuildContext context, final int index) {
                  final int value = _intValueFromIndex(index);

                  final TextStyle itemStyle = value == selectedIntValue && highlightSelectedValue ? selectedStyle : defaultStyle;

                  final bool isExtra = index == 0 || index == listItemCount - 1;

                  return isExtra
                      ? Container()
                      : Center(
                          child: Text(
                            getDisplayedValue(value),
                            style: itemStyle,
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

  String getDisplayedValue(final int value) {
    if (isShowMonthName!) {
      return value.getMonthName(isJalali!);
    } else {
      final String text = zeroPad ? value.toString().padLeft(maxValue.toString().length, '0') : value.toString();
      return textMapper != null ? textMapper!(text) : text;
    }
  }

  int _intValueFromIndex(int index) {
    index--;
    index %= integerItemCount;
    return minValue + index * step;
  }

  bool _onIntegerNotification(final Notification notification) {
    if (notification is ScrollNotification) {
      int intIndexOfMiddleElement = (notification.metrics.pixels / itemExtent).round();
      intIndexOfMiddleElement = intIndexOfMiddleElement.clamp(0, integerItemCount - 1);
      int intValueInTheMiddle = _intValueFromIndex(intIndexOfMiddleElement + 1);
      intValueInTheMiddle = _normalizeIntegerMiddleValue(intValueInTheMiddle);

      if (_userStoppedScrolling(notification, intScrollController)) {
        animateIntToIndex(intIndexOfMiddleElement);
      }

      if (intValueInTheMiddle != selectedIntValue) {
        num newValue;
        if (decimalPlaces == 0) {
          newValue = intValueInTheMiddle;
        } else {
          if (intValueInTheMiddle == maxValue) {
            newValue = intValueInTheMiddle.toDouble();
            animateDecimal(0);
          } else {
            final double decimalPart = _toDecimal(selectedDecimalValue);
            newValue = intValueInTheMiddle + decimalPart;
          }
        }
        if (haptics) {
          HapticFeedback.selectionClick();
        }
        onChanged(newValue);
      }
    }
    return true;
  }

  double _calculateCacheExtent(final int itemCount) {
    double cacheExtent = 250;
    if ((itemCount - 2) * kDefaultItemExtent <= cacheExtent) {
      cacheExtent = (itemCount - 3) * kDefaultItemExtent;
    }
    return cacheExtent;
  }

  int _normalizeMiddleValue(final int valueInTheMiddle, final int min, final int max) => math.max(math.min(valueInTheMiddle, max), min);

  int _normalizeIntegerMiddleValue(final int integerValueInTheMiddle) {
    final int max = (maxValue ~/ step) * step;
    return _normalizeMiddleValue(integerValueInTheMiddle, minValue, max);
  }

  bool _userStoppedScrolling(
    final Notification notification,
    final ScrollController scrollController,
  ) =>
      notification is UserScrollNotification && notification.direction == ScrollDirection.idle && scrollController.position is! HoldScrollActivity;

  double _toDecimal(final int decimalValueAsInteger) => double.parse(
        (decimalValueAsInteger * math.pow(10, -decimalPlaces)).toStringAsFixed(decimalPlaces),
      );

  void _animate(final ScrollController scrollController, final double value) {
    scrollController.animateTo(
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
  Widget build(final BuildContext context) => Center(
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
    this.infiniteLoop = false,
    this.zeroPad = false,
    this.highlightSelectedValue = true,
    this.decoration,
    this.textMapper,
    this.haptics = false,
    final Widget? confirmWidget,
    final Widget? cancelWidget,
    this.isShowMonthName = false,
    this.isJalali = false,
  })  : confirmWidget = confirmWidget ?? const Text("OK"),
        cancelWidget = cancelWidget ?? const Text("CANCEL"),
        decimalPlaces = 0,
        initialDoubleValue = -1.0;

  const NumberPickerDialog.decimal({
    required this.minValue,
    required this.maxValue,
    required this.initialDoubleValue,
    super.key,
    this.decimalPlaces = 1,
    this.title,
    this.titlePadding,
    this.highlightSelectedValue = true,
    this.decoration,
    this.textMapper,
    this.haptics = false,
    final Widget? confirmWidget,
    final Widget? cancelWidget,
    this.isShowMonthName = false,
    this.isJalali = false,
  })  : confirmWidget = confirmWidget ?? const Text("OK"),
        cancelWidget = cancelWidget ?? const Text("CANCEL"),
        initialIntegerValue = -1,
        step = 1,
        infiniteLoop = false,
        zeroPad = false;
  final int minValue;
  final int maxValue;
  final int initialIntegerValue;
  final double initialDoubleValue;
  final int decimalPlaces;
  final Widget? title;
  final EdgeInsets? titlePadding;
  final Widget confirmWidget;
  final Widget cancelWidget;
  final int step;
  final bool infiniteLoop;
  final bool zeroPad;
  final bool highlightSelectedValue;
  final Decoration? decoration;
  final TextMapper? textMapper;
  final bool haptics;

  final bool isShowMonthName;
  final bool isJalali;

  @override
  State<NumberPickerDialog> createState() => _NumberPickerDialogControllerState(
        initialIntegerValue,
        initialDoubleValue,
      );
}

class _NumberPickerDialogControllerState extends State<NumberPickerDialog> {
  _NumberPickerDialogControllerState(this.selectedIntValue, this.selectedDoubleValue);

  int selectedIntValue;
  double selectedDoubleValue;

  void _handleValueChanged(final num value) {
    if (value is int) {
      setState(() => selectedIntValue = value);
    } else {
      setState(() => selectedDoubleValue = value as double);
    }
  }

  NumberPicker _buildNumberPicker() => NumberPicker.integer(
        initialValue: selectedIntValue,
        minValue: widget.minValue,
        maxValue: widget.maxValue,
        step: widget.step,
        zeroPad: widget.zeroPad,
        highlightSelectedValue: widget.highlightSelectedValue,
        decoration: widget.decoration,
        onChanged: _handleValueChanged,
        textMapper: widget.textMapper,
        haptics: widget.haptics,
      );

  @override
  Widget build(final BuildContext context) => AlertDialog(
        title: widget.title,
        titlePadding: widget.titlePadding,
        content: _buildNumberPicker(),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: widget.cancelWidget,
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(
              widget.decimalPlaces > 0 ? selectedDoubleValue : selectedIntValue,
            ),
            child: widget.confirmWidget,
          ),
        ],
      );
}
