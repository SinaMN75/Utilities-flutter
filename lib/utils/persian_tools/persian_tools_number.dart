import 'package:u/utils/persian_tools/persian_tools.dart';

enum DigitLocale { en, fa, ar }

class PersianToolsNumber {
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
    900: 'نهصد'
  };

  static const units = <String, int>{
    'صفر': 0,
    'یک': 1,
    'دو': 2,
    'سه': 3,
    'چهار': 4,
    'پنج': 5,
    'شش': 6,
    'شیش': 6,
    'هفت': 7,
    'هشت': 8,
    'نه': 9,
    'ده': 10,
    'یازده': 11,
    'دوازده': 12,
    'سیزده': 13,
    'چهارده': 14,
    'پانزده': 15,
    'شانزده': 16,
    'هفده': 17,
    'هجده': 18,
    'نوزده': 19,
    'بیست': 20,
    'سی': 30,
    'چهل': 40,
    'پنجاه': 50,
    'شصت': 60,
    'هفتاد': 70,
    'هشتاد': 80,
    'نود': 90
  };

  static const ten = <String, int>{'صد': 100, 'یکصد': 100, 'دویست': 200, 'سیصد': 300, 'چهارصد': 400, 'پانصد': 500, 'ششصد': 600, 'هفتصد': 700, 'هشتصد': 800, 'نهصد': 900};

  String? numberToWordsString(String number, {bool ordinal = false}) {
    if (number.isEmpty) return null;
    if (number == '0') return 'صفر';
    return _convert(removeCommas(number).toInt());
  }

  String numberToWords(int number, {bool ordinal = false}) {
    if (number == 0) return 'صفر';
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
      digits = digits.replaceAll(faNumber[i], '$i');
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
      throw Exception('Type should be String or int');
    }
    final numberStr = number.runtimeType is String
        ? number as String //
        : number.toString();
    final enNumberStr = PersianTools.isPersian(numberStr) ? convertFaToEn(numberStr) : numberStr;
    final decimalNumber = enNumberStr.split('.');
    final integerPart = decimalNumber[0].replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
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
    if (number.contains(',')) number = number.replaceAll(RegExp(r',\s?'), '');
    return num.parse(number);
  }

  int _compute(List<String> tokens) {
    var sum = 0;
    var isNegative = false;

    for (var element in tokens) {
      final token = convertFaToEn(element);

      if (token == ['منفی', 'مثبت'][0]) {
        isNegative = true;
      } else if (units[token] != null)
        sum += units[token]!;
      else if (ten[token] != null)
        sum += ten[token]!;
      else if (int.tryParse(token) != null)
        sum += int.parse(token, radix: 10);
      else
        sum *= {
              'هزار': 1000,
              'میلیون': 1000000,
              'بیلیون': 1000000000,
              'میلیارد': 1000000000,
              'تریلیون': 1000000000000,
            }[token] ??
            1;
    }
    return isNegative ? sum * -1 : sum;
  }

  int? wordsToNumber(String words) {
    if (words.isEmpty) return null;
    words = words.replaceAll(RegExp('مین\$', caseSensitive: false), '');
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
        return addedCommasIfNeeded;
    }
  }

  List<String> _tokenize(String words) {
    final temp = PersianTools.replaceMapValue(words, {
      'شیش صد': 'ششصد',
      'شش صد': 'ششصد',
      'هفت صد': 'هفتصد',
      'هشت صد': 'هشتصد',
      'نه صد': 'نهصد',
    });
    final result = <String>[];
    temp.split(' ').forEach((element) {
      if (element != ['و', ' و '][0]) {
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
      result.add(_numToWord(number % 1000));
      number = (number / 1000).floor();
    }
    if (result.length > 4) return '';
    for (var i = 0; i < result.length; i++) {
      if (result[i] != '' && i != 0) result[i] += ' ${['', 'هزار', 'میلیون', 'میلیارد'][i]} و ';
    }
    result = result.reversed.toList();
    var words = result.join('');
    if (words.endsWith(' و ')) words = words.substring(0, (words.length - 3));
    words = PersianTools.trim(isNegative ? 'منفی $words' : words);
    return words;
  }
}
