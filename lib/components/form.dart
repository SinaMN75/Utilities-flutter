import 'package:u/utilities.dart';

class UTextField extends StatefulWidget {
  const UTextField({
    super.key,
    this.text,
    this.labelText,
    this.hintText,
    this.contentPadding,
    this.fontSize,
    this.controller,
    this.onTap,
    this.validator,
    this.prefix,
    this.suffix,
    this.onSave,
    this.initialValue,
    this.textHeight,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLength,
    this.formatters,
    this.autoFillHints,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.lines = 1,
    this.hasClearButton = false,
    this.required = false,
    this.isDense = false,
    this.textAlign = TextAlign.start,
  });

  final bool obscureText;
  final bool hasClearButton;
  final bool required;
  final bool isDense;
  final bool readOnly;
  final String? text;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final double? fontSize;
  final double? textHeight;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int lines;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String? value)? onSave;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? formatters;
  final List<String>? autoFillHints;

  @override
  State<UTextField> createState() => _UTextFieldState();
}

class _UTextFieldState extends State<UTextField> {
  bool obscure = false;

  @override
  void initState() {
    obscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.text != null)
            UIconTextHorizontal(
              leading: Text(widget.text!, style: Theme.of(context).textTheme.titleSmall),
              trailing: widget.required ? const Text("*").bodyMedium(color: Theme.of(context).colorScheme.error) : const SizedBox(),
            ).pSymmetric(vertical: 8),
          TextFormField(
            autofillHints: widget.autoFillHints,
            textDirection: widget.keyboardType == TextInputType.number ? TextDirection.ltr : null,
            inputFormatters: widget.formatters,
            style: TextStyle(fontSize: widget.fontSize),
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            initialValue: widget.initialValue,
            textAlign: widget.textAlign,
            onSaved: widget.onSave,
            onTap: widget.onTap,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: obscure,
            validator: widget.validator,
            minLines: widget.lines,
            onFieldSubmitted: widget.onFieldSubmitted,
            maxLines: widget.lines == 1 ? 1 : 20,
            decoration: InputDecoration(
              labelText: widget.labelText,
              isDense: widget.isDense,
              helperStyle: const TextStyle(fontSize: 0),
              hintText: widget.hintText,
              contentPadding: widget.contentPadding ?? const EdgeInsets.fromLTRB(10, 0, 10, 0),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      splashRadius: 1,
                      onPressed: () => setState(() => obscure = !obscure),
                      icon: obscure ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    )
                  : widget.suffix,
              prefixIcon: widget.prefix,
            ),
          ),
        ],
      );
}

class UTextFieldPersianDatePicker extends StatefulWidget {
  const UTextFieldPersianDatePicker({
    super.key,
    required this.onChange,
    this.text,
    this.fontSize,
    this.hintText,
    this.labelText,
    this.prefix,
    this.suffix,
    this.textHeight,
    this.controller,
    this.initialDate,
    this.startDate,
    this.endDate,
    this.validator,
    this.readOnly = false,
    this.date = true,
    this.time = false,
    this.submitButtonText = "Submit",
    this.cancelButtonText = "Cancel",
    this.textAlign = TextAlign.start,
  });

  final Function(DateTime, Jalali) onChange;
  final String? text;
  final double? fontSize;
  final String? hintText;
  final String? labelText;
  final Widget? prefix;
  final bool readOnly;
  final Widget? suffix;
  final TextAlign textAlign;
  final double? textHeight;
  final TextEditingController? controller;
  final Jalali? initialDate;
  final Jalali? startDate;
  final Jalali? endDate;
  final String submitButtonText;
  final String cancelButtonText;
  final String? Function(String?)? validator;
  final bool date;
  final bool time;

  @override
  State<UTextFieldPersianDatePicker> createState() => _UTextFieldPersianDatePickerState();
}

class _UTextFieldPersianDatePickerState extends State<UTextFieldPersianDatePicker> {
  late Jalali jalali;

