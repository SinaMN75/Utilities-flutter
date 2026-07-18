import "package:u/utilities.dart";

/// A self-contained, cross-platform **block** rich text editor that produces and
/// consumes HTML. No third-party editor packages are used.
///
/// Public API:
///  * [URichTextEditor] – embeddable block editor widget.
///  * [URichTextEditor.open] – push a full-screen editor and get the HTML back.
///
/// The document model, the HTML serializer/parser and the shared styling live in
/// `u_html_document.dart`; the read-only renderer is [UHtmlView] in
/// `u_html_view.dart`; the continuous, Word-like editor is [UDocumentEditor].

/// Signature for uploading a picked image and returning its final URL (or null
/// on failure). Provide your own to plug in any backend; when omitted the
/// editor uploads through `UServices.media`.
typedef URichImageUploader = Future<String?> Function(FileData file);

/// Embeddable block-based rich text editor.
///
/// Give it a bounded height (e.g. inside an `Expanded` or `SizedBox`).
/// Listen to [onChanged] for the live HTML, or use [URichTextEditor.open] for a
/// ready-made full-screen editing flow that returns the HTML.
class URichTextEditor extends StatefulWidget {
  const URichTextEditor({
    super.key,
    this.initialHtml,
    this.onChanged,
    this.onUploadImage,
    this.onAutoSave,
    this.autoSaveInterval = const Duration(seconds: 20),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.readOnly = false,
    this.showStatusBar = true,
  });

  final String? initialHtml;
  final ValueChanged<String>? onChanged;
  final URichImageUploader? onUploadImage;

  /// Called with the current HTML every [autoSaveInterval] while the document
  /// has unsaved edits.
  final ValueChanged<String>? onAutoSave;
  final Duration autoSaveInterval;
  final EdgeInsets padding;
  final bool readOnly;

  /// Show the word/character count footer.
  final bool showStatusBar;

  /// Push a full-screen editor and await the resulting HTML (null if cancelled).
  static Future<String?> open({String? initialHtml, URichImageUploader? onUploadImage}) =>
      UNavigator.push<String>(_URichTextEditorPage(initialHtml: initialHtml, onUploadImage: onUploadImage), fullscreenDialog: true);

  @override
  State<URichTextEditor> createState() => _URichTextEditorState();
}

class _URichTextEditorState extends State<URichTextEditor> {
  final List<UEditorBlock> _blocks = <UEditorBlock>[];
  final Map<String, TextSelection> _selCache = <String, TextSelection>{};
  final List<String> _history = <String>[];

  int _historyIndex = -1;
  int _activeIndex = 0;
  bool _uploading = false;
  bool _restoring = false;
  bool _dirty = false;
  Timer? _historyTimer;
  Timer? _autoSaveTimer;

  static const List<String> _codeLanguages = <String>["", "dart", "javascript", "typescript", "python", "java", "kotlin", "swift", "csharp", "sql", "json", "yaml", "html", "css", "bash"];

  @override
  void initState() {
    super.initState();
    _blocks.addAll(UHtmlDocument.parse(widget.initialHtml));
    for (final b in _blocks) _wireBlock(b);
    _history.add(UHtmlDocument.serialize(_blocks));
    _historyIndex = 0;
    if (widget.onAutoSave != null) _autoSaveTimer = Timer.periodic(widget.autoSaveInterval, (_) => _autoSave());
  }

  @override
  void dispose() {
    _historyTimer?.cancel();
    _autoSaveTimer?.cancel();
    for (final UEditorBlock b in _blocks) b.dispose();
    super.dispose();
  }

  void _autoSave() {
    if (!_dirty) return;
    _dirty = false;
    widget.onAutoSave?.call(_html);
  }

  String get _html => UHtmlDocument.serialize(_blocks);

  void _wireBlock(UEditorBlock b) {
    if (!b.isText) return;
    b.focusNode!.addListener(() {
      if (b.focusNode!.hasFocus) setState(() => _activeIndex = _blocks.indexOf(b));
    });
    b.controller!.addListener(() => _onControllerChanged(b));
    b.focusNode!.onKeyEvent = (FocusNode node, KeyEvent event) => _handleKey(b, event);
  }

  void _onControllerChanged(UEditorBlock b) {
    final TextSelection sel = b.controller!.selection;
    if (sel.isValid) _selCache[b.id] = sel;
    if (mounted) setState(() {});
    _notifyChanged();
  }

  void _notifyChanged() {
    if (_restoring) return;
    _dirty = true;
    widget.onChanged?.call(_html);
    _scheduleHistory();
  }

  // ---- undo / redo ---------------------------------------------------------

  // Snapshots are coalesced so a burst of typing collapses into one undo step.
  void _scheduleHistory() {
    _historyTimer?.cancel();
    _historyTimer = Timer(const Duration(milliseconds: 600), _pushHistory);
  }

