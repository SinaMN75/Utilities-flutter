import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:u/utils/shamsi_date/shamsi_date.dart';

import 'calendar_date_picker.dart';
import 'date.dart';
import 'input_date_picker_form_field.dart';
import 'restoration_properties.dart';

const Size _calendarPortraitDialogSizeM2 = Size(330.0, 518.0);
const Size _calendarPortraitDialogSizeM3 = Size(328.0, 512.0);
const Size _calendarLandscapeDialogSize = Size(496.0, 346.0);
const Size _inputPortraitDialogSizeM2 = Size(330.0, 270.0);
const Size _inputPortraitDialogSizeM3 = Size(328.0, 270.0);
const Size _inputLandscapeDialogSize = Size(496, 160.0);
const Size _inputRangeLandscapeDialogSize = Size(496, 164.0);
const Duration _dialogSizeAnimationDuration = Duration(milliseconds: 200);
const double _inputFormPortraitHeight = 98.0;
const double _inputFormLandscapeHeight = 108.0;
const double _kMaxTextScaleFactor = 1.3;

Future<Jalali?> showPersianDatePicker({
  required BuildContext context,
  Jalali? initialDate,
  required Jalali firstDate,
  required Jalali lastDate,
  Jalali? currentDate,
  PersianDatePickerEntryMode initialEntryMode = PersianDatePickerEntryMode.calendar,
  PersianSelectableDayPredicate? selectableDayPredicate,
  String? helpText,
  String? cancelText,
  String? confirmText,
  Locale? locale,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  PersianDatePickerMode initialDatePickerMode = PersianDatePickerMode.day,
  String? errorFormatText,
  String? errorInvalidText,
  String? fieldHintText,
  String? fieldLabelText,
  TextInputType? keyboardType,
  Offset? anchorPoint,
  final ValueChanged<PersianDatePickerEntryMode>? onDatePickerModeChange,
  final Icon? switchToInputEntryModeIcon,
  final Icon? switchToCalendarEntryModeIcon,
}) async {
  initialDate = initialDate == null ? null : PersianDateUtils.dateOnly(initialDate);
  firstDate = PersianDateUtils.dateOnly(firstDate);
  lastDate = PersianDateUtils.dateOnly(lastDate);
  assert(
    !lastDate.isBefore(firstDate),
    'lastDate $lastDate must be on or after firstDate $firstDate.',
  );
  assert(
    initialDate == null || !initialDate.isBefore(firstDate),
    'initialDate $initialDate must be on or after firstDate $firstDate.',
  );
  assert(
    initialDate == null || !initialDate.isAfter(lastDate),
    'initialDate $initialDate must be on or before lastDate $lastDate.',
  );
  assert(
    selectableDayPredicate == null || initialDate == null || selectableDayPredicate(initialDate),
    'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
  );
  assert(debugCheckHasMaterialLocalizations(context));

  Widget dialog = PersianDatePickerDialog(
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    currentDate: currentDate,
    initialEntryMode: initialEntryMode,
    selectableDayPredicate: selectableDayPredicate,
    helpText: helpText,
    cancelText: cancelText,
    confirmText: confirmText,
    initialCalendarMode: initialDatePickerMode,
    errorFormatText: errorFormatText,
    errorInvalidText: errorInvalidText,
    fieldHintText: fieldHintText,
    fieldLabelText: fieldLabelText,
    keyboardType: keyboardType,
    onDatePickerModeChange: onDatePickerModeChange,
    switchToInputEntryModeIcon: switchToInputEntryModeIcon,
    switchToCalendarEntryModeIcon: switchToCalendarEntryModeIcon,
  );

  if (textDirection != null) {
    dialog = Directionality(
      textDirection: textDirection,
      child: dialog,
    );
  }

  if (locale != null) {
    dialog = Localizations.override(
      context: context,
      locale: locale,
      child: dialog,
    );
  } else {
    final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);
    if (datePickerTheme.locale != null) {
      dialog = Localizations.override(
        context: context,
        locale: datePickerTheme.locale,
        child: dialog,
      );
    }
  }

  return showDialog<Jalali>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    anchorPoint: anchorPoint,
  );
}

class PersianDatePickerDialog extends StatefulWidget {
  PersianDatePickerDialog({
    super.key,
    Jalali? initialDate,
    required Jalali firstDate,
    required Jalali lastDate,
    Jalali? currentDate,
    this.initialEntryMode = PersianDatePickerEntryMode.calendar,
    this.selectableDayPredicate,
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.initialCalendarMode = PersianDatePickerMode.day,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
    this.keyboardType,
    this.restorationId,
    this.onDatePickerModeChange,
    this.switchToInputEntryModeIcon,
    this.switchToCalendarEntryModeIcon,
  })  : initialDate = initialDate == null ? null : PersianDateUtils.dateOnly(initialDate),
        firstDate = PersianDateUtils.dateOnly(firstDate),
        lastDate = PersianDateUtils.dateOnly(lastDate),
        currentDate = PersianDateUtils.dateOnly(currentDate ?? Jalali.now()) {
    assert(
      !this.lastDate.isBefore(this.firstDate),
      'lastDate ${this.lastDate} must be on or after firstDate ${this.firstDate}.',
    );
    assert(
      initialDate == null || !this.initialDate!.isBefore(this.firstDate),
      'initialDate ${this.initialDate} must be on or after firstDate ${this.firstDate}.',
    );
    assert(
      initialDate == null || !this.initialDate!.isAfter(this.lastDate),
      'initialDate ${this.initialDate} must be on or before lastDate ${this.lastDate}.',
    );
    assert(
      selectableDayPredicate == null || initialDate == null || selectableDayPredicate!(this.initialDate!),
      'Provided initialDate ${this.initialDate} must satisfy provided selectableDayPredicate',
    );
  }

  final Jalali? initialDate;

  final Jalali firstDate;

  final Jalali lastDate;

  final Jalali currentDate;

  final PersianDatePickerEntryMode initialEntryMode;

  final PersianSelectableDayPredicate? selectableDayPredicate;

  final String? cancelText;

  final String? confirmText;

  final String? helpText;

  final PersianDatePickerMode initialCalendarMode;

  final String? errorFormatText;

  final String? errorInvalidText;

  final String? fieldHintText;

  final String? fieldLabelText;

  final TextInputType? keyboardType;

  final String? restorationId;

  final ValueChanged<PersianDatePickerEntryMode>? onDatePickerModeChange;

  final Icon? switchToInputEntryModeIcon;

  final Icon? switchToCalendarEntryModeIcon;

  @override
  State<PersianDatePickerDialog> createState() => _PersianDatePickerDialogState();
}

class _PersianDatePickerDialogState extends State<PersianDatePickerDialog> with RestorationMixin {
  late final RestorableJalaliN _selectedDate = RestorableJalaliN(widget.initialDate);
  late final _RestorableDatePickerEntryMode _entryMode = _RestorableDatePickerEntryMode(widget.initialEntryMode);
  final _RestorableAutovalidateMode _autovalidateMode = _RestorableAutovalidateMode(AutovalidateMode.disabled);

  @override
  void dispose() {
    _selectedDate.dispose();
    _entryMode.dispose();
    _autovalidateMode.dispose();
    super.dispose();
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(_autovalidateMode, 'autovalidateMode');
    registerForRestoration(_entryMode, 'calendar_entry_mode');
  }

