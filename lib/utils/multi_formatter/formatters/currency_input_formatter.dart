import 'package:u/utilities.dart';

final RegExp _mantissaSeparatorRegexp = RegExp(r'[,.]');
final RegExp _illegalCharsRegexp = RegExp(r'[^0-9-,.]+');
final RegExp _illegalLeadingOrTrailing = RegExp(r'[-,.+]+');

class CurrencySymbols {
  static const String DOLLAR_SIGN = '\$';
  static const String EURO_SIGN = '€';
  static const String POUND_SIGN = '£';
  static const String YEN_SIGN = '￥';
  static const String ETHEREUM_SIGN = 'Ξ';
  static const String BITCOIN_SIGN = 'Ƀ';
  static const String SWISS_FRANK_SIGN = '₣';
  static const String RUBLE_SIGN = '₽';
}

class CurrencyInputFormatter extends TextInputFormatter {
  final ThousandSeparator thousandSeparator;
  final int mantissaLength;
  final String leadingSymbol;
  final String trailingSymbol;
  final bool useSymbolPadding;
  final int? maxTextLength;
  final ValueChanged<num>? onValueChange;

  final bool _printDebugInfo = false;

  /// Indicates if there are any scheduled updates using [_widgetsBinding]'s `addPostFrameCallback`.
  bool _scheduledUpdate = false;

  /// The value that will be passed to [onValueChange] on the next scheduled frame.
  /// This value need is updated using [_updateValue] and [_updateValueFromText].
  late String _nextValue;

  /// [thousandSeparator] specifies what symbol will be used to separate
  /// each block of 3 digits, e.g. [ThousandSeparator.Comma] will format
  /// million as 1,000,000
  /// [ShorteningPolicy.NoShortening] displays a value of 1234456789.34 as 1,234,456,789.34
  /// but [ShorteningPolicy.RoundToThousands] displays the same value as 1,234,456K
  /// [mantissaLength] specifies how many digits will be added after a period sign
  /// [leadingSymbol] any symbol (except for the ones that contain digits) the will be
  /// added in front of the resulting string. E.g. $ or €
  /// some of the signs are available via constants like [CurrencySymbols.EURO_SIGN]
  /// but you can basically add any string instead of it. The main rule is that the string
  /// must not contain digits, periods, commas and dashes
  /// [trailingSymbol] is the same as leading but this symbol will be added at the
  /// end of your resulting string like 1,250€ instead of €1,250
  /// [useSymbolPadding] adds a space between the number and trailing / leading symbols
  /// like 1,250€ -> 1,250 € or €1,250€ -> € 1,250
  /// [onValueChange] a callback that will be called on a number change
  CurrencyInputFormatter({
    this.thousandSeparator = ThousandSeparator.Comma,
    this.mantissaLength = 2,
    this.leadingSymbol = '',
    this.trailingSymbol = '',
    this.useSymbolPadding = false,
    this.onValueChange,
    this.maxTextLength,
  }) : assert(!leadingSymbol.contains(_illegalLeadingOrTrailing) && !trailingSymbol.contains(_illegalLeadingOrTrailing), '''
    Illegal trailing or reading symbol. You cannot use 
    the next symbols as leading or trailing because 
    they might interfere with numbers: -,.+
  ''');

  WidgetsBinding? get _widgetsBinding {
    return WidgetsBinding.instance;
  }

  // The use of [_nextValue] is a hack to avoid calling [onValueChange] twice while
  // formatting the text.
  /// @{template fmf_schedule_update}
  ///
  /// Updates the value that will be passed to [onValueChange] on the next frame.
  /// If this is called more than once in a frame, only the last call [value] will
  /// be used.
  ///
  /// @{endtemplate}
  void _updateValue(String value) {
    if (onValueChange == null) {
      return;
    }
    _nextValue = value;

    if (_scheduledUpdate) {
      return;
    }

    _scheduledUpdate = true;
    _widgetsBinding?.addPostFrameCallback((Duration timeStamp) {
      try {
        if (mantissaLength < 1) {
          onValueChange!(int.parse(_nextValue));
        } else {
          onValueChange!(double.parse(_nextValue));
        }
      } catch (e) {
        onValueChange!(double.nan);
      } finally {
        _scheduledUpdate = false;
      }
    });
  }

  ///
  /// @{macro fmf_schedule_update}
  ///
  String _updateValueFromText(String newText) {
    final String asNumeric = toNumericString(
      newText,
      allowPeriod: true,
      mantissaSeparator: _mantissaSeparator,
      mantissaLength: mantissaLength,
    );
    _updateValue(asNumeric);

    return asNumeric;
  }

  String get _mantissaSeparator {
    if (thousandSeparator == ThousandSeparator.Period || thousandSeparator == ThousandSeparator.SpaceAndCommaMantissa) {
      return ',';
    }
    return '.';
  }

