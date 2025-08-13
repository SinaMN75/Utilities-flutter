import 'package:u/utilities.dart';

class CardSystem {
  static const String MIR = 'MIR';
  static const String UNION_PAY = 'UnionPay';
  static const String VISA = 'Visa';
  static const String MASTERCARD = 'Mastercard';
  static const String JCB = 'JCB';
  static const String DISCOVER = 'Discover';
  static const String MAESTRO = 'Maestro';
  static const String AMERICAN_EXPRESS = 'Amex';
  static const String DINERS_CLUB = 'DinersClub';
  static const String UZ_CARD = 'UzCard';
  static const String HUMO = 'HUMO';
}

class CreditCardNumberInputFormatter extends TextInputFormatter {
  CreditCardNumberInputFormatter({
    this.onCardSystemSelected,
    this.useSeparators = true,
  });
  final ValueChanged<CardSystemData?>? onCardSystemSelected;
  final bool useSeparators;

  CardSystemData? _cardSystemData;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final bool isErasing = newValue.text.length < oldValue.text.length;
    if (isErasing) {
      if (newValue.text.isEmpty) {
        _removeFirstLetter();
      }
    }
    final String onlyNumbers = toNumericString(
      newValue.text,
    );
    final String maskedValue = _applyMask(
      onlyNumbers,
    );
    if (maskedValue.length == oldValue.text.length) {
      return oldValue;
    }
    final int endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );
    final int selectionEnd = maskedValue.length - endOffset;
    return TextEditingValue(
      selection: TextSelection.collapsed(
        offset: selectionEnd,
      ),
      text: maskedValue,
    );
  }

  /// this is a small dirty hack to be able to remove the first character
  Future<void> _removeFirstLetter() async {
    await Future<void>.delayed(
      const Duration(
        milliseconds: 5,
      ),
    );
    _updateCardSystemData(null);
  }

  void _updateCardSystemData(
    CardSystemData? cardSystemData,
  ) {
    _cardSystemData = cardSystemData;
    if (onCardSystemSelected != null) {
      onCardSystemSelected!(_cardSystemData);
    }
  }

  String _applyMask(
    String numericString,
  ) {
    if (numericString.isEmpty) {
      _updateCardSystemData(null);
    } else {
      final CardSystemData? countryData = _CardSystemDatas.getCardSystemDataByNumber(
        numericString,
      );
      if (countryData != null) {
        _updateCardSystemData(
          countryData,
        );
      }
    }
    if (_cardSystemData != null) {
      return _formatByMask(numericString, _cardSystemData!.numberMask!);
    }
    return numericString;
  }
}

/// [useLuhnAlgo] validates the number using the Luhn algorithm
bool isCardNumberValid({
  required String cardNumber,
  bool checkLength = false,
  bool useLuhnAlgo = true,
}) {
  cardNumber = toNumericString(
    cardNumber,
    allowAllZeroes: true,
    allowHyphen: false,
  );
  if (cardNumber.isEmpty) {
    return false;
  }
  final CardSystemData? countryData = _CardSystemDatas.getCardSystemDataByNumber(cardNumber);
  if (countryData == null) {
    return false;
  }
  if (useLuhnAlgo) {
    final bool isLuhnOk = checkNumberByLuhn(number: cardNumber);
    if (!isLuhnOk) {
      return false;
    }
  }
  final String formatted = _formatByMask(cardNumber, countryData.numberMask!);
  final String reprocessed = toNumericString(formatted);
  return reprocessed == cardNumber && (checkLength == false || reprocessed.length == countryData.numDigits);
}

/// checks not only for a length and characters but also
/// for card system code. If it's not found the succession of numbers
/// will not be marked as a valid card number
@Deprecated('Use isCardNumberValid() instead')
bool isCardValidNumber(
  String cardNumber, {
  bool checkLength = false,
}) {
  return isCardNumberValid(
    cardNumber: cardNumber,
    checkLength: checkLength,
    useLuhnAlgo: false,
  );
}

String formatAsCardNumber(String cardNumber) {
  if (!isCardNumberValid(
    cardNumber: cardNumber,
  )) {
    return _formatByMask(cardNumber, '0000 0000 0000 0000');
  }
  cardNumber = toNumericString(
    cardNumber,
  );
  final CardSystemData cardSystemData = _CardSystemDatas.getCardSystemDataByNumber(cardNumber)!;
  return _formatByMask(cardNumber, cardSystemData.numberMask!);
}

CardSystemData? getCardSystemData(
  String cardNumber,
) {
  return _CardSystemDatas.getCardSystemDataByNumber(cardNumber);
}

String _formatByMask(
  String text,
  String mask,
) {
  final List<String> chars = text.split('');
  final List<String> result = <String>[];
  int index = 0;
  for (int i = 0; i < mask.length; i++) {
    if (index >= chars.length) {
      break;
    }
    final String curChar = chars[index];
    if (mask[i] == '0') {
      if (isDigit(curChar)) {
        result.add(curChar);
        index++;
      } else {
        break;
      }
    } else {
      result.add(mask[i]);
    }
  }
  return result.join();
}

