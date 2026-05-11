import "package:u/utilities.dart";

class UCreditCard extends StatefulWidget {
  const UCreditCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.onCreditCardModelChange,
    required this.formKey,
    this.obscureCvv = false,
    this.obscureNumber = false,
    this.inputConfiguration = const InputConfiguration(),
    this.cardNumberKey,
    this.cardHolderKey,
    this.expiryDateKey,
    this.cvvCodeKey,
    this.cvvValidationMessage = "Please input a valid CVV",
    this.dateValidationMessage = "Please input a valid date",
    this.numberValidationMessage = "Please input a valid number",
    this.isHolderNameVisible = true,
    this.isCardNumberVisible = true,
    this.isExpiryDateVisible = true,
    this.enableCvv = true,
    this.autoValidateMode,
    this.cardNumberValidator,
    this.expiryDateValidator,
    this.cvvValidator,
    this.cardHolderValidator,
    this.onFormComplete,
    this.disableCardNumberAutoFillHints = false,
    this.isCardHolderNameUpperCase = false,
    super.key,
  });

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final String cvvValidationMessage;
  final String dateValidationMessage;
  final String numberValidationMessage;
  final Function(CreditCardModel) onCreditCardModelChange;
  final bool obscureCvv;
  final bool obscureNumber;
  final bool isHolderNameVisible;
  final bool isCardNumberVisible;
  final bool enableCvv;
  final bool isExpiryDateVisible;
  final GlobalKey<FormState> formKey;
  final Function? onFormComplete;
  final GlobalKey<FormFieldState<String>>? cardNumberKey;
  final GlobalKey<FormFieldState<String>>? cardHolderKey;
  final GlobalKey<FormFieldState<String>>? expiryDateKey;
  final GlobalKey<FormFieldState<String>>? cvvCodeKey;
  final InputConfiguration inputConfiguration;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? cardNumberValidator;
  final String? Function(String?)? expiryDateValidator;
  final String? Function(String?)? cvvValidator;
  final String? Function(String?)? cardHolderValidator;
  final bool disableCardNumberAutoFillHints;
  final bool isCardHolderNameUpperCase;

  @override
  State<UCreditCard> createState() => _UCreditCardState();
}

class _UCreditCardState extends State<UCreditCard> {
  @override
  Widget build(BuildContext context) => CreditCardForm(
    formKey: widget.formKey,
    cardNumber: widget.cardNumber,
    expiryDate: widget.expiryDate,
    cardHolderName: widget.cardHolderName,
    cvvCode: widget.cvvCode,
    cardNumberKey: widget.cardNumberKey,
    cvvCodeKey: widget.cvvCodeKey,
    expiryDateKey: widget.expiryDateKey,
    cardHolderKey: widget.cardHolderKey,
    onCreditCardModelChange: widget.onCreditCardModelChange,
    obscureCvv: widget.obscureCvv,
    obscureNumber: widget.obscureNumber,
    isHolderNameVisible: widget.isHolderNameVisible,
    isCardNumberVisible: widget.isCardNumberVisible,
    isExpiryDateVisible: widget.isExpiryDateVisible,
    enableCvv: widget.enableCvv,
    cvvValidationMessage: widget.cvvValidationMessage,
    dateValidationMessage: widget.dateValidationMessage,
    numberValidationMessage: widget.numberValidationMessage,
    cardNumberValidator: widget.cardNumberValidator,
    expiryDateValidator: widget.expiryDateValidator,
    cvvValidator: widget.cvvValidator,
    cardHolderValidator: widget.cardHolderValidator,
    isCardHolderNameUpperCase: widget.isCardHolderNameUpperCase,
    onFormComplete: widget.onFormComplete,
    autovalidateMode: widget.autoValidateMode,
    disableCardNumberAutoFillHints: widget.disableCardNumberAutoFillHints,
    inputConfiguration: widget.inputConfiguration,
  );
}
