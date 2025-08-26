import "package:u/utilities.dart";

class UOtpField extends StatefulWidget {
  const UOtpField({
    required this.cursorColor,
    required this.fillColor,
    required this.activeColor,
    required this.borderColor,
    required this.controller,
    super.key,
    this.length = 6,
    this.autoFocus = false,
    this.onChanged,
    this.onCompleted,
    this.validator,
    this.textStyle,
    this.fieldWidth = 48,
    this.fieldHeight = 60,
    this.borderRadius = 8,
    this.borderWidth = 1.5,
    this.obscureText = false,
    this.obscuringCharacter = "•",
    this.keyboardType = TextInputType.number,
    this.showCursor = true,
    this.readOnly = false,
    this.decoration,
    this.autoDismissKeyboard = true,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  final TextEditingController controller;
  final int length;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final FormFieldValidator<String>? validator;
  final TextStyle? textStyle;
  final double fieldWidth;
  final double fieldHeight;
  final Color cursorColor;
  final Color fillColor;
  final Color activeColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final bool obscureText;
  final String obscuringCharacter;
  final TextInputType keyboardType;
  final bool showCursor;
  final bool readOnly;
  final InputDecoration? decoration;
  final bool autoDismissKeyboard;
  final MainAxisAlignment mainAxisAlignment;

  @override
  _UOtpFieldState createState() => _UOtpFieldState();
}

class _UOtpFieldState extends State<UOtpField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  late List<String> _otp;

  @override
  void initState() {
    super.initState();
    _initializeOtpFields();
  }

  void _initializeOtpFields() {
    _focusNodes = List<FocusNode>.generate(
      widget.length,
      (final int index) => FocusNode(),
    );
    _controllers = List<TextEditingController>.generate(
      widget.length,
      (final int index) => TextEditingController(),
    );
    _otp = List<String>.generate(
      widget.length,
      (final int index) => "",
    );

    widget.controller.addListener(_syncControllersWithMain);
  }

  void _syncControllersWithMain() {
    final String text = widget.controller.text;
    for (int i = 0; i < widget.length; i++) {
      if (i < text.length) {
        _controllers[i].text = text[i];
      } else {
        _controllers[i].text = "";
      }
    }
  }

  @override
  void dispose() {
    for (final FocusNode node in _focusNodes) {
      node.dispose();
    }
    for (final TextEditingController controller in _controllers) {
      controller.dispose();
    }
    widget.controller.removeListener(_syncControllersWithMain);
    super.dispose();
  }

  void _onChanged(final int index, final String value) {
    if (value.length > 1) {
      // Handle paste operation
      if (value.length == widget.length) {
        for (int i = 0; i < widget.length; i++) {
          _controllers[i].text = value[i];
          _otp[i] = value[i];
        }
        widget.controller.text = value;
        _focusNodes.last.requestFocus();
      }
      return;
    }

    _otp[index] = value;
    widget.controller.text = _otp.join();

    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (widget.onChanged != null) {
      widget.onChanged!(widget.controller.text);
    }

    if (widget.controller.text.length == widget.length && widget.onCompleted != null) {
      widget.onCompleted!(widget.controller.text);
    }
  }

  void _onKeyDown(final int index, final KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.backspace && _controllers[index].text.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  Color _getBorderColor(final int index) {
    if (_focusNodes[index].hasFocus) {
      return widget.activeColor;
    } else if (_controllers[index].text.isNotEmpty) {
      return widget.activeColor.withValues(alpha: 0.5);
    }
    return widget.borderColor;
  }

  @override
  Widget build(final BuildContext context) => FormField<String>(
        validator: widget.validator,
        builder: (final FormFieldState<String> formFieldState) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: widget.mainAxisAlignment,
              children: List<Widget>.generate(
                  widget.length,
                  (final int index) => SizedBox(
                        width: widget.fieldWidth,
                        height: widget.fieldHeight,
                        child: KeyboardListener(
                          focusNode: FocusNode(),
                          onKeyEvent: (final KeyEvent event) => _onKeyDown(index, event),
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            autofocus: widget.autoFocus && index == 0,
                            textAlign: TextAlign.center,
                            style: widget.textStyle ?? Theme.of(context).textTheme.headlineSmall,
                            keyboardType: widget.keyboardType,
                            cursorColor: widget.cursorColor,
                            showCursor: widget.showCursor,
                            readOnly: widget.readOnly,
                            obscureText: widget.obscureText,
                            obscuringCharacter: widget.obscuringCharacter,
                            maxLength: 1,
                            decoration: widget.decoration ??
                                InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: widget.fillColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(widget.borderRadius),
                                    borderSide: BorderSide(
                                      color: _getBorderColor(index),
                                      width: widget.borderWidth,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(widget.borderRadius),
                                    borderSide: BorderSide(
                                      color: widget.activeColor,
                                      width: widget.borderWidth,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(widget.borderRadius),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.error,
                                      width: widget.borderWidth,
                                    ),
                                  ),
                                ),
                            onChanged: (final String value) => _onChanged(index, value),
                          ),
                        ),
                      )),
            ),
            if (formFieldState.hasError)
              Text(
                formFieldState.errorText!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ).pOnly(top: 8),
          ],
        ),
      ).ltr();
}
