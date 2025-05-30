import 'package:u/utilities.dart';

class _Separator {
  String value;
  int indexInMask;

  _Separator({
    required this.value,
    required this.indexInMask,
  });
}

class MaskedInputFormatter extends TextInputFormatter {
  final String mask;

  final String _anyCharMask = '#';
  final String _onlyDigitMask = '0';
  final RegExp? allowedCharMatcher;
  final List<_Separator> _separators = <_Separator>[];

  // List<int> _separatorIndices = <int>[];
  // List<String> _separatorChars = <String>[];
  String _maskedValue = '';

  /// [mask] is a string that must contain # (hash) and 0 (zero)
  /// as maskable characters. # means any possible character,
  /// 0 means only digits. So if you want to match e.g. a
  /// string like this GGG-FB-897-R5 you need
  /// a mask like this ###-##-000-#0
  /// a mask like ###-### will also match 123-034 but a mask like
  /// 000-000 will only match digits and won't allow a string like Gtt-RBB
  ///
  /// will match literally any character unless
  /// you supply an [allowedCharMatcher] parameter with a RegExp
  /// to constrain its values. e.g. RegExp(r'[a-z]+') will make #
  /// match only lowercase latin characters and everything else will be
  /// ignored
  MaskedInputFormatter(
    this.mask, {
    this.allowedCharMatcher,
  });

  bool get isFilled => _maskedValue.length == mask.length;

  String get unmaskedValue {
    _prepareMask();
    final StringBuffer stringBuffer = StringBuffer();
    for (int i = 0; i < _maskedValue.length; i++) {
      final String char = _maskedValue[i];
      if (!_separators.any((_Separator s) => s.value == char)) {
        stringBuffer.write(char);
      }
    }
    return stringBuffer.toString();
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final FormattedValue oldFormattedValue = applyMask(
      oldValue.text,
    );
    final FormattedValue newFormattedValue = applyMask(
      newValue.text,
    );
    int numSeparatorsInNew = 0;
    int numSeparatorsInOld = 0;

    /// it's only used in CreditCardExpirationDateFormatter
    /// when it adds a leading zero to the input
    final int addOffset = newFormattedValue._numLeadingSymbols;
    numSeparatorsInOld = _countSeparators(
      oldFormattedValue.text,
    );
    numSeparatorsInNew = _countSeparators(
      newFormattedValue.text,
    );

    int separatorsDiff = (numSeparatorsInNew - numSeparatorsInOld);
    if (newFormattedValue._isErasing) {
      separatorsDiff = 0;
    }
    int selectionOffset = newValue.selection.end + separatorsDiff;
    _maskedValue = newFormattedValue.text;

    if (selectionOffset > _maskedValue.length) {
      selectionOffset = _maskedValue.length;
    }

    return TextEditingValue(
      text: _maskedValue,
      selection: TextSelection.collapsed(
        offset: selectionOffset + addOffset,
        affinity: TextAffinity.upstream,
      ),
    );
  }

  bool _isMatchingRestrictor(String character) {
    if (allowedCharMatcher == null) {
      return true;
    }
    return allowedCharMatcher!.stringMatch(character) != null;
  }

  void _prepareMask() {
    if (_separators.isEmpty) {
      for (int i = 0; i < mask.length; i++) {
        final String separatorChar = mask[i];
        if (separatorChar != _anyCharMask && separatorChar != _onlyDigitMask) {
          _separators.add(
            _Separator(
              value: separatorChar,
              indexInMask: i,
            ),
          );
        }
      }
    }
  }

  int _countSeparators(String text) {
    _prepareMask();
    int numSeparators = 0;
    for (int i = 0; i < text.length; i++) {
      final String char = text[i];

      if (_separators.any((_Separator s) => s.value == char)) {
        numSeparators++;
      }
    }
    return numSeparators;
  }

  String _removeSeparators(String text) {
    final StringBuffer stringBuffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      final String char = text[i];
      if (!_separators.any((_Separator s) => s.value == char)) {
        stringBuffer.write(char);
      }
    }
    return stringBuffer.toString();
  }

  _Separator? _getSeparatorForIndex(int index) {
    return _separators.firstWhereOrNull(
      (_Separator s) => s.indexInMask == index,
    );
  }

  FormattedValue applyMask(String text) {
    _prepareMask();
    final String clearedValueAfter = _removeSeparators(text);
    final bool isErasing = _maskedValue.length > text.length;
    final FormattedValue formattedValue = FormattedValue();
    final StringBuffer stringBuffer = StringBuffer();
    int index = 0;
    final List<String> splitMask = mask.split('');
    final List<String> placeholder = List<String>.filled(
      splitMask.length,
      '',
    );
    int lastRealCharIndex = 0;
    for (int i = 0; i < splitMask.length; i++) {
      final _Separator? separator = _getSeparatorForIndex(i);
      if (separator == null) {
        if (clearedValueAfter.length > index) {
          final bool maskOnDigitMatcher = splitMask[i] == _onlyDigitMask;
          final String curChar = clearedValueAfter[index];
          if (maskOnDigitMatcher) {
            if (!isDigit(curChar, positiveOnly: true)) {
              break;
            }
          } else {
            if (!_isMatchingRestrictor(curChar)) {
              break;
            }
          }
          placeholder[i] = curChar;
          lastRealCharIndex = i + 1;
          index++;
        } else {
          break;
        }
      } else {
        placeholder[i] = separator.value;
      }
    }
    for (int i = 0; i < lastRealCharIndex; i++) {
      stringBuffer.write(placeholder[i]);
    }
    formattedValue._isErasing = isErasing;
    formattedValue._formattedValue = stringBuffer.toString();

    return formattedValue;
  }
}

class FormattedValue {
  String _formattedValue = '';
  bool _isErasing = false;
  int _numLeadingSymbols = 0;

  String get text {
    return _formattedValue;
  }

  /// Used in CreditCardExpirationInputFormatter
  /// to be able to add a leading zero
  void increaseNumberOfLeadingSymbols() {
    _numLeadingSymbols++;
  }

  @override
  String toString() {
    return _formattedValue;
  }
}
