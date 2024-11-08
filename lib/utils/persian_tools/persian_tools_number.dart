import 'package:utilities/utils/persian_tools/constants.dart';
import 'package:utilities/utils/persian_tools/persian_tools.dart';

enum DigitLocale {
  en,
  fa,
  ar,
}

class PersianToolsNumber {
  static const String exception = 'Type should be String or int';
  static const String addCommasRegExp = r'(\d)(?=(\d{3})+(?!\d))';
  static const String removeCommasRegExp = r',\s?';
  static const base = 1000;
  static const zeroFa = 'صفر';
  static const endsWithAnd = ' و ';
  static const scale = ['', 'هزار', 'میلیون', 'میلیارد'];
  static const faNumber = '۰۱۲۳۴۵۶۷۸۹';
  static const arNumber = '۰۱۲۳٤٥٦۷۸۹';
  static const numberToWord = {
    0: '',
    1: 'یک',
    2: 'دو',
    3: 'سه',
    4: 'چهار',
    5: 'پنج',
    6: 'شش',
    7: 'هفت',
    8: 'هشت',
    9: 'نه',
    10: 'ده',
    11: 'یازده',
    12: 'دوازده',
    13: 'سیزده',
    14: 'چهارده',
    15: 'پانزده',
    16: 'شانزده',
    17: 'هفده',
    18: 'هجده',
    19: 'نوزده',
    20: 'بیست',
    30: 'سی',
    40: 'چهل',
    50: 'پنجاه',
    60: 'شصت',
    70: 'هفتاد',
    80: 'هشتاد',
    90: 'نود',
    100: 'صد',
    200: 'دویست',
    300: 'سیصد',
    400: 'چهارصد',
    500: 'پانصد',
    600: 'ششصد',
    700: 'هفتصد',
    800: 'هشتصد',
    900: 'نهصد',
  };

  String? numberToWordsString(String number, {bool ordinal = false}) {
    if (number.isEmpty) return null;
    if (number == '0') return zeroFa;
    return _convert(removeCommas(number).toInt());
  }

  String numberToWords(int number, {bool ordinal = false}) {
    if (number == 0) return zeroFa;
    return _convert(number);
  }

  String convertEnToFa(String digits) {
    for (var i = 0; i < 10; i++) {
      digits = digits.replaceAll('$i', faNumber[i]);
    }
    return digits;
  }

  String convertEnToAr(String digits) {
    for (var i = 0; i < 10; i++) {
      digits = digits.replaceAll('$i', arNumber[i]);
    }
    return digits;
  }

  String convertFaToEn(String digits) {
    for (var i = 0; i < 10; i++) {
      digits = digits.replaceAll('${faNumber[i]}', '$i');
    }
    return digits;
  }

  String convertArToFa(String digits) {
    for (var i = 0; i < 10; i++) {
      digits = digits.replaceAll(arNumber[i], faNumber[i]);
    }
    return digits;
  }

  String convertArToEn(String digits) {
    for (var i = 0; i < 10; i++) {
      digits = digits.replaceAll(arNumber[i], '$i');
    }
    return digits;
  }

  String addCommas(Object number) {
    if (number is! int && number is! String && number is! double) {
      throw Exception(exception);
    }
    final numberStr = number.runtimeType is String
        ? number as String //
        : number.toString();
    final enNumberStr = PersianTools().isPersian(numberStr) ? convertFaToEn(numberStr) : numberStr;
    final decimalNumber = enNumberStr.split('.');
    final integerPart = decimalNumber[0].replaceAllMapped(
      RegExp(addCommasRegExp),
      (matched) => '${matched[1]},',
    );
    String decimalPart;
    try {
      decimalPart = '.${decimalNumber[1]}';
    } on RangeError catch (_) {}
    decimalPart = '';
    return integerPart + decimalPart;
  }

  num removeCommas(String number) {
    if (number.contains(',')) number = number.replaceAll(RegExp(removeCommasRegExp), '');
    return num.parse(number);
  }

  int _compute(List<String> tokens) {
    var sum = 0;
    var isNegative = false;

    tokens.forEach((element) {
      final token = convertFaToEn(element);

      if (token == prefixes[0])
        isNegative = true;
      else if (units[token] != null)
        sum += units[token]!;
      else if (ten[token] != null)
        sum += ten[token]!;
      else if (int.tryParse(token) != null)
        sum += int.parse(token, radix: 10);
      else
        sum *= magnitude[token] ?? 1;
    });
    return isNegative ? sum * -1 : sum;
  }

  int? wordsToNumber(String words) {
    if (words.isEmpty) return null;
    words = words.replaceAll(RegExp(faOrdinalRegExp, caseSensitive: false), '');
    return _compute(_tokenize(words));
  }

  String? wordsToNumberString(
    String words, {
    DigitLocale digits = DigitLocale.en,
    bool addComma = false,
  }) {
    final computeNumbers = wordsToNumber(words);
    if (computeNumbers == null) return null;
    final addedCommasIfNeeded = addComma ? addCommas(computeNumbers) : computeNumbers.toString();

    switch (digits) {
      case DigitLocale.fa:
        return convertEnToFa(addedCommasIfNeeded);
      case DigitLocale.ar:
        return convertEnToAr(addedCommasIfNeeded);
      case DigitLocale.en:
      default:
        return addedCommasIfNeeded;
    }
  }

  List<String> _tokenize(String words) {
    final temp = PersianTools.replaceMapValue(words, typoList);
    final result = <String>[];
    temp.split(' ').forEach((element) {
      if (element != joiners[0]) {
        result.add(element);
      }
    });
    return result;
  }

  String _numToWord(int number) {
    var unit = 100;
    var result = '';

    while (unit > 0) {
      if ((number / unit).floor() * unit != 0) {
        if (numberToWord.containsKey(number)) {
          result += numberToWord[number]!;
          break;
        } else {
          result += '${numberToWord[(number / unit).floor() * unit]} و ';
          number %= unit;
        }
      }
      unit = (unit / 10).floor();
    }
    return result;
  }

  /// Checks current [input] for negative [value] and deploying converting process
  String _convert(int number) {
    var result = <String>[];
    final isNegative = number < 0;
    number = isNegative ? number * -1 : number;
    while (number > 0) {
      result.add(_numToWord(number % base));
      number = (number / base).floor();
    }
    if (result.length > 4) return '';
    for (var i = 0; i < result.length; i++) if (result[i] != '' && i != 0) result[i] += ' ${scale[i]} و ';
    result = result.reversed.toList();
    var words = result.join('');
    if (words.endsWith(endsWithAnd)) words = words.substring(0, (words.length - 3));
    words = PersianTools.trim(isNegative ? 'منفی $words' : words);
    return words;
  }
}