  final GlobalKey _calendarPickerKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleOk() {
    if (_entryMode.value == PersianDatePickerEntryMode.input || _entryMode.value == PersianDatePickerEntryMode.inputOnly) {
      final FormState form = _formKey.currentState!;
      if (!form.validate()) {
        setState(() => _autovalidateMode.value = AutovalidateMode.always);
        return;
      }
      form.save();
    }
    Navigator.pop(context, _selectedDate.value);
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleOnDatePickerModeChange() {
    widget.onDatePickerModeChange?.call(_entryMode.value);
  }

  void _handleEntryModeToggle() {
    setState(() {
      switch (_entryMode.value) {
        case PersianDatePickerEntryMode.calendar:
          _autovalidateMode.value = AutovalidateMode.disabled;
          _entryMode.value = PersianDatePickerEntryMode.input;
          _handleOnDatePickerModeChange();
        case PersianDatePickerEntryMode.input:
          _formKey.currentState!.save();
          _entryMode.value = PersianDatePickerEntryMode.calendar;
          _handleOnDatePickerModeChange();
        case PersianDatePickerEntryMode.calendarOnly:
        case PersianDatePickerEntryMode.inputOnly:
          assert(false, 'Can not change entry mode from ${_entryMode.value}');
      }
    });
  }

  void _handleDateChanged(Jalali date) {
    setState(() {
      _selectedDate.value = date;
    });
  }

  Size _dialogSize(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final bool isCalendar = switch (_entryMode.value) {
      PersianDatePickerEntryMode.calendar || PersianDatePickerEntryMode.calendarOnly => true,
      PersianDatePickerEntryMode.input || PersianDatePickerEntryMode.inputOnly => false,
    };
    final Orientation orientation = MediaQuery.orientationOf(context);

    return switch ((isCalendar, orientation)) {
      (true, Orientation.portrait) when useMaterial3 => _calendarPortraitDialogSizeM3,
      (false, Orientation.portrait) when useMaterial3 => _inputPortraitDialogSizeM3,
      (true, Orientation.portrait) => _calendarPortraitDialogSizeM2,
      (false, Orientation.portrait) => _inputPortraitDialogSizeM2,
      (true, Orientation.landscape) => _calendarLandscapeDialogSize,
      (false, Orientation.landscape) => _inputLandscapeDialogSize,
    };
  }

  static const Map<ShortcutActivator, Intent> _formShortcutMap = <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.enter): NextFocusIntent(),
  };

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final Orientation orientation = MediaQuery.orientationOf(context);
    final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);
    final DatePickerThemeData defaults = DatePickerTheme.defaults(context);
    final TextTheme textTheme = theme.textTheme;

    TextStyle? headlineStyle;
    if (useMaterial3) {
      headlineStyle = datePickerTheme.headerHeadlineStyle ?? defaults.headerHeadlineStyle;
      switch (_entryMode.value) {
        case PersianDatePickerEntryMode.input:
        case PersianDatePickerEntryMode.inputOnly:
          if (orientation == Orientation.landscape) {
            headlineStyle = textTheme.headlineSmall;
          }
        case PersianDatePickerEntryMode.calendar:
        case PersianDatePickerEntryMode.calendarOnly:
      }
    } else {
      headlineStyle = orientation == Orientation.landscape ? textTheme.headlineSmall : textTheme.headlineMedium;
    }
    final Color? headerForegroundColor = datePickerTheme.headerForegroundColor ?? defaults.headerForegroundColor;
    headlineStyle = headlineStyle?.copyWith(color: headerForegroundColor);

    final Widget actions = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 52.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: OverflowBar(
            spacing: 8,
            children: <Widget>[
              TextButton(
                style: datePickerTheme.cancelButtonStyle ?? defaults.cancelButtonStyle,
                onPressed: _handleCancel,
                child: Text(widget.cancelText ?? (useMaterial3 ? localizations.cancelButtonLabel : localizations.cancelButtonLabel.toUpperCase())),
              ),
              TextButton(
                style: datePickerTheme.confirmButtonStyle ?? defaults.confirmButtonStyle,
                onPressed: _handleOk,
                child: Text(widget.confirmText ?? localizations.okButtonLabel),
              ),
            ],
          ),
        ),
      ),
    );

    PersianCalendarDatePicker calendarDatePicker() {
      return PersianCalendarDatePicker(
        key: _calendarPickerKey,
        initialDate: _selectedDate.value,
        firstDate: widget.firstDate,
        lastDate: widget.lastDate,
        currentDate: widget.currentDate,
        onDateChanged: _handleDateChanged,
        selectableDayPredicate: widget.selectableDayPredicate,
        initialCalendarMode: widget.initialCalendarMode,
      );
    }

    Form inputDatePicker() {
      return Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode.value,
        child: SizedBox(
          height: orientation == Orientation.portrait ? _inputFormPortraitHeight : _inputFormLandscapeHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Shortcuts(
              shortcuts: _formShortcutMap,
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  PersianInputDatePickerFormField(
                    initialDate: _selectedDate.value,
                    firstDate: widget.firstDate,
                    lastDate: widget.lastDate,
                    onDateSubmitted: _handleDateChanged,
                    onDateSaved: _handleDateChanged,
                    selectableDayPredicate: widget.selectableDayPredicate,
                    errorFormatText: widget.errorFormatText,
                    errorInvalidText: widget.errorInvalidText,
                    fieldHintText: widget.fieldHintText,
                    fieldLabelText: widget.fieldLabelText,
                    keyboardType: widget.keyboardType,
                    autofocus: true,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final Widget picker;
    final Widget? entryModeButton;
    switch (_entryMode.value) {
      case PersianDatePickerEntryMode.calendar:
        picker = calendarDatePicker();
        entryModeButton = IconButton(
          icon: widget.switchToInputEntryModeIcon ?? Icon(useMaterial3 ? Icons.edit_outlined : Icons.edit),
          color: headerForegroundColor,
          tooltip: localizations.inputDateModeButtonLabel,
          onPressed: _handleEntryModeToggle,
        );

      case PersianDatePickerEntryMode.calendarOnly:
        picker = calendarDatePicker();
        entryModeButton = null;

      case PersianDatePickerEntryMode.input:
        picker = inputDatePicker();
        entryModeButton = IconButton(
          icon: widget.switchToCalendarEntryModeIcon ?? const Icon(Icons.calendar_today),
          color: headerForegroundColor,
          tooltip: localizations.calendarModeButtonLabel,
          onPressed: _handleEntryModeToggle,
        );

      case PersianDatePickerEntryMode.inputOnly:
        picker = inputDatePicker();
        entryModeButton = null;
    }

    final Widget header = _DatePickerHeader(
      helpText: widget.helpText ?? (useMaterial3 ? localizations.datePickerHelpText : localizations.datePickerHelpText.toUpperCase()),
      titleText: _selectedDate.value == null ? '' : localizations.formatMediumDate(_selectedDate.value!.toDateTime()),
      titleStyle: headlineStyle,
      orientation: orientation,
      isShort: orientation == Orientation.landscape,
      entryModeButton: entryModeButton,
    );

    const double fontSizeToScale = 14.0;
    final double textScaleFactor = MediaQuery.textScalerOf(context).clamp(maxScaleFactor: _kMaxTextScaleFactor).scale(fontSizeToScale) / fontSizeToScale;
    final Size dialogSize = _dialogSize(context) * textScaleFactor;
    final DialogThemeData dialogTheme = theme.dialogTheme;
    return Dialog(
      backgroundColor: datePickerTheme.backgroundColor ?? defaults.backgroundColor,
      elevation: useMaterial3 ? datePickerTheme.elevation ?? defaults.elevation! : datePickerTheme.elevation ?? dialogTheme.elevation ?? 24,
      shadowColor: datePickerTheme.shadowColor ?? defaults.shadowColor,
      surfaceTintColor: datePickerTheme.surfaceTintColor ?? defaults.surfaceTintColor,
      shape: useMaterial3 ? datePickerTheme.shape ?? defaults.shape : datePickerTheme.shape ?? dialogTheme.shape ?? defaults.shape,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        width: dialogSize.width,
        height: dialogSize.height,
        duration: _dialogSizeAnimationDuration,
        curve: Curves.easeIn,
        child: MediaQuery.withClampedTextScaling(
          maxScaleFactor: _kMaxTextScaleFactor,
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            final Size portraitDialogSize = useMaterial3 ? _inputPortraitDialogSizeM3 : _inputPortraitDialogSizeM2;
            final bool isFullyPortrait = constraints.maxHeight >= math.min(dialogSize.height, portraitDialogSize.height);

            switch (orientation) {
              case Orientation.portrait:
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    header,
                    if (useMaterial3) Divider(height: 0, color: datePickerTheme.dividerColor),
                    if (isFullyPortrait) ...<Widget>[
                      Expanded(child: picker),
                      actions,
                    ],
                  ],
                );
              case Orientation.landscape:
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    header,
                    if (useMaterial3) VerticalDivider(width: 0, color: datePickerTheme.dividerColor),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(child: picker),
                          actions,
                        ],
                      ),
                    ),
                  ],
                );
            }
          }),
        ),
      ),
    );
  }
}

class _RestorableDatePickerEntryMode extends RestorableValue<PersianDatePickerEntryMode> {
  _RestorableDatePickerEntryMode(
    PersianDatePickerEntryMode defaultValue,
  ) : _defaultValue = defaultValue;

  final PersianDatePickerEntryMode _defaultValue;

  @override
  PersianDatePickerEntryMode createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(PersianDatePickerEntryMode? oldValue) {
    assert(debugIsSerializableForRestoration(value.index));
    notifyListeners();
  }

  @override
  PersianDatePickerEntryMode fromPrimitives(Object? data) => PersianDatePickerEntryMode.values[data! as int];

  @override
  Object? toPrimitives() => value.index;
}

class _RestorableAutovalidateMode extends RestorableValue<AutovalidateMode> {
  _RestorableAutovalidateMode(
    AutovalidateMode defaultValue,
  ) : _defaultValue = defaultValue;

  final AutovalidateMode _defaultValue;

  @override
  AutovalidateMode createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(AutovalidateMode? oldValue) {
    assert(debugIsSerializableForRestoration(value.index));
    notifyListeners();
  }

  @override
  AutovalidateMode fromPrimitives(Object? data) => AutovalidateMode.values[data! as int];

  @override
  Object? toPrimitives() => value.index;
}

class _DatePickerHeader extends StatelessWidget {
  const _DatePickerHeader({
    required this.helpText,
    required this.titleText,
    this.titleSemanticsLabel,
    required this.titleStyle,
    required this.orientation,
    this.isShort = false,
    this.entryModeButton,
  });

  static const double _datePickerHeaderLandscapeWidth = 152.0;
  static const double _datePickerHeaderPortraitHeight = 120.0;
  static const double _headerPaddingLandscape = 16.0;

  final String helpText;

  final String titleText;

  final String? titleSemanticsLabel;

  final TextStyle? titleStyle;

  final Orientation orientation;

  final bool isShort;

