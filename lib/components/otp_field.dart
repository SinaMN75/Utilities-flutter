import 'package:u/utilities.dart';

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
          selectedColor: borderColor,
          activeColor: borderColor,
        ),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        onCompleted: onCompleted,
        onChanged: (final _) {},
      ).ltr();
}