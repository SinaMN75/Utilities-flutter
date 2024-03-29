part of 'components.dart';

class IconProperty {
  IconProperty({this.icon, this.color, this.size});

  final IconData? icon;
  final Color? color;
  final double? size;
}

class CheckBoxProperty {
  CheckBoxProperty({
    this.tristate = false,
    this.mouseCursor,
    this.activeColor,
    this.fillColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
    this.shape,
    this.side,
  });

  final MouseCursor? mouseCursor;
  final Color? activeColor;
  final MaterialStateProperty<Color?>? fillColor;
  final Color? checkColor;
  final bool tristate;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
  static const double width = 18.0;
}

class DropDownTextField extends StatefulWidget {
  const DropDownTextField({final Key? key, this.controller, this.initialValue, required this.dropDownList, this.padding, this.textStyle, this.onChanged, this.validator, this.isEnabled = true, this.enableSearch = false, this.readOnly = true, this.dropdownRadius = 12, this.textFieldDecoration, this.dropDownIconProperty, this.dropDownItemCount = 6, this.searchFocusNode, this.textFieldFocusNode, this.searchAutofocus = false, this.searchDecoration, this.searchShowCursor, this.searchKeyboardType, this.listSpace = 0, this.clearOption = true, this.clearIconProperty, this.listPadding, this.listTextStyle, this.keyboardType, this.autovalidateMode})
      : assert(
          !(initialValue != null && controller != null),
          "you cannot add both initialValue and singleController,\nset initial value using controller \n\tEg: SingleValueDropDownController(data:initial value) ",
        ),
        assert(!(!readOnly && enableSearch), "readOnly!=true or enableSearch=true both condition does not work"),
        assert(
          !(controller != null && !(controller is SingleValueDropDownController)),
          "controller must be type of SingleValueDropDownController",
        ),
        checkBoxProperty = null,
        isMultiSelection = false,
        singleController = controller,
        multiController = null,
        displayCompleteItem = false,
        submitButtonColor = null,
        submitButtonText = null,
        submitButtonTextStyle = null,
        super(key: key);

  const DropDownTextField.multiSelection({final Key? key, this.controller, this.displayCompleteItem = false, this.initialValue, required this.dropDownList, this.padding, this.textStyle, this.onChanged, this.validator, this.isEnabled = true, this.dropdownRadius = 12, this.dropDownIconProperty, this.textFieldDecoration, this.dropDownItemCount = 6, this.searchFocusNode, this.textFieldFocusNode, this.listSpace = 0, this.clearOption = true, this.clearIconProperty, this.submitButtonColor, this.submitButtonText, this.submitButtonTextStyle, this.listPadding, this.listTextStyle, this.checkBoxProperty, this.autovalidateMode})
      : assert(initialValue == null || controller == null, "you cannot add both initialValue and multiController\nset initial value using controller\n\tMultiValueDropDownController(data:initial value)"),
        assert(
          !(controller != null && !(controller is MultiValueDropDownController)),
          "controller must be type of MultiValueDropDownController",
        ),
        multiController = controller,
        isMultiSelection = true,
        enableSearch = false,
        readOnly = true,
        searchAutofocus = false,
        searchKeyboardType = null,
        searchShowCursor = null,
        singleController = null,
        searchDecoration = null,
        keyboardType = null,
        super(key: key);

  final dynamic controller;
  final SingleValueDropDownController? singleController;
  final MultiValueDropDownController? multiController;
  final double dropdownRadius;
  final dynamic initialValue;
  final List<DropDownValueModel> dropDownList;
  final ValueSetter? onChanged;

  final bool isMultiSelection;

  final TextStyle? textStyle;

  final EdgeInsets? padding;
  final InputDecoration? textFieldDecoration;
  final IconProperty? dropDownIconProperty;
  final bool isEnabled;

  final FormFieldValidator<String>? validator;
  final bool enableSearch;

  final bool readOnly;
  final bool displayCompleteItem;

  final int dropDownItemCount;

