import 'package:utilities_framework_flutter/utilities.dart';
import 'package:utilities_framework_flutter/utilities2.dart';

enum ButtonType { elevated, text, outlined }

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
  Widget build(BuildContext context) => Column(
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

Widget textFieldPersianDatePicker({
  required final Function(DateTime, Jalali) onChange,
  final String? text,
  final double? fontSize,
  final String? hintText,
  final String? labelText,
  final int lines = 1,
  final Widget? prefix,
  final Widget? suffix,
  final TextAlign textAlign = TextAlign.start,
  final double? textHeight,
  final TextEditingController? controller,
  final Jalali? initialDate,
  final Jalali? startDate,
  final Jalali? endDate,
}) {
  final Rx<Jalali> jalali = (initialDate ?? Jalali.now()).obs;
  return UTextField(
    controller: controller,
    text: text,
    labelText: labelText,
    fontSize: fontSize,
    hintText: hintText,
    textAlign: textAlign,
    readOnly: true,
    textHeight: textHeight,
    onTap: () async {
      jalali(
        await showPersianDatePicker(
          context: navigatorKey.currentContext!,
          initialDate: jalali.value,
          firstDate: startDate ?? Jalali(1320),
          lastDate: endDate ?? Jalali(1405),
        ),
      );
      onChange(jalali.value.toDateTime(), jalali.value);
    },
  );
}

Widget button({
  final String? title,
  final Widget? titleWidget,
  final VoidCallback? onTap,
  final IconData? icon,
  final double? width,
  final double? height,
  final TextStyle? textStyle,
  final Color? backgroundColor,
  final ButtonType buttonType = ButtonType.elevated,
  final EdgeInsets? padding,
  final PageState state = PageState.initial,
  final int countDownSeconds = 120,
}) {
  final Rx<PageState> buttonState = state.obs;
  if (buttonType == ButtonType.elevated)
    return Obx(
      () {
        if (buttonState.value == PageState.initial)
          return ElevatedButton(
            style: ButtonStyle(
              textStyle: textStyle == null ? null : WidgetStatePropertyAll<TextStyle>(textStyle),
              backgroundColor: WidgetStateProperty.all(backgroundColor),
              padding: WidgetStateProperty.all(padding),
            ),
            onPressed: onTap,
            child: SizedBox(
              height: height ?? 20,
              width: width ?? MediaQuery.sizeOf(navigatorKey.currentContext!).width,
              child: Center(
                child: titleWidget ?? Text(title ?? '', textAlign: TextAlign.center),
              ),
            ),
          );
        else if (buttonState.value == PageState.loading)
          return const CircularProgressIndicator().alignAtCenter();
        else if (buttonState.value == PageState.paging)
          return SlideCountdown(
            separatorStyle: TextStyle(color: Theme.of(navigatorKey.currentContext!).colorScheme.onSurface),
            decoration: const BoxDecoration(),
            style: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium!,
            duration: Duration(seconds: countDownSeconds),
            onDone: () => buttonState(PageState.initial),
          ).alignAtCenter();
        else
          return const SizedBox();
      },
    );
  if (buttonType == ButtonType.outlined)
    return OutlinedButton(
      style: ButtonStyle(
        textStyle: textStyle == null ? null : WidgetStatePropertyAll<TextStyle>(textStyle),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        padding: WidgetStateProperty.all(padding),
      ),
      onPressed: onTap,
      child: SizedBox(
        height: height ?? 20,
        width: width ?? MediaQuery.sizeOf(navigatorKey.currentContext!).width,
        child: Center(
          child: titleWidget ?? Text(title ?? '', textAlign: TextAlign.center),
        ),
      ),
    );
  if (buttonType == ButtonType.text)
    return TextButton(
      style: ButtonStyle(
        textStyle: textStyle == null ? null : WidgetStatePropertyAll<TextStyle>(textStyle),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        padding: WidgetStateProperty.all(padding),
      ),
      onPressed: onTap,
      child: SizedBox(
        height: height ?? 20,
        width: width ?? MediaQuery.sizeOf(navigatorKey.currentContext!).width,
        child: Center(
          child: titleWidget ?? Text(title ?? '', textAlign: TextAlign.center),
        ),
      ),
    );
  return const SizedBox();
}

Widget textFieldTypeAhead<T>({
  required final void Function(T) onSuggestionSelected,
  required final FutureOr<List<T>?> Function(String) suggestionsCallback,
  final Widget Function(BuildContext context, T itemData)? itemBuilder,
  final String? text,
  final Widget? prefix,
  final VoidCallback? onTap,
  final bool isDense = false,
  final Widget? suffix,
  final String? labelText,
  final String? hintText,
  final EdgeInsetsGeometry? contentPadding,
  final TextEditingController? controller,
  final bool hideKeyboard = false,
  final String? Function(String?)? validator,
  final Function(String)? onChanged,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (text != null) Text(text, style: Theme.of(navigatorKey.currentContext!).textTheme.titleSmall).pSymmetric(vertical: 8),
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
