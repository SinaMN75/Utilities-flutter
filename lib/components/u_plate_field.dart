import "package:u/utilities.dart";

const List<String> uPlateLetters = <String>["ب", "ج", "د", "س", "ص", "ط", "ق", "ک", "ل", "م", "ن", "و", "ه", "ی"];

class UPlateField extends StatefulWidget {
  const UPlateField({
    this.onPlateChange,
    super.key,
    this.initialPlate = "",
  });

  final String initialPlate;
  final ValueChanged<String>? onPlateChange;

  @override
  State<UPlateField> createState() => _UPlateFieldState();
}

class _UPlateFieldState extends State<UPlateField> {
  static const String _irIran = """
<svg width="35" height="42" viewBox="0 0 35 42" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect width="35" height="42" rx="8" fill="#3B39E5"/>
<rect x="4" y="6.3855" width="27" height="4" fill="#189C21"/>
<rect x="4" y="10" width="27" height="5" fill="white"/>
<rect x="4" y="14" width="27" height="4" fill="#C80505"/>
<path d="M19.6362 12.4318C19.6362 12.85 19.3511 13.2339 18.8959 13.4294C19.5155 12.7998 19.3889 11.8812 18.6137 11.3774C18.5875 11.3602 18.5606 11.3437 18.533 11.3278C19.1759 11.437 19.6362 11.8978 19.6362 12.4318Z" fill="#C80505"/>
<path d="M18.9919 12.3863C18.9912 13.1306 18.2479 13.7337 17.3316 13.7331C17.1578 13.7331 16.9854 13.7107 16.8203 13.6676C16.8494 13.6687 16.8792 13.6693 16.9083 13.6693C17.9126 13.6693 18.7264 13.0077 18.7264 12.192C18.7264 11.8978 18.6181 11.6102 18.4152 11.3662C18.7824 11.6214 18.9926 11.9941 18.9919 12.3863Z" fill="#C80505"/>
<path d="M18.2865 11.0821C18.2865 11.1955 18.173 11.2877 18.0334 11.2877C17.9461 11.2877 17.8647 11.251 17.8189 11.1908L17.7883 11.166L17.8181 11.0449C17.8727 11.1412 18.0138 11.1831 18.1323 11.1388C18.2014 11.1128 18.2516 11.0608 18.2654 11C18.2792 11.026 18.2865 11.0538 18.2865 11.0821Z" fill="#C80505"/>
<path d="M18.0325 11.4152C17.9481 11.3839 17.874 11.336 17.818 11.2764L17.7271 12.4306L17.818 13.9085L17.959 13.7508L17.978 13.3869L17.9976 13.0083L17.9998 12.9598L18.0005 12.9415L18.0049 12.863L18.0172 12.6243L18.0274 12.4318L18.0303 12.3762L18.034 12.3054L18.0325 11.4152Z" fill="#C80505"/>
<path d="M15.9998 12.4318C15.9998 12.85 16.2849 13.2339 16.7401 13.4294C16.1205 12.7998 16.2471 11.8812 17.0223 11.3774C17.0485 11.3602 17.0754 11.3437 17.103 11.3278C16.4601 11.437 15.9998 11.8978 15.9998 12.4318Z" fill="#C80505"/>
<path d="M16.6441 12.3863C16.6448 13.1306 17.3881 13.7337 18.3044 13.7331C18.4782 13.7331 18.6506 13.7107 18.8157 13.6676C18.7866 13.6687 18.7568 13.6693 18.7277 13.6693C17.7233 13.6693 16.9095 13.0077 16.9095 12.192C16.9095 11.8978 17.0179 11.6102 17.2208 11.3662C16.8535 11.6214 16.6434 11.9941 16.6441 12.3863Z" fill="#C80505"/>
<path d="M17.3495 11.0821C17.3495 11.1955 17.4629 11.2877 17.6026 11.2877C17.6898 11.2877 17.7713 11.251 17.8171 11.1908L17.8477 11.166L17.8178 11.0449C17.7633 11.1412 17.6222 11.1831 17.5037 11.1388C17.4346 11.1128 17.3844 11.0608 17.3706 11C17.3568 11.026 17.3495 11.0538 17.3495 11.0821Z" fill="#C80505"/>
<path d="M17.6035 11.4152C17.6879 11.3839 17.762 11.336 17.818 11.2764L17.9089 12.4306L17.818 13.9085L17.6769 13.7508L17.658 13.3869L17.6384 13.0083L17.6362 12.9598L17.6355 12.9415L17.6311 12.863L17.6188 12.6243L17.6086 12.4318L17.6057 12.3762L17.602 12.3054L17.6035 11.4152Z" fill="#C80505"/>
<path d="M29.2188 29.2236H30.77V36.0036H29.4795L26.5076 32.4436C26.3425 32.2503 26.16 32.0336 25.9601 31.7936C25.7689 31.5469 25.5864 31.3203 25.4127 31.1136C25.4387 31.3269 25.4604 31.5503 25.4778 31.7836C25.5039 32.0169 25.5169 32.2403 25.5169 32.4536L25.556 35.9936H24.0049V29.2036H25.2171L28.2803 32.7236C28.4541 32.9169 28.6279 33.1236 28.8017 33.3436C28.9842 33.5569 29.1624 33.7636 29.3362 33.9636C29.3188 33.7503 29.3014 33.5369 29.284 33.3236C29.2666 33.1036 29.2579 32.9169 29.2579 32.7636L29.2188 29.2236Z" fill="white"/>
<path d="M18.5241 29.2236H19.7494L23.1515 35.9936H21.496L20.6879 34.2236H17.5074L16.6731 35.9936H15.135L18.5241 29.2236ZM20.2838 33.3436C20.0057 32.7436 19.7667 32.2003 19.5669 31.7136C19.367 31.2203 19.2149 30.8336 19.1107 30.5536C18.989 30.8536 18.8282 31.247 18.6284 31.7336C18.4285 32.2203 18.1939 32.757 17.9245 33.3436H20.2838Z" fill="white"/>
<path d="M8.37329 29.2236C8.43412 29.2236 8.57316 29.2236 8.79041 29.2236C9.00766 29.2169 9.25097 29.2136 9.52036 29.2136C9.78975 29.2136 10.0591 29.2136 10.3285 29.2136C10.5979 29.2069 10.8195 29.2036 10.9933 29.2036C12.0709 29.2036 12.8573 29.3669 13.3526 29.6936C13.8479 30.0136 14.0956 30.4669 14.0956 31.0536C14.0956 31.4403 13.9696 31.7836 13.7176 32.0836C13.4656 32.3836 13.0528 32.6003 12.4793 32.7336C12.7226 32.8403 12.9398 32.9869 13.131 33.1736C13.3222 33.3603 13.509 33.5903 13.6915 33.8636C13.874 34.1303 14.0608 34.4436 14.252 34.8036C14.4432 35.1569 14.6648 35.5536 14.9168 35.9936H13.2353C12.9398 35.4669 12.6792 35.0169 12.4532 34.6436C12.236 34.2703 12.0231 33.9669 11.8145 33.7336C11.6059 33.5003 11.38 33.3303 11.1367 33.2236C10.9021 33.1169 10.624 33.0636 10.3025 33.0636H9.92444V35.9936H8.37329V29.2236ZM9.92444 32.1936H10.9281C11.4148 32.1936 11.7884 32.1103 12.0491 31.9436C12.3185 31.7769 12.4532 31.5303 12.4532 31.2036C12.4532 31.0569 12.4271 30.9136 12.375 30.7736C12.3229 30.6336 12.2316 30.5103 12.1013 30.4036C11.9796 30.2969 11.8102 30.2136 11.5929 30.1536C11.3844 30.0869 11.1193 30.0536 10.7978 30.0536H9.92444V32.1936Z" fill="white"/>
<path d="M5 29.2236H6.55115V35.9936H5V29.2236Z" fill="white"/>
<path d="M16.7184 26.4117C17.0226 26.4117 17.2529 26.4817 17.4093 26.6217C17.5744 26.7617 17.6569 26.9417 17.6569 27.1617C17.6569 27.3751 17.5744 27.5551 17.4093 27.7017C17.2442 27.8484 17.0009 27.9217 16.6793 27.9217C16.3752 27.9217 16.1406 27.8484 15.9754 27.7017C15.8103 27.5551 15.7278 27.3817 15.7278 27.1817C15.7278 26.9684 15.8103 26.7884 15.9754 26.6417C16.1406 26.4884 16.3882 26.4117 16.7184 26.4117Z" fill="white"/>
<path d="M8.37329 21.0419C8.43412 21.0419 8.57316 21.0419 8.79041 21.0419C9.00766 21.0352 9.25097 21.0319 9.52036 21.0319C9.78975 21.0319 10.0591 21.0319 10.3285 21.0319C10.5979 21.0252 10.8195 21.0219 10.9933 21.0219C12.0709 21.0219 12.8573 21.1852 13.3526 21.5119C13.8479 21.8319 14.0956 22.2852 14.0956 22.8719C14.0956 23.2585 13.9696 23.6019 13.7176 23.9019C13.4656 24.2019 13.0528 24.4185 12.4793 24.5519C12.7226 24.6585 12.9398 24.8052 13.131 24.9919C13.3222 25.1785 13.509 25.4085 13.6915 25.6819C13.874 25.9485 14.0608 26.2619 14.252 26.6219C14.4432 26.9752 14.6648 27.3719 14.9168 27.8119H13.2353C12.9398 27.2852 12.6792 26.8352 12.4532 26.4619C12.236 26.0885 12.0231 25.7852 11.8145 25.5519C11.6059 25.3185 11.38 25.1485 11.1367 25.0419C10.9021 24.9352 10.624 24.8819 10.3025 24.8819H9.92444V27.8119H8.37329V21.0419ZM9.92444 24.0119H10.9281C11.4148 24.0119 11.7884 23.9285 12.0491 23.7619C12.3185 23.5952 12.4532 23.3485 12.4532 23.0219C12.4532 22.8752 12.4271 22.7319 12.375 22.5919C12.3229 22.4519 12.2316 22.3285 12.1013 22.2219C11.9796 22.1152 11.8102 22.0319 11.5929 21.9719C11.3844 21.9052 11.1193 21.8719 10.7978 21.8719H9.92444V24.0119Z" fill="white"/>
<path d="M5 21.0417H6.55115V27.8117H5V21.0417Z" fill="white"/>
</svg>
  """;

