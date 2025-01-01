import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:u/utils/shamsi_date/shamsi_date.dart';

import '../material/date.dart';

const double _kItemExtent = 32.0;
const double _kPickerWidth = 320.0;
const double _kPickerHeight = 216.0;
const bool _kUseMagnifier = true;
const double _kMagnification = 2.35 / 2.1;
const double _kDatePickerPadSize = 12.0;
const double _kSqueeze = 1.25;

const TextStyle _kDefaultPickerTextStyle = TextStyle(
  letterSpacing: -0.83,
);

const double _kTimerPickerMagnification = 34 / 32;
const double _kTimerPickerMinHorizontalPadding = 30;
const double _kTimerPickerHalfColumnPadding = 4;
const double _kTimerPickerLabelPadSize = 6;
const double _kTimerPickerLabelFontSize = 17.0;

const double _kTimerPickerColumnIntrinsicWidth = 106;

TextStyle _themeTextStyle(BuildContext context, {bool isValid = true}) {
  final TextStyle style = CupertinoTheme.of(context).textTheme.dateTimePickerTextStyle;
  return isValid ? style.copyWith(color: CupertinoDynamicColor.maybeResolve(style.color, context)) : style.copyWith(color: CupertinoDynamicColor.resolve(CupertinoColors.inactiveGray, context));
}

void _animateColumnControllerToItem(FixedExtentScrollController controller, int targetItem) {
  controller.animateToItem(
    targetItem,
    curve: Curves.easeInOut,
    duration: const Duration(milliseconds: 200),
  );
}

const Widget _startSelectionOverlay = CupertinoPickerDefaultSelectionOverlay(capEndEdge: false);
const Widget _centerSelectionOverlay = CupertinoPickerDefaultSelectionOverlay(capStartEdge: false, capEndEdge: false);
const Widget _endSelectionOverlay = CupertinoPickerDefaultSelectionOverlay(capStartEdge: false);

class _DatePickerLayoutDelegate extends MultiChildLayoutDelegate {
  _DatePickerLayoutDelegate({
    required this.columnWidths,
    required this.textDirectionFactor,
    required this.maxWidth,
  });

  final List<double> columnWidths;

  final int textDirectionFactor;

  final double maxWidth;

  @override
  void performLayout(Size size) {
    double remainingWidth = maxWidth < size.width ? maxWidth : size.width;

    double currentHorizontalOffset = (size.width - remainingWidth) / 2;

    for (int i = 0; i < columnWidths.length; i++) {
      remainingWidth -= columnWidths[i] + _kDatePickerPadSize * 2;
    }

    for (int i = 0; i < columnWidths.length; i++) {
      final int index = textDirectionFactor == 1 ? i : columnWidths.length - i - 1;

      double childWidth = columnWidths[index] + _kDatePickerPadSize * 2;
      if (index == 0 || index == columnWidths.length - 1) {
        childWidth += remainingWidth / 2;
      }

      assert(() {
        if (childWidth < 0) {
          FlutterError.reportError(
            FlutterErrorDetails(
              exception: FlutterError(
                'Insufficient horizontal space to render the '
                'PersianCupertinoDatePicker because the parent is too narrow at '
                '${size.width}px.\n'
                'An additional ${-remainingWidth}px is needed to avoid '
                'overlapping columns.',
              ),
            ),
          );
        }
        return true;
      }());
      layoutChild(index, BoxConstraints.tight(Size(math.max(0.0, childWidth), size.height)));
      positionChild(index, Offset(currentHorizontalOffset, 0.0));

      currentHorizontalOffset += childWidth;
    }
  }

  @override
  bool shouldRelayout(_DatePickerLayoutDelegate oldDelegate) {
    return columnWidths != oldDelegate.columnWidths || textDirectionFactor != oldDelegate.textDirectionFactor;
  }
}

enum PersianCupertinoDatePickerMode {
  time,
  date,
  dateAndTime,
  monthYear,
}

enum _PickerColumnType {
  dayOfMonth,
  month,
  year,
  date,
  hour,
  minute,
  dayPeriod,
}

class PersianCupertinoDatePicker extends StatefulWidget {
  PersianCupertinoDatePicker({
    super.key,
    this.mode = PersianCupertinoDatePickerMode.dateAndTime,
    required this.onDateTimeChanged,
    Jalali? initialDateTime,
    this.minimumDate,
    this.maximumDate,
    this.minimumYear = 1,
    this.maximumYear,
    this.minuteInterval = 1,
    this.use24hFormat = false,
    this.dateOrder,
    this.backgroundColor,
    this.showDayOfWeek = false,
    this.itemExtent = _kItemExtent,
    this.selectionOverlayBuilder,
  })  : initialDateTime = initialDateTime ?? Jalali.now(),
        assert(
          itemExtent > 0,
          'item extent should be greater than 0',
        ),
        assert(
          minuteInterval > 0 && 60 % minuteInterval == 0,
          'minute interval is not a positive integer factor of 60',
        ) {
    assert(
      mode != PersianCupertinoDatePickerMode.dateAndTime || minimumDate == null || !this.initialDateTime.isBefore(minimumDate!),
      'initial date is before minimum date',
    );
    assert(
      mode != PersianCupertinoDatePickerMode.dateAndTime || maximumDate == null || !this.initialDateTime.isAfter(maximumDate!),
      'initial date is after maximum date',
    );
    assert(
      (mode != PersianCupertinoDatePickerMode.date && mode != PersianCupertinoDatePickerMode.monthYear) || (minimumYear >= 1 && this.initialDateTime.year >= minimumYear),
      'initial year is not greater than minimum year, or minimum year is not positive',
    );
    assert(
      (mode != PersianCupertinoDatePickerMode.date && mode != PersianCupertinoDatePickerMode.monthYear) || maximumYear == null || this.initialDateTime.year <= maximumYear!,
      'initial year is not smaller than maximum year',
    );
    assert(
      (mode != PersianCupertinoDatePickerMode.date && mode != PersianCupertinoDatePickerMode.monthYear) || minimumDate == null || !minimumDate!.isAfter(this.initialDateTime),
      'initial date ${this.initialDateTime} is not greater than or equal to minimumDate $minimumDate',
    );
    assert(
      (mode != PersianCupertinoDatePickerMode.date && mode != PersianCupertinoDatePickerMode.monthYear) || maximumDate == null || !maximumDate!.isBefore(this.initialDateTime),
      'initial date ${this.initialDateTime} is not less than or equal to maximumDate $maximumDate',
    );
    assert(
      this.initialDateTime.minute % minuteInterval == 0,
      'initial minute is not divisible by minute interval',
    );
  }

  final PersianCupertinoDatePickerMode mode;

  final Jalali initialDateTime;

  final Jalali? minimumDate;

  final Jalali? maximumDate;

  final int minimumYear;

  final int? maximumYear;

  final int minuteInterval;

  final bool use24hFormat;

  final DatePickerDateOrder? dateOrder;

  final ValueChanged<Jalali> onDateTimeChanged;

  final Color? backgroundColor;

  final bool showDayOfWeek;

  final double itemExtent;

  final SelectionOverlayBuilder? selectionOverlayBuilder;

  @override
  State<StatefulWidget> createState() {
    return switch (mode) {
      PersianCupertinoDatePickerMode.time => _CupertinoDatePickerDateTimeState(),
      PersianCupertinoDatePickerMode.dateAndTime => _CupertinoDatePickerDateTimeState(),
      PersianCupertinoDatePickerMode.date => _CupertinoDatePickerDateState(dateOrder: dateOrder),
      PersianCupertinoDatePickerMode.monthYear => _CupertinoDatePickerMonthYearState(dateOrder: dateOrder),
    };
  }

