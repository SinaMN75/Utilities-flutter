part of 'components.dart';

enum ButtonType { elevated, text, outlined }

Widget textField({
  final String? text,
  final String? labelText,
  final String? hintText,
  final EdgeInsetsGeometry? contentPadding,
  final double? fontSize,
  final TextEditingController? controller,
  final TextInputType? keyboardType = TextInputType.text,
  final bool obscureText = false,
  final int lines = 1,
  final VoidCallback? onTap,
  final bool hasClearButton = false,
  final bool required = false,
  final bool isDense = false,
  final String? Function(String?)? validator,
  final Widget? prefix,
  final Widget? suffix,
  final Function(String? value)? onSave,
  final TextAlign textAlign = TextAlign.start,
  final String? initialValue,
  final bool? readOnly,
  final double? textHeight,
  final ValueChanged<String>? onChanged,
  final ValueChanged<String>? onFieldSubmitted,
  final int? maxLength,
  final List<TextInputFormatter>? formatters,
  final List<String>? autoFillHints,
}) {
  bool obscure = obscureText;
  return StatefulBuilder(
    builder: (final BuildContext context, final StateSetter setState) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (text != null)
          UIconTextHorizontal(
            leading: Text(text, style: Theme.of(context).textTheme.titleSmall),
            trailing: required ? const Text("*").bodyMedium(color: Theme.of(context).colorScheme.error) : const SizedBox(),
          ).paddingSymmetric(vertical: 8),
        TextFormField(
          autofillHints: autoFillHints,
          textDirection: keyboardType == TextInputType.number ? TextDirection.ltr : null,
          inputFormatters: formatters,
          style: TextStyle(fontSize: fontSize),
          maxLength: maxLength,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          initialValue: initialValue,
          textAlign: textAlign,
          onSaved: onSave,
          onTap: onTap,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscure,
          validator: validator,
          minLines: lines,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: lines == 1 ? 1 : 20,
          decoration: InputDecoration(
            labelText: labelText,
            isDense: isDense,
            helperStyle: const TextStyle(fontSize: 0),
            hintText: hintText,
            contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(10, 0, 10, 0),
            suffixIcon: obscureText
                ? IconButton(
                    splashRadius: 1,
                    onPressed: () => setState(() => obscure = !obscure),
                    icon: obscure ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                  )
                : suffix,
            prefixIcon: prefix,
          ),
        ),
      ],
    ),
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
  return textField(
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
        if (text != null) Text(text, style: Theme.of(navigatorKey.currentContext!).textTheme.titleSmall).paddingSymmetric(vertical: 8),
        TypeAheadField<T>(
          hideKeyboardOnDrag: hideKeyboard,
          suggestionsCallback: suggestionsCallback,
          builder: (final BuildContext _, final TextEditingController __, final FocusNode ___) => textField(
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
      borderColor: Theme.of(navigatorKey.currentContext!).colorScheme.onSurface.withOpacity(0.2),
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
