import 'package:flutter/material.dart';
import 'package:u/utils/shamsi_date/shamsi_date.dart';

import 'date.dart';

class PersianInputDatePickerFormField extends StatefulWidget {
  PersianInputDatePickerFormField({
    super.key,
    Jalali? initialDate,
    required Jalali firstDate,
    required Jalali lastDate,
    this.onDateSubmitted,
    this.onDateSaved,
    this.selectableDayPredicate,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
    this.keyboardType,
    this.autofocus = false,
    this.acceptEmptyDate = false,
    this.focusNode,
  })  : initialDate = initialDate != null ? PersianDateUtils.dateOnly(initialDate) : null,
        firstDate = PersianDateUtils.dateOnly(firstDate),
        lastDate = PersianDateUtils.dateOnly(lastDate) {
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
      'Provided initialDate ${this.initialDate} must satisfy provided selectableDayPredicate.',
    );
  }

  final Jalali? initialDate;

  final Jalali firstDate;

  final Jalali lastDate;

  final ValueChanged<Jalali>? onDateSubmitted;

  final ValueChanged<Jalali>? onDateSaved;

  final PersianSelectableDayPredicate? selectableDayPredicate;

  final String? errorFormatText;

  final String? errorInvalidText;

  final String? fieldHintText;

  final String? fieldLabelText;

  final TextInputType? keyboardType;

  final bool autofocus;

  final bool acceptEmptyDate;

  final FocusNode? focusNode;

  @override
  State<PersianInputDatePickerFormField> createState() => _InputDatePickerFormFieldState();
}

class _InputDatePickerFormFieldState extends State<PersianInputDatePickerFormField> {
  final TextEditingController _controller = TextEditingController();
  Jalali? _selectedDate;
  String? _inputText;
  bool _autoSelected = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateValueForSelectedDate();
  }

  @override
  void didUpdateWidget(PersianInputDatePickerFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDate != oldWidget.initialDate) {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        setState(() {
          _selectedDate = widget.initialDate;
          _updateValueForSelectedDate();
        });
      }, debugLabel: 'PersianInputDatePickerFormField.update');
    }
  }

  void _updateValueForSelectedDate() {
    if (_selectedDate != null) {
      final MaterialLocalizations localizations = MaterialLocalizations.of(context);
      _inputText = localizations.formatCompactDate(_selectedDate!.toDateTime());
      TextEditingValue textEditingValue = TextEditingValue(text: _inputText!);
      if (widget.autofocus && !_autoSelected) {
        textEditingValue = textEditingValue.copyWith(
            selection: TextSelection(
          baseOffset: 0,
          extentOffset: _inputText!.length,
        ));
        _autoSelected = true;
      }
      _controller.value = textEditingValue;
    } else {
      _inputText = '';
      _controller.value = TextEditingValue(text: _inputText!);
    }
  }

  Jalali? _parseDate(String? text) {
    return text == null ? null : parseCompactJalaliDate(text);
  }

  bool _isValidAcceptableDate(Jalali? date) {
    return date != null && !date.isBefore(widget.firstDate) && !date.isAfter(widget.lastDate) && (widget.selectableDayPredicate == null || widget.selectableDayPredicate!(date));
  }

  String? _validateDate(String? text) {
    if ((text == null || text.isEmpty) && widget.acceptEmptyDate) {
      return null;
    }
    final Jalali? date = _parseDate(text);
    if (date == null) {
      return widget.errorFormatText ?? MaterialLocalizations.of(context).invalidDateFormatLabel;
    } else if (!_isValidAcceptableDate(date)) {
      return widget.errorInvalidText ?? MaterialLocalizations.of(context).dateOutOfRangeLabel;
    }
    return null;
  }

  void _updateDate(String? text, ValueChanged<Jalali>? callback) {
    final Jalali? date = _parseDate(text);
    if (_isValidAcceptableDate(date)) {
      _selectedDate = date;
      _inputText = text;
      callback?.call(_selectedDate!);
    }
  }

  void _handleSaved(String? text) {
    _updateDate(text, widget.onDateSaved);
  }

  void _handleSubmitted(String text) {
    _updateDate(text, widget.onDateSubmitted);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final DatePickerThemeData datePickerTheme = theme.datePickerTheme;
    final InputDecorationTheme inputTheme = theme.inputDecorationTheme;
    final InputBorder effectiveInputBorder = datePickerTheme.inputDecorationTheme?.border ?? theme.inputDecorationTheme.border ?? (useMaterial3 ? const OutlineInputBorder() : const UnderlineInputBorder());

    return Semantics(
      container: true,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.fieldHintText ?? localizations.dateHelpText,
          labelText: widget.fieldLabelText ?? localizations.dateInputLabel,
        ).applyDefaults(
          inputTheme.merge(datePickerTheme.inputDecorationTheme).copyWith(border: effectiveInputBorder),
        ),
        validator: _validateDate,
        keyboardType: widget.keyboardType ?? TextInputType.datetime,
        onSaved: _handleSaved,
        onFieldSubmitted: _handleSubmitted,
        autofocus: widget.autofocus,
        controller: _controller,
        focusNode: widget.focusNode,
      ),
    );
  }
}