  void _pushHistory() {
    final String html = _html;
    if (_historyIndex >= 0 && _historyIndex < _history.length && _history[_historyIndex] == html) return;
    if (_historyIndex < _history.length - 1) _history.removeRange(_historyIndex + 1, _history.length);
    _history.add(html);
    if (_history.length > 100) _history.removeAt(0);
    _historyIndex = _history.length - 1;
    if (mounted) setState(() {});
  }

  bool get _canUndo => _historyIndex > 0;

  bool get _canRedo => _historyIndex >= 0 && _historyIndex < _history.length - 1;

  void _undo() {
    _historyTimer?.cancel();
    _pushHistory();
    if (!_canUndo) return;
    _historyIndex--;
    _loadHtml(_history[_historyIndex]);
  }

  void _redo() {
    if (!_canRedo) return;
    _historyIndex++;
    _loadHtml(_history[_historyIndex]);
  }

  void _loadHtml(String html) {
    _restoring = true;
    setState(() {
      for (final UEditorBlock b in _blocks) b.dispose();
      _blocks
        ..clear()
        ..addAll(UHtmlDocument.parse(html));
      for (final b in _blocks) _wireBlock(b);
      _activeIndex = 0;
    });
    _restoring = false;
    _dirty = true;
    widget.onChanged?.call(html);
  }

  // ---- selection plumbing --------------------------------------------------

  void _onSelection(void Function(URichTextController c) action) {
    final UEditorBlock? b = _active;
    final URichTextController? c = b?.controller;
    if (b == null || c == null) return;
    if (!c.selection.isValid || c.selection.isCollapsed) {
      final TextSelection? cached = _selCache[b.id];
      if (cached != null && cached.isValid && !cached.isCollapsed) c.selection = cached;
    }
    action(c);
    b.focusNode!.requestFocus();
  }

  UEditorBlock? get _active => (_activeIndex >= 0 && _activeIndex < _blocks.length && _blocks[_activeIndex].isText) ? _blocks[_activeIndex] : null;

  URichTextController? get _activeController => _active?.controller;

  TextSelection? _restoredSelection() {
    final UEditorBlock? b = _active;
    final URichTextController? c = b?.controller;
    if (b == null || c == null) return null;
    if (!c.selection.isValid || c.selection.isCollapsed) {
      final TextSelection? cached = _selCache[b.id];
      if (cached != null && cached.isValid && !cached.isCollapsed) c.selection = cached;
    }
    return c.selection.isValid ? c.selection : null;
  }

  // ---- key handling --------------------------------------------------------

  KeyEventResult _handleKey(UEditorBlock b, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) return KeyEventResult.ignored;
    final bool meta = HardwareKeyboard.instance.isControlPressed || HardwareKeyboard.instance.isMetaPressed;
    final bool shift = HardwareKeyboard.instance.isShiftPressed;

