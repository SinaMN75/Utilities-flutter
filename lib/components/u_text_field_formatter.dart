import "package:flutter/services.dart";

class UCurrencyInputFormatter extends TextInputFormatter {
  final String thousandSeparator;
  final String decimalSeparator;
  final int maxDigits;

  UCurrencyInputFormatter({
    this.thousandSeparator = ",",
    this.decimalSeparator = ".",
    this.maxDigits = 12,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final String cleanedText = newValue.text.replaceAll(RegExp(r"[^\d.]"), "");

    final List<String> parts = cleanedText.split(".");
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : "";

    if (integerPart.length > maxDigits) {
      integerPart = integerPart.substring(0, maxDigits);
    }

    String formattedInteger = "";
    int count = 0;

    for (int i = integerPart.length - 1; i >= 0; i--) {
      formattedInteger = integerPart[i] + formattedInteger;
      count++;
      if (count == 3 && i > 0) {
        formattedInteger = thousandSeparator + formattedInteger;
        count = 0;
      }
    }

    String finalText = formattedInteger;
    if (decimalPart.isNotEmpty) {
      if (decimalPart.length > 2) {
        decimalPart = decimalPart.substring(0, 2);
      }
      finalText = "$formattedInteger$decimalSeparator$decimalPart";
    }

    int cursorPosition = finalText.length;
    if (oldValue.text.isNotEmpty && newValue.text.isNotEmpty) {
      final int oldNumericCount = oldValue.text.replaceAll(RegExp(r"[^\d]"), "").length;
      final int newNumericCount = newValue.text.replaceAll(RegExp(r"[^\d]"), "").length;

      if (newNumericCount > oldNumericCount) {
        cursorPosition = finalText.length;
      } else if (newNumericCount < oldNumericCount) {
        cursorPosition = newValue.selection.baseOffset;
      }
    }

    return TextEditingValue(
      text: finalText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