class CardSystemData {

  CardSystemData._init({
    this.numberMask,
    this.system,
    this.systemCode,
    this.numDigits,
  });

  factory CardSystemData.fromMap(Map<dynamic, dynamic> value) {
    return CardSystemData._init(
      system: value['system'],
      systemCode: value['systemCode'],
      numDigits: value['numDigits'],
      numberMask: value['numberMask'],
    );
  }

  final String? system;
  final String? systemCode;
  final String? numberMask;
  final int? numDigits;

  @override
  String toString() {
    return '[CardSystemData(system: $system,' ' systemCode: $systemCode]';
  }
}

class _CardSystemDatas {
  static CardSystemData? getCardSystemDataByNumber(
    String cardNumber, {
    int? substringLength,
  }) {
    if (cardNumber.isEmpty) return null;
    substringLength = substringLength ?? cardNumber.length;

    if (substringLength < 1) return null;
    Map<dynamic, dynamic>? rawData;
    List<Map<dynamic, dynamic>> tempSystems = <Map<dynamic, dynamic>>[];
    for (Map<String, dynamic> data in _data) {
      final dynamic systemCode = data['systemCode'];
      if (cardNumber.startsWith(systemCode)) {
        tempSystems.add(data);
      }
    }
    if (tempSystems.isEmpty) {
      return null;
    }
    if (tempSystems.length == 1) {
      rawData = tempSystems.first;
    } else {
      tempSystems.sort((Map<dynamic, dynamic> a, Map<dynamic, dynamic> b) => b['systemCode'].compareTo(a['systemCode']));
      final int maxCodeLength = tempSystems.first['systemCode'].length;
      tempSystems = tempSystems
          .where(
            (Map<dynamic, dynamic> e) => e['systemCode'].length == maxCodeLength,
          )
          .toList();

      tempSystems.sort((Map<dynamic, dynamic> a, Map<dynamic, dynamic> b) => a['systemCode'].compareTo(b['systemCode']));
      for (Map<dynamic, dynamic> data in tempSystems) {
        final int numMaskDigits = data['numDigits']!;
        if (cardNumber.length <= numMaskDigits) {
          rawData = data;
          break;
        }
      }
      rawData ??= tempSystems.last;
    }
    return CardSystemData.fromMap(rawData);
  }

  static final List<Map<String, dynamic>> _data = <Map<String, dynamic>>[
    <String, dynamic>{
      'system': CardSystem.VISA,
      'systemCode': '4',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.DINERS_CLUB,
      'systemCode': '14',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.DINERS_CLUB,
      'systemCode': '36',
      'numberMask': '0000 000000 0000',
      'numDigits': 14,
    },
    <String, dynamic>{
      'system': CardSystem.DINERS_CLUB,
      'systemCode': '54',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.DINERS_CLUB,
      'systemCode': '30',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.MASTERCARD,
      'systemCode': '5',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.MASTERCARD,
      'systemCode': '222',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.MASTERCARD,
      'systemCode': '2720',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.AMERICAN_EXPRESS,
      'systemCode': '34',
      'numberMask': '0000 000000 00000',
      'numDigits': 15,
    },
    <String, dynamic>{
      'system': CardSystem.AMERICAN_EXPRESS,
      'systemCode': '37',
      'numberMask': '0000 000000 00000',
      'numDigits': 15,
    },
    <String, dynamic>{
      'system': CardSystem.JCB,
      'systemCode': '35',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.UZ_CARD,
      'systemCode': '8600',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.UZ_CARD,
      'systemCode': '5614',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.HUMO,
      'systemCode': '9860',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.DISCOVER,
      'systemCode': '65',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.DISCOVER,
      'systemCode': '60',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.DISCOVER,
      'systemCode': '60',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 19,
    },
    <String, dynamic>{
      'system': CardSystem.MAESTRO,
      'systemCode': '67',
      'numberMask': '0000 0000 0000 0000 0',
      'numDigits': 17,
    },
    <String, dynamic>{
      'system': CardSystem.MAESTRO,
      'systemCode': '67',
      'numberMask': '00000000 0000000000',
      'numDigits': 18,
    },
    <String, dynamic>{
      'system': CardSystem.MIR,
      'systemCode': '2200',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.MIR,
      'systemCode': '2204',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.UNION_PAY,
      'systemCode': '62',
      'numberMask': '0000 0000 0000 0000',
      'numDigits': 16,
    },
    <String, dynamic>{
      'system': CardSystem.UNION_PAY,
      'systemCode': '62',
      'numberMask': '0000 0000 0000 0000 000',
      'numDigits': 19,
    },
  ];
}

bool checkNumberByLuhn({
  required String number,
}) {
  final List<String> cardNumbers = number.split('');
  final int numDigits = cardNumbers.length;

  int sum = 0;
  bool isSecond = false;
  for (int i = numDigits - 1; i >= 0; i--) {
    int d = int.parse(cardNumbers[i]);

    if (isSecond == true) {
      d = d * 2;
    }

    sum += d ~/ 10;
    sum += d % 10;

    isSecond = !isSecond;
  }
  return (sum % 10 == 0);
}