  @override
  void initState() {
    jalali = (widget.initialDate ?? Jalali.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UTextField(
        controller: widget.controller,
        text: widget.text,
        prefix: widget.prefix,
        suffix: widget.suffix,
        labelText: widget.labelText,
        fontSize: widget.fontSize,
        hintText: widget.hintText,
        textAlign: widget.textAlign,
        readOnly: true,
        textHeight: widget.textHeight,
        validator: widget.validator,
        onTap: () async {
          if (!widget.readOnly) {
            if (widget.date) {
              UNavigator.bottomSheet(
                  child: Column(
                    children: [
                      LinearDatePicker(
                        startDate: "1330/01/01",
                        endDate: "1406/12/30",
                        initialDate: "${jalali.year}/${jalali.month}/${jalali.day}",
                        addLeadingZero: true,
                        dateChangeListener: (String selectedDate) {
                          jalali = Jalali(
                            selectedDate.getYear(),
                            selectedDate.getMonth(),
                            selectedDate.getDay(),
                          );
                        },
                        showDay: true,
                        yearText: "سال",
                        monthText: "ماه",
                        dayText: "روز",
                        showLabels: true,
                        columnWidth: 100,
                        showMonthName: true,
                        isJalaali: true,
                      ),
                      Row(
                        children: [
                          UElevatedButton(
                            title: widget.submitButtonText,
                            onTap: () {
                              setState(() {});
                              widget.onChange(jalali.toDateTime(), jalali);
                              UNavigator.back();
                            },
                          ).expanded(),
                          SizedBox(width: 12),
                          UElevatedButton(
                            title: widget.cancelButtonText,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            onTap: () => UNavigator.back(),
                          ).expanded(),
                        ],
                      ).pOnly(top: 24, bottom: 12),
                    ],
                  ),
                  onDismiss: () async {
                    if (widget.time) {
                      TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 0, minute: 0),
                      );
                      jalali = Jalali(
                        jalali.year,
                        jalali.month,
                        jalali.day,
                        timeOfDay!.hour,
                        timeOfDay.minute,
                      );
                      setState(() => jalali = jalali);
                      widget.onChange(jalali.toDateTime(), jalali);
                    }
                  });
            }
          }
        },
      );
}

class UElevatedButton extends StatelessWidget {
  const UElevatedButton({
    super.key,
    this.title,
    this.titleWidget,
    this.onTap,
    this.icon,
    this.width,
    this.height,
    this.textStyle,
    this.backgroundColor,
    this.padding,
  });

  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onTap;
  final IconData? icon;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          textStyle: textStyle == null ? null : WidgetStatePropertyAll<TextStyle>(textStyle!),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          padding: WidgetStateProperty.all(padding),
        ),
        onPressed: onTap,
        child: SizedBox(
          height: height,
          width: width ?? MediaQuery.sizeOf(navigatorKey.currentContext!).width,
          child: Center(child: titleWidget ?? Text(title ?? '', textAlign: TextAlign.center)),
        ),
      );
}

class UOutlinedButton extends StatelessWidget {
  const UOutlinedButton({
    super.key,
    this.title,
    this.titleWidget,
    this.onTap,
    this.icon,
    this.width,
    this.height,
    this.textStyle,
    this.padding,
  });

  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onTap;
  final IconData? icon;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: ButtonStyle(
          textStyle: textStyle == null ? null : WidgetStatePropertyAll<TextStyle>(textStyle!),
          padding: WidgetStateProperty.all(padding),
        ),
        onPressed: onTap,
        child: SizedBox(
          height: height,
          width: width ?? MediaQuery.sizeOf(navigatorKey.currentContext!).width,
          child: Center(child: titleWidget ?? Text(title ?? '', textAlign: TextAlign.center)),
        ),
      );
}

class UTextFieldTypeAhead<T> extends StatelessWidget {
  const UTextFieldTypeAhead({
    super.key,
    required this.onSuggestionSelected,
    required this.suggestionsCallback,
    this.itemBuilder,
    this.text,
    this.prefix,
    this.onTap,
    this.suffix,
    this.labelText,
    this.hintText,
    this.contentPadding,
    this.controller,
    this.validator,
    this.onChanged,
    this.isDense = false,
    this.hideKeyboard = false,
  });