  final Widget? entryModeButton;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);
    final DatePickerThemeData defaults = DatePickerTheme.defaults(context);
    final Color? backgroundColor = datePickerTheme.headerBackgroundColor ?? defaults.headerBackgroundColor;
    final Color? foregroundColor = datePickerTheme.headerForegroundColor ?? defaults.headerForegroundColor;
    final TextStyle? helpStyle = (datePickerTheme.headerHelpStyle ?? defaults.headerHelpStyle)?.copyWith(
      color: foregroundColor,
    );

    final Text help = Text(
      helpText,
      style: helpStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    final Text title = Text(
      titleText,
      semanticsLabel: titleSemanticsLabel ?? titleText,
      style: titleStyle,
      maxLines: orientation == Orientation.portrait ? 1 : 2,
      overflow: TextOverflow.ellipsis,
    );

    switch (orientation) {
      case Orientation.portrait:
        return Semantics(
          container: true,
          child: SizedBox(
            height: _datePickerHeaderPortraitHeight,
            child: Material(
              color: backgroundColor,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 24,
                  end: 12,
                  bottom: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    help,
                    const Flexible(child: SizedBox(height: 38)),
                    Row(
                      children: <Widget>[
                        Expanded(child: title),
                        if (entryModeButton != null)
                          Semantics(
                            container: true,
                            child: entryModeButton,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      case Orientation.landscape:
        return Semantics(
          container: true,
          child: SizedBox(
            width: _datePickerHeaderLandscapeWidth,
            child: Material(
              color: backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: _headerPaddingLandscape,
                    ),
                    child: help,
                  ),
                  SizedBox(height: isShort ? 16 : 56),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _headerPaddingLandscape,
                      ),
                      child: title,
                    ),
                  ),
                  if (entryModeButton != null)
                    Padding(
                      padding: theme.useMaterial3
                          ? const EdgeInsetsDirectional.only(
                              start: 8.0,
                              end: 4.0,
                              bottom: 6.0,
                            )
                          : const EdgeInsets.symmetric(horizontal: 4),
                      child: Semantics(
                        container: true,
                        child: entryModeButton,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
    }
  }
}

Future<JalaliRange?> showPersianDateRangePicker({
  required BuildContext context,
  JalaliRange? initialDateRange,
  required Jalali firstDate,
  required Jalali lastDate,
  Jalali? currentDate,
  PersianDatePickerEntryMode initialEntryMode = PersianDatePickerEntryMode.calendar,
  String? helpText,
  String? cancelText,
  String? confirmText,
  String? saveText,
  String? errorFormatText,
  String? errorInvalidText,
  String? errorInvalidRangeText,
  String? fieldStartHintText,
  String? fieldEndHintText,
  String? fieldStartLabelText,
  String? fieldEndLabelText,
  Locale? locale,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  Offset? anchorPoint,
  TextInputType keyboardType = TextInputType.datetime,
  final Icon? switchToInputEntryModeIcon,
  final Icon? switchToCalendarEntryModeIcon,
  required Jalali initialDate,
}) async {
  assert(
    initialDateRange == null || !initialDateRange.start.isAfter(initialDateRange.end),
    "initialDateRange's start date must not be after it's end date.",
  );
  initialDateRange = initialDateRange == null ? null : PersianDateUtils.datesOnly(initialDateRange);
  firstDate = PersianDateUtils.dateOnly(firstDate);
  lastDate = PersianDateUtils.dateOnly(lastDate);
  assert(
    !lastDate.isBefore(firstDate),
    'lastDate $lastDate must be on or after firstDate $firstDate.',
  );
  assert(
    initialDateRange == null || !initialDateRange.start.isBefore(firstDate),
    "initialDateRange's start date must be on or after firstDate $firstDate.",
  );
  assert(
    initialDateRange == null || !initialDateRange.end.isBefore(firstDate),
    "initialDateRange's end date must be on or after firstDate $firstDate.",
  );
  assert(
    initialDateRange == null || !initialDateRange.start.isAfter(lastDate),
    "initialDateRange's start date must be on or before lastDate $lastDate.",
  );
  assert(
    initialDateRange == null || !initialDateRange.end.isAfter(lastDate),
    "initialDateRange's end date must be on or before lastDate $lastDate.",
  );
  currentDate = PersianDateUtils.dateOnly(currentDate ?? Jalali.now());
  assert(debugCheckHasMaterialLocalizations(context));

  Widget dialog = PersianDateRangePickerDialog(
    initialDateRange: initialDateRange,
    firstDate: firstDate,
    lastDate: lastDate,
    currentDate: currentDate,
    initialEntryMode: initialEntryMode,
    helpText: helpText,
    cancelText: cancelText,
    confirmText: confirmText,
    saveText: saveText,
    errorFormatText: errorFormatText,
    errorInvalidText: errorInvalidText,
    errorInvalidRangeText: errorInvalidRangeText,
    fieldStartHintText: fieldStartHintText,
    fieldEndHintText: fieldEndHintText,
    fieldStartLabelText: fieldStartLabelText,
    fieldEndLabelText: fieldEndLabelText,
    keyboardType: keyboardType,
    switchToInputEntryModeIcon: switchToInputEntryModeIcon,
    switchToCalendarEntryModeIcon: switchToCalendarEntryModeIcon,
  );

  if (textDirection != null) {
    dialog = Directionality(
      textDirection: textDirection,
      child: dialog,
    );
  }

  if (locale != null) {
    dialog = Localizations.override(
      context: context,
      locale: locale,
      child: dialog,
    );
  }

  return showDialog<JalaliRange>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    useSafeArea: false,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    anchorPoint: anchorPoint,
  );
}

String _formatRangeStartDate(MaterialLocalizations localizations, Jalali? startDate, Jalali? endDate) {
  return startDate == null
      ? localizations.dateRangeStartLabel
      : (endDate == null || startDate.year == endDate.year)
          ? localizations.formatShortMonthDay(startDate.toDateTime())
          : localizations.formatShortDate(startDate.toDateTime());
}

String _formatRangeEndDate(MaterialLocalizations localizations, Jalali? startDate, Jalali? endDate, Jalali currentDate) {
  return endDate == null
      ? localizations.dateRangeEndLabel
      : (startDate != null && startDate.year == endDate.year && startDate.year == currentDate.year)
          ? localizations.formatShortMonthDay(endDate.toDateTime())
          : localizations.formatShortDate(endDate.toDateTime());
}

class PersianDateRangePickerDialog extends StatefulWidget {
  const PersianDateRangePickerDialog({
    super.key,
    this.initialDateRange,
    required this.firstDate,
    required this.lastDate,
    this.currentDate,
    this.initialEntryMode = PersianDatePickerEntryMode.calendar,
    this.helpText,
    this.cancelText,
    this.confirmText,
    this.saveText,
    this.errorInvalidRangeText,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldStartHintText,
    this.fieldEndHintText,
    this.fieldStartLabelText,
    this.fieldEndLabelText,
    this.keyboardType = TextInputType.datetime,
    this.restorationId,
    this.switchToInputEntryModeIcon,
    this.switchToCalendarEntryModeIcon,
  });

  final JalaliRange? initialDateRange;

  final Jalali firstDate;

  final Jalali lastDate;

  final Jalali? currentDate;

  final PersianDatePickerEntryMode initialEntryMode;

  final String? cancelText;

  final String? confirmText;

  final String? saveText;

  final String? helpText;

  final String? errorInvalidRangeText;

  final String? errorFormatText;

  final String? errorInvalidText;

  final String? fieldStartHintText;

  final String? fieldEndHintText;

  final String? fieldStartLabelText;

  final String? fieldEndLabelText;

  final TextInputType keyboardType;

  final String? restorationId;

  final Icon? switchToInputEntryModeIcon;

  final Icon? switchToCalendarEntryModeIcon;

  @override
  State<PersianDateRangePickerDialog> createState() => _PersianDateRangePickerDialogState();
}

class _PersianDateRangePickerDialogState extends State<PersianDateRangePickerDialog> with RestorationMixin {
  late final _RestorableDatePickerEntryMode _entryMode = _RestorableDatePickerEntryMode(widget.initialEntryMode);
  late final RestorableJalaliN _selectedStart = RestorableJalaliN(widget.initialDateRange?.start);
  late final RestorableJalaliN _selectedEnd = RestorableJalaliN(widget.initialDateRange?.end);
  final RestorableBool _autoValidate = RestorableBool(false);
  final GlobalKey _calendarPickerKey = GlobalKey();
  final GlobalKey<_InputDateRangePickerState> _inputPickerKey = GlobalKey<_InputDateRangePickerState>();

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_entryMode, 'entry_mode');
    registerForRestoration(_selectedStart, 'selected_start');
    registerForRestoration(_selectedEnd, 'selected_end');
    registerForRestoration(_autoValidate, 'autovalidate');
  }

  @override
  void dispose() {
    _entryMode.dispose();
    _selectedStart.dispose();
    _selectedEnd.dispose();
    _autoValidate.dispose();
    super.dispose();
  }

  void _handleOk() {
    if (_entryMode.value == PersianDatePickerEntryMode.input || _entryMode.value == PersianDatePickerEntryMode.inputOnly) {
      final _InputDateRangePickerState picker = _inputPickerKey.currentState!;
      if (!picker.validate()) {
        setState(() {
          _autoValidate.value = true;
        });
        return;
      }
    }
    final JalaliRange? selectedRange = _hasSelectedDateRange ? JalaliRange(start: _selectedStart.value!, end: _selectedEnd.value!) : null;

    Navigator.pop(context, selectedRange);
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleEntryModeToggle() {
    setState(() {
      switch (_entryMode.value) {
        case PersianDatePickerEntryMode.calendar:
          _autoValidate.value = false;
          _entryMode.value = PersianDatePickerEntryMode.input;

        case PersianDatePickerEntryMode.input:
          if (_selectedStart.value != null && (_selectedStart.value!.isBefore(widget.firstDate) || _selectedStart.value!.isAfter(widget.lastDate))) {
            _selectedStart.value = null;
            _selectedEnd.value = null;
          }
          if (_selectedEnd.value != null && (_selectedEnd.value!.isBefore(widget.firstDate) || _selectedEnd.value!.isAfter(widget.lastDate))) {
            _selectedEnd.value = null;
          }
          if (_selectedStart.value != null && _selectedEnd.value != null && _selectedStart.value!.isAfter(_selectedEnd.value!)) {
            _selectedEnd.value = null;
          }
          _entryMode.value = PersianDatePickerEntryMode.calendar;

        case PersianDatePickerEntryMode.calendarOnly:
        case PersianDatePickerEntryMode.inputOnly:
          assert(false, 'Can not change entry mode from $_entryMode');
      }
    });
  }

  void _handleStartDateChanged(Jalali? date) {
    setState(() => _selectedStart.value = date);
  }

  void _handleEndDateChanged(Jalali? date) {
    setState(() => _selectedEnd.value = date);
  }

  bool get _hasSelectedDateRange => _selectedStart.value != null && _selectedEnd.value != null;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final Orientation orientation = MediaQuery.orientationOf(context);
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);
    final DatePickerThemeData defaults = DatePickerTheme.defaults(context);

    final Widget contents;
    final Size size;
    final double? elevation;
    final Color? shadowColor;
    final Color? surfaceTintColor;
    final ShapeBorder? shape;
    final EdgeInsets insetPadding;
    final bool showEntryModeButton = _entryMode.value == PersianDatePickerEntryMode.calendar || _entryMode.value == PersianDatePickerEntryMode.input;
    switch (_entryMode.value) {
      case PersianDatePickerEntryMode.calendar:
      case PersianDatePickerEntryMode.calendarOnly:
        contents = _CalendarRangePickerDialog(
          key: _calendarPickerKey,
          selectedStartDate: _selectedStart.value,
          selectedEndDate: _selectedEnd.value,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          currentDate: widget.currentDate,
          onStartDateChanged: _handleStartDateChanged,
          onEndDateChanged: _handleEndDateChanged,
          onConfirm: _hasSelectedDateRange ? _handleOk : null,
          onCancel: _handleCancel,
          entryModeButton: showEntryModeButton
              ? IconButton(
                  icon: widget.switchToInputEntryModeIcon ?? Icon(useMaterial3 ? Icons.edit_outlined : Icons.edit),
                  padding: EdgeInsets.zero,
                  tooltip: localizations.inputDateModeButtonLabel,
                  onPressed: _handleEntryModeToggle,
                )
              : null,
          confirmText: widget.saveText ?? (useMaterial3 ? localizations.saveButtonLabel : localizations.saveButtonLabel.toUpperCase()),
          helpText: widget.helpText ?? (useMaterial3 ? localizations.dateRangePickerHelpText : localizations.dateRangePickerHelpText.toUpperCase()),
        );
        size = MediaQuery.sizeOf(context);
        insetPadding = EdgeInsets.zero;
        elevation = datePickerTheme.rangePickerElevation ?? defaults.rangePickerElevation!;
        shadowColor = datePickerTheme.rangePickerShadowColor ?? defaults.rangePickerShadowColor!;
        surfaceTintColor = datePickerTheme.rangePickerSurfaceTintColor ?? defaults.rangePickerSurfaceTintColor!;
        shape = datePickerTheme.rangePickerShape ?? defaults.rangePickerShape;

      case PersianDatePickerEntryMode.input:
      case PersianDatePickerEntryMode.inputOnly:
        contents = _InputPersianDateRangePickerDialog(
          selectedStartDate: _selectedStart.value,
          selectedEndDate: _selectedEnd.value,
          currentDate: widget.currentDate,
          picker: SizedBox(
            height: orientation == Orientation.portrait ? _inputFormPortraitHeight : _inputFormLandscapeHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  _InputDateRangePicker(
                    key: _inputPickerKey,
                    initialStartDate: _selectedStart.value,
                    initialEndDate: _selectedEnd.value,
                    firstDate: widget.firstDate,
                    lastDate: widget.lastDate,
                    onStartDateChanged: _handleStartDateChanged,
                    onEndDateChanged: _handleEndDateChanged,
                    autofocus: true,
                    autovalidate: _autoValidate.value,
                    helpText: widget.helpText,
                    errorInvalidRangeText: widget.errorInvalidRangeText,
                    errorFormatText: widget.errorFormatText,
                    errorInvalidText: widget.errorInvalidText,
                    fieldStartHintText: widget.fieldStartHintText,
                    fieldEndHintText: widget.fieldEndHintText,
                    fieldStartLabelText: widget.fieldStartLabelText,
                    fieldEndLabelText: widget.fieldEndLabelText,
                    keyboardType: widget.keyboardType,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          onConfirm: _handleOk,
          onCancel: _handleCancel,
          entryModeButton: showEntryModeButton
              ? IconButton(
                  icon: widget.switchToCalendarEntryModeIcon ?? const Icon(Icons.calendar_today),
                  padding: EdgeInsets.zero,
                  tooltip: localizations.calendarModeButtonLabel,
                  onPressed: _handleEntryModeToggle,
                )
              : null,
          confirmText: widget.confirmText ?? localizations.okButtonLabel,
          cancelText: widget.cancelText ?? (useMaterial3 ? localizations.cancelButtonLabel : localizations.cancelButtonLabel.toUpperCase()),
          helpText: widget.helpText ?? (useMaterial3 ? localizations.dateRangePickerHelpText : localizations.dateRangePickerHelpText.toUpperCase()),
        );
        final DialogThemeData dialogTheme = theme.dialogTheme;
        size = orientation == Orientation.portrait ? (useMaterial3 ? _inputPortraitDialogSizeM3 : _inputPortraitDialogSizeM2) : _inputRangeLandscapeDialogSize;
        elevation = useMaterial3 ? datePickerTheme.elevation ?? defaults.elevation! : datePickerTheme.elevation ?? dialogTheme.elevation ?? 24;
        shadowColor = datePickerTheme.shadowColor ?? defaults.shadowColor;
        surfaceTintColor = datePickerTheme.surfaceTintColor ?? defaults.surfaceTintColor;
        shape = useMaterial3 ? datePickerTheme.shape ?? defaults.shape : datePickerTheme.shape ?? dialogTheme.shape ?? defaults.shape;

        insetPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0);
    }

    return Dialog(
      insetPadding: insetPadding,
      backgroundColor: datePickerTheme.backgroundColor ?? defaults.backgroundColor,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        width: size.width,
        height: size.height,
        duration: _dialogSizeAnimationDuration,
        curve: Curves.easeIn,
        child: MediaQuery.withClampedTextScaling(
          maxScaleFactor: _kMaxTextScaleFactor,
          child: Builder(builder: (BuildContext context) {
            return contents;
          }),
        ),
      ),
    );
  }
}

class _CalendarRangePickerDialog extends StatelessWidget {
  const _CalendarRangePickerDialog({
    super.key,
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.firstDate,
    required this.lastDate,
    required this.currentDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.onConfirm,
    required this.onCancel,
    required this.confirmText,
    required this.helpText,
    this.entryModeButton,
  });

  final Jalali? selectedStartDate;
  final Jalali? selectedEndDate;
  final Jalali firstDate;
  final Jalali lastDate;
  final Jalali? currentDate;
  final ValueChanged<Jalali> onStartDateChanged;
  final ValueChanged<Jalali?> onEndDateChanged;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String confirmText;
  final String helpText;
  final Widget? entryModeButton;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final Orientation orientation = MediaQuery.orientationOf(context);
    final DatePickerThemeData themeData = DatePickerTheme.of(context);
    final DatePickerThemeData defaults = DatePickerTheme.defaults(context);
    final Color? dialogBackground = themeData.rangePickerBackgroundColor ?? defaults.rangePickerBackgroundColor;
    final Color? headerBackground = themeData.rangePickerHeaderBackgroundColor ?? defaults.rangePickerHeaderBackgroundColor;
    final Color? headerForeground = themeData.rangePickerHeaderForegroundColor ?? defaults.rangePickerHeaderForegroundColor;
    final Color? headerDisabledForeground = headerForeground?.withValues(alpha: 0.38);
    final TextStyle? headlineStyle = themeData.rangePickerHeaderHeadlineStyle ?? defaults.rangePickerHeaderHeadlineStyle;
    final TextStyle? headlineHelpStyle = (themeData.rangePickerHeaderHelpStyle ?? defaults.rangePickerHeaderHelpStyle)?.apply(color: headerForeground);
    final String startDateText = _formatRangeStartDate(localizations, selectedStartDate, selectedEndDate);
    final String endDateText = _formatRangeEndDate(localizations, selectedStartDate, selectedEndDate, Jalali.now());
    final TextStyle? startDateStyle = headlineStyle?.apply(
      color: selectedStartDate != null ? headerForeground : headerDisabledForeground,
    );
    final TextStyle? endDateStyle = headlineStyle?.apply(
      color: selectedEndDate != null ? headerForeground : headerDisabledForeground,
    );
    final ButtonStyle buttonStyle = TextButton.styleFrom(foregroundColor: headerForeground, disabledForegroundColor: headerDisabledForeground);
    final IconThemeData iconTheme = IconThemeData(color: headerForeground);

    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: iconTheme,
          actionsIconTheme: iconTheme,
          elevation: useMaterial3 ? 0 : null,
          scrolledUnderElevation: useMaterial3 ? 0 : null,
          backgroundColor: headerBackground,
          leading: CloseButton(
            onPressed: onCancel,
          ),
          actions: <Widget>[
            if (orientation == Orientation.landscape && entryModeButton != null) entryModeButton!,
            TextButton(
              style: buttonStyle,
              onPressed: onConfirm,
              child: Text(confirmText),
            ),
            const SizedBox(width: 8),
          ],
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 64),
            child: Row(children: <Widget>[
              SizedBox(width: MediaQuery.sizeOf(context).width < 360 ? 42 : 72),
              Expanded(
                child: Semantics(
                  label: '$helpText $startDateText to $endDateText',
                  excludeSemantics: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        helpText,
                        style: headlineHelpStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          Text(
                            startDateText,
                            style: startDateStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            ' – ',
                            style: startDateStyle,
                          ),
                          Flexible(
                            child: Text(
                              endDateText,
                              style: endDateStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              if (orientation == Orientation.portrait && entryModeButton != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconTheme(
                    data: iconTheme,
                    child: entryModeButton!,
                  ),
                ),
            ]),
          ),
        ),
        backgroundColor: dialogBackground,
        body: _CalendarDateRangePicker(
          initialStartDate: selectedStartDate,
          initialEndDate: selectedEndDate,
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: currentDate,
          onStartDateChanged: onStartDateChanged,
          onEndDateChanged: onEndDateChanged,
        ),
      ),
    );
  }
}