  final FocusNode? searchFocusNode;
  final FocusNode? textFieldFocusNode;
  final InputDecoration? searchDecoration;
  final TextInputType? searchKeyboardType;
  final bool searchAutofocus;
  final bool? searchShowCursor;
  final bool clearOption;
  final IconProperty? clearIconProperty;
  final double listSpace;
  final ListPadding? listPadding;
  final String? submitButtonText;
  final Color? submitButtonColor;
  final TextStyle? submitButtonTextStyle;
  final TextStyle? listTextStyle;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final CheckBoxProperty? checkBoxProperty;

  @override
  _DropDownTextFieldState createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> with TickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  late TextEditingController _cnt;
  late String _hintText;

  late bool _isExpanded;
  OverlayEntry? _entry;
  OverlayEntry? _entry2;
  OverlayEntry? _barrierOverlay;
  final LayerLink _layerLink = LayerLink();
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  List<bool> _multiSelectionValue = [];
  late double _height;
  late List<DropDownValueModel> _dropDownList;
  late int _maxListItem;
  late double _searchWidgetHeight;
  late FocusNode _searchFocusNode;
  late FocusNode _textFieldFocusNode;
  late bool _isOutsideClickOverlay;
  late bool _isScrollPadding;
  final int _duration = 150;
  late Offset _offset;
  late bool _searchAutofocus;
  late bool _isPortrait;
  late double _listTileHeight;
  late double _keyboardHeight;
  late TextStyle _listTileTextStyle;
  late ListPadding _listPadding;