  final void Function(T) onSuggestionSelected;
  final FutureOr<List<T>?> Function(String) suggestionsCallback;
  final Widget Function(BuildContext context, T itemData)? itemBuilder;
  final String? text;
  final Widget? prefix;
  final VoidCallback? onTap;
  final bool isDense;
  final Widget? suffix;
  final String? labelText;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final bool hideKeyboard;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TypeAheadField<T>(
            hideKeyboardOnDrag: hideKeyboard,
            suggestionsCallback: suggestionsCallback,
            builder: (final BuildContext _, final TextEditingController __, final FocusNode ___) => UTextField(
              onTap: onTap,
              validator: validator,
              prefix: prefix,
              isDense: isDense,
              contentPadding: contentPadding,
              onChanged: onChanged,
              text: text,
              hintText: hintText,
              labelText: labelText,
              suffix: suffix,
              controller: controller,
            ),
            itemBuilder: itemBuilder ??
                (final BuildContext context, final Object? suggestion) => Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Text(suggestion.toString()),
                    ),
            onSelected: onSuggestionSelected,
          ),
        ],
      );
}

class UOtpField extends StatelessWidget {
  const UOtpField({
    this.length = 4,
    this.autoFocus = false,
    this.controller,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.hintCharacter,
    this.onCompleted,
    this.borderRadius = 8,
    this.shape = PinCodeFieldShape.box,
    this.fieldOuterPadding,
    this.fieldHeight = 64,
    this.fieldWidth = 60,
    this.fillColor,
    this.borderColor,
    this.activeColor,
    this.cursorColor,
    this.onTap,
    this.validator,
    super.key,
  });

  final int length;
  final bool autoFocus;
  final TextEditingController? controller;
  final MainAxisAlignment mainAxisAlignment;
  final String? hintCharacter;
  final void Function(String)? onCompleted;
  final double borderRadius;
  final PinCodeFieldShape shape;
  final EdgeInsetsGeometry? fieldOuterPadding;
  final double fieldHeight;
  final double fieldWidth;
  final Color? fillColor;
  final Color? borderColor;
  final Color? activeColor;
  final Color? cursorColor;
  final Function? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) => PinCodeTextField(
        controller: controller,
        appContext: navigatorKey.currentContext!,
        length: length,
        cursorColor: cursorColor,
        onTap: onTap,
        autoFocus: autoFocus,
        mainAxisAlignment: mainAxisAlignment,
        hintCharacter: hintCharacter,
        validator: validator,
        pinTheme: PinTheme(
          shape: shape,
          fieldOuterPadding: fieldOuterPadding,
          borderRadius: BorderRadius.circular(borderRadius),
          fieldHeight: fieldHeight,
          fieldWidth: fieldWidth,
          activeFillColor: fillColor,
          inactiveFillColor: fillColor,
          selectedFillColor: fillColor,
          inactiveColor: borderColor,
          selectedColor: activeColor,
          activeColor: activeColor,
          borderWidth: 1,
          activeBorderWidth: 1,
          errorBorderWidth: 1,
          inactiveBorderWidth: 1,
          disabledBorderWidth: 1,
        ),
        enableActiveFill: true,
        backgroundColor: Colors.transparent,
        keyboardType: TextInputType.number,
        onCompleted: onCompleted,
        onChanged: (final _) {},
      ).ltr();
}

Widget radioListTile<T>({
  required final T value,
  required final T groupValue,
  required final String title,
  required final String subTitle,
  required final Function(T?)? onChanged,
  final bool toggleable = true,
}) =>
    RadioListTile<T>(
      toggleable: toggleable,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(title),
      subtitle: FittedBox(alignment: Alignment.centerRight, fit: BoxFit.scaleDown, child: Text(subTitle)),
      groupValue: groupValue,
      value: value,
      onChanged: onChanged,
    ).container(
      radius: 20,
      borderColor: Theme.of(navigatorKey.currentContext!).colorScheme.onSurface.withValues(alpha: 0.2),
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