const Duration _monthScrollDuration = Duration(milliseconds: 200);

const double _monthItemHeaderHeight = 58.0;
const double _monthItemFooterHeight = 12.0;
const double _monthItemRowHeight = 42.0;
const double _monthItemSpaceBetweenRows = 8.0;
const double _horizontalPadding = 8.0;
const double _maxCalendarWidthLandscape = 384.0;
const double _maxCalendarWidthPortrait = 480.0;

class _CalendarDateRangePicker extends StatefulWidget {
  _CalendarDateRangePicker({
    Jalali? initialStartDate,
    Jalali? initialEndDate,
    required Jalali firstDate,
    required Jalali lastDate,
    Jalali? currentDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
  })  : initialStartDate = initialStartDate != null ? PersianDateUtils.dateOnly(initialStartDate) : null,
        initialEndDate = initialEndDate != null ? PersianDateUtils.dateOnly(initialEndDate) : null,
        firstDate = PersianDateUtils.dateOnly(firstDate),
        lastDate = PersianDateUtils.dateOnly(lastDate),
        currentDate = PersianDateUtils.dateOnly(currentDate ?? Jalali.now()) {
    assert(
      this.initialStartDate == null || this.initialEndDate == null || !this.initialStartDate!.isAfter(initialEndDate!),
      'initialStartDate must be on or before initialEndDate.',
    );
    assert(
      !this.lastDate.isBefore(this.firstDate),
      'firstDate must be on or before lastDate.',
    );
  }

