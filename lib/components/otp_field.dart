import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:utilities/utilities.dart';

Widget otpTextField({
  final int length = 4,
  final bool autoFocus = false,
  final TextEditingController? controller,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
  final String? hintCharacter,
  final void Function(String)? onCompleted,
  final double borderRadius = 8,
  final PinCodeFieldShape shape = PinCodeFieldShape.box,
  final EdgeInsetsGeometry? fieldOuterPadding,
  final double fieldHeight = 64,
  final double fieldWidth = 60,
  final Color? fillColor,
  final Color? borderColor,
  final Function? onTap,
}) =>
    PinCodeTextField(
      controller: controller,
      appContext: context,
      length: length,
      onTap: onTap,
      autoFocus: autoFocus,
      mainAxisAlignment: mainAxisAlignment,
      hintCharacter: hintCharacter,
      animationType: AnimationType.fade,
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
