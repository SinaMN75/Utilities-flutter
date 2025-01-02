import 'package:u/utilities.dart';

class CreditCardExpirationDateFormatter extends MaskedInputFormatter {
  CreditCardExpirationDateFormatter() : super('00/00');

  @override
  FormattedValue applyMask(String text) {
    var fv = super.applyMask(text);
    var result = fv.toString();
    var numericString = toNumericString(
      result,
      allowAllZeroes: true,
    );
    var numAddedLeadingSymbols = 0;
    String? amendedMonth;
    if (numericString.isNotEmpty) {
      var allDigits = numericString.split('');
      var stringBuffer = StringBuffer();
      var firstDigit = int.parse(allDigits[0]);

      if (firstDigit > 1) {
        stringBuffer.write('0');
        stringBuffer.write(firstDigit);
        amendedMonth = stringBuffer.toString();
        numAddedLeadingSymbols = 1;
      } else if (firstDigit == 1) {
        if (allDigits.length > 1) {
          stringBuffer.write(firstDigit);
          var secondDigit = int.parse(allDigits[1]);
          if (secondDigit > 2) {
            stringBuffer.write(2);
          } else {
            stringBuffer.write(secondDigit);
          }
          amendedMonth = stringBuffer.toString();
        }
      }
    }
    if (amendedMonth != null) {
      if (result.length < amendedMonth.length) {
        result = amendedMonth;
      } else {
        var sub = result.substring(2, result.length);
        result = '$amendedMonth$sub';
      }
    }
    fv = super.applyMask(result);

    /// a little hack to be able to move caret by one
    /// symbol to the right if a leading zero was added automatically
    for (var i = 0; i < numAddedLeadingSymbols; i++) {
      fv.increaseNumberOfLeadingSymbols();
    }
    return fv;
  }
}
