import 'package:utilities_framework_flutter/utilities.dart';

class CreditCardCvcInputFormatter extends MaskedInputFormatter {
  CreditCardCvcInputFormatter({bool isAmericanExpress = false})
      : super(
          isAmericanExpress ? '0000' : '000',
        );
}