  @override
  void initState() {
    _cnt = TextEditingController();
    _keyboardHeight = 450;
    _searchAutofocus = false;
    _isScrollPadding = false;
    _isOutsideClickOverlay = false;
    _searchFocusNode = widget.searchFocusNode ?? FocusNode();
    _textFieldFocusNode = widget.textFieldFocusNode ?? FocusNode();
    _isExpanded = false;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _duration),
    );
    _heightFactor = _controller.drive(_easeInTween);
    _searchWidgetHeight = 60;
    _hintText = "Select Item";
    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus && !_textFieldFocusNode.hasFocus && _isExpanded && !widget.isMultiSelection) {
        _isExpanded = !_isExpanded;
        hideOverlay();
      }
    });
    _textFieldFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus && !_textFieldFocusNode.hasFocus && _isExpanded) {
        _isExpanded = !_isExpanded;
        hideOverlay();
        if (!widget.readOnly && widget.singleController?.dropDownValue?.name != _cnt.text) {
          setState(() {
            _cnt.clear();
          });
        }
      }
    });

    for (int i = 0; i < widget.dropDownList.length; i++) {
      _multiSelectionValue.add(false);
    }

    if (widget.initialValue != null) {
      _dropDownList = List.from(widget.dropDownList);
      if (widget.isMultiSelection) {
        for (int i = 0; i < widget.initialValue.length; i++) {
          final int index = _dropDownList.indexWhere((final DropDownValueModel element) => element.name.trim() == widget.initialValue[i].trim());
          if (index != -1) {
            _multiSelectionValue[index] = true;
          }
        }
        final int count = _multiSelectionValue.where((final bool element) => element).toList().length;

        _cnt.text = (count == 0
            ? ""
            : widget.displayCompleteItem
                ? widget.initialValue.join(",")
                : "$count item selected");
      } else {
        final int index = _dropDownList.indexWhere((final DropDownValueModel element) => element.name.trim() == widget.initialValue.trim());

        if (index != -1) {
          _cnt.text = widget.initialValue;
        }
      }
    }
    updateFunction();
    super.initState();
  }

  Size _textWidgetSize(final String text, final TextStyle style) {
    final TextPainter textPainter = TextPainter(text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  updateFunction({final DropDownTextField? oldWidget}) {
    final Function eq = const DeepCollectionEquality().equals;
    _dropDownList = List.from(widget.dropDownList);
    _listPadding = widget.listPadding ?? ListPadding();
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      if (widget.isMultiSelection) {
        if (oldWidget != null && !eq(oldWidget.dropDownList, _dropDownList)) {
          _multiSelectionValue = [];
          _cnt.text = "";
          for (int i = 0; i < _dropDownList.length; i++) {
            _multiSelectionValue.add(false);
          }
        }

        if (widget.multiController != null) {
          if (oldWidget != null && oldWidget.multiController!.dropDownValueList != null) {}
          if (widget.multiController!.dropDownValueList != null) {
            _multiSelectionValue = [];
            for (int i = 0; i < _dropDownList.length; i++) {
              _multiSelectionValue.add(false);
            }
            for (int i = 0; i < widget.multiController!.dropDownValueList!.length; i++) {
              final int index = _dropDownList.indexWhere((final DropDownValueModel element) => element == widget.multiController!.dropDownValueList![i]);
              if (index != -1) {
                _multiSelectionValue[index] = true;
              }
            }
            final int count = _multiSelectionValue.where((final bool element) => element).toList().length;
            _cnt.text = (count == 0
                ? ""
                : widget.displayCompleteItem
                    ? widget.initialValue.join(",")
                    : "$count item selected");
          } else {
            _multiSelectionValue = [];
            _cnt.text = "";
            for (int i = 0; i < _dropDownList.length; i++) {
              _multiSelectionValue.add(false);
            }
          }
        }
      } else {
        if (widget.singleController != null) {
          if (widget.singleController!.dropDownValue != null) {
            _cnt.text = widget.singleController!.dropDownValue!.name;
          } else {
            _cnt.clear();
          }
        }
      }

      _listTileTextStyle = (widget.listTextStyle ?? Theme.of(context).textTheme.bodyMedium)!;
      _listTileHeight = _textWidgetSize("dummy Text", _listTileTextStyle).height + _listPadding.top + _listPadding.bottom;
      _maxListItem = widget.dropDownItemCount;

      _height = (!widget.isMultiSelection
              ? (_dropDownList.length < _maxListItem ? _dropDownList.length * _listTileHeight : _listTileHeight * _maxListItem.toDouble())
              : _dropDownList.length < _maxListItem
                  ? _dropDownList.length * _listTileHeight
                  : _listTileHeight * _maxListItem.toDouble()) +
          10;
    });
  }

  @override
  void didUpdateWidget(covariant final DropDownTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateFunction(oldWidget: oldWidget);
  }

  @override
  void dispose() {
    if (widget.searchFocusNode == null) _searchFocusNode.dispose();
    if (widget.textFieldFocusNode == null) _textFieldFocusNode.dispose();
    _cnt.dispose();
    super.dispose();
  }

  clearFun() {
    if (_isExpanded) {
      _isExpanded = !_isExpanded;
      hideOverlay();
    }
    _cnt.clear();
    if (widget.isMultiSelection) {
      if (widget.multiController != null) {
        widget.multiController!.setDropDown(null);
      }
      if (widget.onChanged != null) {
        widget.onChanged!([]);
      }

      _multiSelectionValue = [];
      for (int i = 0; i < _dropDownList.length; i++) {
        _multiSelectionValue.add(false);
      }
    } else {
      if (widget.singleController != null) {
        widget.singleController!.setDropDown(null);
      }
      if (widget.onChanged != null) {
        widget.onChanged!("");
      }
    }
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) {
    _isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return KeyboardVisibilityBuilder(
      builder: (final BuildContext context, final bool isKeyboardVisible) {
        if (!isKeyboardVisible && _isExpanded && _isScrollPadding) {
          WidgetsBinding.instance.addPostFrameCallback((final _) {
            shiftOverlayEntry2to1();
          });
        }
        return CompositedTransformTarget(
          link: _layerLink,
          child: TextFormField(
            controller: _cnt,
            focusNode: _textFieldFocusNode,
            keyboardType: widget.keyboardType,
            autovalidateMode: widget.autovalidateMode,
            style: widget.textStyle,
            enabled: widget.isEnabled,
            readOnly: widget.readOnly,
            onTap: () {
              _searchAutofocus = widget.searchAutofocus;
              if (!_isExpanded) {
                if (_dropDownList.isNotEmpty) {
                  _showOverlay();
                }
              } else {
                if (widget.readOnly) hideOverlay();
              }
            },
            validator: (final String? value) => widget.validator != null ? widget.validator!(value) : null,
            decoration: widget.textFieldDecoration != null
                ? widget.textFieldDecoration!.copyWith(
                    suffixIcon: (_cnt.text.isEmpty || !widget.clearOption)
                        ? Icon(
                            widget.dropDownIconProperty?.icon ?? Icons.arrow_drop_down_outlined,
                            size: widget.dropDownIconProperty?.size,
                            color: widget.dropDownIconProperty?.color,
                          )
                        : widget.clearOption
                            ? InkWell(
                                onTap: clearFun,
                                child: Icon(
                                  widget.clearIconProperty?.icon ?? Icons.clear,
                                  size: widget.clearIconProperty?.size,
                                  color: widget.clearIconProperty?.color,
                                ),
                              )
                            : null,
                  )
                : InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: _hintText,
                    hintStyle: const TextStyle(fontWeight: FontWeight.normal),
                    suffixIcon: (_cnt.text.isEmpty || !widget.clearOption)
                        ? Icon(
                            widget.dropDownIconProperty?.icon ?? Icons.arrow_drop_down_outlined,
                            size: widget.dropDownIconProperty?.size,
                            color: widget.dropDownIconProperty?.color,
                          )
                        : widget.clearOption
                            ? InkWell(
                                onTap: clearFun,
                                child: Icon(
                                  widget.clearIconProperty?.icon ?? Icons.clear,
                                  size: widget.clearIconProperty?.size,
                                  color: widget.clearIconProperty?.color,
                                ),
                              )
                            : null,
                  ),
          ),
        );
      },
    );
  }

  Future<void> _showOverlay() async {
    _controller.forward();
    _isExpanded = true;
    final OverlayState overlay = Overlay.of(context);
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    _offset = renderBox.localToGlobal(Offset.zero);
    final double posFromTop = _offset.dy;
    final double posFromBot = MediaQuery.of(context).size.height - posFromTop;

    final double dropdownListHeight = _height + (widget.enableSearch ? _searchWidgetHeight : 0) + widget.listSpace;
    final double ht = dropdownListHeight + 120;
    if (_searchAutofocus && !(posFromBot < ht) && posFromBot < _keyboardHeight && !_isScrollPadding && _isPortrait) {
      _isScrollPadding = true;
    }
    _isOutsideClickOverlay = _isScrollPadding || (widget.readOnly && dropdownListHeight > (posFromTop - MediaQuery.of(context).padding.top - 15) && posFromBot < ht);
    final double topPaddingHeight = _isOutsideClickOverlay ? (dropdownListHeight - (posFromTop - MediaQuery.of(context).padding.top - 15)) : 0;

    final double htPos = posFromBot < ht
        ? size.height - 100 + topPaddingHeight
        : _isScrollPadding
            ? size.height - (_keyboardHeight - posFromBot)
            : size.height;
    if (_isOutsideClickOverlay) {
      _openOutSideClickOverlay(context);
    }
    _entry = OverlayEntry(
      builder: (final BuildContext context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
              targetAnchor: posFromBot < ht ? Alignment.bottomCenter : Alignment.topCenter,
              followerAnchor: posFromBot < ht ? Alignment.bottomCenter : Alignment.topCenter,
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(
                0,
                posFromBot < ht ? htPos - widget.listSpace : htPos + widget.listSpace,
              ),
              child: AnimatedBuilder(
                animation: _controller.view,
                builder: buildOverlay,
              ))),
    );
    _entry2 = OverlayEntry(
      builder: (final BuildContext context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
              targetAnchor: Alignment.bottomCenter,
              followerAnchor: Alignment.bottomCenter,
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(
                0,
                htPos,
              ),
              child: AnimatedBuilder(
                animation: _controller.view,
                builder: buildOverlay,
              ))),
    );
    overlay.insert(_isScrollPadding ? _entry2! : _entry!);
  }

  _openOutSideClickOverlay(final BuildContext context) {
    final OverlayState overlay2 = Overlay.of(context);
    _barrierOverlay = OverlayEntry(builder: (final BuildContext context) {
      final Size size = MediaQuery.of(context).size;
      return GestureDetector(
        onTap: hideOverlay,
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.transparent,
        ),
      );
    });
    overlay2.insert(_barrierOverlay!);
  }

  void hideOverlay() {
    if (!_isScrollPadding) {}
    _controller.reverse().then<void>((final void value) {
      if (_entry != null && _entry!.mounted) {
        _entry?.remove();
        _entry = null;
      }
      if (_entry2 != null && _entry2!.mounted) {
        _entry2?.remove();
        _entry2 = null;
      }

      if (_barrierOverlay != null && _barrierOverlay!.mounted) {
        _barrierOverlay?.remove();
        _barrierOverlay = null;
        _isOutsideClickOverlay = false;
      }
      _isScrollPadding = false;
      _isExpanded = false;
    });
    _textFieldFocusNode.unfocus();
  }

  void shiftOverlayEntry1to2() {
    _entry?.remove();
    _entry = null;
    if (_barrierOverlay != null && _barrierOverlay!.mounted) {
      _barrierOverlay?.remove();
      _barrierOverlay = null;
      _isOutsideClickOverlay = false;
    }
    _isScrollPadding = true;
    _showOverlay();
    _textFieldFocusNode.requestFocus();

    Future.delayed(Duration(milliseconds: _duration), () {
      _searchFocusNode.requestFocus();
    });
  }

  void shiftOverlayEntry2to1() {
    _searchAutofocus = false;
    _entry2?.remove();
    _entry2 = null;
    if (_barrierOverlay != null && _barrierOverlay!.mounted) {
      _barrierOverlay?.remove();
      _barrierOverlay = null;
      _isOutsideClickOverlay = false;
    }
    _controller.reset();
    _isScrollPadding = false;
    _showOverlay();
    _textFieldFocusNode.requestFocus();
  }

  Widget buildOverlay(final context, final child) => ClipRect(
        child: Align(
          heightFactor: _heightFactor.value,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(widget.dropdownRadius)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: !widget.isMultiSelection
                    ? SingleSelection(
                        mainController: _cnt,
                        autoSort: !widget.readOnly,
                        mainFocusNode: _textFieldFocusNode,
                        searchFocusNode: _searchFocusNode,
                        enableSearch: widget.enableSearch,
                        height: _height,
                        listTileHeight: _listTileHeight,
                        dropDownList: _dropDownList,
                        listTextStyle: _listTileTextStyle,
                        onChanged: (final item) {
                          setState(() {
                            _cnt.text = item.title;
                            _isExpanded = !_isExpanded;
                          });
                          if (widget.singleController != null) {
                            widget.singleController!.setDropDown(item);
                          }
                          if (widget.onChanged != null) {
                            widget.onChanged!(item);
                          }
                          hideOverlay();
                        },
                        searchHeight: _searchWidgetHeight,
                        searchKeyboardType: widget.searchKeyboardType,
                        searchAutofocus: _searchAutofocus,
                        searchDecoration: widget.searchDecoration,
                        searchShowCursor: widget.searchShowCursor,
                        listPadding: _listPadding,
                        clearIconProperty: widget.clearIconProperty,
                      )
                    : MultiSelection(
                        buttonTextStyle: widget.submitButtonTextStyle,
                        buttonText: widget.submitButtonText,
                        buttonColor: widget.submitButtonColor,
                        height: _height,
                        listTileHeight: _listTileHeight,
                        list: _multiSelectionValue,
                        dropDownList: _dropDownList,
                        listTextStyle: _listTileTextStyle,
                        listPadding: _listPadding,
                        onChanged: (final val) {
                          _isExpanded = !_isExpanded;
                          _multiSelectionValue = val;
                          List<DropDownValueModel> result = [];
                          final List completeList = [];
                          for (int i = 0; i < _multiSelectionValue.length; i++) {
                            if (_multiSelectionValue[i]) {
                              result.add(_dropDownList[i]);
                              completeList.add(_dropDownList[i].name);
                            }
                          }
                          final int count = _multiSelectionValue.where((final bool element) => element).toList().length;

                          _cnt.text = (count == 0
                              ? ""
                              : widget.displayCompleteItem
                                  ? completeList.join(",")
                                  : "$count item selected");
                          if (widget.multiController != null) {
                            widget.multiController!.setDropDown(result.isNotEmpty ? result : null);
                          }
                          if (widget.onChanged != null) {
                            widget.onChanged!(result);
                          }

                          hideOverlay();

                          setState(() {});
                        },
                        checkBoxProperty: widget.checkBoxProperty,
                      ),
              ),
            ),
          ),
        ),
      );
}