    if (meta) {
      final LogicalKeyboardKey key = event.logicalKey;
      if (key == LogicalKeyboardKey.keyB) {
        _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.bold));
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.keyI) {
        _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.italic));
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.keyU) {
        _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.underline));
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.keyK) {
        _editLink();
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.keyF) {
        _findReplace();
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.keyZ) {
        if (shift)
          _redo();
        else
          _undo();
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.keyY) {
        _redo();
        return KeyEventResult.handled;
      }
    }

    if (event.logicalKey == LogicalKeyboardKey.tab && b.isList) {
      _indent(shift ? -1 : 1);
      return KeyEventResult.handled;
    }

    if (event.logicalKey != LogicalKeyboardKey.backspace) return KeyEventResult.ignored;
    final URichTextController c = b.controller!;
    if (!c.selection.isValid || !c.selection.isCollapsed || c.selection.baseOffset != 0) return KeyEventResult.ignored;
    final int index = _blocks.indexOf(b);
    if (index <= 0) return KeyEventResult.ignored;
    // Outdent first, so backspace at the start of a nested item un-nests it.
    if (b.indent > 0) {
      setState(() => b.indent--);
      _notifyChanged();
      return KeyEventResult.handled;
    }
    _mergeWithPrevious(index);
    return KeyEventResult.handled;
  }

  // ---- block structure operations -----------------------------------------

  void _onChanged(UEditorBlock b, String value) {
    if (_applyMarkdownShortcut(b, value)) return;
    if (!value.contains("\n")) return;
    final int index = _blocks.indexOf(b);
    final int nl = value.indexOf("\n");
    if (b.isList && value.trim().isEmpty) {
      setState(() {
        b.type = UBlockType.paragraph;
        b.indent = 0;
        b.controller!.value = const TextEditingValue();
      });
      _notifyChanged();
      return;
    }
    _splitAtNewline(index, nl);
  }

  // Turns "# ", "- ", "1. ", "> ", "[] " and "```" into the matching block type.
  bool _applyMarkdownShortcut(UEditorBlock b, String value) {
    if (b.type != UBlockType.paragraph) return false;
    UBlockType? type;
    int strip = 0;
    final RegExpMatch? heading = RegExp(r"^(#{1,6})\s").firstMatch(value);
    if (heading != null) {
      const List<UBlockType> levels = <UBlockType>[UBlockType.h1, UBlockType.h2, UBlockType.h3, UBlockType.h4, UBlockType.h5, UBlockType.h6];
      type = levels[heading.group(1)!.length - 1];
      strip = heading.group(0)!.length;
    } else if (value.startsWith("- ") || value.startsWith("* ")) {
      type = UBlockType.bulleted;
      strip = 2;
    } else if (RegExp(r"^\d+[.)]\s").hasMatch(value)) {
      type = UBlockType.numbered;
      strip = RegExp(r"^\d+[.)]\s").firstMatch(value)!.group(0)!.length;
    } else if (value.startsWith("> ")) {
      type = UBlockType.quote;
      strip = 2;
    } else if (value.startsWith("[] ") || value.startsWith("[ ] ")) {
      type = UBlockType.checklist;
      strip = value.startsWith("[] ") ? 3 : 4;
    } else if (value.startsWith("```")) {
      type = UBlockType.code;
      strip = 3;
    } else if (value == "---" || value == "***") {
      setState(() => b.controller!.value = const TextEditingValue());
      _insertBlockAfterActive(UEditorBlock(type: UBlockType.divider));
      return true;
    }
    if (type == null) return false;
    setState(() {
      b.type = type!;
      b.controller!.setContent(value.substring(strip), <UStyleSpan>[], caret: 0);
    });
    _notifyChanged();
    return true;
  }

  void _splitAtNewline(int index, int nl) {
    final UEditorBlock block = _blocks[index];
    final URichTextController c = block.controller!;
    final String full = c.text;
    final String after = full.substring(nl + 1);

    final List<UStyleSpan> afterSpans = <UStyleSpan>[];
    for (final UStyleSpan sp in c.spans) {
      final int s = (sp.start - (nl + 1)).clamp(0, after.length);
      final int e = (sp.end - (nl + 1)).clamp(0, after.length);
      if (e > s) afterSpans.add(UStyleSpan(start: s, end: e, attr: sp.attr, value: sp.value));
    }

    c.value = TextEditingValue(
      text: full.substring(0, nl),
      selection: TextSelection.collapsed(offset: nl),
    );

    final UBlockType nextType = block.isList || block.type == UBlockType.paragraph || block.type == UBlockType.code ? block.type : UBlockType.paragraph;
    final UEditorBlock newBlock = UEditorBlock.text(nextType, text: after, spans: afterSpans, align: block.align, indent: block.indent, language: block.language);

    setState(() => _blocks.insert(index + 1, newBlock));
    _wireBlock(newBlock);
    _notifyChanged();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      newBlock.focusNode!.requestFocus();
      newBlock.controller!.selection = const TextSelection.collapsed(offset: 0);
    });
  }

  void _mergeWithPrevious(int index) {
    final UEditorBlock prev = _blocks[index - 1];
    final UEditorBlock cur = _blocks[index];
    if (!prev.isText) {
      setState(() {
        prev.dispose();
        _blocks.removeAt(index - 1);
      });
      _notifyChanged();
      return;
    }
    final URichTextController pc = prev.controller!;
    final URichTextController cc = cur.controller!;
    final int junction = pc.text.length;

    final List<UStyleSpan> merged = <UStyleSpan>[for (final UStyleSpan sp in pc.spans) sp.copy()];
    for (final UStyleSpan sp in cc.spans) merged.add(UStyleSpan(start: sp.start + junction, end: sp.end + junction, attr: sp.attr, value: sp.value));

    pc.setContent(pc.text + cc.text, merged, caret: junction);

    setState(() {
      cur.dispose();
      _blocks.removeAt(index);
      _activeIndex = index - 1;
    });
    _notifyChanged();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      prev.focusNode!.requestFocus();
      pc.selection = TextSelection.collapsed(offset: junction);
    });
  }

  void _removeBlock(int index) {
    setState(() {
      _blocks[index].dispose();
      _blocks.removeAt(index);
      if (_blocks.isEmpty) {
        final UEditorBlock p = UEditorBlock.text(UBlockType.paragraph);
        _blocks.add(p);
        _wireBlock(p);
      }
      _activeIndex = index.clamp(0, _blocks.length - 1);
    });
    _notifyChanged();
  }

  void _duplicateBlock(int index) {
    final UEditorBlock src = _blocks[index];
    final UEditorBlock copy = src.isText
        ? UEditorBlock.text(src.type, text: src.controller!.text, spans: src.controller!.snapshotSpans(), align: src.align, indent: src.indent, checked: src.checked, language: src.language)
        : UEditorBlock(type: src.type, imageUrl: src.imageUrl, imageAlt: src.imageAlt, imageWidth: src.imageWidth, align: src.align, table: src.table?.copy());
    setState(() => _blocks.insert(index + 1, copy));
    _wireBlock(copy);
    _notifyChanged();
  }

  void _moveBlock(int index, int delta) {
    final int target = index + delta;
    if (target < 0 || target >= _blocks.length) return;
    setState(() {
      final UEditorBlock b = _blocks.removeAt(index);
      _blocks.insert(target, b);
      _activeIndex = target;
    });
    _notifyChanged();
  }

  void _reorder(int oldIndex, int newIndex) {
    setState(() {
      final int target = newIndex > oldIndex ? newIndex - 1 : newIndex;
      final UEditorBlock b = _blocks.removeAt(oldIndex);
      _blocks.insert(target, b);
      _activeIndex = target;
    });
    _notifyChanged();
  }

  void _insertBlockAfterActive(UEditorBlock block) {
    final int at = (_activeIndex + 1).clamp(0, _blocks.length);
    setState(() => _blocks.insert(at, block));
    if (block.isText) _wireBlock(block);
    _notifyChanged();
  }

  // ---- formatting actions --------------------------------------------------

  void _setBlockType(UBlockType type) {
    final UEditorBlock? b = _active;
    if (b == null) return;
    setState(() => b.type = type);
    _notifyChanged();
    b.focusNode!.requestFocus();
  }

  void _setAlign(TextAlign align) {
    final UEditorBlock? b = _blocks.isEmpty ? null : _blocks[_activeIndex.clamp(0, _blocks.length - 1)];
    if (b == null) return;
    setState(() => b.align = align);
    _notifyChanged();
  }

  void _indent(int delta) {
    final UEditorBlock? b = _active;
    if (b == null) return;
    setState(() => b.indent = (b.indent + delta).clamp(0, 8));
    _notifyChanged();
    b.focusNode!.requestFocus();
  }

  Future<void> _pickColor(UInlineAttr attr) async {
    final TextSelection? sel = _restoredSelection();
    final URichTextController? c = _activeController;
    if (sel == null || c == null) return;
    final int? picked = await UEditorDialogs.pickColor(context: context, current: c.activeValue(attr) as int?, title: attr == UInlineAttr.highlight ? U.s.highlightColor : U.s.textColor);
    if (picked == null) return;
    c.selection = sel;
    c.applyValue(attr, picked == 0 ? null : picked);
    _active?.focusNode!.requestFocus();
  }

  Future<void> _editLink() async {
    final TextSelection? sel = _restoredSelection();
    final URichTextController? c = _activeController;
    if (sel == null || c == null) return;
    final String? url = await UEditorDialogs.editLink(existing: c.activeLink());
    if (url == null) return;
    c.selection = sel;
    c.applyValue(UInlineAttr.link, url.trim().isEmpty ? null : url.trim());
    _active?.focusNode!.requestFocus();
  }

  Future<void> _insertTable() async {
    final UTableData? table = await UEditorDialogs.insertTable();
    if (table != null) _insertBlockAfterActive(UEditorBlock(type: UBlockType.table, table: table));
  }

  Future<void> _editHtmlSource() async {
    final String? edited = await UEditorDialogs.htmlSource(html: _html);
    if (edited != null) {
      _loadHtml(edited);
      _pushHistory();
    }
  }

  Future<void> _findReplace() async {
    final UFindReplaceRequest? request = await UEditorDialogs.findReplace();
    if (request == null || request.find.isEmpty) return;
    final Pattern pattern = request.matchCase ? request.find : RegExp(RegExp.escape(request.find), caseSensitive: false);
    int count = 0;
    for (final UEditorBlock b in _blocks) {
      if (b.isText) {
        final String old = b.controller!.text;
        final int hits = pattern.allMatches(old).length;
        if (hits == 0) continue;
        count += hits;
        b.controller!.value = TextEditingValue(text: old.replaceAll(pattern, request.replace), selection: const TextSelection.collapsed(offset: 0));
        continue;
      }
      final UTableData? table = b.table;
      if (table == null) continue;
      for (final List<String> row in table.rows) {
        for (int i = 0; i < row.length; i++) {
          final int hits = pattern.allMatches(row[i]).length;
          if (hits == 0) continue;
          count += hits;
          row[i] = row[i].replaceAll(pattern, request.replace);
        }
      }
    }
    setState(() {});
    _notifyChanged();
    UToast.snackBar(message: count == 0 ? U.s.noMatchesFound : "${U.s.replacedCount}: $count");
  }

  Future<void> _insertImage() async {
    await UFile.showFilePicker(
      allowedExtensions: const <String>["jpg", "jpeg", "png", "gif", "webp"],
      action: (List<FileData> files) async {
        if (files.isEmpty) return;
        setState(() => _uploading = true);
        final URichImageUploader uploader = widget.onUploadImage ?? _defaultUpload;
        final String? url = await uploader(files.first);
        if (!mounted) return;
        setState(() => _uploading = false);
        if (url == null) {
          UToast.error(message: U.s.errorSubmittingForm);
          return;
        }
        _insertBlockAfterActive(UEditorBlock(type: UBlockType.image, imageUrl: url));
      },
    );
  }

  Future<String?> _defaultUpload(FileData file) async {
    final Completer<String?> completer = Completer<String?>();
    await UServices.media.create(
      p: UMediaCreateParams(file: file, tag1: TagMedia.image.number),
      onOk: (UResponse<String> r) => completer.complete(r.message.startsWith("http") ? r.message : r.result),
      onError: (UEmptyResponse e) => completer.complete(null),
      onException: (String e) => completer.complete(null),
    );
    return completer.future;
  }

  void _preview() => UNavigator.dialog(
    AlertDialog(
      title: Text(U.s.preview),
      content: SizedBox(
        width: 720,
        child: SingleChildScrollView(child: UHtmlView(html: _html, selectable: true)),
      ),
      actions: <Widget>[TextButton(onPressed: UNavigator.back, child: Text(U.s.ok))],
    ),
  );

  // ---- build ---------------------------------------------------------------

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      if (!widget.readOnly) _toolbar(),
      if (_uploading) LinearProgressIndicator(minHeight: 2, color: Theme.of(context).colorScheme.primary),
      const Divider(height: 1),
      ReorderableListView.builder(
        padding: widget.padding,
        buildDefaultDragHandles: false,
        itemCount: _blocks.length,
        onReorder: _reorder,
        itemBuilder: (BuildContext context, int index) => _blockRow(index),
      ).expanded(),
      if (widget.showStatusBar) _statusBar(),
    ],
  );

  Widget _statusBar() {
    final String html = _html;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        children: <Widget>[
          UTextBodySmall("${U.s.words}: ${UHtmlDocument.wordCount(html)}   ${U.s.characters}: ${UHtmlDocument.characterCount(html)}").expanded(),
          UTextBodySmall("${UHtmlDocument.readingMinutes(html)} ${U.s.minutes}"),
        ],
      ),
    );
  }

  Widget _toolbar() {
    final URichTextController? c = _activeController;
    final Set<UInlineAttr> active = c?.activeAttributes() ?? <UInlineAttr>{};
    final UBlockType type = _active?.type ?? UBlockType.paragraph;
    final Object? family = c?.activeValue(UInlineAttr.fontFamily);
    final Object? size = c?.activeValue(UInlineAttr.fontSize);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: <Widget>[
          UEditorToolButton(icon: Icons.undo, tooltip: U.s.undo, onTap: _canUndo ? _undo : null),
          UEditorToolButton(icon: Icons.redo, tooltip: U.s.redo, onTap: _canRedo ? _redo : null),
          const UEditorToolSeparator(),
          _blockTypeMenu(type),
          _fontFamilyMenu(family as String?),
          _fontSizeMenu(size as double?),
          const UEditorToolSeparator(),
          UEditorToolButton(
            icon: Icons.format_bold,
            tooltip: U.s.bold,
            active: active.contains(UInlineAttr.bold),
            onTap: () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.bold)),
          ),
          UEditorToolButton(
            icon: Icons.format_italic,
            tooltip: U.s.italic,
            active: active.contains(UInlineAttr.italic),
            onTap: () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.italic)),
          ),
          UEditorToolButton(
            icon: Icons.format_underlined,
            tooltip: U.s.underline,
            active: active.contains(UInlineAttr.underline),
            onTap: () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.underline)),
          ),
          UEditorToolButton(
            icon: Icons.strikethrough_s,
            tooltip: U.s.strikethrough,
            active: active.contains(UInlineAttr.strikethrough),
            onTap: () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.strikethrough)),
          ),
          UEditorToolButton(
            icon: Icons.code,
            tooltip: U.s.inlineCode,
            active: active.contains(UInlineAttr.code),
            onTap: () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.code)),
          ),
          UEditorToolButton(
            icon: Icons.superscript,
            tooltip: U.s.superscript,
            active: active.contains(UInlineAttr.superscript),
            onTap: () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.superscript)),
          ),
          UEditorToolButton(
            icon: Icons.subscript,
            tooltip: U.s.subscript,
            active: active.contains(UInlineAttr.subscript),
            onTap: () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.subscript)),
          ),
          const UEditorToolSeparator(),
          UEditorToolButton(icon: Icons.format_color_text, tooltip: U.s.textColor, onTap: () => _pickColor(UInlineAttr.color)),
          UEditorToolButton(icon: Icons.border_color_outlined, tooltip: U.s.highlightColor, onTap: () => _pickColor(UInlineAttr.highlight)),
          UEditorToolButton(icon: Icons.link, tooltip: U.s.insertLink, active: c?.activeLink() != null, onTap: _editLink),
          const UEditorToolSeparator(),
          UEditorToolButton(
            icon: Icons.format_list_bulleted,
            tooltip: U.s.bulletedList,
            active: type == UBlockType.bulleted,
            onTap: () => _setBlockType(type == UBlockType.bulleted ? UBlockType.paragraph : UBlockType.bulleted),
          ),
          UEditorToolButton(
            icon: Icons.format_list_numbered,
            tooltip: U.s.numberedList,
            active: type == UBlockType.numbered,
            onTap: () => _setBlockType(type == UBlockType.numbered ? UBlockType.paragraph : UBlockType.numbered),
          ),
          UEditorToolButton(
            icon: Icons.checklist,
            tooltip: U.s.checklist,
            active: type == UBlockType.checklist,
            onTap: () => _setBlockType(type == UBlockType.checklist ? UBlockType.paragraph : UBlockType.checklist),
          ),
          UEditorToolButton(icon: Icons.format_indent_decrease, tooltip: U.s.decreaseIndent, onTap: () => _indent(-1)),
          UEditorToolButton(icon: Icons.format_indent_increase, tooltip: U.s.increaseIndent, onTap: () => _indent(1)),
          const UEditorToolSeparator(),
          UEditorToolButton(icon: Icons.format_align_left, tooltip: U.s.alignLeft, active: _active?.align == TextAlign.left, onTap: () => _setAlign(TextAlign.left)),
          UEditorToolButton(icon: Icons.format_align_center, tooltip: U.s.alignCenter, active: _active?.align == TextAlign.center, onTap: () => _setAlign(TextAlign.center)),
          UEditorToolButton(icon: Icons.format_align_right, tooltip: U.s.alignRight, active: _active?.align == TextAlign.right, onTap: () => _setAlign(TextAlign.right)),
          UEditorToolButton(icon: Icons.format_align_justify, tooltip: U.s.alignJustify, active: _active?.align == TextAlign.justify, onTap: () => _setAlign(TextAlign.justify)),
          const UEditorToolSeparator(),
          UEditorToolButton(icon: Icons.image_outlined, tooltip: U.s.insertImage, onTap: _insertImage),
          UEditorToolButton(icon: Icons.table_chart_outlined, tooltip: U.s.insertTable, onTap: _insertTable),
          UEditorToolButton(
            icon: Icons.horizontal_rule,
            tooltip: U.s.divider,
            onTap: () => _insertBlockAfterActive(UEditorBlock(type: UBlockType.divider)),
          ),
          UEditorToolButton(icon: Icons.format_clear, tooltip: U.s.clearFormatting, onTap: () => _onSelection((URichTextController c) => c.clearFormatting())),
          const UEditorToolSeparator(),
          UEditorToolButton(icon: Icons.find_replace, tooltip: U.s.findAndReplace, onTap: _findReplace),
          UEditorToolButton(icon: Icons.data_object, tooltip: U.s.htmlSource, onTap: _editHtmlSource),
          UEditorToolButton(
            icon: Icons.info_outline,
            tooltip: U.s.documentInfo,
            onTap: () => UEditorDialogs.documentInfo(html: _html),
          ),
          UEditorToolButton(icon: Icons.visibility_outlined, tooltip: U.s.preview, onTap: _preview),
        ].map((Widget w) => Padding(padding: const EdgeInsets.symmetric(horizontal: 1), child: w)).toList(),
      ),
    );
  }

  Widget _blockTypeMenu(UBlockType type) => UEditorDropdown<UBlockType>(
    label: UEditorStyles.label(type),
    tooltip: U.s.paragraph,
    width: 130,
    onSelected: _setBlockType,
    items: <UEditorMenuEntry<UBlockType>>[
      for (final UBlockType t in <UBlockType>[
        UBlockType.paragraph,
        UBlockType.h1,
        UBlockType.h2,
        UBlockType.h3,
        UBlockType.h4,
        UBlockType.h5,
        UBlockType.h6,
        UBlockType.quote,
        UBlockType.bulleted,
        UBlockType.numbered,
        UBlockType.checklist,
        UBlockType.code,
      ])
        UEditorMenuEntry<UBlockType>(value: t, label: UEditorStyles.label(t)),
    ],
  );

  Widget _fontFamilyMenu(String? current) => UEditorDropdown<String>(
    label: current ?? U.s.fontFamily,
    tooltip: U.s.fontFamily,
    width: 120,
    onSelected: (String f) => _onSelection((URichTextController c) => c.applyValue(UInlineAttr.fontFamily, f == UEditorStyles.fontFamilies.first ? null : f)),
    items: <UEditorMenuEntry<String>>[
      for (final String f in UEditorStyles.fontFamilies)
        UEditorMenuEntry<String>(
          value: f,
          label: f,
          style: TextStyle(fontFamily: f == UEditorStyles.fontFamilies.first ? null : f),
        ),
    ],
  );

  Widget _fontSizeMenu(double? current) => UEditorDropdown<double>(
    label: current == null ? U.s.fontSize : "${current.toInt()}",
    tooltip: U.s.fontSize,
    width: 78,
    onSelected: (double s) => _onSelection((URichTextController c) => c.applyValue(UInlineAttr.fontSize, s <= 0 ? null : s)),
    items: <UEditorMenuEntry<double>>[
      UEditorMenuEntry<double>(value: 0, label: U.s.none),
      for (final double s in UEditorStyles.fontSizes) UEditorMenuEntry<double>(value: s, label: "${s.toInt()}"),
    ],
  );

  // ---- block rendering -----------------------------------------------------

  Widget _blockRow(int index) {
    final UEditorBlock b = _blocks[index];
    return Padding(
      key: ValueKey<String>(b.id),
      padding: EdgeInsets.only(top: 3, bottom: 3, left: b.indent * UHtmlDocument.indentStep),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _blockBody(b).expanded(),
          if (!widget.readOnly) _blockControls(index),
        ],
      ),
    );
  }

  Widget _blockControls(int index) => ReorderableDelayedDragStartListener(
    index: index,
    child: PopupMenuButton<String>(
      icon: Icon(Icons.drag_indicator, size: 18, color: Theme.of(context).colorScheme.outline),
      tooltip: "",
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          onTap: () => _moveBlock(index, -1),
          child: UIconTextHorizontal(leading: const Icon(Icons.arrow_upward, size: 18), trailing: Text(U.s.moveUp)),
        ),
        PopupMenuItem<String>(
          onTap: () => _moveBlock(index, 1),
          child: UIconTextHorizontal(leading: const Icon(Icons.arrow_downward, size: 18), trailing: Text(U.s.moveDown)),
        ),
        PopupMenuItem<String>(
          onTap: () => _duplicateBlock(index),
          child: UIconTextHorizontal(leading: const Icon(Icons.copy_all_outlined, size: 18), trailing: Text(U.s.duplicateBlock)),
        ),
        PopupMenuItem<String>(
          onTap: () => _removeBlock(index),
          child: UIconTextHorizontal(
            leading: Icon(Icons.delete_outline, size: 18, color: Theme.of(context).colorScheme.error),
            trailing: Text(U.s.removeBlock, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        ),
      ],
    ),
  );

  Widget _blockBody(UEditorBlock b) {
    switch (b.type) {
      case UBlockType.image:
        return _imageBlock(b);
      case UBlockType.divider:
        return const Divider(thickness: 2).pSymmetric(vertical: 8);
      case UBlockType.table:
        return _tableBlock(b);
      default:
        return _textBlock(b);
    }
  }

  Widget _textBlock(UEditorBlock b) {
    final TextStyle style = UEditorStyles.baseStyle(context, b.type);
    final Widget field = TextField(
      controller: b.controller,
      focusNode: b.focusNode,
      style: style,
      textAlign: b.align,
      maxLines: null,
      readOnly: widget.readOnly,
      keyboardType: TextInputType.multiline,
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration.collapsed(
        hintText: U.s.writeSomething,
        hintStyle: style.copyWith(color: Theme.of(context).hintColor),
      ),
      onChanged: (String v) => _onChanged(b, v),
    );

    Widget content = field;
    if (b.isList) {
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 2, right: 8, left: 4), child: _listMarker(b, style)),
          field.expanded(),
        ],
      );
    } else if (b.type == UBlockType.code) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_codeLanguageMenu(b), field],
      );
    }

    return UEditorStyles.decorate(context, b.type, content);
  }

  Widget _listMarker(UEditorBlock b, TextStyle style) {
    if (b.type == UBlockType.checklist) {
      return SizedBox(
        width: 24,
        height: 24,
        child: Checkbox(
          value: b.checked,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (bool? v) {
            setState(() => b.checked = v ?? false);
            _notifyChanged();
          },
        ),
      );
    }
    return Text(b.type == UBlockType.numbered ? "${_listOrdinal(b)}." : "•", style: style);
  }

  Widget _codeLanguageMenu(UEditorBlock b) => Align(
    alignment: Alignment.centerLeft,
    child: UEditorDropdown<String>(
      label: (b.language ?? "").isEmpty ? U.s.codeLanguage : b.language!,
      tooltip: U.s.codeLanguage,
      onSelected: (String v) {
        setState(() => b.language = v.isEmpty ? null : v);
        _notifyChanged();
      },
      items: <UEditorMenuEntry<String>>[
        for (final String l in _codeLanguages) UEditorMenuEntry<String>(value: l, label: l.isEmpty ? U.s.none : l),
      ],
    ),
  );

  int _listOrdinal(UEditorBlock b) {
    int n = 0;
    for (final UEditorBlock x in _blocks) {
      if (x.type == b.type) n++;
      if (identical(x, b)) break;
      if (x.type != b.type) n = 0;
    }
    return n;
  }

  Widget _tableBlock(UEditorBlock b) {
    b.table ??= UTableData.empty();
    final UTableData table = b.table!;
    final ColorScheme cs = Theme.of(context).colorScheme;
    final BorderSide side = BorderSide(color: cs.outlineVariant);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Table(
          border: TableBorder(top: side, bottom: side, left: side, right: side, horizontalInside: side, verticalInside: side),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            for (int r = 0; r < table.rows.length; r++)
              TableRow(
                decoration: BoxDecoration(color: table.hasHeader && r == 0 ? cs.surfaceContainerHighest : null),
                children: <Widget>[
                  for (int col = 0; col < table.rows[r].length; col++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: TextFormField(
                        initialValue: table.rows[r][col],
                        readOnly: widget.readOnly,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: table.hasHeader && r == 0 ? FontWeight.bold : null),
                        decoration: const InputDecoration(isDense: true, border: InputBorder.none),
                        onChanged: (String v) {
                          table.rows[r][col] = v;
                          _notifyChanged();
                        },
                      ),
                    ),
                ],
              ),
          ],
        ),
        if (!widget.readOnly)
          Row(
            children: <Widget>[
              UEditorToolButton(icon: Icons.add, tooltip: U.s.addRow, size: 16, onTap: () => setState(table.addRow)),
              UEditorToolButton(icon: Icons.add_box_outlined, tooltip: U.s.addColumn, size: 16, onTap: () => setState(table.addColumn)),
              UEditorToolButton(icon: Icons.remove, tooltip: U.s.removeRow, size: 16, onTap: () => setState(() => table.removeRow(table.rowCount - 1))),
              UEditorToolButton(icon: Icons.indeterminate_check_box_outlined, tooltip: U.s.removeColumn, size: 16, onTap: () => setState(() => table.removeColumn(table.columnCount - 1))),
              UEditorToolButton(
                icon: Icons.table_rows_outlined,
                tooltip: U.s.headerRow,
                size: 16,
                active: table.hasHeader,
                onTap: () {
                  setState(() => table.hasHeader = !table.hasHeader);
                  _notifyChanged();
                },
              ),
            ],
          ),
      ],
    ).pSymmetric(vertical: 6);
  }

  Widget _imageBlock(UEditorBlock b) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Align(
        alignment: b.align == TextAlign.center
            ? Alignment.center
            : b.align == TextAlign.right
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: UImage(b.imageUrl ?? "", width: b.imageWidth ?? double.infinity, height: 220),
        ),
      ),
      if (!widget.readOnly)
        Row(
          children: <Widget>[
            UEditorToolButton(icon: Icons.format_align_left, tooltip: U.s.alignLeft, size: 16, active: b.align == TextAlign.left, onTap: () => _setImageAlign(b, TextAlign.left)),
            UEditorToolButton(icon: Icons.format_align_center, tooltip: U.s.alignCenter, size: 16, active: b.align == TextAlign.center, onTap: () => _setImageAlign(b, TextAlign.center)),
            UEditorToolButton(icon: Icons.format_align_right, tooltip: U.s.alignRight, size: 16, active: b.align == TextAlign.right, onTap: () => _setImageAlign(b, TextAlign.right)),
            SizedBox(
              width: 140,
              child: Slider(
                value: (b.imageWidth ?? 640).clamp(80, 1200).toDouble(),
                min: 80,
                max: 1200,
                onChanged: (double v) => setState(() => b.imageWidth = v),
                onChangeEnd: (double v) => _notifyChanged(),
              ),
            ),
            UEditorToolButton(icon: Icons.fit_screen_outlined, tooltip: U.s.imageWidth, size: 16, onTap: () => _setImageWidth(b, null)),
          ],
        ),
      TextFormField(
        initialValue: b.imageAlt,
        readOnly: widget.readOnly,
        decoration: InputDecoration(isDense: true, hintText: U.s.imageAltText, border: InputBorder.none),
        style: Theme.of(context).textTheme.bodySmall,
        onChanged: (String v) {
          b.imageAlt = v;
          _notifyChanged();
        },
      ),
    ],
  ).pSymmetric(vertical: 6);

  void _setImageAlign(UEditorBlock b, TextAlign align) {
    setState(() => b.align = align);
    _notifyChanged();
  }

  void _setImageWidth(UEditorBlock b, double? width) {
    setState(() => b.imageWidth = width);
    _notifyChanged();
  }
}

/// Full-screen editor page used by [URichTextEditor.open]. Returns the HTML via
/// [UNavigator.back] when the check action is tapped.
class _URichTextEditorPage extends StatefulWidget {
  const _URichTextEditorPage({this.initialHtml, this.onUploadImage});

  final String? initialHtml;
  final URichImageUploader? onUploadImage;

  @override
  State<_URichTextEditorPage> createState() => _URichTextEditorPageState();
}

class _URichTextEditorPageState extends State<_URichTextEditorPage> {
  late String _html = widget.initialHtml ?? "";

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(U.s.richTextEditor),
      actions: <Widget>[IconButton(icon: const Icon(Icons.check), tooltip: U.s.submit, onPressed: () => UNavigator.back(_html))],
    ),
    body: URichTextEditor(initialHtml: widget.initialHtml, onUploadImage: widget.onUploadImage, onChanged: (String h) => _html = h),
  );
}