  late TextEditingController digits1Controller;
  late TextEditingController digits3Controller;
  late TextEditingController provinceController;
  String letter = "";

  final FocusNode focus1 = FocusNode();
  final FocusNode focus3 = FocusNode();
  final FocusNode focusProv = FocusNode();
  final FocusNode letterFocusNode = FocusNode();

  final GlobalKey _letterButtonKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  bool get _isReadOnly => widget.onPlateChange == null;

  ColorScheme get _scheme => Theme.of(context).colorScheme;

  @override
  void initState() {
    super.initState();
    String parsedDigits1 = "";
    String parsedDigits3 = "";
    String parsedProvince = "";
    String parsedLetter = "";

    if (widget.initialPlate.isNotEmpty) {
      for (int i = 0; i < widget.initialPlate.length && i < 2; i++) {
        if (widget.initialPlate[i].contains(RegExp(r"[0-9]"))) parsedDigits1 += widget.initialPlate[i];
      }
      for (int i = 0; i < widget.initialPlate.length; i++) {
        if (uPlateLetters.contains(widget.initialPlate[i])) {
          parsedLetter = widget.initialPlate[i];
          break;
        }
      }
      final int letterIndex = widget.initialPlate.indexOf(parsedLetter);
      if (letterIndex != -1 && letterIndex + 1 < widget.initialPlate.length) {
        for (int i = letterIndex + 1; i < widget.initialPlate.length && i < letterIndex + 4; i++) {
          if (widget.initialPlate[i].contains(RegExp(r"[0-9]"))) parsedDigits3 += widget.initialPlate[i];
        }
      }
      final List<String> digits = <String>[];
      for (int i = widget.initialPlate.length - 1; i >= 0 && digits.length < 2; i--) {
        if (widget.initialPlate[i].contains(RegExp(r"[0-9]"))) digits.insert(0, widget.initialPlate[i]);
      }
      parsedProvince = digits.join();
    }

    digits1Controller = TextEditingController(text: parsedDigits1);
    digits3Controller = TextEditingController(text: parsedDigits3);
    provinceController = TextEditingController(text: parsedProvince);
    letter = parsedLetter;

    if (!_isReadOnly) {
      digits1Controller.addListener(_onDigits1Changed);
      digits3Controller.addListener(_onDigits3Changed);
      provinceController.addListener(_onProvinceChanged);
    }
  }

