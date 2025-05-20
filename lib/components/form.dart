import 'package:u/components/persian_date_picker.dart';
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
              await UNavigator.bottomSheet(
                  Column(
                    children: <Widget>[
                      JalaliDatePickerDialog(
                        initialDate: Jalali.now(),
                        onDateSelected: (DateTime d, Jalali j) => jalali = j,
                      ),
                      Row(
                        children: <Widget>[
                          UElevatedButton(
                            title: widget.submitButtonText,
                            onTap: () {
                              setState(() {});
                              widget.onChange(jalali.toDateTime(), jalali);
                              UNavigator.back();
                            },
                          ).expanded(),
                          const SizedBox(width: 12),
                          UElevatedButton(
                            title: widget.cancelButtonText,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            onTap: () => UNavigator.back(),
                          ).expanded(),
                        ],
                      ).pOnly(top: 24, bottom: 12),
                    ],
                  ), onDismiss: () async {
                if (widget.time) {
                  final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(hour: 0, minute: 0),
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
