part of 'components.dart';

enum ButtonType { elevated, text, outlined }

Widget textField({
  final String? text,
  final String? labelText,
  final double? fontSize,
  final TextEditingController? controller,
  final TextInputType? keyboardType = TextInputType.text,
  final String? hintText,
  final bool obscureText = false,
  final int lines = 1,
  final VoidCallback? onTap,
  final bool hasClearButton = false,
  final bool required = false,
  final String? Function(String?)? validator,
  final Widget? prefix,
  final Widget? suffix,
  final Function(String? value)? onSave,
  final EdgeInsets margin = EdgeInsets.zero,
  final TextAlign textAlign = TextAlign.start,
  final String? initialValue,
  final bool? readOnly,
  final double? textHeight,
  final EdgeInsetsGeometry? contentPadding,
  final ValueChanged<String>? onChanged,
  final ValueChanged<String>? onFieldSubmitted,
  final int? maxLength,
  final List<TextInputFormatter>? formatters,
  final List<String>? autoFillHints,
}) {
  bool obscure = obscureText;
  return StatefulBuilder(
    builder: (final BuildContext context, final StateSetter setState) => column(
      margin: margin,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (text != null)
          iconTextHorizontal(
            leading: Text(text, style: textTheme.titleSmall),
            trailing: required ? Text("*").bodyMedium(color: context.theme.colorScheme.error) : SizedBox(),
          ).paddingSymmetric(vertical: 8),
        TextFormField(
          autofillHints: autoFillHints,
          textDirection: keyboardType == TextInputType.number ? TextDirection.ltr : TextDirection.rtl,
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
  final int lines = 1,
  final Widget? prefix,
  final Widget? suffix,
  final EdgeInsets margin = EdgeInsets.zero,
  final TextAlign textAlign = TextAlign.start,
  final double? textHeight,
  final TextEditingController? controller,
}) {
  final Rx<Jalali> jalali = Jalali.now().obs;
  return textField(
    controller: controller,
    margin: margin,
    text: text,
    fontSize: fontSize,
    hintText: hintText,
    textAlign: textAlign,
    readOnly: true,
    textHeight: textHeight,
    onTap: () async {
      jalali(
        await showPersianDatePicker(
          context: context,
          initialDate: jalali.value,
          firstDate: Jalali(1320),
          lastDate: Jalali(1405),
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
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(backgroundColor), padding: MaterialStateProperty.all(padding)),
            onPressed: onTap,
            child: SizedBox(
              height: 20,
              width: width ?? context.width,
              child: Center(
                child: titleWidget ?? Text(title ?? '', textAlign: TextAlign.center).fit(),
              ),
            ),
          );
        else if (buttonState.value == PageState.loading)
          return const CircularProgressIndicator().alignAtCenter();
        else if (buttonState.value == PageState.paging)
          return SlideCountdown(
            separatorStyle: TextStyle(color: context.theme.colorScheme.onBackground),
            decoration: const BoxDecoration(),
            textStyle: context.theme.textTheme.bodyMedium!,
            duration: Duration(seconds: countDownSeconds),
            onDone: () => buttonState(PageState.initial),
          ).alignAtCenter();
        else
          return const SizedBox();
      },
    );
  if (buttonType == ButtonType.outlined)
    return OutlinedButton(
      onPressed: onTap,
      child: SizedBox(
        height: 20,
        width: width ?? context.width,
        child: Text(title ?? '', textAlign: TextAlign.center),
      ).fit(),
    );
  if (buttonType == ButtonType.text)
    return TextButton(
      onPressed: onTap,
      child: SizedBox(
        height: 20,
        width: width ?? context.width,
        child: Text(title ?? '', textAlign: TextAlign.center).bodyLarge(color: context.theme.colorScheme.secondary).fit(),
      ),
    );
  return const SizedBox();
}

Widget textFieldTypeAhead<T>({
  required final void Function(T) onSuggestionSelected,
  required final SuggestionsCallback<T> suggestionsCallback,
  final Widget Function(BuildContext context, T itemData)? itemBuilder,
  final String? text,
  final String? hint,
  final Widget? prefix,
  final VoidCallback? onTap,
  final Color? fillColor,
  final TextEditingController? controller,
  final bool hideKeyboard = false,
  final Function(String)? onChanged,
}) =>
    column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (text != null) Text(text, style: textTheme.titleSmall).paddingSymmetric(vertical: 8),
        TypeAheadField<T>(
          textFieldConfiguration: TextFieldConfiguration(
            onTap: () {
              if (controller!.selection == TextSelection.fromPosition(TextPosition(offset: controller.text.length - 1)))
                controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length),
                );
            },
            controller: controller,
            onChanged: onChanged,
            scrollPadding: const EdgeInsets.symmetric(vertical: 16),
            decoration: InputDecoration(prefixIcon: prefix?.paddingOnly(left: 8, right: 12), fillColor: fillColor, hintText: hint),
          ),
          hideKeyboard: hideKeyboard,
          suggestionsCallback: suggestionsCallback,
          itemBuilder: itemBuilder ??
                  (final BuildContext context, final Object? suggestion) => Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(suggestion.toString()),
              ),
          onSuggestionSelected: onSuggestionSelected,
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
    ).container(radius: 20, borderColor: context.theme.colorScheme.onBackground.withOpacity(0.2)).paddingSymmetric(horizontal: 20);