  void _onDigits1Changed() {
    if (_isReadOnly) return;
    String value = digits1Controller.text.replaceAll(RegExp(r"[^0-9]"), "");
    if (value.length > 2) value = value.substring(0, 2);
    if (digits1Controller.text != value)
      digits1Controller.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    _updateFullPlate();
    if (value.length == 2 && letter.isEmpty) WidgetsBinding.instance.addPostFrameCallback((_) => _showLetterMenu());
  }

  void _onDigits3Changed() {
    if (_isReadOnly) return;
    String value = digits3Controller.text.replaceAll(RegExp(r"[^0-9]"), "");
    if (value.length > 3) value = value.substring(0, 3);
    if (digits3Controller.text != value)
      digits3Controller.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    _updateFullPlate();
    if (value.length == 3) focusProv.requestFocus();
  }

  void _onProvinceChanged() {
    if (_isReadOnly) return;
    String value = provinceController.text.replaceAll(RegExp(r"[^0-9]"), "");
    if (value.length > 2) value = value.substring(0, 2);
    if (provinceController.text != value)
      provinceController.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    _updateFullPlate();
  }

  void _updateFullPlate() {
    if (_isReadOnly) return;
    widget.onPlateChange!.call("${digits1Controller.text}$letter${digits3Controller.text}${provinceController.text}");
  }