  final Jalali? initialStartDate;

  final Jalali? initialEndDate;

  final Jalali firstDate;

  final Jalali lastDate;

  final Jalali currentDate;

  final ValueChanged<Jalali>? onStartDateChanged;

  final ValueChanged<Jalali?>? onEndDateChanged;

  @override
  _CalendarDateRangePickerState createState() => _CalendarDateRangePickerState();
}

class _CalendarDateRangePickerState extends State<_CalendarDateRangePicker> {
  final GlobalKey _scrollViewKey = GlobalKey();
  Jalali? _startDate;
  Jalali? _endDate;
  int _initialMonthIndex = 0;
  late ScrollController _controller;
  late bool _showWeekBottomDivider;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    _startDate = widget.initialStartDate;
    _endDate = widget.initialEndDate;

    final Jalali initialDate = widget.initialStartDate ?? widget.currentDate;
    if (!initialDate.isBefore(widget.firstDate) && !initialDate.isAfter(widget.lastDate)) {
      _initialMonthIndex = PersianDateUtils.monthDelta(widget.firstDate, initialDate);
    }

    _showWeekBottomDivider = _initialMonthIndex != 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset <= _controller.position.minScrollExtent) {
      setState(() {
        _showWeekBottomDivider = false;
      });
    } else if (!_showWeekBottomDivider) {
      setState(() {
        _showWeekBottomDivider = true;
      });
    }
  }

  int get _numberOfMonths => PersianDateUtils.monthDelta(widget.firstDate, widget.lastDate) + 1;

  void _vibrate() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        HapticFeedback.vibrate();
      case TargetPlatform.iOS:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        break;
    }
  }

  void _updateSelection(Jalali date) {
    _vibrate();
    setState(() {
      if (_startDate != null && _endDate == null && !date.isBefore(_startDate!)) {
        _endDate = date;
        widget.onEndDateChanged?.call(_endDate);
      } else {
        _startDate = date;
        widget.onStartDateChanged?.call(_startDate!);
        if (_endDate != null) {
          _endDate = null;
          widget.onEndDateChanged?.call(_endDate);
        }
      }
    });
  }

  Widget _buildMonthItem(BuildContext context, int index, bool beforeInitialMonth) {
    final int monthIndex = beforeInitialMonth ? _initialMonthIndex - index - 1 : _initialMonthIndex + index;
    final Jalali month = PersianDateUtils.addMonthsToMonthDate(widget.firstDate, monthIndex);

    return _MonthItem(
      selectedDateStart: _startDate,
      selectedDateEnd: _endDate,
      currentDate: widget.currentDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      displayedMonth: month,
      onChanged: _updateSelection,
    );
  }

  @override
  Widget build(BuildContext context) {
    const Key sliverAfterKey = Key('sliverAfterKey');

    return Column(
      children: <Widget>[
        const _DayHeaders(),
        if (_showWeekBottomDivider) const Divider(height: 0),
        Expanded(
          child: _CalendarKeyboardNavigator(
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            initialFocusedDay: _startDate ?? widget.initialStartDate ?? widget.currentDate,
            child: CustomScrollView(
              key: _scrollViewKey,
              controller: _controller,
              center: sliverAfterKey,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => _buildMonthItem(context, index, true),
                    childCount: _initialMonthIndex,
                  ),
                ),
                SliverList(
                  key: sliverAfterKey,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => _buildMonthItem(context, index, false),
                    childCount: _numberOfMonths - _initialMonthIndex,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CalendarKeyboardNavigator extends StatefulWidget {
  const _CalendarKeyboardNavigator({
    required this.child,
    required this.firstDate,
    required this.lastDate,
    required this.initialFocusedDay,
  });

  final Widget child;
  final Jalali firstDate;
  final Jalali lastDate;
  final Jalali initialFocusedDay;

  @override
  _CalendarKeyboardNavigatorState createState() => _CalendarKeyboardNavigatorState();
}

class _CalendarKeyboardNavigatorState extends State<_CalendarKeyboardNavigator> {
  final Map<ShortcutActivator, Intent> _shortcutMap = const <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.arrowLeft): DirectionalFocusIntent(TraversalDirection.left),
    SingleActivator(LogicalKeyboardKey.arrowRight): DirectionalFocusIntent(TraversalDirection.right),
    SingleActivator(LogicalKeyboardKey.arrowDown): DirectionalFocusIntent(TraversalDirection.down),
    SingleActivator(LogicalKeyboardKey.arrowUp): DirectionalFocusIntent(TraversalDirection.up),
  };
  late Map<Type, Action<Intent>> _actionMap;
  late FocusNode _dayGridFocus;
  TraversalDirection? _dayTraversalDirection;
  Jalali? _focusedDay;

  @override
  void initState() {
    super.initState();

    _actionMap = <Type, Action<Intent>>{
      NextFocusIntent: CallbackAction<NextFocusIntent>(onInvoke: _handleGridNextFocus),
      PreviousFocusIntent: CallbackAction<PreviousFocusIntent>(onInvoke: _handleGridPreviousFocus),
      DirectionalFocusIntent: CallbackAction<DirectionalFocusIntent>(onInvoke: _handleDirectionFocus),
    };
    _dayGridFocus = FocusNode(debugLabel: 'Day Grid');
  }

  @override
  void dispose() {
    _dayGridFocus.dispose();
    super.dispose();
  }

  void _handleGridFocusChange(bool focused) {
    setState(() {
      if (focused) {
        _focusedDay ??= widget.initialFocusedDay;
      }
    });
  }

  void _handleGridNextFocus(NextFocusIntent intent) {
    _dayGridFocus.requestFocus();
    _dayGridFocus.nextFocus();
  }

  void _handleGridPreviousFocus(PreviousFocusIntent intent) {
    _dayGridFocus.requestFocus();
    _dayGridFocus.previousFocus();
  }

  void _handleDirectionFocus(DirectionalFocusIntent intent) {
    assert(_focusedDay != null);
    setState(() {
      final Jalali? nextDate = _nextDateInDirection(_focusedDay!, intent.direction);
      if (nextDate != null) {
        _focusedDay = nextDate;
        _dayTraversalDirection = intent.direction;
      }
    });
  }

  static const Map<TraversalDirection, int> _directionOffset = <TraversalDirection, int>{
    TraversalDirection.up: -JalaliExt.daysPerWeek,
    TraversalDirection.right: 1,
    TraversalDirection.down: JalaliExt.daysPerWeek,
    TraversalDirection.left: -1,
  };

  int _dayDirectionOffset(TraversalDirection traversalDirection, TextDirection textDirection) {
    if (textDirection == TextDirection.rtl) {
      if (traversalDirection == TraversalDirection.left) {
        traversalDirection = TraversalDirection.right;
      } else if (traversalDirection == TraversalDirection.right) {
        traversalDirection = TraversalDirection.left;
      }
    }
    return _directionOffset[traversalDirection]!;
  }

  Jalali? _nextDateInDirection(Jalali date, TraversalDirection direction) {
    final TextDirection textDirection = Directionality.of(context);
    final Jalali nextDate = PersianDateUtils.addDaysToDate(date, _dayDirectionOffset(direction, textDirection));
    if (!nextDate.isBefore(widget.firstDate) && !nextDate.isAfter(widget.lastDate)) {
      return nextDate;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      shortcuts: _shortcutMap,
      actions: _actionMap,
      focusNode: _dayGridFocus,
      onFocusChange: _handleGridFocusChange,
      child: _FocusedDate(
        date: _dayGridFocus.hasFocus ? _focusedDay : null,
        scrollDirection: _dayGridFocus.hasFocus ? _dayTraversalDirection : null,
        child: widget.child,
      ),
    );
  }
}

class _FocusedDate extends InheritedWidget {
  const _FocusedDate({
    required super.child,
    this.date,
    this.scrollDirection,
  });

  final Jalali? date;
  final TraversalDirection? scrollDirection;

  @override
  bool updateShouldNotify(_FocusedDate oldWidget) {
    return !PersianDateUtils.isSameDay(date, oldWidget.date) || scrollDirection != oldWidget.scrollDirection;
  }

  static _FocusedDate? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_FocusedDate>();
  }
}

class _DayHeaders extends StatelessWidget {
  const _DayHeaders();

  List<Widget> _getDayHeaders(TextStyle headerStyle, MaterialLocalizations localizations) {
    final List<Widget> result = <Widget>[];
    for (int i = localizations.firstDayOfWeekIndex; result.length < JalaliExt.daysPerWeek; i = (i + 1) % JalaliExt.daysPerWeek) {
      final String weekday = localizations.narrowWeekdays[i];
      result.add(ExcludeSemantics(
        child: Center(child: Text(weekday, style: headerStyle)),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextStyle textStyle = themeData.textTheme.titleSmall!.apply(color: colorScheme.onSurface);
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final List<Widget> labels = _getDayHeaders(textStyle, localizations);

    labels.insert(0, const SizedBox.shrink());
    labels.add(const SizedBox.shrink());

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.orientationOf(context) == Orientation.landscape ? _maxCalendarWidthLandscape : _maxCalendarWidthPortrait,
        maxHeight: _monthItemRowHeight,
      ),
      child: GridView.custom(
        shrinkWrap: true,
        gridDelegate: _monthItemGridDelegate,
        childrenDelegate: SliverChildListDelegate(
          labels,
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

class _MonthItemGridDelegate extends SliverGridDelegate {
  const _MonthItemGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double tileWidth = (constraints.crossAxisExtent - 2 * _horizontalPadding) / JalaliExt.daysPerWeek;
    return _MonthSliverGridLayout(
      crossAxisCount: JalaliExt.daysPerWeek + 2,
      dayChildWidth: tileWidth,
      edgeChildWidth: _horizontalPadding,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_MonthItemGridDelegate oldDelegate) => false;
}

const _MonthItemGridDelegate _monthItemGridDelegate = _MonthItemGridDelegate();

class _MonthSliverGridLayout extends SliverGridLayout {
  const _MonthSliverGridLayout({
    required this.crossAxisCount,
    required this.dayChildWidth,
    required this.edgeChildWidth,
    required this.reverseCrossAxis,
  })  : assert(crossAxisCount > 0),
        assert(dayChildWidth >= 0),
        assert(edgeChildWidth >= 0);

  final int crossAxisCount;

  final double dayChildWidth;

  final double edgeChildWidth;

  final bool reverseCrossAxis;

  double get _rowHeight {
    return _monthItemRowHeight + _monthItemSpaceBetweenRows;
  }

  double get _childHeight {
    return _monthItemRowHeight;
  }

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    return crossAxisCount * (scrollOffset ~/ _rowHeight);
  }

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    final int mainAxisCount = (scrollOffset / _rowHeight).ceil();
    return math.max(0, crossAxisCount * mainAxisCount - 1);
  }

  double _getCrossAxisOffset(double crossAxisStart, bool isPadding) {
    if (reverseCrossAxis) {
      return ((crossAxisCount - 2) * dayChildWidth + 2 * edgeChildWidth) - crossAxisStart - (isPadding ? edgeChildWidth : dayChildWidth);
    }
    return crossAxisStart;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    final int adjustedIndex = index % crossAxisCount;
    final bool isEdge = adjustedIndex == 0 || adjustedIndex == crossAxisCount - 1;
    final double crossAxisStart = math.max(0, (adjustedIndex - 1) * dayChildWidth + edgeChildWidth);

    return SliverGridGeometry(
      scrollOffset: (index ~/ crossAxisCount) * _rowHeight,
      crossAxisOffset: _getCrossAxisOffset(crossAxisStart, isEdge),
      mainAxisExtent: _childHeight,
      crossAxisExtent: isEdge ? edgeChildWidth : dayChildWidth,
    );
  }

  @override
  double computeMaxScrollOffset(int childCount) {
    assert(childCount >= 0);
    final int mainAxisCount = ((childCount - 1) ~/ crossAxisCount) + 1;
    final double mainAxisSpacing = _rowHeight - _childHeight;
    return _rowHeight * mainAxisCount - mainAxisSpacing;
  }
}

class _MonthItem extends StatefulWidget {
  _MonthItem({
    required this.selectedDateStart,
    required this.selectedDateEnd,
    required this.currentDate,
    required this.onChanged,
    required this.firstDate,
    required this.lastDate,
    required this.displayedMonth,
  })  : assert(!firstDate.isAfter(lastDate)),
        assert(selectedDateStart == null || !selectedDateStart.isBefore(firstDate)),
        assert(selectedDateEnd == null || !selectedDateEnd.isBefore(firstDate)),
        assert(selectedDateStart == null || !selectedDateStart.isAfter(lastDate)),
        assert(selectedDateEnd == null || !selectedDateEnd.isAfter(lastDate)),
        assert(selectedDateStart == null || selectedDateEnd == null || !selectedDateStart.isAfter(selectedDateEnd));

  final Jalali? selectedDateStart;

  final Jalali? selectedDateEnd;

  final Jalali currentDate;

  final ValueChanged<Jalali> onChanged;

  final Jalali firstDate;

  final Jalali lastDate;

  final Jalali displayedMonth;

  @override
  _MonthItemState createState() => _MonthItemState();
}

class _MonthItemState extends State<_MonthItem> {
  late List<FocusNode> _dayFocusNodes;

  @override
  void initState() {
    super.initState();
    final int daysInMonth = PersianDateUtils.getDaysInMonth(widget.displayedMonth.year, widget.displayedMonth.month);
    _dayFocusNodes = List<FocusNode>.generate(
      daysInMonth,
      (int index) => FocusNode(skipTraversal: true, debugLabel: 'Day ${index + 1}'),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Jalali? focusedDate = _FocusedDate.maybeOf(context)?.date;
    if (focusedDate != null && PersianDateUtils.isSameMonth(widget.displayedMonth, focusedDate)) {
      _dayFocusNodes[focusedDate.day - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    for (final FocusNode node in _dayFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Color _highlightColor(BuildContext context) {
    return DatePickerTheme.of(context).rangeSelectionBackgroundColor ?? DatePickerTheme.defaults(context).rangeSelectionBackgroundColor!;
  }

  void _dayFocusChanged(bool focused) {
    if (focused) {
      final TraversalDirection? focusDirection = _FocusedDate.maybeOf(context)?.scrollDirection;
      if (focusDirection != null) {
        ScrollPositionAlignmentPolicy policy = ScrollPositionAlignmentPolicy.explicit;
        switch (focusDirection) {
          case TraversalDirection.up:
          case TraversalDirection.left:
            policy = ScrollPositionAlignmentPolicy.keepVisibleAtStart;
          case TraversalDirection.right:
          case TraversalDirection.down:
            policy = ScrollPositionAlignmentPolicy.keepVisibleAtEnd;
        }
        Scrollable.ensureVisible(
          primaryFocus!.context!,
          duration: _monthScrollDuration,
          alignmentPolicy: policy,
        );
      }
    }
  }

  Widget _buildDayItem(BuildContext context, Jalali dayToBuild, int firstDayOffset, int daysInMonth) {
    final int day = dayToBuild.day;

    final bool isDisabled = dayToBuild.isAfter(widget.lastDate) || dayToBuild.isBefore(widget.firstDate);
    final bool isRangeSelected = widget.selectedDateStart != null && widget.selectedDateEnd != null;
    final bool isSelectedDayStart = widget.selectedDateStart != null && dayToBuild.isAtSameMomentAs(widget.selectedDateStart!);
    final bool isSelectedDayEnd = widget.selectedDateEnd != null && dayToBuild.isAtSameMomentAs(widget.selectedDateEnd!);
    final bool isInRange = isRangeSelected && dayToBuild.isAfter(widget.selectedDateStart!) && dayToBuild.isBefore(widget.selectedDateEnd!);
    final bool isOneDayRange = isRangeSelected && widget.selectedDateStart == widget.selectedDateEnd;
    final bool isToday = PersianDateUtils.isSameDay(widget.currentDate, dayToBuild);

    return _DayItem(
      day: dayToBuild,
      focusNode: _dayFocusNodes[day - 1],
      onChanged: widget.onChanged,
      onFocusChange: _dayFocusChanged,
      highlightColor: _highlightColor(context),
      isDisabled: isDisabled,
      isRangeSelected: isRangeSelected,
      isSelectedDayStart: isSelectedDayStart,
      isSelectedDayEnd: isSelectedDayEnd,
      isInRange: isInRange,
      isOneDayRange: isOneDayRange,
      isToday: isToday,
    );
  }

  Widget _buildEdgeBox(BuildContext context, bool isHighlighted) {
    const Widget empty = LimitedBox(maxWidth: 0.0, maxHeight: 0.0, child: SizedBox.expand());
    return isHighlighted ? ColoredBox(color: _highlightColor(context), child: empty) : empty;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final int year = widget.displayedMonth.year;
    final int month = widget.displayedMonth.month;
    final int daysInMonth = PersianDateUtils.getDaysInMonth(year, month);
    final int dayOffset = PersianDateUtils.firstDayOffset(year, month, localizations);
    final int weeks = ((daysInMonth + dayOffset) / JalaliExt.daysPerWeek).ceil();
    final double gridHeight = weeks * _monthItemRowHeight + (weeks - 1) * _monthItemSpaceBetweenRows;
    final List<Widget> dayItems = <Widget>[];

    for (int day = 0 - dayOffset + 1; day <= daysInMonth; day += 1) {
      if (day < 1) {
        dayItems.add(const LimitedBox(maxWidth: 0.0, maxHeight: 0.0, child: SizedBox.expand()));
      } else {
        final Jalali dayToBuild = Jalali(year, month, day);
        final Widget dayItem = _buildDayItem(
          context,
          dayToBuild,
          dayOffset,
          daysInMonth,
        );
        dayItems.add(dayItem);
      }
    }

    final List<Widget> paddedDayItems = <Widget>[];
    for (int i = 0; i < weeks; i++) {
      final int start = i * JalaliExt.daysPerWeek;
      final int end = math.min(
        start + JalaliExt.daysPerWeek,
        dayItems.length,
      );
      final List<Widget> weekList = dayItems.sublist(start, end);

      final Jalali dateAfterLeadingPadding = Jalali(year, month, 1).addDays(start - dayOffset);

      final bool isLeadingInRange = !(dayOffset > 0 && i == 0) && widget.selectedDateStart != null && widget.selectedDateEnd != null && dateAfterLeadingPadding.isAfter(widget.selectedDateStart!) && !dateAfterLeadingPadding.isAfter(widget.selectedDateEnd!);
      weekList.insert(0, _buildEdgeBox(context, isLeadingInRange));

      if (end < dayItems.length || (end == dayItems.length && dayItems.length % JalaliExt.daysPerWeek == 0)) {
        final Jalali dateBeforeTrailingPadding = Jalali(year, month, 1).addDays(end - dayOffset - 1);

        final bool isTrailingInRange = widget.selectedDateStart != null && widget.selectedDateEnd != null && !dateBeforeTrailingPadding.isBefore(widget.selectedDateStart!) && dateBeforeTrailingPadding.isBefore(widget.selectedDateEnd!);
        weekList.add(_buildEdgeBox(context, isTrailingInRange));
      }

      paddedDayItems.addAll(weekList);
    }

    final double maxWidth = MediaQuery.orientationOf(context) == Orientation.landscape ? _maxCalendarWidthLandscape : _maxCalendarWidthPortrait;
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth).tighten(height: _monthItemHeaderHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: ExcludeSemantics(
                child: Text(
                  localizations.formatMonthYear(widget.displayedMonth.toDateTime()),
                  style: textTheme.bodyMedium!.apply(color: themeData.colorScheme.onSurface),
                ),
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            maxHeight: gridHeight,
          ),
          child: GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: _monthItemGridDelegate,
            childrenDelegate: SliverChildListDelegate(
              paddedDayItems,
              addRepaintBoundaries: false,
            ),
          ),
        ),
        const SizedBox(height: _monthItemFooterHeight),
      ],
    );
  }
}

class _DayItem extends StatefulWidget {
  const _DayItem({
    required this.day,
    required this.focusNode,
    required this.onChanged,
    required this.onFocusChange,
    required this.highlightColor,
    required this.isDisabled,
    required this.isRangeSelected,
    required this.isSelectedDayStart,
    required this.isSelectedDayEnd,
    required this.isInRange,
    required this.isOneDayRange,
    required this.isToday,
  });

  final Jalali day;

  final FocusNode focusNode;

  final ValueChanged<Jalali> onChanged;

  final ValueChanged<bool> onFocusChange;

  final Color highlightColor;

  final bool isDisabled;

  final bool isRangeSelected;

  final bool isSelectedDayStart;

  final bool isSelectedDayEnd;

  final bool isInRange;

  final bool isOneDayRange;

  final bool isToday;

  @override
  State<_DayItem> createState() => _DayItemState();
}

class _DayItemState extends State<_DayItem> {
  final WidgetStatesController _statesController = WidgetStatesController();

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);
    final DatePickerThemeData defaults = DatePickerTheme.defaults(context);
    final TextDirection textDirection = Directionality.of(context);
    final Color highlightColor = widget.highlightColor;

    BoxDecoration? decoration;
    TextStyle? itemStyle = textTheme.bodyMedium;

    T? effectiveValue<T>(T? Function(DatePickerThemeData? theme) getProperty) {
      return getProperty(datePickerTheme) ?? getProperty(defaults);
    }

    T? resolve<T>(WidgetStateProperty<T>? Function(DatePickerThemeData? theme) getProperty, Set<WidgetState> states) {
      return effectiveValue(
        (DatePickerThemeData? theme) {
          return getProperty(theme)?.resolve(states);
        },
      );
    }

    final Set<WidgetState> states = <WidgetState>{
      if (widget.isDisabled) WidgetState.disabled,
      if (widget.isSelectedDayStart || widget.isSelectedDayEnd) WidgetState.selected,
    };

    _statesController.value = states;

    final Color? dayForegroundColor = resolve<Color?>((DatePickerThemeData? theme) => theme?.dayForegroundColor, states);
    final Color? dayBackgroundColor = resolve<Color?>((DatePickerThemeData? theme) => theme?.dayBackgroundColor, states);
    final WidgetStateProperty<Color?> dayOverlayColor = WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) => effectiveValue(
          (DatePickerThemeData? theme) => widget.isInRange ? theme?.rangeSelectionOverlayColor?.resolve(states) : theme?.dayOverlayColor?.resolve(states),
        ));

    _HighlightPainter? highlightPainter;

    if (widget.isSelectedDayStart || widget.isSelectedDayEnd) {
      itemStyle = textTheme.bodyMedium?.apply(color: dayForegroundColor);
      decoration = BoxDecoration(
        color: dayBackgroundColor,
        shape: BoxShape.circle,
      );

      if (widget.isRangeSelected && !widget.isOneDayRange) {
        final _HighlightPainterStyle style = widget.isSelectedDayStart ? _HighlightPainterStyle.highlightTrailing : _HighlightPainterStyle.highlightLeading;
        highlightPainter = _HighlightPainter(
          color: highlightColor,
          style: style,
          textDirection: textDirection,
        );
      }
    } else if (widget.isInRange) {
      highlightPainter = _HighlightPainter(
        color: highlightColor,
        style: _HighlightPainterStyle.highlightAll,
        textDirection: textDirection,
      );
    } else if (widget.isDisabled) {
      itemStyle = textTheme.bodyMedium?.apply(color: colorScheme.onSurface.withValues(alpha: 0.38));
    } else if (widget.isToday) {
      itemStyle = textTheme.bodyMedium?.apply(color: colorScheme.primary);
      decoration = BoxDecoration(
        border: Border.all(color: colorScheme.primary),
        shape: BoxShape.circle,
      );
    }

    final String dayText = localizations.formatDecimal(widget.day.day);

    final String semanticLabelSuffix = widget.isToday ? ', ${localizations.currentDateLabel}' : '';
    String semanticLabel = '$dayText, ${localizations.formatFullDate(widget.day.toDateTime())}$semanticLabelSuffix';
    if (widget.isSelectedDayStart) {
      semanticLabel = localizations.dateRangeStartDateSemanticLabel(semanticLabel);
    } else if (widget.isSelectedDayEnd) {
      semanticLabel = localizations.dateRangeEndDateSemanticLabel(semanticLabel);
    }

    Widget dayWidget = Container(
      decoration: decoration,
      alignment: Alignment.center,
      child: Semantics(
        label: semanticLabel,
        selected: widget.isSelectedDayStart || widget.isSelectedDayEnd,
        child: ExcludeSemantics(
          child: Text(dayText, style: itemStyle),
        ),
      ),
    );

    if (highlightPainter != null) {
      dayWidget = CustomPaint(
        painter: highlightPainter,
        child: dayWidget,
      );
    }

    if (!widget.isDisabled) {
      dayWidget = InkResponse(
        focusNode: widget.focusNode,
        onTap: () => widget.onChanged(widget.day),
        radius: _monthItemRowHeight / 2 + 4,
        statesController: _statesController,
        overlayColor: dayOverlayColor,
        onFocusChange: widget.onFocusChange,
        child: dayWidget,
      );
    }

    return dayWidget;
  }
}

enum _HighlightPainterStyle {
  none,
  highlightLeading,
  highlightTrailing,
  highlightAll,
}

class _HighlightPainter extends CustomPainter {
  _HighlightPainter({
    required this.color,
    this.style = _HighlightPainterStyle.none,
    this.textDirection,
  });

  final Color color;
  final _HighlightPainterStyle style;
  final TextDirection? textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    if (style == _HighlightPainterStyle.none) {
      return;
    }

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final bool rtl = switch (textDirection) {
      TextDirection.rtl || null => true,
      TextDirection.ltr => false,
    };

    switch (style) {
      case _HighlightPainterStyle.highlightLeading when rtl:
      case _HighlightPainterStyle.highlightTrailing when !rtl:
        canvas.drawRect(Rect.fromLTWH(size.width / 2, 0, size.width / 2, size.height), paint);
      case _HighlightPainterStyle.highlightLeading:
      case _HighlightPainterStyle.highlightTrailing:
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width / 2, size.height), paint);
      case _HighlightPainterStyle.highlightAll:
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
      case _HighlightPainterStyle.none:
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _InputPersianDateRangePickerDialog extends StatelessWidget {
  const _InputPersianDateRangePickerDialog({
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.currentDate,
    required this.picker,
    required this.onConfirm,
    required this.onCancel,
    required this.confirmText,
    required this.cancelText,
    required this.helpText,
    required this.entryModeButton,
  });

  final Jalali? selectedStartDate;
  final Jalali? selectedEndDate;
  final Jalali? currentDate;
  final Widget picker;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String? confirmText;
  final String? cancelText;
  final String? helpText;
  final Widget? entryModeButton;

  String _formatDateRange(BuildContext context, Jalali? start, Jalali? end, Jalali now) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final String startText = _formatRangeStartDate(localizations, start, end);
    final String endText = _formatRangeEndDate(localizations, start, end, now);
    if (start == null || end == null) {
      return localizations.unspecifiedDateRange;
    }
    return switch (Directionality.of(context)) {
      TextDirection.rtl => '$endText – $startText',
      TextDirection.ltr => '$startText – $endText',
    };
  }

  @override
  Widget build(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final Orientation orientation = MediaQuery.orientationOf(context);
    final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);
    final DatePickerThemeData defaults = DatePickerTheme.defaults(context);

    TextStyle? headlineStyle = (orientation == Orientation.portrait) ? datePickerTheme.headerHeadlineStyle ?? defaults.headerHeadlineStyle : Theme.of(context).textTheme.headlineSmall;

    final Color? headerForegroundColor = datePickerTheme.headerForegroundColor ?? defaults.headerForegroundColor;
    headlineStyle = headlineStyle?.copyWith(color: headerForegroundColor);

    final String dateText = _formatDateRange(context, selectedStartDate, selectedEndDate, currentDate!);
    final String semanticDateText = selectedStartDate != null && selectedEndDate != null ? '${localizations.formatMediumDate(selectedStartDate!.toDateTime())} – ${localizations.formatMediumDate(selectedEndDate!.toDateTime())}' : '';

    final Widget header = _DatePickerHeader(
      helpText: helpText ?? (useMaterial3 ? localizations.dateRangePickerHelpText : localizations.dateRangePickerHelpText.toUpperCase()),
      titleText: dateText,
      titleSemanticsLabel: semanticDateText,
      titleStyle: headlineStyle,
      orientation: orientation,
      isShort: orientation == Orientation.landscape,
      entryModeButton: entryModeButton,
    );

    final Widget actions = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 52.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: OverflowBar(
            spacing: 8,
            children: <Widget>[
              TextButton(
                onPressed: onCancel,
                child: Text(cancelText ?? (useMaterial3 ? localizations.cancelButtonLabel : localizations.cancelButtonLabel.toUpperCase())),
              ),
              TextButton(
                onPressed: onConfirm,
                child: Text(confirmText ?? localizations.okButtonLabel),
              ),
            ],
          ),
        ),
      ),
    );

    const double fontSizeToScale = 14.0;
    final double textScaleFactor = MediaQuery.textScalerOf(context).clamp(maxScaleFactor: _kMaxTextScaleFactor).scale(fontSizeToScale) / fontSizeToScale;
    final Size dialogSize = (useMaterial3 ? _inputPortraitDialogSizeM3 : _inputPortraitDialogSizeM2) * textScaleFactor;
    switch (orientation) {
      case Orientation.portrait:
        return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          final Size portraitDialogSize = useMaterial3 ? _inputPortraitDialogSizeM3 : _inputPortraitDialogSizeM2;
          final bool isFullyPortrait = constraints.maxHeight >= math.min(dialogSize.height, portraitDialogSize.height);

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              header,
              if (isFullyPortrait) ...<Widget>[
                Expanded(child: picker),
                actions,
              ],
            ],
          );
        });

      case Orientation.landscape:
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            header,
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(child: picker),
                  actions,
                ],
              ),
            ),
          ],
        );
    }
  }
}

