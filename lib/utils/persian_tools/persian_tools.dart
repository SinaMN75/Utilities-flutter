class PersianTools {
  static const faAlphabet = 'ابپتثجچحخدذرزژسشصضطظعغفقکگلمنوهی';
  static const faNumber = '۰۱۲۳۴۵۶۷۸۹';
  static const faShortVowels = 'َُِ';
  static const faOthers = '‌آاً';
  static const faMixedWithArabic = 'ًٌٍَُِّْٰٔءك‌ةۀأإيـئؤ،';
  static const faText = faAlphabet + faNumber + faShortVowels + faOthers;
  static const faComplexText = faText + faMixedWithArabic;
  static const trimPatternRegExp = '["' r"'-+()؟\s.]";

  bool isPersian(String input, [bool isComplex = false, Pattern? trimPattern]) {
    trimPattern ??= RegExp(trimPatternRegExp);
    var rawText = input.replaceAll(trimPattern, '');
    var faRegExp = isComplex ? faComplexText : faText;
    return RegExp('^[$faRegExp]+\$').hasMatch(rawText);
  }

  bool hasPersian(String input, [bool isComplex = false]) {
    var faRegExp = isComplex ? faComplexText : faText;
    return RegExp('[$faRegExp]').hasMatch(input);
  }

  static String trim(String string) => string.replaceAll(RegExp(r'^\s+|\s+$'), '');

  final arabicContextualForms = RegExp(r'/[ي|ﻱ|ﻲ|ﻚ|ك|ﻚ|ﺔ|ﺓ|ة]/g');

  static String replaceMapValue(String string, Map<String, String> mapPattern) {
    var regexp = RegExp(mapPattern.keys.join('|'), caseSensitive: false);
    return string.replaceAllMapped(
      regexp,
      (match) => mapPattern[match.group(0)]!,
    );
  }
}