  void _showLetterMenu() {
    if (_isReadOnly) return;
    _overlayEntry?.remove();
    final RenderBox renderBox = _letterButtonKey.currentContext!.findRenderObject()! as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    final ColorScheme scheme = Theme.of(context).colorScheme;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Stack(
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              onTap: _hideLetterMenu,
              child: const ColoredBox(color: Color(0x00000000)),
            ),
          ),
          Positioned(
            top: offset.dy + size.height,
            left: offset.dx,
            width: size.width,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: scheme.outlineVariant),
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: uPlateLetters
                          .map(
                            (String ch) => InkWell(
                              onTap: () {
                                setState(() => letter = ch);
                                _hideLetterMenu();
                                _updateFullPlate();
                                WidgetsBinding.instance.addPostFrameCallback((_) => focus3.requestFocus());
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: scheme.outlineVariant)),
                                ),
                                child: Text(
                                  ch,
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: scheme.onSurface),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideLetterMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    digits1Controller.dispose();
    digits3Controller.dispose();
    provinceController.dispose();
    focus1.dispose();
    focus3.dispose();
    focusProv.dispose();
    letterFocusNode.dispose();
    _hideLetterMenu();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8),
    child: Row(
      children: <Widget>[
        _buildTextField(controller: provinceController, focusNode: focusProv, hint: "--", irPrefix: true, readOnly: _isReadOnly).expanded(flex: 3),
        const SizedBox(width: 4),
        _buildTextField(controller: digits3Controller, focusNode: focus3, hint: "---", readOnly: _isReadOnly).expanded(flex: 3),
        const SizedBox(width: 4),
        GestureDetector(
          key: _letterButtonKey,
          onTap: _isReadOnly ? null : _showLetterMenu,
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: letter.isEmpty ? _scheme.onSurfaceVariant : _scheme.onSurface, width: 1.5),
              borderRadius: BorderRadius.circular(8),
              color: _isReadOnly ? _scheme.surfaceContainerHighest : null,
            ),
            child: Center(
              child: Text(
                letter.isEmpty ? U.s.letter : letter,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: letter.isEmpty ? _scheme.onSurfaceVariant : (_isReadOnly ? _scheme.onSurfaceVariant : _scheme.onSurface)),
              ),
            ),
          ),
        ).expanded(flex: 2),
        const SizedBox(width: 4),
        _buildTextField(controller: digits1Controller, focusNode: focus1, hint: "--", readOnly: _isReadOnly).expanded(flex: 2),
        const SizedBox(width: 4),
        SizedBox(height: 52, child: SvgPicture.string(_irIran, fit: BoxFit.fill)).expanded(),
      ],
    ),
  );

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hint,
    bool irPrefix = false,
    bool readOnly = false,
  }) => TextField(
    controller: controller,
    focusNode: focusNode,
    textAlign: TextAlign.center,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    keyboardType: TextInputType.number,
    readOnly: readOnly,
    enableInteractiveSelection: !readOnly,
    decoration: InputDecoration(
      hintText: hint,
      prefix: irPrefix ? UTextLabelSmall(" ${U.s.iran} ") : null,
      hintStyle: TextStyle(fontSize: 18, color: _scheme.onSurfaceVariant),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: _scheme.onSurfaceVariant),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: _scheme.onSurfaceVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 2, color: _scheme.primary),
      ),
      contentPadding: const EdgeInsets.symmetric(),
      filled: readOnly,
      fillColor: readOnly ? _scheme.surfaceContainerHighest : null,
    ),
  );
}