class _InputDateRangePicker extends StatefulWidget {
  _InputDateRangePicker({
    super.key,
    Jalali? initialStartDate,
    Jalali? initialEndDate,
    required Jalali firstDate,
    required Jalali lastDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    this.helpText,
    this.errorFormatText,
    this.errorInvalidText,
    this.errorInvalidRangeText,
    this.fieldStartHintText,
    this.fieldEndHintText,
    this.fieldStartLabelText,
    this.fieldEndLabelText,
    this.autofocus = false,
    this.autovalidate = false,
    this.keyboardType = TextInputType.datetime,
  })  : initialStartDate = initialStartDate == null ? null : PersianDateUtils.dateOnly(initialStartDate),
        initialEndDate = initialEndDate == null ? null : PersianDateUtils.dateOnly(initialEndDate),
        firstDate = PersianDateUtils.dateOnly(firstDate),
        lastDate = PersianDateUtils.dateOnly(lastDate);

  final Jalali? initialStartDate;

  final Jalali? initialEndDate;

  final Jalali firstDate;

  final Jalali lastDate;

  final ValueChanged<Jalali?>? onStartDateChanged;

  final ValueChanged<Jalali?>? onEndDateChanged;

  final String? helpText;

  final String? errorFormatText;

  final String? errorInvalidText;