  static double _getColumnWidth(
    _PickerColumnType columnType,
    CupertinoLocalizations localizations,
    BuildContext context,
    bool showDayOfWeek, {
    bool standaloneMonth = false,
  }) {
    String longestText = '';

    switch (columnType) {
      case _PickerColumnType.date:
        for (int i = 1; i <= 12; i++) {
          final String date = localizations.datePickerMediumDate(Jalali(2018, i, 25).toDateTime());
          if (longestText.length < date.length) {
            longestText = date;
          }
        }
      case _PickerColumnType.hour:
        for (int i = 0; i < 24; i++) {
          final String hour = localizations.datePickerHour(i);
          if (longestText.length < hour.length) {
            longestText = hour;
          }
        }
      case _PickerColumnType.minute:
        for (int i = 0; i < 60; i++) {
          final String minute = localizations.datePickerMinute(i);
          if (longestText.length < minute.length) {
            longestText = minute;
          }
        }
      case _PickerColumnType.dayPeriod:
        longestText = localizations.anteMeridiemAbbreviation.length > localizations.postMeridiemAbbreviation.length ? localizations.anteMeridiemAbbreviation : localizations.postMeridiemAbbreviation;
      case _PickerColumnType.dayOfMonth:
        int longestDayOfMonth = 1;
        for (int i = 1; i <= 31; i++) {
          final String dayOfMonth = localizations.datePickerDayOfMonth(i);
          if (longestText.length < dayOfMonth.length) {
            longestText = dayOfMonth;
            longestDayOfMonth = i;
          }
        }
        if (showDayOfWeek) {
          for (int wd = 1; wd < JalaliExt.daysPerWeek; wd++) {
            final String dayOfMonth = localizations.datePickerDayOfMonth(longestDayOfMonth, wd);
            if (longestText.length < dayOfMonth.length) {
              longestText = dayOfMonth;
            }
          }
        }
      case _PickerColumnType.month:
        for (int i = 1; i <= 12; i++) {
          final String month = standaloneMonth ? localizations.datePickerStandaloneMonth(i) : localizations.datePickerMonth(i);
          if (longestText.length < month.length) {
            longestText = month;
          }
        }
      case _PickerColumnType.year:
        longestText = localizations.datePickerYear(2018);
    }

    assert(longestText != '', 'column type is not appropriate');

    return TextPainter.computeMaxIntrinsicWidth(
      text: TextSpan(
        style: _themeTextStyle(context),
        text: longestText,
      ),
      textDirection: Directionality.of(context),
    );
  }
}

typedef _ColumnBuilder = Widget Function(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay);

class _CupertinoDatePickerDateTimeState extends State<PersianCupertinoDatePicker> {
  static const double _kMaximumOffAxisFraction = 0.45;

  late int textDirectionFactor;
  late CupertinoLocalizations localizations;

  late Alignment alignCenterLeft;
  late Alignment alignCenterRight;

  late Jalali initialDateTime;

  int get selectedDayFromInitial {
    switch (widget.mode) {
      case PersianCupertinoDatePickerMode.dateAndTime:
        return dateController.hasClients ? dateController.selectedItem : 0;
      case PersianCupertinoDatePickerMode.time:
        return 0;
      case PersianCupertinoDatePickerMode.date:
      case PersianCupertinoDatePickerMode.monthYear:
        break;
    }
    assert(
      false,
      '$runtimeType is only meant for dateAndTime mode or time mode',
    );
    return 0;
  }

  late FixedExtentScrollController dateController;

  int get selectedHour => _selectedHour(selectedAmPm, _selectedHourIndex);

  int get _selectedHourIndex => hourController.hasClients ? hourController.selectedItem % 24 : initialDateTime.hour;

  int _selectedHour(int selectedAmPm, int selectedHour) {
    return _isHourRegionFlipped(selectedAmPm) ? (selectedHour + 12) % 24 : selectedHour;
  }

  late FixedExtentScrollController hourController;

  int get selectedMinute {
    return minuteController.hasClients ? minuteController.selectedItem * widget.minuteInterval % 60 : initialDateTime.minute;
  }

  late FixedExtentScrollController minuteController;

  late int selectedAmPm;

  bool get isHourRegionFlipped => _isHourRegionFlipped(selectedAmPm);

  bool _isHourRegionFlipped(int selectedAmPm) => selectedAmPm != meridiemRegion;

  late int meridiemRegion;

  late FixedExtentScrollController meridiemController;

  bool isDatePickerScrolling = false;
  bool isHourPickerScrolling = false;
  bool isMinutePickerScrolling = false;
  bool isMeridiemPickerScrolling = false;

  bool get isScrolling {
    return isDatePickerScrolling || isHourPickerScrolling || isMinutePickerScrolling || isMeridiemPickerScrolling;
  }

  final Map<int, double> estimatedColumnWidths = <int, double>{};

  @override
  void initState() {
    super.initState();
    initialDateTime = widget.initialDateTime;

    selectedAmPm = initialDateTime.hour ~/ 12;
    meridiemRegion = selectedAmPm;

    meridiemController = FixedExtentScrollController(initialItem: selectedAmPm);
    hourController = FixedExtentScrollController(initialItem: initialDateTime.hour);
    minuteController = FixedExtentScrollController(initialItem: initialDateTime.minute ~/ widget.minuteInterval);
    dateController = FixedExtentScrollController();

    PaintingBinding.instance.systemFonts.addListener(_handleSystemFontsChange);
  }

  void _handleSystemFontsChange() {
    setState(() {
      estimatedColumnWidths.clear();
    });
  }

  @override
  void dispose() {
    dateController.dispose();
    hourController.dispose();
    minuteController.dispose();
    meridiemController.dispose();

    PaintingBinding.instance.systemFonts.removeListener(_handleSystemFontsChange);
    super.dispose();
  }