  // For the package developers: if you added a new return case here and it's return
  // a value that does not match the value triggered on "onChangedValue" then you
  // need to call [_updateValue] or [_updateValueFromText] method before returning
  // the value.
  //
  // Take as example the "RETURN 3" case:
  //
  // ```dart
  // // ...
  // if (_printDebugInfo) {
  //   print('RETURN 3 ${oldValue.text}');
  // }
  //
  // _updateValueFromText(oldText); // <-- this is the line that needs to be added
  //
  // return oldValue;
  // ```
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int trailingLength = _getTrailingLength();
    final int leadingLength = _getLeadingLength();
    int oldCaretIndex = max(oldValue.selection.start, oldValue.selection.end);
    int newCaretIndex = max(newValue.selection.start, newValue.selection.end);
    String newText = newValue.text;
    final String newAsNumeric = _updateValueFromText(newText);

    final String oldText = oldValue.text;
    if (oldValue == newValue) {
      if (_printDebugInfo) {
      }
      return newValue;
    }
    final bool isErasing = newText.length < oldText.length;
    if (isErasing) {
      if (mantissaLength == 0 && oldCaretIndex == oldValue.text.length) {
        if (trailingLength > 0) {
          if (_printDebugInfo) {
          }
          return oldValue.copyWith(
            selection: TextSelection.collapsed(
              offset: min(
                oldValue.text.length,
                oldCaretIndex - trailingLength,
              ),
            ),
          );
        }
      } else {
        if (thousandSeparator == ThousandSeparator.Space) {
          /// It's a dirty hack to try and fix this issue
          /// https://github.com/caseyryan/flutter_multi_formatter/issues/145
          /// The problem there is that after erasing just a white space
          /// the number from e.g. this 45 555 $ becomes this 45555 $ but
          /// after applying the format again in regains the lost space and
          /// this leads to a situation when nothing seems to be changed
          final List<String> differences = _findDifferentChars(
            longerString: oldText,
            shorterString: newText,
          );
          if (differences.length == 1 && differences.first == ' ') {
            if (newCaretIndex > 0) {
              newCaretIndex = newCaretIndex.subtractClamping(1);
              oldCaretIndex = oldCaretIndex.subtractClamping(1);
              newText = newText.removeCharAt(newCaretIndex);
            }
          }
        }
      }
      if (_hasErasedMantissaSeparator(
        shorterString: newText,
        longerString: oldText,
      )) {
        if (_printDebugInfo) {
        }

        // propagate previous correct value with mantissa separator
        _updateValueFromText(oldText);

        return oldValue.copyWith(
          selection: TextSelection.collapsed(
            offset: min(
              oldValue.text.length,
              oldCaretIndex - 1,
            ),
          ),
        );
      }
    } else {
      if (_containsIllegalChars(newText)) {
        if (_printDebugInfo) {
        }

        // propagate previous correct value without illegal chars
        _updateValueFromText(oldText);

        return oldValue;
      }
    }

    final int afterMantissaPosition = _countAfterMantissaPosition(
      oldText: oldText,
      oldCaretOffset: oldCaretIndex,
    );

    final String newAsCurrency = toCurrencyString(
      newText,
      mantissaLength: mantissaLength,
      thousandSeparator: thousandSeparator,
      leadingSymbol: leadingSymbol,
      trailingSymbol: trailingSymbol,
      useSymbolPadding: useSymbolPadding,
    );

    if (_switchToRightInWholePart(
      newText: newText,
      oldText: oldText,
    )) {
      if (_printDebugInfo) {
      }

      // propagate previous correct value with correct mantissa position
      _updateValueFromText(oldText);

      return oldValue.copyWith(
        selection: TextSelection.collapsed(
          offset: min(
            oldValue.text.length,
            oldCaretIndex + 1,
          ),
        ),
      );
    }

    if (afterMantissaPosition > 0) {
      if (_switchToLeftInMantissa(
        newText: newText,
        oldText: oldText,
        caretPosition: newCaretIndex,
      )) {
        if (_printDebugInfo) {
        }
        return TextEditingValue(
          selection: TextSelection.collapsed(
            offset: newCaretIndex,
          ),
          text: newAsCurrency,
        );
      } else {
        if (_printDebugInfo) {
        }

        final int offset = min(
          newCaretIndex,
          newAsCurrency.length - trailingLength,
        );
        return TextEditingValue(
          selection: TextSelection.collapsed(
            offset: offset,
          ),
          text: newAsCurrency,
        );
      }
    }

    int initialCaretOffset = leadingLength;
    if (_isZeroOrEmpty(newAsNumeric)) {
      if (_printDebugInfo) {
      }
      int offset = min(
        newValue.text.length,
        initialCaretOffset + 1,
      );
      if (newValue.text == '') {
        offset = 1;
      }
      return newValue.copyWith(
        text: newAsCurrency,
        selection: TextSelection.collapsed(
          offset: offset,
        ),
      );
    }
    final String oldAsCurrency = toCurrencyString(
      oldText,
      mantissaLength: mantissaLength,
      thousandSeparator: thousandSeparator,
      leadingSymbol: leadingSymbol,
      trailingSymbol: trailingSymbol,
      useSymbolPadding: useSymbolPadding,
    );