  final String? errorInvalidRangeText;

  final String? fieldStartHintText;

  final String? fieldEndHintText;

  final String? fieldStartLabelText;

  final String? fieldEndLabelText;

  final bool autofocus;

  final bool autovalidate;

  final TextInputType keyboardType;

  @override
  _InputDateRangePickerState createState() => _InputDateRangePickerState();
}

class _InputDateRangePickerState extends State<_InputDateRangePicker> {
  late String _startInputText;
  late String _endInputText;
  Jalali? _startDate;
  Jalali? _endDate;
  late TextEditingController _startController;
  late TextEditingController _endController;
  String? _startErrorText;
  String? _endErrorText;
  bool _autoSelected = false;

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialStartDate;
    _startController = TextEditingController();
    _endDate = widget.initialEndDate;
    _endController = TextEditingController();
  }

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    if (_startDate != null) {
      _startInputText = localizations.formatCompactDate(_startDate!.toDateTime());
      final bool selectText = widget.autofocus && !_autoSelected;
      _updateController(_startController, _startInputText, selectText);
      _autoSelected = selectText;
    }

    if (_endDate != null) {
      _endInputText = localizations.formatCompactDate(_endDate!.toDateTime());
      _updateController(_endController, _endInputText, false);
    }
  }

  bool validate() {
    String? startError = _validateDate(_startDate);
    final String? endError = _validateDate(_endDate);
    if (startError == null && endError == null) {
      if (_startDate!.isAfter(_endDate!)) {
        startError = widget.errorInvalidRangeText ?? MaterialLocalizations.of(context).invalidDateRangeLabel;
      }
    }
    setState(() {
      _startErrorText = startError;
      _endErrorText = endError;
    });
    return startError == null && endError == null;
  }

  Jalali? _parseDate(String? text) {
    return text == null ? null : parseCompactJalaliDate(text);
  }

  String? _validateDate(Jalali? date) {
    if (date == null) {
      return widget.errorFormatText ?? MaterialLocalizations.of(context).invalidDateFormatLabel;
    } else if (date.isBefore(widget.firstDate) || date.isAfter(widget.lastDate)) {
      return widget.errorInvalidText ?? MaterialLocalizations.of(context).dateOutOfRangeLabel;
    }
    return null;
  }

  void _updateController(TextEditingController controller, String text, bool selectText) {
    TextEditingValue textEditingValue = controller.value.copyWith(text: text);
    if (selectText) {
      textEditingValue = textEditingValue.copyWith(
          selection: TextSelection(
        baseOffset: 0,
        extentOffset: text.length,
      ));
    }
    controller.value = textEditingValue;
  }

  void _handleStartChanged(String text) {
    setState(() {
      _startInputText = text;
      _startDate = _parseDate(text);
      widget.onStartDateChanged?.call(_startDate);
    });
    if (widget.autovalidate) {
      validate();
    }
  }

  void _handleEndChanged(String text) {
    setState(() {
      _endInputText = text;
      _endDate = _parseDate(text);
      widget.onEndDateChanged?.call(_endDate);
    });
    if (widget.autovalidate) {
      validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final InputDecorationTheme inputTheme = theme.inputDecorationTheme;
    final InputBorder inputBorder = inputTheme.border ?? (useMaterial3 ? const OutlineInputBorder() : const UnderlineInputBorder());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _startController,
            decoration: InputDecoration(
              border: inputBorder,
              filled: inputTheme.filled,
              hintText: widget.fieldStartHintText ?? localizations.dateHelpText,
              labelText: widget.fieldStartLabelText ?? localizations.dateRangeStartLabel,
              errorText: _startErrorText,
            ),
            keyboardType: widget.keyboardType,
            onChanged: _handleStartChanged,
            autofocus: widget.autofocus,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _endController,
            decoration: InputDecoration(
              border: inputBorder,
              filled: inputTheme.filled,
              hintText: widget.fieldEndHintText ?? localizations.dateHelpText,
              labelText: widget.fieldEndLabelText ?? localizations.dateRangeEndLabel,
              errorText: _endErrorText,
            ),
            keyboardType: widget.keyboardType,
            onChanged: _handleEndChanged,
          ),
        ),
      ],
    );
  }
}