class SingleSelection extends StatefulWidget {
  const SingleSelection({final Key? key, required this.dropDownList, required this.onChanged, required this.height, required this.enableSearch, required this.searchHeight, required this.searchFocusNode, required this.mainFocusNode, this.searchKeyboardType, required this.searchAutofocus, this.searchShowCursor, required this.mainController, required this.autoSort, required this.listTileHeight, this.onSearchTap, this.onSearchSubmit, this.listTextStyle, this.searchDecoration, required this.listPadding, this.clearIconProperty}) : super(key: key);
  final List<DropDownValueModel> dropDownList;
  final ValueSetter onChanged;
  final double height;
  final double listTileHeight;
  final bool enableSearch;
  final double searchHeight;
  final FocusNode searchFocusNode;
  final FocusNode mainFocusNode;
  final TextInputType? searchKeyboardType;
  final bool searchAutofocus;
  final bool? searchShowCursor;
  final TextEditingController mainController;
  final bool autoSort;
  final Function? onSearchTap;
  final Function? onSearchSubmit;
  final TextStyle? listTextStyle;
  final ListPadding listPadding;
  final InputDecoration? searchDecoration;
  final IconProperty? clearIconProperty;

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  late List<DropDownValueModel> newDropDownList;
  late TextEditingController _searchCnt;
  late FocusScopeNode _focusScopeNode;
  late InputDecoration _inpDec;