  @override
  void didUpdateWidget(PersianCupertinoDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    assert(
      oldWidget.mode == widget.mode,
      "The $runtimeType's mode cannot change once it's built.",
    );

    if (!widget.use24hFormat && oldWidget.use24hFormat) {
      meridiemController.dispose();
      meridiemController = FixedExtentScrollController(initialItem: selectedAmPm);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    textDirectionFactor = Directionality.of(context) == TextDirection.ltr ? 1 : -1;
    localizations = CupertinoLocalizations.of(context);

    alignCenterLeft = textDirectionFactor == 1 ? Alignment.centerLeft : Alignment.centerRight;
    alignCenterRight = textDirectionFactor == 1 ? Alignment.centerRight : Alignment.centerLeft;

    estimatedColumnWidths.clear();
  }

  double _getEstimatedColumnWidth(_PickerColumnType columnType) {
    estimatedColumnWidths[columnType.index] ??= PersianCupertinoDatePicker._getColumnWidth(columnType, localizations, context, widget.showDayOfWeek);

    return estimatedColumnWidths[columnType.index]!;
  }

  Jalali get selectedDateTime {
    return Jalali(
      initialDateTime.year,
      initialDateTime.month,
      initialDateTime.day,
      selectedHour,
      selectedMinute,
    ).addDays(selectedDayFromInitial);
  }

  void _onSelectedItemChange(int index) {
    final Jalali selected = selectedDateTime;

    final bool isDateInvalid = (widget.minimumDate?.isAfter(selected) ?? false) || (widget.maximumDate?.isBefore(selected) ?? false);

    if (isDateInvalid) {
      return;
    }

    widget.onDateTimeChanged(selected);
  }

  Widget _buildMediumDatePicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isDatePickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isDatePickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker.builder(
        scrollController: dateController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: (int index) {
          _onSelectedItemChange(index);
        },
        itemBuilder: (BuildContext context, int index) {
          final Jalali rangeStart = Jalali(
            initialDateTime.year,
            initialDateTime.month,
            initialDateTime.day,
          ).addDays(index);

          final Jalali rangeEnd = Jalali(
            initialDateTime.year,
            initialDateTime.month,
            initialDateTime.day,
          ).addDays(index + 1);

          final Jalali now = Jalali.now();

          if (widget.minimumDate?.isBefore(rangeEnd) == false) {
            return null;
          }
          if (widget.maximumDate?.isAfter(rangeStart) == false) {
            return null;
          }

          final String dateText = rangeStart == Jalali(now.year, now.month, now.day) ? localizations.todayLabel : localizations.datePickerMediumDate(rangeStart.toDateTime());

          return itemPositioningBuilder(
            context,
            Text(dateText, style: _themeTextStyle(context)),
          );
        },
        selectionOverlay: selectionOverlay,
      ),
    );
  }

  bool _isValidHour(int meridiemIndex, int hourIndex) {
    final Jalali rangeStart = Jalali(
      initialDateTime.year,
      initialDateTime.month,
      initialDateTime.day,
      _selectedHour(meridiemIndex, hourIndex),
    ).addDays(selectedDayFromInitial);

    final Jalali rangeEnd = rangeStart.addHours(1);

    return (widget.minimumDate?.isBefore(rangeEnd) ?? true) && !(widget.maximumDate?.isBefore(rangeStart) ?? false);
  }

  Widget _buildHourPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isHourPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isHourPickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker(
        scrollController: hourController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: (int index) {
          final bool regionChanged = meridiemRegion != index ~/ 12;
          final bool debugIsFlipped = isHourRegionFlipped;

          if (regionChanged) {
            meridiemRegion = index ~/ 12;
            selectedAmPm = 1 - selectedAmPm;
          }

          if (!widget.use24hFormat && regionChanged) {
            meridiemController.animateToItem(
              selectedAmPm,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          } else {
            _onSelectedItemChange(index);
          }

          assert(debugIsFlipped == isHourRegionFlipped);
        },
        looping: true,
        selectionOverlay: selectionOverlay,
        children: List<Widget>.generate(24, (int index) {
          final int hour = isHourRegionFlipped ? (index + 12) % 24 : index;
          final int displayHour = widget.use24hFormat ? hour : (hour + 11) % 12 + 1;

          return itemPositioningBuilder(
            context,
            Text(
              localizations.datePickerHour(displayHour),
              semanticsLabel: localizations.datePickerHourSemanticsLabel(displayHour),
              style: _themeTextStyle(context, isValid: _isValidHour(selectedAmPm, index)),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMinutePicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isMinutePickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isMinutePickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker(
        scrollController: minuteController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: _onSelectedItemChange,
        looping: true,
        selectionOverlay: selectionOverlay,
        children: List<Widget>.generate(60 ~/ widget.minuteInterval, (int index) {
          final int minute = index * widget.minuteInterval;

          final Jalali date = Jalali(
            initialDateTime.year,
            initialDateTime.month,
            initialDateTime.day,
            selectedHour,
            minute,
          ).addDays(selectedDayFromInitial);

          final bool isInvalidMinute = (widget.minimumDate?.isAfter(date) ?? false) || (widget.maximumDate?.isBefore(date) ?? false);

          return itemPositioningBuilder(
            context,
            Text(
              localizations.datePickerMinute(minute),
              semanticsLabel: localizations.datePickerMinuteSemanticsLabel(minute),
              style: _themeTextStyle(context, isValid: !isInvalidMinute),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAmPmPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isMeridiemPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isMeridiemPickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker(
        scrollController: meridiemController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: (int index) {
          selectedAmPm = index;
          assert(selectedAmPm == 0 || selectedAmPm == 1);
          _onSelectedItemChange(index);
        },
        selectionOverlay: selectionOverlay,
        children: List<Widget>.generate(2, (int index) {
          return itemPositioningBuilder(
            context,
            Text(
              index == 0 ? localizations.anteMeridiemAbbreviation : localizations.postMeridiemAbbreviation,
              style: _themeTextStyle(context, isValid: _isValidHour(index, _selectedHourIndex)),
            ),
          );
        }),
      ),
    );
  }

  void _pickerDidStopScrolling() {
    setState(() {});

    if (isScrolling) {
      return;
    }

    final Jalali selectedDate = selectedDateTime;

    final bool minCheck = widget.minimumDate?.isAfter(selectedDate) ?? false;
    final bool maxCheck = widget.maximumDate?.isBefore(selectedDate) ?? false;

    if (minCheck || maxCheck) {
      final Jalali targetDate = minCheck ? widget.minimumDate! : widget.maximumDate!;
      _scrollToDate(targetDate, selectedDate, minCheck);
    }
  }

  void _scrollToDate(Jalali newDate, Jalali fromDate, bool minCheck) {
    SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
      if (fromDate.year != newDate.year || fromDate.month != newDate.month || fromDate.day != newDate.day) {
        _animateColumnControllerToItem(dateController, selectedDayFromInitial);
      }

      if (fromDate.hour != newDate.hour) {
        final bool needsMeridiemChange = !widget.use24hFormat && fromDate.hour ~/ 12 != newDate.hour ~/ 12;
        if (needsMeridiemChange) {
          _animateColumnControllerToItem(meridiemController, 1 - meridiemController.selectedItem);

          final int newItem = (hourController.selectedItem ~/ 12) * 12 + (hourController.selectedItem + newDate.hour - fromDate.hour) % 12;
          _animateColumnControllerToItem(hourController, newItem);
        } else {
          _animateColumnControllerToItem(
            hourController,
            hourController.selectedItem + newDate.hour - fromDate.hour,
          );
        }
      }

      if (fromDate.minute != newDate.minute) {
        final double positionDouble = newDate.minute / widget.minuteInterval;
        final int position = minCheck ? positionDouble.ceil() : positionDouble.floor();
        _animateColumnControllerToItem(minuteController, position);
      }
    }, debugLabel: 'DatePicker.scrollToDate');
  }

  @override
  Widget build(BuildContext context) {
    final List<double> columnWidths = <double>[
      _getEstimatedColumnWidth(_PickerColumnType.hour),
      _getEstimatedColumnWidth(_PickerColumnType.minute),
    ];

    final List<_ColumnBuilder> pickerBuilders = Directionality.of(context) == TextDirection.rtl ? <_ColumnBuilder>[_buildMinutePicker, _buildHourPicker] : <_ColumnBuilder>[_buildHourPicker, _buildMinutePicker];

    if (!widget.use24hFormat) {
      switch (localizations.datePickerDateTimeOrder) {
        case DatePickerDateTimeOrder.date_time_dayPeriod:
        case DatePickerDateTimeOrder.time_dayPeriod_date:
          pickerBuilders.add(_buildAmPmPicker);
          columnWidths.add(_getEstimatedColumnWidth(_PickerColumnType.dayPeriod));
        case DatePickerDateTimeOrder.date_dayPeriod_time:
        case DatePickerDateTimeOrder.dayPeriod_time_date:
          pickerBuilders.insert(0, _buildAmPmPicker);
          columnWidths.insert(0, _getEstimatedColumnWidth(_PickerColumnType.dayPeriod));
      }
    }

    if (widget.mode == PersianCupertinoDatePickerMode.dateAndTime) {
      switch (localizations.datePickerDateTimeOrder) {
        case DatePickerDateTimeOrder.time_dayPeriod_date:
        case DatePickerDateTimeOrder.dayPeriod_time_date:
          pickerBuilders.add(_buildMediumDatePicker);
          columnWidths.add(_getEstimatedColumnWidth(_PickerColumnType.date));
        case DatePickerDateTimeOrder.date_time_dayPeriod:
        case DatePickerDateTimeOrder.date_dayPeriod_time:
          pickerBuilders.insert(0, _buildMediumDatePicker);
          columnWidths.insert(0, _getEstimatedColumnWidth(_PickerColumnType.date));
      }
    }

    final List<Widget> pickers = <Widget>[];
    double totalColumnWidths = 4 * _kDatePickerPadSize;

    for (final (int i, double width) in columnWidths.indexed) {
      final (bool firstColumn, bool lastColumn) = (i == 0, i == columnWidths.length - 1);
      double offAxisFraction = 0.0;
      Widget? selectionOverlay = _centerSelectionOverlay;

      if (widget.selectionOverlayBuilder != null) {
        selectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: i, columnCount: columnWidths.length);
      } else {
        if (firstColumn) {
          selectionOverlay = _startSelectionOverlay;
        } else if (lastColumn) {
          selectionOverlay = _endSelectionOverlay;
        }
      }

      if (firstColumn) {
        offAxisFraction = -_kMaximumOffAxisFraction * textDirectionFactor;
      } else if (i >= 2 || columnWidths.length == 2) {
        offAxisFraction = _kMaximumOffAxisFraction * textDirectionFactor;
      }

      EdgeInsets padding = const EdgeInsets.only(right: _kDatePickerPadSize);
      if (lastColumn) {
        padding = padding.flipped;
      }
      if (textDirectionFactor == -1) {
        padding = padding.flipped;
      }

      totalColumnWidths += width + (2 * _kDatePickerPadSize);

      pickers.add(LayoutId(
        id: i,
        child: pickerBuilders[i](
          offAxisFraction,
          (BuildContext context, Widget? child) {
            late final Widget constrained = ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width + _kDatePickerPadSize),
              child: child,
            );

            return Padding(
              padding: padding,
              child: Align(
                alignment: lastColumn ? alignCenterLeft : alignCenterRight,
                child: firstColumn || lastColumn ? constrained : child,
              ),
            );
          },
          selectionOverlay,
        ),
      ));
    }

    final double maxPickerWidth = totalColumnWidths > _kPickerWidth ? totalColumnWidths : _kPickerWidth;

    return MediaQuery.withNoTextScaling(
      child: DefaultTextStyle.merge(
        style: _kDefaultPickerTextStyle,
        child: CustomMultiChildLayout(
          delegate: _DatePickerLayoutDelegate(
            columnWidths: columnWidths,
            textDirectionFactor: textDirectionFactor,
            maxWidth: maxPickerWidth,
          ),
          children: pickers,
        ),
      ),
    );
  }
}

class _CupertinoDatePickerDateState extends State<PersianCupertinoDatePicker> {
  _CupertinoDatePickerDateState({
    required this.dateOrder,
  });

  final DatePickerDateOrder? dateOrder;

  late int textDirectionFactor;
  late CupertinoLocalizations localizations;

  late Alignment alignCenterLeft;
  late Alignment alignCenterRight;

  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;

  late FixedExtentScrollController dayController;
  late FixedExtentScrollController monthController;
  late FixedExtentScrollController yearController;

  bool isDayPickerScrolling = false;
  bool isMonthPickerScrolling = false;
  bool isYearPickerScrolling = false;

  bool get isScrolling => isDayPickerScrolling || isMonthPickerScrolling || isYearPickerScrolling;

  Map<int, double> estimatedColumnWidths = <int, double>{};

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDateTime.day;
    selectedMonth = widget.initialDateTime.month;
    selectedYear = widget.initialDateTime.year;

    dayController = FixedExtentScrollController(initialItem: selectedDay - 1);
    monthController = FixedExtentScrollController(initialItem: selectedMonth - 1);
    yearController = FixedExtentScrollController(initialItem: selectedYear);

    PaintingBinding.instance.systemFonts.addListener(_handleSystemFontsChange);
  }

  void _handleSystemFontsChange() {
    setState(() {
      _refreshEstimatedColumnWidths();
    });
  }

  @override
  void dispose() {
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();

    PaintingBinding.instance.systemFonts.removeListener(_handleSystemFontsChange);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    textDirectionFactor = Directionality.of(context) == TextDirection.ltr ? 1 : -1;
    localizations = CupertinoLocalizations.of(context);

    alignCenterLeft = textDirectionFactor == 1 ? Alignment.centerLeft : Alignment.centerRight;
    alignCenterRight = textDirectionFactor == 1 ? Alignment.centerRight : Alignment.centerLeft;

    _refreshEstimatedColumnWidths();
  }

  void _refreshEstimatedColumnWidths() {
    estimatedColumnWidths[_PickerColumnType.dayOfMonth.index] = PersianCupertinoDatePicker._getColumnWidth(_PickerColumnType.dayOfMonth, localizations, context, widget.showDayOfWeek);
    estimatedColumnWidths[_PickerColumnType.month.index] = PersianCupertinoDatePicker._getColumnWidth(_PickerColumnType.month, localizations, context, widget.showDayOfWeek);
    estimatedColumnWidths[_PickerColumnType.year.index] = PersianCupertinoDatePicker._getColumnWidth(_PickerColumnType.year, localizations, context, widget.showDayOfWeek);
  }

  Jalali _lastDayInMonth(int year, int month) => Jalali(year, month, Jalali(year, month).monthLength);

  Widget _buildDayPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    final int daysInCurrentMonth = _lastDayInMonth(selectedYear, selectedMonth).day;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isDayPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isDayPickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker(
        scrollController: dayController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: (int index) {
          selectedDay = index + 1;
          if (_isCurrentDateValid) {
            widget.onDateTimeChanged(Jalali(selectedYear, selectedMonth, selectedDay));
          }
        },
        looping: true,
        selectionOverlay: selectionOverlay,
        children: List<Widget>.generate(daysInCurrentMonth, (int index) {
          final int day = index + 1;
          final int? dayOfWeek = widget.showDayOfWeek ? Jalali(selectedYear, selectedMonth, day).weekDay : null;
          final bool isInvalidDay =
              (day > daysInCurrentMonth) || (widget.minimumDate?.year == selectedYear && widget.minimumDate!.month == selectedMonth && widget.minimumDate!.day > day) || (widget.maximumDate?.year == selectedYear && widget.maximumDate!.month == selectedMonth && widget.maximumDate!.day < day);
          return itemPositioningBuilder(
            context,
            Text(
              localizations.datePickerDayOfMonth(day, dayOfWeek),
              style: _themeTextStyle(context, isValid: !isInvalidDay),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMonthPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isMonthPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isMonthPickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker(
        scrollController: monthController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: (int index) {
          selectedMonth = index + 1;
          if (_isCurrentDateValid) {
            widget.onDateTimeChanged(Jalali(selectedYear, selectedMonth, selectedDay));
          }
        },
        looping: true,
        selectionOverlay: selectionOverlay,
        children: List<Widget>.generate(12, (int index) {
          final int month = index + 1;
          final bool isInvalidMonth = (widget.minimumDate?.year == selectedYear && widget.minimumDate!.month > month) || (widget.maximumDate?.year == selectedYear && widget.maximumDate!.month < month);
          final String monthName = (widget.mode == PersianCupertinoDatePickerMode.monthYear) ? localizations.datePickerStandaloneMonth(month) : localizations.datePickerMonth(month);

          return itemPositioningBuilder(
            context,
            Text(
              monthName,
              style: _themeTextStyle(context, isValid: !isInvalidMonth),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildYearPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isYearPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isYearPickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker.builder(
        scrollController: yearController,
        itemExtent: widget.itemExtent,
        offAxisFraction: offAxisFraction,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        onSelectedItemChanged: (int index) {
          selectedYear = index;
          if (_isCurrentDateValid) {
            widget.onDateTimeChanged(Jalali(selectedYear, selectedMonth, selectedDay));
          }
        },
        itemBuilder: (BuildContext context, int year) {
          if (year < widget.minimumYear) {
            return null;
          }

          if (widget.maximumYear != null && year > widget.maximumYear!) {
            return null;
          }

          final bool isValidYear = (widget.minimumDate == null || widget.minimumDate!.year <= year) && (widget.maximumDate == null || widget.maximumDate!.year >= year);

          return itemPositioningBuilder(
            context,
            Text(
              localizations.datePickerYear(year),
              style: _themeTextStyle(context, isValid: isValidYear),
            ),
          );
        },
        selectionOverlay: selectionOverlay,
      ),
    );
  }

  bool get _isCurrentDateValid {
    final Jalali minSelectedDate = Jalali(selectedYear, selectedMonth, selectedDay);
    final Jalali maxSelectedDate = Jalali(selectedYear, selectedMonth, selectedDay).addDays(1);

    final bool minCheck = widget.minimumDate?.isBefore(maxSelectedDate) ?? true;
    final bool maxCheck = widget.maximumDate?.isBefore(minSelectedDate) ?? false;

    return minCheck && !maxCheck && minSelectedDate.day == selectedDay;
  }

  void _pickerDidStopScrolling() {
    setState(() {});

    if (isScrolling) {
      return;
    }

    final Jalali minSelectDate = Jalali(selectedYear, selectedMonth, selectedDay);
    final Jalali maxSelectDate = Jalali(selectedYear, selectedMonth, selectedDay).addDays(1);

    final bool minCheck = widget.minimumDate?.isBefore(maxSelectDate) ?? true;
    final bool maxCheck = widget.maximumDate?.isBefore(minSelectDate) ?? false;

    if (!minCheck || maxCheck) {
      final Jalali targetDate = minCheck ? widget.maximumDate! : widget.minimumDate!;
      _scrollToDate(targetDate);
      return;
    }

    if (minSelectDate.day != selectedDay) {
      final Jalali lastDay = _lastDayInMonth(selectedYear, selectedMonth);
      _scrollToDate(lastDay);
    }
  }

  void _scrollToDate(Jalali newDate) {
    SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
      if (selectedYear != newDate.year) {
        _animateColumnControllerToItem(yearController, newDate.year);
      }

      if (selectedMonth != newDate.month) {
        _animateColumnControllerToItem(monthController, newDate.month - 1);
      }

      if (selectedDay != newDate.day) {
        _animateColumnControllerToItem(dayController, newDate.day - 1);
      }
    }, debugLabel: 'DatePicker.scrollToDate');
  }

  @override
  Widget build(BuildContext context) {
    List<_ColumnBuilder> pickerBuilders = <_ColumnBuilder>[];
    List<double> columnWidths = <double>[];

    final DatePickerDateOrder datePickerDateOrder = dateOrder ?? localizations.datePickerDateOrder;

    switch (datePickerDateOrder) {
      case DatePickerDateOrder.mdy:
        pickerBuilders = <_ColumnBuilder>[_buildMonthPicker, _buildDayPicker, _buildYearPicker];
        columnWidths = <double>[
          estimatedColumnWidths[_PickerColumnType.month.index]!,
          estimatedColumnWidths[_PickerColumnType.dayOfMonth.index]!,
          estimatedColumnWidths[_PickerColumnType.year.index]!,
        ];
      case DatePickerDateOrder.dmy:
        pickerBuilders = <_ColumnBuilder>[_buildDayPicker, _buildMonthPicker, _buildYearPicker];
        columnWidths = <double>[
          estimatedColumnWidths[_PickerColumnType.dayOfMonth.index]!,
          estimatedColumnWidths[_PickerColumnType.month.index]!,
          estimatedColumnWidths[_PickerColumnType.year.index]!,
        ];
      case DatePickerDateOrder.ymd:
        pickerBuilders = <_ColumnBuilder>[_buildYearPicker, _buildMonthPicker, _buildDayPicker];
        columnWidths = <double>[
          estimatedColumnWidths[_PickerColumnType.year.index]!,
          estimatedColumnWidths[_PickerColumnType.month.index]!,
          estimatedColumnWidths[_PickerColumnType.dayOfMonth.index]!,
        ];
      case DatePickerDateOrder.ydm:
        pickerBuilders = <_ColumnBuilder>[_buildYearPicker, _buildDayPicker, _buildMonthPicker];
        columnWidths = <double>[
          estimatedColumnWidths[_PickerColumnType.year.index]!,
          estimatedColumnWidths[_PickerColumnType.dayOfMonth.index]!,
          estimatedColumnWidths[_PickerColumnType.month.index]!,
        ];
    }

    final List<Widget> pickers = <Widget>[];
    double totalColumnWidths = 4 * _kDatePickerPadSize;

    for (final (int i, double width) in columnWidths.indexed) {
      final (bool firstColumn, bool lastColumn) = (i == 0, i == columnWidths.length - 1);
      final double offAxisFraction = (i - 1) * 0.3 * textDirectionFactor;

      EdgeInsets padding = const EdgeInsets.only(right: _kDatePickerPadSize);
      if (textDirectionFactor == -1) {
        padding = const EdgeInsets.only(left: _kDatePickerPadSize);
      }

      Widget? selectionOverlay = _centerSelectionOverlay;

      if (widget.selectionOverlayBuilder != null) {
        selectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: i, columnCount: columnWidths.length);
      } else {
        if (firstColumn) {
          selectionOverlay = _startSelectionOverlay;
        } else if (lastColumn) {
          selectionOverlay = _endSelectionOverlay;
        }
      }

      totalColumnWidths += width + (2 * _kDatePickerPadSize);

      pickers.add(LayoutId(
        id: i,
        child: pickerBuilders[i](
          offAxisFraction,
          (BuildContext context, Widget? child) {
            return Padding(
              padding: firstColumn ? EdgeInsets.zero : padding,
              child: Align(
                alignment: lastColumn ? alignCenterLeft : alignCenterRight,
                child: SizedBox(
                  width: width + _kDatePickerPadSize,
                  child: Align(
                    alignment: firstColumn ? alignCenterLeft : alignCenterRight,
                    child: child,
                  ),
                ),
              ),
            );
          },
          selectionOverlay,
        ),
      ));
    }

    final double maxPickerWidth = totalColumnWidths > _kPickerWidth ? totalColumnWidths : _kPickerWidth;

    return MediaQuery.withNoTextScaling(
      child: DefaultTextStyle.merge(
        style: _kDefaultPickerTextStyle,
        child: CustomMultiChildLayout(
          delegate: _DatePickerLayoutDelegate(
            columnWidths: columnWidths,
            textDirectionFactor: textDirectionFactor,
            maxWidth: maxPickerWidth,
          ),
          children: pickers,
        ),
      ),
    );
  }
}

class _CupertinoDatePickerMonthYearState extends State<PersianCupertinoDatePicker> {
  _CupertinoDatePickerMonthYearState({
    required this.dateOrder,
  });

  final DatePickerDateOrder? dateOrder;

  late int textDirectionFactor;
  late CupertinoLocalizations localizations;

  late Alignment alignCenterLeft;
  late Alignment alignCenterRight;

  late int selectedYear;
  late int selectedMonth;

  late FixedExtentScrollController monthController;
  late FixedExtentScrollController yearController;

  bool isMonthPickerScrolling = false;
  bool isYearPickerScrolling = false;

  bool get isScrolling => isMonthPickerScrolling || isYearPickerScrolling;

  Map<int, double> estimatedColumnWidths = <int, double>{};

  @override
  void initState() {
    super.initState();
    selectedMonth = widget.initialDateTime.month;
    selectedYear = widget.initialDateTime.year;

    monthController = FixedExtentScrollController(initialItem: selectedMonth - 1);
    yearController = FixedExtentScrollController(initialItem: selectedYear);

    PaintingBinding.instance.systemFonts.addListener(_handleSystemFontsChange);
  }

  void _handleSystemFontsChange() {
    setState(() {
      _refreshEstimatedColumnWidths();
    });
  }

  @override
  void dispose() {
    monthController.dispose();
    yearController.dispose();

    PaintingBinding.instance.systemFonts.removeListener(_handleSystemFontsChange);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    textDirectionFactor = Directionality.of(context) == TextDirection.ltr ? 1 : -1;
    localizations = CupertinoLocalizations.of(context);

    alignCenterLeft = textDirectionFactor == 1 ? Alignment.centerLeft : Alignment.centerRight;
    alignCenterRight = textDirectionFactor == 1 ? Alignment.centerRight : Alignment.centerLeft;

    _refreshEstimatedColumnWidths();
  }

  void _refreshEstimatedColumnWidths() {
    estimatedColumnWidths[_PickerColumnType.month.index] = PersianCupertinoDatePicker._getColumnWidth(_PickerColumnType.month, localizations, context, false, standaloneMonth: widget.mode == PersianCupertinoDatePickerMode.monthYear);
    estimatedColumnWidths[_PickerColumnType.year.index] = PersianCupertinoDatePicker._getColumnWidth(_PickerColumnType.year, localizations, context, false);
  }

  Widget _buildMonthPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isMonthPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isMonthPickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker(
        scrollController: monthController,
        offAxisFraction: offAxisFraction,
        itemExtent: _kItemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: (int index) {
          selectedMonth = index + 1;
          if (_isCurrentDateValid) {
            widget.onDateTimeChanged(Jalali(selectedYear, selectedMonth));
          }
        },
        looping: true,
        selectionOverlay: selectionOverlay,
        children: List<Widget>.generate(12, (int index) {
          final int month = index + 1;
          final bool isInvalidMonth = (widget.minimumDate?.year == selectedYear && widget.minimumDate!.month > month) || (widget.maximumDate?.year == selectedYear && widget.maximumDate!.month < month);
          final String monthName = (widget.mode == PersianCupertinoDatePickerMode.monthYear) ? localizations.datePickerStandaloneMonth(month) : localizations.datePickerMonth(month);

          return itemPositioningBuilder(
            context,
            Text(
              monthName,
              style: _themeTextStyle(context, isValid: !isInvalidMonth),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildYearPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isYearPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isYearPickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker.builder(
        scrollController: yearController,
        itemExtent: _kItemExtent,
        offAxisFraction: offAxisFraction,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        onSelectedItemChanged: (int index) {
          selectedYear = index;
          if (_isCurrentDateValid) {
            widget.onDateTimeChanged(Jalali(selectedYear, selectedMonth));
          }
        },
        itemBuilder: (BuildContext context, int year) {
          if (year < widget.minimumYear) {
            return null;
          }

          if (widget.maximumYear != null && year > widget.maximumYear!) {
            return null;
          }

          final bool isValidYear = (widget.minimumDate == null || widget.minimumDate!.year <= year) && (widget.maximumDate == null || widget.maximumDate!.year >= year);

          return itemPositioningBuilder(
            context,
            Text(
              localizations.datePickerYear(year),
              style: _themeTextStyle(context, isValid: isValidYear),
            ),
          );
        },
        selectionOverlay: selectionOverlay,
      ),
    );
  }

  bool get _isCurrentDateValid {
    final Jalali minSelectedDate = Jalali(selectedYear, selectedMonth);
    final Jalali maxSelectedDate = Jalali(selectedYear, selectedMonth, widget.initialDateTime.day).addDays(1);

    final bool minCheck = widget.minimumDate?.isBefore(maxSelectedDate) ?? true;
    final bool maxCheck = widget.maximumDate?.isBefore(minSelectedDate) ?? false;

    return minCheck && !maxCheck;
  }

  void _pickerDidStopScrolling() {
    setState(() {});

    if (isScrolling) {
      return;
    }

    final Jalali minSelectDate = Jalali(selectedYear, selectedMonth);
    final Jalali maxSelectDate = Jalali(selectedYear, selectedMonth, widget.initialDateTime.day).addDays(1);

    final bool minCheck = widget.minimumDate?.isBefore(maxSelectDate) ?? true;
    final bool maxCheck = widget.maximumDate?.isBefore(minSelectDate) ?? false;

    if (!minCheck || maxCheck) {
      final Jalali targetDate = minCheck ? widget.maximumDate! : widget.minimumDate!;
      _scrollToDate(targetDate);
      return;
    }
  }

  void _scrollToDate(Jalali newDate) {
    SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
      if (selectedYear != newDate.year) {
        _animateColumnControllerToItem(yearController, newDate.year);
      }

      if (selectedMonth != newDate.month) {
        _animateColumnControllerToItem(monthController, newDate.month - 1);
      }
    }, debugLabel: 'DatePicker.scrollToDate');
  }

  @override
  Widget build(BuildContext context) {
    List<_ColumnBuilder> pickerBuilders = <_ColumnBuilder>[];
    List<double> columnWidths = <double>[];

    final DatePickerDateOrder datePickerDateOrder = dateOrder ?? localizations.datePickerDateOrder;

    switch (datePickerDateOrder) {
      case DatePickerDateOrder.mdy:
      case DatePickerDateOrder.dmy:
        pickerBuilders = <_ColumnBuilder>[_buildMonthPicker, _buildYearPicker];
        columnWidths = <double>[
          estimatedColumnWidths[_PickerColumnType.month.index]!,
          estimatedColumnWidths[_PickerColumnType.year.index]!,
        ];
      case DatePickerDateOrder.ymd:
      case DatePickerDateOrder.ydm:
        pickerBuilders = <_ColumnBuilder>[_buildYearPicker, _buildMonthPicker];
        columnWidths = <double>[
          estimatedColumnWidths[_PickerColumnType.year.index]!,
          estimatedColumnWidths[_PickerColumnType.month.index]!,
        ];
    }

    final List<Widget> pickers = <Widget>[];
    double totalColumnWidths = 3 * _kDatePickerPadSize;

    for (final (int i, double width) in columnWidths.indexed) {
      final (bool firstColumn, bool lastColumn) = (i == 0, i == columnWidths.length - 1);
      final double offAxisFraction = textDirectionFactor * (firstColumn ? -0.3 : 0.5);

      totalColumnWidths += width + (2 * _kDatePickerPadSize);

      Widget? selectionOverlay = _centerSelectionOverlay;

      if (widget.selectionOverlayBuilder != null) {
        selectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: i, columnCount: columnWidths.length);
      } else {
        if (firstColumn) {
          selectionOverlay = _startSelectionOverlay;
        } else if (lastColumn) {
          selectionOverlay = _endSelectionOverlay;
        }
      }

      pickers.add(LayoutId(
        id: i,
        child: pickerBuilders[i](
          offAxisFraction,
          (BuildContext context, Widget? child) {
            final Widget contents = Align(
              alignment: lastColumn ? alignCenterLeft : alignCenterRight,
              child: SizedBox(
                width: width + _kDatePickerPadSize,
                child: Align(
                  alignment: firstColumn ? alignCenterLeft : alignCenterRight,
                  child: child,
                ),
              ),
            );
            if (firstColumn) {
              return contents;
            }

            const EdgeInsets padding = EdgeInsets.only(right: _kDatePickerPadSize);
            return Padding(
              padding: textDirectionFactor == -1 ? padding.flipped : padding,
              child: contents,
            );
          },
          selectionOverlay,
        ),
      ));
    }

    final double maxPickerWidth = totalColumnWidths > _kPickerWidth ? totalColumnWidths : _kPickerWidth;

    return MediaQuery.withNoTextScaling(
      child: DefaultTextStyle.merge(
        style: _kDefaultPickerTextStyle,
        child: CustomMultiChildLayout(
          delegate: _DatePickerLayoutDelegate(
            columnWidths: columnWidths,
            textDirectionFactor: textDirectionFactor,
            maxWidth: maxPickerWidth,
          ),
          children: pickers,
        ),
      ),
    );
  }
}

enum CupertinoTimerPickerMode {
  hm,
  ms,
  hms,
}

class CupertinoTimerPicker extends StatefulWidget {
  CupertinoTimerPicker({
    super.key,
    this.mode = CupertinoTimerPickerMode.hms,
    this.initialTimerDuration = Duration.zero,
    this.minuteInterval = 1,
    this.secondInterval = 1,
    this.alignment = Alignment.center,
    this.backgroundColor,
    this.itemExtent = _kItemExtent,
    required this.onTimerDurationChanged,
    this.selectionOverlayBuilder,
  })  : assert(initialTimerDuration >= Duration.zero),
        assert(initialTimerDuration < const Duration(days: 1)),
        assert(minuteInterval > 0 && 60 % minuteInterval == 0),
        assert(secondInterval > 0 && 60 % secondInterval == 0),
        assert(initialTimerDuration.inMinutes % minuteInterval == 0),
        assert(initialTimerDuration.inSeconds % secondInterval == 0),
        assert(itemExtent > 0, 'item extent should be greater than 0');

  final CupertinoTimerPickerMode mode;

  final Duration initialTimerDuration;

  final int minuteInterval;

  final int secondInterval;

  final ValueChanged<Duration> onTimerDurationChanged;

  final AlignmentGeometry alignment;

  final Color? backgroundColor;

  final double itemExtent;

  final SelectionOverlayBuilder? selectionOverlayBuilder;

  @override
  State<StatefulWidget> createState() => _CupertinoTimerPickerState();
}

class _CupertinoTimerPickerState extends State<CupertinoTimerPicker> {
  late TextDirection textDirection;
  late CupertinoLocalizations localizations;

  int get textDirectionFactor {
    return switch (textDirection) {
      TextDirection.ltr => 1,
      TextDirection.rtl => -1,
    };
  }

  int? selectedHour;
  late int selectedMinute;
  int? selectedSecond;

  int? lastSelectedHour;
  int? lastSelectedMinute;
  int? lastSelectedSecond;

  final TextPainter textPainter = TextPainter();
  final List<String> numbers = List<String>.generate(10, (int i) => '${9 - i}');
  late double numberLabelWidth;
  late double numberLabelHeight;
  late double numberLabelBaseline;

  late double hourLabelWidth;
  late double minuteLabelWidth;
  late double secondLabelWidth;

  late double totalWidth;
  late double pickerColumnWidth;

  FixedExtentScrollController? _hourScrollController;
  FixedExtentScrollController? _minuteScrollController;
  FixedExtentScrollController? _secondScrollController;

  @override
  void initState() {
    super.initState();

    selectedMinute = widget.initialTimerDuration.inMinutes % 60;

    if (widget.mode != CupertinoTimerPickerMode.ms) {
      selectedHour = widget.initialTimerDuration.inHours;
    }

    if (widget.mode != CupertinoTimerPickerMode.hm) {
      selectedSecond = widget.initialTimerDuration.inSeconds % 60;
    }

    PaintingBinding.instance.systemFonts.addListener(_handleSystemFontsChange);
  }

  void _handleSystemFontsChange() {
    setState(() {
      textPainter.markNeedsLayout();
      _measureLabelMetrics();
    });
  }

  @override
  void dispose() {
    PaintingBinding.instance.systemFonts.removeListener(_handleSystemFontsChange);
    textPainter.dispose();

    _hourScrollController?.dispose();
    _minuteScrollController?.dispose();
    _secondScrollController?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CupertinoTimerPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    assert(
      oldWidget.mode == widget.mode,
      "The CupertinoTimerPicker's mode cannot change once it's built",
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    textDirection = Directionality.of(context);
    localizations = CupertinoLocalizations.of(context);

    _measureLabelMetrics();
  }

  void _measureLabelMetrics() {
    textPainter.textDirection = textDirection;
    final TextStyle textStyle = _textStyleFrom(context, _kTimerPickerMagnification);

    double maxWidth = double.negativeInfinity;
    String? widestNumber;

    for (final String input in numbers) {
      textPainter.text = TextSpan(
        text: input,
        style: textStyle,
      );
      textPainter.layout();

      if (textPainter.maxIntrinsicWidth > maxWidth) {
        maxWidth = textPainter.maxIntrinsicWidth;
        widestNumber = input;
      }
    }

    textPainter.text = TextSpan(
      text: '$widestNumber$widestNumber',
      style: textStyle,
    );

    textPainter.layout();
    numberLabelWidth = textPainter.maxIntrinsicWidth;
    numberLabelHeight = textPainter.height;
    numberLabelBaseline = textPainter.computeDistanceToActualBaseline(TextBaseline.alphabetic);

    minuteLabelWidth = _measureLabelsMaxWidth(localizations.timerPickerMinuteLabels, textStyle);

    if (widget.mode != CupertinoTimerPickerMode.ms) {
      hourLabelWidth = _measureLabelsMaxWidth(localizations.timerPickerHourLabels, textStyle);
    }

    if (widget.mode != CupertinoTimerPickerMode.hm) {
      secondLabelWidth = _measureLabelsMaxWidth(localizations.timerPickerSecondLabels, textStyle);
    }
  }

  double _measureLabelsMaxWidth(List<String?> labels, TextStyle style) {
    double maxWidth = double.negativeInfinity;
    for (int i = 0; i < labels.length; i++) {
      final String? label = labels[i];
      if (label == null) {
        continue;
      }

      textPainter.text = TextSpan(text: label, style: style);
      textPainter.layout();
      textPainter.maxIntrinsicWidth;
      if (textPainter.maxIntrinsicWidth > maxWidth) {
        maxWidth = textPainter.maxIntrinsicWidth;
      }
    }

    return maxWidth;
  }

  Widget _buildLabel(String text, EdgeInsetsDirectional pickerPadding) {
    final EdgeInsetsDirectional padding = EdgeInsetsDirectional.only(
      start: numberLabelWidth + _kTimerPickerLabelPadSize + pickerPadding.start,
    );

    return IgnorePointer(
      child: Padding(
        padding: padding.resolve(textDirection),
        child: Align(
          alignment: AlignmentDirectional.centerStart.resolve(textDirection),
          child: SizedBox(
            height: numberLabelHeight,
            child: Baseline(
              baseline: numberLabelBaseline,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: _kTimerPickerLabelFontSize,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPickerNumberLabel(String text, EdgeInsetsDirectional padding) {
    return SizedBox(
      width: _kTimerPickerColumnIntrinsicWidth + padding.horizontal,
      child: Padding(
        padding: padding.resolve(textDirection),
        child: Align(
          alignment: AlignmentDirectional.centerStart.resolve(textDirection),
          child: SizedBox(
            width: numberLabelWidth,
            child: Align(
              alignment: AlignmentDirectional.centerEnd.resolve(textDirection),
              child: Text(text, softWrap: false, maxLines: 1, overflow: TextOverflow.visible),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHourPicker(EdgeInsetsDirectional additionalPadding, Widget? selectionOverlay) {
    _hourScrollController ??= FixedExtentScrollController(initialItem: selectedHour!);
    return CupertinoPicker(
      scrollController: _hourScrollController,
      magnification: _kMagnification,
      offAxisFraction: _calculateOffAxisFraction(additionalPadding.start, 0),
      itemExtent: widget.itemExtent,
      backgroundColor: widget.backgroundColor,
      squeeze: _kSqueeze,
      onSelectedItemChanged: (int index) {
        setState(() {
          selectedHour = index;
          widget.onTimerDurationChanged(
            Duration(
              hours: selectedHour!,
              minutes: selectedMinute,
              seconds: selectedSecond ?? 0,
            ),
          );
        });
      },
      selectionOverlay: selectionOverlay,
      children: List<Widget>.generate(24, (int index) {
        final String label = localizations.timerPickerHourLabel(index) ?? '';
        final String semanticsLabel = textDirectionFactor == 1 ? localizations.timerPickerHour(index) + label : label + localizations.timerPickerHour(index);

        return Semantics(
          label: semanticsLabel,
          excludeSemantics: true,
          child: _buildPickerNumberLabel(localizations.timerPickerHour(index), additionalPadding),
        );
      }),
    );
  }

  Widget _buildHourColumn(EdgeInsetsDirectional additionalPadding, Widget? selectionOverlay) {
    additionalPadding = EdgeInsetsDirectional.only(
      start: math.max(additionalPadding.start, 0),
      end: math.max(additionalPadding.end, 0),
    );

    return Stack(
      children: <Widget>[
        NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification notification) {
            setState(() {
              lastSelectedHour = selectedHour;
            });
            return false;
          },
          child: _buildHourPicker(additionalPadding, selectionOverlay),
        ),
        _buildLabel(
          localizations.timerPickerHourLabel(lastSelectedHour ?? selectedHour!) ?? '',
          additionalPadding,
        ),
      ],
    );
  }

  Widget _buildMinutePicker(EdgeInsetsDirectional additionalPadding, Widget? selectionOverlay) {
    _minuteScrollController ??= FixedExtentScrollController(
      initialItem: selectedMinute ~/ widget.minuteInterval,
    );
    return CupertinoPicker(
      scrollController: _minuteScrollController,
      magnification: _kMagnification,
      offAxisFraction: _calculateOffAxisFraction(
        additionalPadding.start,
        widget.mode == CupertinoTimerPickerMode.ms ? 0 : 1,
      ),
      itemExtent: widget.itemExtent,
      backgroundColor: widget.backgroundColor,
      squeeze: _kSqueeze,
      looping: true,
      onSelectedItemChanged: (int index) {
        setState(() {
          selectedMinute = index * widget.minuteInterval;
          widget.onTimerDurationChanged(
            Duration(
              hours: selectedHour ?? 0,
              minutes: selectedMinute,
              seconds: selectedSecond ?? 0,
            ),
          );
        });
      },
      selectionOverlay: selectionOverlay,
      children: List<Widget>.generate(60 ~/ widget.minuteInterval, (int index) {
        final int minute = index * widget.minuteInterval;
        final String label = localizations.timerPickerMinuteLabel(minute) ?? '';
        final String semanticsLabel = textDirectionFactor == 1 ? localizations.timerPickerMinute(minute) + label : label + localizations.timerPickerMinute(minute);

        return Semantics(
          label: semanticsLabel,
          excludeSemantics: true,
          child: _buildPickerNumberLabel(localizations.timerPickerMinute(minute), additionalPadding),
        );
      }),
    );
  }

  Widget _buildMinuteColumn(EdgeInsetsDirectional additionalPadding, Widget? selectionOverlay) {
    additionalPadding = EdgeInsetsDirectional.only(
      start: math.max(additionalPadding.start, 0),
      end: math.max(additionalPadding.end, 0),
    );

    return Stack(
      children: <Widget>[
        NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification notification) {
            setState(() {
              lastSelectedMinute = selectedMinute;
            });
            return false;
          },
          child: _buildMinutePicker(additionalPadding, selectionOverlay),
        ),
        _buildLabel(
          localizations.timerPickerMinuteLabel(lastSelectedMinute ?? selectedMinute) ?? '',
          additionalPadding,
        ),
      ],
    );
  }

  Widget _buildSecondPicker(EdgeInsetsDirectional additionalPadding, Widget? selectionOverlay) {
    _secondScrollController ??= FixedExtentScrollController(
      initialItem: selectedSecond! ~/ widget.secondInterval,
    );
    return CupertinoPicker(
      scrollController: _secondScrollController,
      magnification: _kMagnification,
      offAxisFraction: _calculateOffAxisFraction(
        additionalPadding.start,
        widget.mode == CupertinoTimerPickerMode.ms ? 1 : 2,
      ),
      itemExtent: widget.itemExtent,
      backgroundColor: widget.backgroundColor,
      squeeze: _kSqueeze,
      looping: true,
      onSelectedItemChanged: (int index) {
        setState(() {
          selectedSecond = index * widget.secondInterval;
          widget.onTimerDurationChanged(
            Duration(
              hours: selectedHour ?? 0,
              minutes: selectedMinute,
              seconds: selectedSecond!,
            ),
          );
        });
      },
      selectionOverlay: selectionOverlay,
      children: List<Widget>.generate(60 ~/ widget.secondInterval, (int index) {
        final int second = index * widget.secondInterval;
        final String label = localizations.timerPickerSecondLabel(second) ?? '';
        final String semanticsLabel = textDirectionFactor == 1 ? localizations.timerPickerSecond(second) + label : label + localizations.timerPickerSecond(second);

        return Semantics(
          label: semanticsLabel,
          excludeSemantics: true,
          child: _buildPickerNumberLabel(localizations.timerPickerSecond(second), additionalPadding),
        );
      }),
    );
  }

  Widget _buildSecondColumn(EdgeInsetsDirectional additionalPadding, Widget? selectionOverlay) {
    additionalPadding = EdgeInsetsDirectional.only(
      start: math.max(additionalPadding.start, 0),
      end: math.max(additionalPadding.end, 0),
    );

    return Stack(
      children: <Widget>[
        NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification notification) {
            setState(() {
              lastSelectedSecond = selectedSecond;
            });
            return false;
          },
          child: _buildSecondPicker(additionalPadding, selectionOverlay),
        ),
        _buildLabel(
          localizations.timerPickerSecondLabel(lastSelectedSecond ?? selectedSecond!) ?? '',
          additionalPadding,
        ),
      ],
    );
  }

  TextStyle _textStyleFrom(BuildContext context, [double magnification = 1.0]) {
    final TextStyle textStyle = CupertinoTheme.of(context).textTheme.pickerTextStyle;
    return textStyle.copyWith(
      color: CupertinoDynamicColor.maybeResolve(textStyle.color, context),
      fontSize: textStyle.fontSize! * magnification,
    );
  }

  double _calculateOffAxisFraction(double paddingStart, int position) {
    final double centerPoint = paddingStart + (numberLabelWidth / 2);

    final double pickerColumnOffAxisFraction = 0.5 - centerPoint / pickerColumnWidth;
    final double timerPickerOffAxisFraction = 0.5 - (centerPoint + pickerColumnWidth * position) / totalWidth;
    return (pickerColumnOffAxisFraction - timerPickerOffAxisFraction) * textDirectionFactor;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        List<Widget> columns;

        if (widget.mode == CupertinoTimerPickerMode.hms) {
          pickerColumnWidth = _kTimerPickerColumnIntrinsicWidth + (_kTimerPickerHalfColumnPadding * 2);
          totalWidth = pickerColumnWidth * 3;
        } else {
          totalWidth = _kPickerWidth;
          pickerColumnWidth = totalWidth / 2;
        }

        if (constraints.maxWidth < totalWidth) {
          totalWidth = constraints.maxWidth;
          pickerColumnWidth = totalWidth / (widget.mode == CupertinoTimerPickerMode.hms ? 3 : 2);
        }

        final double baseLabelContentWidth = numberLabelWidth + _kTimerPickerLabelPadSize;
        final double minuteLabelContentWidth = baseLabelContentWidth + minuteLabelWidth;

        switch (widget.mode) {
          case CupertinoTimerPickerMode.hm:
            final double hourLabelContentWidth = baseLabelContentWidth + hourLabelWidth;
            double hourColumnStartPadding = pickerColumnWidth - hourLabelContentWidth - _kTimerPickerHalfColumnPadding;
            if (hourColumnStartPadding < _kTimerPickerMinHorizontalPadding) {
              hourColumnStartPadding = _kTimerPickerMinHorizontalPadding;
            }

            double minuteColumnEndPadding = pickerColumnWidth - minuteLabelContentWidth - _kTimerPickerHalfColumnPadding;
            if (minuteColumnEndPadding < _kTimerPickerMinHorizontalPadding) {
              minuteColumnEndPadding = _kTimerPickerMinHorizontalPadding;
            }

            Widget? hourSelectionOverlay = _startSelectionOverlay;
            Widget? minuteSelectionOverlay = _endSelectionOverlay;

            if (widget.selectionOverlayBuilder != null) {
              hourSelectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: 0, columnCount: 2);
              minuteSelectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: 1, columnCount: 2);
            }

            columns = <Widget>[
              _buildHourColumn(
                EdgeInsetsDirectional.only(
                  start: hourColumnStartPadding,
                  end: pickerColumnWidth - hourColumnStartPadding - hourLabelContentWidth,
                ),
                hourSelectionOverlay,
              ),
              _buildMinuteColumn(
                EdgeInsetsDirectional.only(
                  start: pickerColumnWidth - minuteColumnEndPadding - minuteLabelContentWidth,
                  end: minuteColumnEndPadding,
                ),
                minuteSelectionOverlay,
              ),
            ];
          case CupertinoTimerPickerMode.ms:
            final double secondLabelContentWidth = baseLabelContentWidth + secondLabelWidth;
            double secondColumnEndPadding = pickerColumnWidth - secondLabelContentWidth - _kTimerPickerHalfColumnPadding;
            if (secondColumnEndPadding < _kTimerPickerMinHorizontalPadding) {
              secondColumnEndPadding = _kTimerPickerMinHorizontalPadding;
            }

            double minuteColumnStartPadding = pickerColumnWidth - minuteLabelContentWidth - _kTimerPickerHalfColumnPadding;
            if (minuteColumnStartPadding < _kTimerPickerMinHorizontalPadding) {
              minuteColumnStartPadding = _kTimerPickerMinHorizontalPadding;
            }

            Widget? minuteSelectionOverlay = _startSelectionOverlay;
            Widget? secondSelectionOverlay = _endSelectionOverlay;

            if (widget.selectionOverlayBuilder != null) {
              minuteSelectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: 0, columnCount: 2);
              secondSelectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: 1, columnCount: 2);
            }

            columns = <Widget>[
              _buildMinuteColumn(
                EdgeInsetsDirectional.only(
                  start: minuteColumnStartPadding,
                  end: pickerColumnWidth - minuteColumnStartPadding - minuteLabelContentWidth,
                ),
                minuteSelectionOverlay,
              ),
              _buildSecondColumn(
                EdgeInsetsDirectional.only(
                  start: pickerColumnWidth - secondColumnEndPadding - minuteLabelContentWidth,
                  end: secondColumnEndPadding,
                ),
                secondSelectionOverlay,
              ),
            ];
          case CupertinoTimerPickerMode.hms:
            final double hourColumnEndPadding = pickerColumnWidth - baseLabelContentWidth - hourLabelWidth - _kTimerPickerMinHorizontalPadding;
            final double minuteColumnPadding = (pickerColumnWidth - minuteLabelContentWidth) / 2;
            final double secondColumnStartPadding = pickerColumnWidth - baseLabelContentWidth - secondLabelWidth - _kTimerPickerMinHorizontalPadding;

            Widget? hourSelectionOverlay = _startSelectionOverlay;
            Widget? minuteSelectionOverlay = _centerSelectionOverlay;
            Widget? secondSelectionOverlay = _endSelectionOverlay;

            if (widget.selectionOverlayBuilder != null) {
              hourSelectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: 0, columnCount: 3);
              minuteSelectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: 1, columnCount: 3);
              secondSelectionOverlay = widget.selectionOverlayBuilder!(context, selectedIndex: 2, columnCount: 3);
            }

            columns = <Widget>[
              _buildHourColumn(
                EdgeInsetsDirectional.only(
                  start: _kTimerPickerMinHorizontalPadding,
                  end: math.max(hourColumnEndPadding, 0),
                ),
                hourSelectionOverlay,
              ),
              _buildMinuteColumn(
                EdgeInsetsDirectional.only(
                  start: minuteColumnPadding,
                  end: minuteColumnPadding,
                ),
                minuteSelectionOverlay,
              ),
              _buildSecondColumn(
                EdgeInsetsDirectional.only(
                  start: math.max(secondColumnStartPadding, 0),
                  end: _kTimerPickerMinHorizontalPadding,
                ),
                secondSelectionOverlay,
              ),
            ];
        }

        Widget contents = SizedBox(
          width: totalWidth,
          height: _kPickerHeight,
          child: DefaultTextStyle(
            style: _textStyleFrom(context),
            child: Row(children: columns.map((Widget child) => Expanded(child: child)).toList(growable: false)),
          ),
        );
        final Color? color = CupertinoDynamicColor.maybeResolve(widget.backgroundColor, context);
        if (color != null) {
          contents = ColoredBox(color: color, child: contents);
        }

        final CupertinoThemeData themeData = CupertinoTheme.of(context);

        return MediaQuery.withNoTextScaling(
          child: CupertinoTheme(
            data: themeData.copyWith(
              textTheme: themeData.textTheme.copyWith(
                pickerTextStyle: _textStyleFrom(context, _kTimerPickerMagnification),
              ),
            ),
            child: Align(alignment: widget.alignment, child: contents),
          ),
        );
      },
    );
  }
}
