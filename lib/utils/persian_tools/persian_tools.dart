class PersianTools {
  static const String faText = 'ابپتثجچحخدذرزژسشصضطظعغفقکگلمنوهی' '۰۱۲۳۴۵۶۷۸۹' 'َُِ' '‌آاً';
  static const String faComplexText = '$faTextًٌٍَُِّْٰٔءك‌ةۀأإيـئؤ،';

  static bool isPersian(String input, [bool isComplex = false, Pattern? trimPattern]) {
    trimPattern ??= RegExp('["' r"'-+()؟\s.]");
    final String rawText = input.replaceAll(trimPattern, '');
    final String faRegExp = isComplex ? faComplexText : faText;
    return RegExp('^[$faRegExp]+\$').hasMatch(rawText);
  }

  static bool hasPersian(String input, [bool isComplex = false]) {
    final String faRegExp = isComplex ? faComplexText : faText;
    return RegExp('[$faRegExp]').hasMatch(input);
  }

  static String trim(String string) => string.replaceAll(RegExp(r'^\s+|\s+$'), '');

  static String replaceMapValue(String string, Map<String, String> mapPattern) => string.replaceAllMapped(
        RegExp(mapPattern.keys.join('|'), caseSensitive: false),
        (Match match) => mapPattern[match.group(0)]!,
      );

  bool verifyIranianNationalId(String value) {
    if (!RegExp(r'^\d{10}$').hasMatch(value)) return false;
    final String nationalId = '0000$value'.substring(value.length + 4 - 10);
    if ((int.tryParse(nationalId.substring(3, 9)) ?? 0) == 0) return false;
    final int lastNumber = int.parse(nationalId.substring(9, 10));
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(nationalId.substring(i, i + 1)) * (10 - i);
    }
    sum = sum % 11;
    return (sum < 2 && lastNumber == sum) || (sum >= 2 && lastNumber == 11 - sum);
  }
}