    final int lengthDiff = newAsCurrency.length - oldAsCurrency.length;

    initialCaretOffset = max(
      (oldCaretIndex + lengthDiff),
      leadingLength + 1,
    );
    if (initialCaretOffset < 1) {
      if (newAsCurrency.isNotEmpty) {
        initialCaretOffset += 1;
      }
    }

    return TextEditingValue(
      selection: TextSelection.collapsed(
        offset: initialCaretOffset,
      ),
      text: newAsCurrency,
    );
  }

  bool _isZeroOrEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }
    value = toNumericString(
      value,
      allowPeriod: true,
      mantissaSeparator: _mantissaSeparator,
      mantissaLength: mantissaLength,
    );
    try {
      return double.parse(value) == 0.0;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
  }

  int _getLeadingLength() {
    if (useSymbolPadding) {
      if (leadingSymbol.isNotEmpty) {
        return leadingSymbol.length + 1;
      } else {
        return 0;
      }
    }
    return leadingSymbol.length;
  }

  int _getTrailingLength() {
    if (useSymbolPadding) {
      if (trailingSymbol.isNotEmpty) {
        return trailingSymbol.length + 1;
      } else {
        return 0;
      }
    }
    return trailingSymbol.length;
  }

  List<String> _findDifferentChars({
    required String longerString,
    required String shorterString,
  }) {
    final List<String> newChars = longerString.split('');
    final List<String> oldChars = shorterString.split('');
    for (int i = 0; i < oldChars.length; i++) {
      final String oldChar = oldChars[i];
      newChars.remove(oldChar);
    }
    return newChars;
  }

  bool _containsMantissaSeparator(List<String> chars) {
    for (String char in chars) {
      if (char == _mantissaSeparator) {
        return true;
      }
    }
    return false;
  }

  bool _switchToRightInWholePart({
    required String newText,
    required String oldText,
  }) {
    if (newText.length > oldText.length) {
      final List<String> newChars = _findDifferentChars(
        longerString: newText,
        shorterString: oldText,
      );

      /// [hasWrongSeparator] is an attempt to fix this
      /// https://github.com/caseyryan/flutter_multi_formatter/issues/114
      /// Not sure if it will have some side effect
      final bool hasWrongSeparator = newText.contains(',.') || newText.contains('.,');
      if (_containsMantissaSeparator(newChars) || hasWrongSeparator) {
        return true;
      }
    }
    return false;
  }

  bool _switchToLeftInMantissa({
    required String newText,
    required String oldText,
    required int caretPosition,
  }) {
    if (newText.length < oldText.length) {
      if (caretPosition < newText.length) {
        String nextChar = '';
        if (caretPosition < newText.length - 1) {
          nextChar = newText[caretPosition];
          if (!isDigit(nextChar, positiveOnly: true) || int.tryParse(nextChar) == 0) {
            return true;
          }
        }
      }
    }
    return false;
  }

  int _countAfterMantissaPosition({
    required String oldText,
    required int oldCaretOffset,
  }) {
    if (mantissaLength < 1) {
      return 0;
    }
    final int mantissaIndex = oldText.lastIndexOf(
      _mantissaSeparatorRegexp,
    );
    if (mantissaIndex < 0) {
      return 0;
    }
    if (oldCaretOffset > mantissaIndex) {
      return oldCaretOffset - mantissaIndex;
    }
    return 0;
  }

  bool _hasErasedMantissaSeparator({
    required String shorterString,
    required String longerString,
  }) {
    final List<String> differentChars = _findDifferentChars(
      shorterString: shorterString,
      longerString: longerString,
    );
    if (_containsMantissaSeparator(differentChars)) {
      return true;
    }
    return false;
  }

  bool _containsIllegalChars(String input) {
    if (input.isEmpty) return false;
    String clearedInput = input;
    if (leadingSymbol.isNotEmpty) {
      /// allows to get read of an odd minus in front of a leading symbol
      /// https://github.com/caseyryan/flutter_multi_formatter/issues/123
      final String sub = clearedInput.substring(
        0,
        clearedInput.indexOf(leadingSymbol) + 1,
      );
      if (sub.length > leadingSymbol.length) {
        return true;
      }

      clearedInput = clearedInput.replaceFirst(leadingSymbol, '');
    }
    if (trailingSymbol.isNotEmpty) {
      clearedInput = clearedInput.replaceFirst(trailingSymbol, '');
    }
    clearedInput = clearedInput.replaceAll(' ', '');
    return _illegalCharsRegexp.hasMatch(clearedInput);
  }
}