  onItemChanged(final String value) {
    setState(() {
      if (value.isEmpty) {
        newDropDownList = List.from(widget.dropDownList);
      } else {
        newDropDownList = widget.dropDownList.where((final DropDownValueModel item) => item.name.toLowerCase().contains(value.toLowerCase())).toList();
      }
    });
  }

  @override
  void initState() {
    _focusScopeNode = FocusScopeNode();
    _inpDec = widget.searchDecoration ?? InputDecoration();
    if (widget.searchAutofocus) {
      widget.searchFocusNode.requestFocus();
    }
    _focusScopeNode.requestFocus();
    newDropDownList = List.from(widget.dropDownList);
    _searchCnt = TextEditingController();
    if (widget.autoSort) {
      onItemChanged(widget.mainController.text);
      widget.mainController.addListener(() {
        if (mounted) {
          onItemChanged(widget.mainController.text);
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _searchCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.enableSearch)
            SizedBox(
              height: widget.searchHeight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  focusNode: widget.searchFocusNode,
                  showCursor: widget.searchShowCursor,
                  keyboardType: widget.searchKeyboardType,
                  controller: _searchCnt,
                  onTap: () {
                    if (widget.onSearchTap != null) {
                      widget.onSearchTap!();
                    }
                  },
                  decoration: _inpDec.copyWith(
                    hintText: _inpDec.hintText ?? 'Search Here...',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        widget.mainFocusNode.requestFocus();
                        _searchCnt.clear();
                        onItemChanged("");
                      },
                      child: widget.searchFocusNode.hasFocus
                          ? InkWell(
                              child: Icon(
                                widget.clearIconProperty?.icon ?? Icons.close,
                                size: widget.clearIconProperty?.size,
                                color: widget.clearIconProperty?.color,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  onChanged: onItemChanged,
                  onSubmitted: (final String val) {
                    widget.mainFocusNode.requestFocus();
                    if (widget.onSearchSubmit != null) {
                      widget.onSearchSubmit!();
                    }
                  },
                ),
              ),
            ),
          SizedBox(
            height: widget.height,
            child: Scrollbar(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: newDropDownList.length,
                itemBuilder: (final BuildContext context, final int index) => InkWell(
                  onTap: () {
                    widget.onChanged(newDropDownList[index]);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: widget.listPadding.bottom, top: widget.listPadding.top),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(newDropDownList[index].name, style: widget.listTextStyle),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}

class MultiSelection extends StatefulWidget {
  const MultiSelection({final Key? key, required this.onChanged, required this.dropDownList, required this.list, required this.height, this.buttonColor, this.buttonText, this.buttonTextStyle, required this.listTileHeight, required this.listPadding, this.listTextStyle, this.checkBoxProperty}) : super(key: key);
  final List<DropDownValueModel> dropDownList;
  final ValueSetter onChanged;
  final List<bool> list;
  final double height;
  final Color? buttonColor;
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final double listTileHeight;
  final TextStyle? listTextStyle;
  final ListPadding listPadding;
  final CheckBoxProperty? checkBoxProperty;

  @override
  _MultiSelectionState createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<bool> multiSelectionValue = [];

  @override
  void initState() {
    multiSelectionValue = List.from(widget.list);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          SizedBox(
            height: widget.height,
            child: Scrollbar(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: widget.dropDownList.length,
                  itemBuilder: (final BuildContext context, final int index) => SizedBox(
                        height: widget.listTileHeight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: widget.listPadding.bottom, top: widget.listPadding.top),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(widget.dropDownList[index].name, style: widget.listTextStyle),
                                        ),
                                        if (widget.dropDownList[index].toolTipMsg != null) ToolTipWidget(msg: widget.dropDownList[index].toolTipMsg!)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Checkbox(
                                value: multiSelectionValue[index],
                                onChanged: (final bool? value) {
                                  if (value != null) {
                                    setState(() {
                                      multiSelectionValue[index] = value;
                                    });
                                  }
                                },
                                tristate: widget.checkBoxProperty?.tristate ?? false,
                                mouseCursor: widget.checkBoxProperty?.mouseCursor,
                                activeColor: widget.checkBoxProperty?.activeColor,
                                fillColor: widget.checkBoxProperty?.fillColor,
                                checkColor: widget.checkBoxProperty?.checkColor,
                                focusColor: widget.checkBoxProperty?.focusColor,
                                hoverColor: widget.checkBoxProperty?.hoverColor,
                                overlayColor: widget.checkBoxProperty?.overlayColor,
                                splashRadius: widget.checkBoxProperty?.splashRadius,
                                materialTapTargetSize: widget.checkBoxProperty?.materialTapTargetSize,
                                visualDensity: widget.checkBoxProperty?.visualDensity,
                                focusNode: widget.checkBoxProperty?.focusNode,
                                autofocus: widget.checkBoxProperty?.autofocus ?? false,
                                shape: widget.checkBoxProperty?.shape,
                                side: widget.checkBoxProperty?.side,
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 15, bottom: 10),
                child: InkWell(
                  onTap: () => widget.onChanged(multiSelectionValue),
                  child: Container(
                    height: widget.listTileHeight * 0.9,
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
                    decoration: BoxDecoration(color: widget.buttonColor ?? Colors.green, borderRadius: const BorderRadius.all(Radius.circular(12))),
                    child: Align(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          widget.buttonText ?? "Ok",
                          style: widget.buttonTextStyle ?? const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}

class DropDownValueModel extends Equatable {
  const DropDownValueModel({required this.name, required this.value, this.toolTipMsg});

  factory DropDownValueModel.fromJson(final Map<String, dynamic> json) => DropDownValueModel(
        name: json["name"],
        value: json["value"],
        toolTipMsg: json["toolTipMsg"],
      );
  final String name;
  final dynamic value;

  ///as of now only added for multiselection dropdown
  final String? toolTipMsg;

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "toolTipMsg": toolTipMsg,
      };

  @override
  List<Object> get props => [name, value];
}

class SingleValueDropDownController extends ChangeNotifier {
  SingleValueDropDownController({final DropDownValueModel? data}) {
    setDropDown(data);
  }

  DropDownValueModel? dropDownValue;

  setDropDown(final DropDownValueModel? model) {
    dropDownValue = model;
    notifyListeners();
  }

  clearDropDown() {
    dropDownValue = null;
    notifyListeners();
  }
}

class MultiValueDropDownController extends ChangeNotifier {
  MultiValueDropDownController({final List<DropDownValueModel>? data}) {
    setDropDown(data);
  }

  List<DropDownValueModel>? dropDownValueList;

  setDropDown(final List<DropDownValueModel>? modelList) {
    if (modelList != null && modelList.isNotEmpty) {
      List<DropDownValueModel> list = [];
      for (DropDownValueModel item in modelList) {
        if (!list.contains(item)) {
          list.add(item);
        }
      }
      dropDownValueList = list;
    } else {
      dropDownValueList = null;
    }
    notifyListeners();
  }

  clearDropDown() {
    dropDownValueList = null;
    notifyListeners();
  }
}

class ListPadding {
  ListPadding({this.top = 15, this.bottom = 15});

  double top;
  double bottom;
}

class KeyboardVisibilityBuilder extends StatefulWidget {
  const KeyboardVisibilityBuilder({
    final Key? key,
    required this.builder,
  }) : super(key: key);
  final Widget Function(
    BuildContext context,
    bool isKeyboardVisible,
  ) builder;

  @override
  _KeyboardVisibilityBuilderState createState() => _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder> with WidgetsBindingObserver {
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final double bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final bool newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  @override
  Widget build(final BuildContext context) => widget.builder(
        context,
        _isKeyboardVisible,
      );
}

class ToolTipWidget extends StatefulWidget {
  const ToolTipWidget({final Key? key, required this.msg}) : super(key: key);
  final String msg;

  @override
  State<ToolTipWidget> createState() => _ToolTipWidgetState();
}

class _ToolTipWidgetState extends State<ToolTipWidget> {
  late OverlayEntry overlayEntry;

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: () {
          _showOverlay(context);
        },
        child: const Icon(
          Icons.info_outlined,
          size: 20,
          color: Colors.blueAccent,
        ),
      );

  toolTipDialogue({required final BuildContext context, required final String msg}) {
    showAnimatedAlertDialog(context: context, content: Text(msg), icon: Icons.info_outlined, iconColor: Colors.blue, actionsAlignment: MainAxisAlignment.center, actions: [
      MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Colors.lightBlueAccent,
        child: const Text(
          "Ok",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ]);
  }

  showAnimatedAlertDialog({required final BuildContext context, required final Widget content, required final List<Widget> actions, final MainAxisAlignment? actionsAlignment, required final IconData icon, final Color? iconColor}) {
    const double size = 100;
    final AlertDialog alert = AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
        actionsPadding: const EdgeInsets.only(right: 20),
        title: Center(
          child: SizedBox(
            height: size,
            width: size,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 600),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (final BuildContext context, final double value, final Widget? child) => Icon(
                icon,
                size: size * value,
                color: iconColor ?? Colors.amber,
              ),
            ),
          ),
        ),
        content: content,
        actionsAlignment: actionsAlignment,
        actions: actions);

    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (final BuildContext context, final Animation<double> a1, final Animation<double> a2, final Widget widget) => Transform.scale(
              scale: a1.value,
              child: Opacity(opacity: a1.value, child: alert),
            ),
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (final BuildContext context, final Animation<double> animation1, final Animation<double> animation2) => const SizedBox.shrink());
  }

  void _showOverlay(final BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    const double size = 70;
    overlayEntry = OverlayEntry(
        builder: (final BuildContext context) => Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey.withOpacity(0.5),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: SizedBox(
                              height: size,
                              width: size,
                              child: TweenAnimationBuilder(
                                duration: const Duration(milliseconds: 600),
                                tween: Tween<double>(begin: 0, end: 1),
                                builder: (final BuildContext context, final double value, final Widget? child) => Icon(Icons.info_outlined, size: size * value, color: Colors.blue),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.msg,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.lightBlueAccent,
                            onPressed: closeOverlay,
                            child: const Text(
                              "Ok",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
    overlayState.insert(overlayEntry);
  }

  closeOverlay() {
    overlayEntry.remove();
  }
}
