import "package:u/utilities.dart";

/// A continuous, Word / WordPress style rich text editor.
///
/// Unlike [URichTextEditor] — which edits a list of discrete blocks — this
/// editor is a **single uninterrupted writing surface**: one caret, one
/// selection, one scroll. Pressing Enter starts a new paragraph in the same
/// field instead of creating a separate widget, so selecting across headings,
/// paragraphs and lists, and formatting them in one gesture, all work.
///
/// Images, tables and dividers are embedded in the flow as inline objects, and
/// the whole document still round-trips through the same HTML used by
/// [URichTextEditor] and [UHtmlView].
///
/// ```dart
/// UDocumentEditor(
///   initialHtml: article.body,
///   onChanged: (String html) => article.body = html,
/// )
/// ```

/// The character that stands in for an embedded object inside the text buffer.
const String uEmbedPlaceholder = "￼";

/// An object embedded in the document flow (image, table or divider).
class UEmbed {
  UEmbed({required this.offset, required this.type, this.url, this.alt, this.width, this.align = TextAlign.center, this.table});

  int offset;
  UBlockType type;
  String? url;
  String? alt;
  double? width;
  TextAlign align;
  UTableData? table;

  UEmbed copy() => UEmbed(offset: offset, type: type, url: url, alt: alt, width: width, align: align, table: table?.copy());
}

/// Paragraph level attributes attached to the line starting at [offset].
class UParagraphMark {
  UParagraphMark({required this.offset, this.type = UBlockType.paragraph, this.align = TextAlign.left, this.indent = 0, this.checked = false, this.language});

  int offset;
  UBlockType type;
  TextAlign align;
  int indent;
  bool checked;
  String? language;

  bool get isList => type == UBlockType.bulleted || type == UBlockType.numbered || type == UBlockType.checklist;

  /// The mark a newly created paragraph should start with. Lists and code
  /// continue; headings and quotes fall back to a plain paragraph.
  UParagraphMark inherit(int newOffset) => UParagraphMark(
    offset: newOffset,
    type: isList || type == UBlockType.code ? type : UBlockType.paragraph,
    align: align,
    indent: indent,
    language: language,
  );

  UParagraphMark copy() => UParagraphMark(offset: offset, type: type, align: align, indent: indent, checked: checked, language: language);
}

/// The controller behind [UDocumentEditor]: one text buffer, inline spans,
/// paragraph marks and embedded objects, all kept in sync across edits.
class UDocumentController extends URichTextController {
  UDocumentController({super.text, super.spans, List<UParagraphMark>? marks, List<UEmbed>? embeds}) : marks = marks ?? <UParagraphMark>[], embeds = embeds ?? <UEmbed>[] {
    reconcileMarks();
  }

  /// Builds a controller from stored HTML.
  factory UDocumentController.fromHtml(String? html) {
    final List<UEditorBlock> blocks = UHtmlDocument.parse(html);
    final StringBuffer buffer = StringBuffer();
    final List<UStyleSpan> spans = <UStyleSpan>[];
    final List<UParagraphMark> marks = <UParagraphMark>[];
    final List<UEmbed> embeds = <UEmbed>[];

    for (final UEditorBlock b in blocks) {
      if (buffer.isNotEmpty) buffer.write("\n");
      final int start = buffer.length;
      if (b.isText) {
        marks.add(UParagraphMark(offset: start, type: b.type, align: b.align, indent: b.indent, checked: b.checked, language: b.language));
        // List markers are real characters in the buffer so the caret can walk over them.
        final String marker = UDocumentController.markerFor(b.type, b.checked, 1);
        buffer.write(marker);
        buffer.write(b.controller!.text);
        for (final UStyleSpan sp in b.controller!.spans) {
          spans.add(UStyleSpan(start: start + marker.length + sp.start, end: start + marker.length + sp.end, attr: sp.attr, value: sp.value));
        }
      } else {
        marks.add(UParagraphMark(offset: start));
        embeds.add(UEmbed(offset: start, type: b.type, url: b.imageUrl, alt: b.imageAlt, width: b.imageWidth, align: b.align, table: b.table));
        buffer.write(uEmbedPlaceholder);
      }
    }
    for (final UEditorBlock b in blocks) b.dispose();
    final UDocumentController c = UDocumentController(text: buffer.toString(), spans: spans, marks: marks, embeds: embeds);
    c.renumber();
    return c;
  }

  List<UParagraphMark> marks;
  final List<UEmbed> embeds;

  /// Called by the editor whenever an embed should be edited.
  ValueChanged<UEmbed>? onEmbedTap;

  static const String bulletMarker = "• ";
  static const String uncheckedMarker = "☐ ";
  static const String checkedMarker = "☑ ";

  /// The literal prefix characters used to draw a list marker in the buffer.
  static String markerFor(UBlockType type, bool checked, int ordinal) {
    switch (type) {
      case UBlockType.bulleted:
        return bulletMarker;
      case UBlockType.checklist:
        return checked ? checkedMarker : uncheckedMarker;
      case UBlockType.numbered:
        return "$ordinal. ";
      default:
        return "";
    }
  }

  static final RegExp _numberedMarker = RegExp(r"^\d+\. ");

  /// Length of the marker currently present at the start of [line], if any.
  static int markerLength(UBlockType type, String line) {
    switch (type) {
      case UBlockType.bulleted:
        return line.startsWith(bulletMarker) ? bulletMarker.length : 0;
      case UBlockType.checklist:
        return line.startsWith(uncheckedMarker) || line.startsWith(checkedMarker) ? uncheckedMarker.length : 0;
      case UBlockType.numbered:
        return _numberedMarker.firstMatch(line)?.group(0)?.length ?? 0;
      default:
        return 0;
    }
  }

  // ---- offsets -------------------------------------------------------------

  @override
  void onBeforeTextChange(String oldText, String newText) {
    final int oldLen = oldText.length;
    final int newLen = newText.length;
    final int minLen = oldLen < newLen ? oldLen : newLen;

    int prefix = 0;
    while (prefix < minLen && oldText.codeUnitAt(prefix) == newText.codeUnitAt(prefix)) prefix++;
    int suffix = 0;
    while (suffix < minLen - prefix && oldText.codeUnitAt(oldLen - 1 - suffix) == newText.codeUnitAt(newLen - 1 - suffix)) suffix++;

    final int removedEnd = oldLen - suffix;
    final int delta = (newLen - suffix) - removedEnd;

    for (final UParagraphMark m in marks) m.offset = URichTextController.mapOffsetStart(m.offset, prefix, removedEnd, delta);
    embeds.removeWhere((UEmbed e) => e.offset >= prefix && e.offset < removedEnd);
    for (final UEmbed e in embeds) e.offset = URichTextController.mapOffsetStart(e.offset, prefix, removedEnd, delta);
  }

  /// The character offset where every paragraph starts.
  List<int> lineStarts() {
    final List<int> starts = <int>[0];
    for (int i = 0; i < text.length; i++) {
      if (text[i] == "\n") starts.add(i + 1);
    }
    return starts;
  }

  /// The end offset (exclusive, before the newline) of the paragraph at [index].
  int lineEnd(int index) {
    final List<int> starts = lineStarts();
    return index + 1 < starts.length ? starts[index + 1] - 1 : text.length;
  }

  /// Ensures there is exactly one mark per paragraph, inheriting attributes for
  /// paragraphs created by pressing Enter.
  void reconcileMarks() {
    final List<int> starts = lineStarts();
    final Map<int, UParagraphMark> byOffset = <int, UParagraphMark>{for (final UParagraphMark m in marks) m.offset: m};
    final List<UParagraphMark> next = <UParagraphMark>[];
    UParagraphMark? previous;
    for (final int s in starts) {
      final UParagraphMark mark = byOffset[s] ?? (previous?.inherit(s) ?? UParagraphMark(offset: s));
      mark.offset = s;
      next.add(mark);
      previous = mark;
    }
    marks = next;
  }

  /// Index of the paragraph containing [offset].
  int paragraphIndexAt(int offset) {
    final List<int> starts = lineStarts();
    int result = 0;
    for (int i = 0; i < starts.length; i++) {
      if (starts[i] <= offset) result = i;
    }
    return result;
  }

  /// Indices of every paragraph touched by the current selection.
  List<int> selectedParagraphs() {
    final TextSelection sel = selection;
    if (!sel.isValid) return <int>[0];
    final int first = paragraphIndexAt(sel.start);
    final int last = paragraphIndexAt(sel.end);
    return <int>[for (int i = first; i <= last; i++) i];
  }

  /// The mark for the paragraph the caret currently sits in.
  UParagraphMark get currentMark {
    reconcileMarks();
    final int index = paragraphIndexAt(selection.isValid ? selection.start : 0);
    return marks[index.clamp(0, marks.length - 1)];
  }

  /// The embed occupying [offset], if any.
  UEmbed? embedAt(int offset) {
    for (final UEmbed e in embeds) {
      if (e.offset == offset) return e;
    }
    return null;
  }

  // ---- paragraph mutation --------------------------------------------------

  /// Applies [type] to every paragraph in the selection, fixing list markers.
  void setParagraphType(UBlockType type) {
    reconcileMarks();
    final List<int> targets = selectedParagraphs();
    for (int i = targets.length - 1; i >= 0; i--) {
      final int index = targets[i];
      if (index >= marks.length) continue;
      final UParagraphMark mark = marks[index];
      _stripMarker(index);
      mark.type = mark.type == type && type != UBlockType.paragraph ? UBlockType.paragraph : type;
    }
    renumber();
    notifyListeners();
  }

  /// Shifts the indent of the selected paragraphs by [delta].
  void indentBy(int delta) {
    reconcileMarks();
    for (final int index in selectedParagraphs()) {
      if (index < marks.length) marks[index].indent = (marks[index].indent + delta).clamp(0, 8);
    }
    notifyListeners();
  }

  /// Applies [align] to every paragraph in the selection.
  void setParagraphAlign(TextAlign align) {
    reconcileMarks();
    for (final int index in selectedParagraphs()) {
      if (index < marks.length) marks[index].align = align;
    }
    notifyListeners();
  }

  /// Toggles the checkbox of the checklist paragraph at [index].
  void toggleChecked(int index) {
    reconcileMarks();
    if (index >= marks.length || marks[index].type != UBlockType.checklist) return;
    marks[index].checked = !marks[index].checked;
    renumber();
    notifyListeners();
  }

  void _stripMarker(int index) {
    final List<int> starts = lineStarts();
    if (index >= starts.length) return;
    final int start = starts[index];
    final int end = lineEnd(index);
    final String line = text.substring(start, end);
    final int len = markerLength(marks[index].type, line);
    if (len > 0) _replaceRange(start, start + len, "");
  }

  /// Rewrites every list marker so bullets, checkboxes and numbering are
  /// correct after any structural change. Edits are applied bottom-up so the
  /// offsets computed for earlier paragraphs stay valid.
  void renumber() {
    reconcileMarks();
    final List<int> starts = lineStarts();
    final List<String> desired = <String>[];
    int ordinal = 0;
    for (int i = 0; i < starts.length && i < marks.length; i++) {
      final UParagraphMark m = marks[i];
      if (m.type == UBlockType.numbered)
        ordinal++;
      else
        ordinal = 0;
      desired.add(markerFor(m.type, m.checked, ordinal));
    }
    for (int i = desired.length - 1; i >= 0; i--) {
      final int start = starts[i];
      final int end = i + 1 < starts.length ? starts[i + 1] - 1 : text.length;
      if (start > end || end > text.length) continue;
      final String line = text.substring(start, end);
      final int existing = markerLength(marks[i].type, line);
      final String want = desired[i];
      if (line.substring(0, existing) == want) continue;
      _replaceRange(start, start + existing, want);
    }
    reconcileMarks();
  }

  /// Replaces `[start, end)` with [insert], keeping spans, marks, embeds and
  /// the caret aligned.
  void _replaceRange(int start, int end, String insert) {
    if (start == end && insert.isEmpty) return;
    final String next = text.replaceRange(start, end, insert);
    final int caret = selection.isValid ? selection.baseOffset : next.length;
    final int shifted = URichTextController.mapOffsetStart(caret, start, end, insert.length - (end - start));
    value = TextEditingValue(
      text: next,
      selection: TextSelection.collapsed(offset: shifted.clamp(0, next.length)),
    );
  }

  /// Inserts an embedded object at the caret, on its own paragraph.
  void insertEmbed(UEmbed embed) {
    reconcileMarks();
    final int caret = selection.isValid ? selection.end : text.length;
    final bool needsLeading = caret > 0 && text[caret - 1] != "\n";
    final String insert = "${needsLeading ? "\n" : ""}$uEmbedPlaceholder\n";
    _replaceRange(caret, caret, insert);
    embed.offset = caret + (needsLeading ? 1 : 0);
    embeds.add(embed);
    reconcileMarks();
    final int index = paragraphIndexAt(embed.offset);
    if (index < marks.length) marks[index].type = UBlockType.paragraph;
    // Park the caret on the empty paragraph created after the object.
    selection = TextSelection.collapsed(offset: (caret + insert.length).clamp(0, text.length));
    notifyListeners();
  }

  /// Removes the embed at [offset] together with its placeholder character.
  void removeEmbed(UEmbed embed) {
    final int at = embed.offset;
    if (at < 0 || at >= text.length) return;
    embeds.remove(embed);
    _replaceRange(at, at + 1, "");
    reconcileMarks();
    notifyListeners();
  }

  // ---- html ---------------------------------------------------------------

  /// Serializes the document to HTML.
  String toHtml() {
    reconcileMarks();
    final List<int> starts = lineStarts();
    final List<UEditorBlock> blocks = <UEditorBlock>[];
    for (int i = 0; i < starts.length; i++) {
      final int start = starts[i];
      final int end = lineEnd(i);
      final UParagraphMark mark = i < marks.length ? marks[i] : UParagraphMark(offset: start);
      final UEmbed? embed = embedAt(start);
      if (embed != null && end - start == 1 && text[start] == uEmbedPlaceholder) {
        blocks.add(
          UEditorBlock(type: embed.type, imageUrl: embed.url, imageAlt: embed.alt, imageWidth: embed.width, align: embed.align, table: embed.table?.copy()),
        );
        continue;
      }
      final String line = text.substring(start, end);
      final int skip = markerLength(mark.type, line);
      final String body = line.substring(skip);
      final List<UStyleSpan> lineSpans = <UStyleSpan>[];
      for (final UStyleSpan sp in spans) {
        final int a = (sp.start - start - skip).clamp(0, body.length);
        final int b = (sp.end - start - skip).clamp(0, body.length);
        if (b > a) lineSpans.add(UStyleSpan(start: a, end: b, attr: sp.attr, value: sp.value));
      }
      blocks.add(UEditorBlock.text(mark.type, text: body, spans: lineSpans, align: mark.align, indent: mark.indent, checked: mark.checked, language: mark.language));
    }
    final String html = UHtmlDocument.serialize(blocks);
    for (final UEditorBlock b in blocks) b.dispose();
    return html;
  }

  /// Replaces the whole document with the content of [html].
  void loadHtml(String? html) {
    final UDocumentController fresh = UDocumentController.fromHtml(html);
    // The text must land first: setting it remaps marks and embeds, so the new
    // ones are installed afterwards.
    setContent(fresh.text, fresh.spans, caret: 0);
    marks = <UParagraphMark>[for (final UParagraphMark m in fresh.marks) m.copy()];
    embeds
      ..clear()
      ..addAll(fresh.embeds.map((UEmbed e) => e.copy()));
    fresh.dispose();
    reconcileMarks();
    notifyListeners();
  }

  // ---- rendering -----------------------------------------------------------

  @override
  TextSpan buildTextSpan({required BuildContext context, required bool withComposing, TextStyle? style}) {
    reconcileMarks();
    final TextStyle fallback = style ?? const TextStyle();
    final ColorScheme cs = Theme.of(context).colorScheme;
    final List<int> starts = lineStarts();
    final List<InlineSpan> children = <InlineSpan>[];

    for (int i = 0; i < starts.length; i++) {
      final int start = starts[i];
      final int end = lineEnd(i);
      final UParagraphMark mark = i < marks.length ? marks[i] : UParagraphMark(offset: start);
      final TextStyle base = fallback.merge(UEditorStyles.baseStyle(context, mark.type));
      final UEmbed? embed = embedAt(start);

      if (embed != null && end - start == 1 && text[start] == uEmbedPlaceholder) {
        children.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: _embedWidget(context, embed),
          ),
        );
      } else {
        _appendStyledRuns(children, start, end, base, cs, mark);
      }
      if (end < text.length) children.add(TextSpan(text: "\n", style: base));
    }
    return TextSpan(style: fallback, children: children);
  }

  void _appendStyledRuns(List<InlineSpan> out, int start, int end, TextStyle base, ColorScheme cs, UParagraphMark mark) {
    if (end <= start) return;
    // The list marker is drawn dimmer so it reads as chrome, not content.
    final int markerLen = markerLength(mark.type, text.substring(start, end));
    if (markerLen > 0) {
      out.add(
        TextSpan(
          text: text.substring(start, start + markerLen),
          style: base.copyWith(color: cs.onSurfaceVariant, fontWeight: FontWeight.normal),
        ),
      );
    }
    int runStart = start + markerLen;
    if (runStart >= end) return;
    TextStyle current = styleAt(runStart, base, cs);
    for (int i = runStart + 1; i <= end; i++) {
      final TextStyle st = i < end ? styleAt(i, base, cs) : current;
      if (i == end || st != current) {
        out.add(TextSpan(text: text.substring(runStart, i), style: current));
        runStart = i;
        current = st;
      }
    }
  }

  Widget _embedWidget(BuildContext context, UEmbed embed) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    Widget child;
    switch (embed.type) {
      case UBlockType.divider:
        child = SizedBox(
          width: double.infinity,
          child: Divider(thickness: 2, color: cs.outlineVariant),
        );
      case UBlockType.table:
        child = _tablePreview(context, embed.table ?? UTableData.empty());
      default:
        child = ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: UImage(embed.url ?? "", width: embed.width ?? 420, height: embed.width == null ? 240 : null),
        );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: embed.align == TextAlign.left
            ? Alignment.centerLeft
            : embed.align == TextAlign.right
            ? Alignment.centerRight
            : Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: cs.outlineVariant),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(4),
          child: child,
        ).onTap(() => onEmbedTap?.call(embed)),
      ),
    );
  }

  Widget _tablePreview(BuildContext context, UTableData table) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    final BorderSide side = BorderSide(color: cs.outlineVariant);
    return Table(
      border: TableBorder(top: side, bottom: side, left: side, right: side, horizontalInside: side, verticalInside: side),
      defaultColumnWidth: const IntrinsicColumnWidth(),
      children: <TableRow>[
        for (int r = 0; r < table.rows.length; r++)
          TableRow(
            decoration: BoxDecoration(color: table.hasHeader && r == 0 ? cs.surfaceContainerHighest : null),
            children: <Widget>[
              for (final String cell in table.rows[r])
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(cell, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: table.hasHeader && r == 0 ? FontWeight.bold : null)),
                ),
            ],
          ),
      ],
    );
  }
}

/// The continuous document editor widget.
class UDocumentEditor extends StatefulWidget {
  const UDocumentEditor({
    super.key,
    this.initialHtml,
    this.onChanged,
    this.onUploadImage,
    this.onAutoSave,
    this.autoSaveInterval = const Duration(seconds: 20),
    this.pageWidth = 780,
    this.pagePadding = const EdgeInsets.symmetric(horizontal: 56, vertical: 48),
    this.showPage = true,
    this.showStatusBar = true,
    this.readOnly = false,
    this.autofocus = false,
  });

  final String? initialHtml;
  final ValueChanged<String>? onChanged;
  final URichImageUploader? onUploadImage;
  final ValueChanged<String>? onAutoSave;
  final Duration autoSaveInterval;

  /// Maximum width of the writing surface, mimicking a page.
  final double pageWidth;
  final EdgeInsets pagePadding;

  /// Draw the surface as an elevated page on a neutral background.
  final bool showPage;
  final bool showStatusBar;
  final bool readOnly;
  final bool autofocus;

  /// Push a full-screen document editor and await the resulting HTML.
  static Future<String?> open({String? initialHtml, URichImageUploader? onUploadImage, String? title}) =>
      UNavigator.push<String>(_UDocumentEditorPage(initialHtml: initialHtml, onUploadImage: onUploadImage, title: title), fullscreenDialog: true);

  @override
  State<UDocumentEditor> createState() => _UDocumentEditorState();
}

class _UDocumentEditorState extends State<UDocumentEditor> {
  late final UDocumentController _controller = UDocumentController.fromHtml(widget.initialHtml);
  final FocusNode _focusNode = FocusNode();
  final List<String> _history = <String>[];

  int _historyIndex = 0;
  double _zoom = 1;

  static const double _minZoom = 0.6;
  static const double _maxZoom = 2;
  bool _uploading = false;
  bool _dirty = false;
  bool _restoring = false;
  Timer? _historyTimer;
  Timer? _autoSaveTimer;

  static const List<String> _codeLanguages = <String>["", "dart", "javascript", "typescript", "python", "java", "kotlin", "swift", "csharp", "sql", "json", "yaml", "html", "css", "bash"];

  @override
  void initState() {
    super.initState();
    _controller.onEmbedTap = _editEmbed;
    _controller.addListener(_onControllerChanged);
    _history.add(_controller.toHtml());
    if (widget.onAutoSave != null) _autoSaveTimer = Timer.periodic(widget.autoSaveInterval, (_) => _autoSave());
  }

  @override
  void dispose() {
    _historyTimer?.cancel();
    _autoSaveTimer?.cancel();
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _autoSave() {
    if (!_dirty) return;
    _dirty = false;
    widget.onAutoSave?.call(_controller.toHtml());
  }

  void _onControllerChanged() {
    if (mounted) setState(() {});
    if (_restoring) return;
    _dirty = true;
    widget.onChanged?.call(_controller.toHtml());
    _historyTimer?.cancel();
    _historyTimer = Timer(const Duration(milliseconds: 600), _pushHistory);
  }

  // ---- undo / redo ---------------------------------------------------------

  void _pushHistory() {
    final String html = _controller.toHtml();
    if (_history.isNotEmpty && _history[_historyIndex] == html) return;
    if (_historyIndex < _history.length - 1) _history.removeRange(_historyIndex + 1, _history.length);
    _history.add(html);
    if (_history.length > 100) _history.removeAt(0);
    _historyIndex = _history.length - 1;
    if (mounted) setState(() {});
  }

  bool get _canUndo => _historyIndex > 0;

  bool get _canRedo => _historyIndex < _history.length - 1;

  void _undo() {
    _historyTimer?.cancel();
    _pushHistory();
    if (!_canUndo) return;
    _historyIndex--;
    _restore(_history[_historyIndex]);
  }

  void _redo() {
    if (!_canRedo) return;
    _historyIndex++;
    _restore(_history[_historyIndex]);
  }

  void _restore(String html) {
    _restoring = true;
    _controller.loadHtml(html);
    _restoring = false;
    _dirty = true;
    widget.onChanged?.call(html);
  }

  // ---- actions -------------------------------------------------------------

  void _toggle(UInlineAttr attr) {
    _controller.toggleAttribute(attr);
    _focusNode.requestFocus();
  }

  Future<void> _pickColor(UInlineAttr attr) async {
    final TextSelection sel = _controller.selection;
    final int? picked = await UEditorDialogs.pickColor(context: context, current: _controller.activeValue(attr) as int?, title: attr == UInlineAttr.highlight ? U.s.highlightColor : U.s.textColor);
    if (picked == null) return;
    _controller.selection = sel;
    _controller.applyValue(attr, picked == 0 ? null : picked);
    _focusNode.requestFocus();
  }

  Future<void> _editLink() async {
    final TextSelection sel = _controller.selection;
    final String? url = await UEditorDialogs.editLink(existing: _controller.activeLink());
    if (url == null) return;
    _controller.selection = sel;
    _controller.applyValue(UInlineAttr.link, url.trim().isEmpty ? null : url.trim());
    _focusNode.requestFocus();
  }

  Future<void> _insertTable() async {
    final UTableData? table = await UEditorDialogs.insertTable();
    if (table != null) _controller.insertEmbed(UEmbed(offset: 0, type: UBlockType.table, table: table));
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
        _controller.insertEmbed(UEmbed(offset: 0, type: UBlockType.image, url: url));
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

  /// Opens an editor for the tapped image / table / divider embed.
  Future<void> _editEmbed(UEmbed embed) async {
    if (embed.type == UBlockType.table) {
      embed.table ??= UTableData.empty();
      await UNavigator.dialog(_TableEditorDialog(table: embed.table!));
      setState(() {});
      _onControllerChanged();
      return;
    }
    await UNavigator.dialog(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setInner) => AlertDialog(
          title: Text(UEditorStyles.label(embed.type)),
          content: SizedBox(
            width: 420,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (embed.type == UBlockType.image) ...<Widget>[
                  TextFormField(
                    initialValue: embed.alt,
                    decoration: InputDecoration(labelText: U.s.imageAltText, border: const OutlineInputBorder()),
                    onChanged: (String v) => embed.alt = v,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      UTextBodyMedium(U.s.imageWidth),
                      Slider(
                        value: (embed.width ?? 420).clamp(80, 1200).toDouble(),
                        min: 80,
                        max: 1200,
                        onChanged: (double v) => setInner(() => embed.width = v),
                      ).expanded(),
                    ],
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    UEditorToolButton(icon: Icons.format_align_left, tooltip: U.s.alignLeft, active: embed.align == TextAlign.left, onTap: () => setInner(() => embed.align = TextAlign.left)),
                    UEditorToolButton(icon: Icons.format_align_center, tooltip: U.s.alignCenter, active: embed.align == TextAlign.center, onTap: () => setInner(() => embed.align = TextAlign.center)),
                    UEditorToolButton(icon: Icons.format_align_right, tooltip: U.s.alignRight, active: embed.align == TextAlign.right, onTap: () => setInner(() => embed.align = TextAlign.right)),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                UNavigator.back();
                _controller.removeEmbed(embed);
              },
              child: Text(U.s.delete, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ),
            TextButton(onPressed: UNavigator.back, child: Text(U.s.ok)),
          ],
        ),
      ),
    );
    setState(() {});
    _onControllerChanged();
  }

  Future<void> _editHtmlSource() async {
    final String? edited = await UEditorDialogs.htmlSource(html: _controller.toHtml());
    if (edited != null) {
      _restore(edited);
      _pushHistory();
    }
  }

  Future<void> _findReplace() async {
    final UFindReplaceRequest? request = await UEditorDialogs.findReplace();
    if (request == null || request.find.isEmpty) return;
    final Pattern pattern = request.matchCase ? request.find : RegExp(RegExp.escape(request.find), caseSensitive: false);
    final int count = pattern.allMatches(_controller.text).length;
    if (count == 0) {
      UToast.snackBar(message: U.s.noMatchesFound);
      return;
    }
    _controller.value = TextEditingValue(
      text: _controller.text.replaceAll(pattern, request.replace),
      selection: const TextSelection.collapsed(offset: 0),
    );
    _controller.renumber();
    UToast.snackBar(message: "${U.s.replacedCount}: $count");
  }

  void _preview() => UNavigator.dialog(
    AlertDialog(
      title: Text(U.s.preview),
      content: SizedBox(
        width: 720,
        child: SingleChildScrollView(child: UHtmlView(html: _controller.toHtml(), selectable: true)),
      ),
      actions: <Widget>[TextButton(onPressed: UNavigator.back, child: Text(U.s.ok))],
    ),
  );

  // ---- key handling --------------------------------------------------------

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) return KeyEventResult.ignored;
    final bool meta = HardwareKeyboard.instance.isControlPressed || HardwareKeyboard.instance.isMetaPressed;
    final bool shift = HardwareKeyboard.instance.isShiftPressed;
    final LogicalKeyboardKey key = event.logicalKey;

    if (meta) {
      if (key == LogicalKeyboardKey.keyB) {
        _toggle(UInlineAttr.bold);
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.keyI) {
        _toggle(UInlineAttr.italic);
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.keyU) {
        _toggle(UInlineAttr.underline);
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
      if (key == LogicalKeyboardKey.keyS) {
        _autoSave();
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
    if (key == LogicalKeyboardKey.tab) {
      _controller.indentBy(shift ? -1 : 1);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  // Markdown style shortcuts applied as the user types at the start of a line.
  void _onChanged(String value) {
    final UParagraphMark mark = _controller.currentMark;
    if (mark.type != UBlockType.paragraph) {
      _controller.renumber();
      return;
    }
    final int index = _controller.paragraphIndexAt(_controller.selection.start);
    final List<int> starts = _controller.lineStarts();
    if (index >= starts.length || index >= _controller.marks.length) return;
    final int start = starts[index];
    final int end = _controller.lineEnd(index);
    if (start > end) return;
    final String line = _controller.text.substring(start, end);

    UBlockType? type;
    int strip = 0;
    final RegExpMatch? heading = RegExp(r"^(#{1,6})\s").firstMatch(line);
    if (heading != null) {
      const List<UBlockType> levels = <UBlockType>[UBlockType.h1, UBlockType.h2, UBlockType.h3, UBlockType.h4, UBlockType.h5, UBlockType.h6];
      type = levels[heading.group(1)!.length - 1];
      strip = heading.group(0)!.length;
    } else if (line.startsWith("- ") || line.startsWith("* ")) {
      type = UBlockType.bulleted;
      strip = 2;
    } else if (RegExp(r"^\d+[.)]\s").hasMatch(line) && _controller.marks[index].type != UBlockType.numbered) {
      type = UBlockType.numbered;
      strip = RegExp(r"^\d+[.)]\s").firstMatch(line)!.group(0)!.length;
    } else if (line.startsWith("> ")) {
      type = UBlockType.quote;
      strip = 2;
    } else if (line.startsWith("[] ") || line.startsWith("[ ] ")) {
      type = UBlockType.checklist;
      strip = line.startsWith("[] ") ? 3 : 4;
    } else if (line.startsWith("```")) {
      type = UBlockType.code;
      strip = 3;
    } else if (line == "---" || line == "***") {
      _controller.selection = TextSelection(baseOffset: start, extentOffset: end);
      _controller.insertEmbed(UEmbed(offset: 0, type: UBlockType.divider));
      return;
    }

    if (type == null) {
      _controller.renumber();
      return;
    }
    _controller.marks[index].type = type;
    _controller.selection = TextSelection.collapsed(offset: start + strip);
    _controller.value = TextEditingValue(
      text: _controller.text.replaceRange(start, start + strip, ""),
      selection: TextSelection.collapsed(offset: start),
    );
    _controller.renumber();
  }

  // Tapping directly on a checklist marker toggles it. A Listener is used rather
  // than a GestureDetector so it never competes with the field's own tap
  // recognizer, and the check runs after the field has moved the caret.
  void _onPointerUp() => WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!mounted) return;
    final int offset = _controller.selection.baseOffset;
    if (offset < 0) return;
    final int index = _controller.paragraphIndexAt(offset);
    if (index >= _controller.marks.length) return;
    final UParagraphMark mark = _controller.marks[index];
    if (mark.type != UBlockType.checklist) return;
    if (offset - mark.offset < UDocumentController.uncheckedMarker.length) _controller.toggleChecked(index);
  });

  // ---- build ---------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return Column(
      children: <Widget>[
        if (!widget.readOnly) _ribbon(),
        if (_uploading) LinearProgressIndicator(minHeight: 2, color: cs.primary),
        const Divider(height: 1),
        Container(
          color: widget.showPage ? cs.surfaceContainerHighest : null,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: widget.showPage ? 24 : 0),
            child: Center(child: _page(cs)),
          ),
        ).expanded(),
        if (widget.showStatusBar) _statusBar(),
      ],
    );
  }

  Widget _page(ColorScheme cs) {
    final Widget field = TextField(
      controller: _controller,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      maxLines: null,
      minLines: 20,
      keyboardType: TextInputType.multiline,
      textAlign: _controller.currentMark.align,
      cursorColor: cs.primary,
      style: UEditorStyles.baseStyle(context, UBlockType.paragraph),
      decoration: InputDecoration.collapsed(
        hintText: U.s.writeSomething,
        hintStyle: TextStyle(color: Theme.of(context).hintColor),
      ),
      onChanged: _onChanged,
    );

    // Zooming through MediaQuery keeps the caret and hit-testing correct, which
    // a Transform would not.
    final Widget zoomed = MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(_zoom)),
      child: field,
    );

    final Widget body = Focus(
      onKeyEvent: _onKey,
      child: Listener(onPointerUp: (PointerUpEvent _) => _onPointerUp(), child: zoomed),
    );

    if (!widget.showPage)
      return Padding(
        padding: widget.pagePadding,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: widget.pageWidth),
          child: body,
        ),
      );

    return Container(
      width: widget.pageWidth,
      constraints: const BoxConstraints(minHeight: 600),
      padding: widget.pagePadding,
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(4),
        boxShadow: <BoxShadow>[BoxShadow(color: cs.shadow.withValues(alpha: 0.12), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: body,
    );
  }

  Widget _statusBar() {
    final String html = _controller.toHtml();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        children: <Widget>[
          UTextBodySmall("${U.s.words}: ${UHtmlDocument.wordCount(html)}   ${U.s.characters}: ${UHtmlDocument.characterCount(html)}").expanded(),
          UTextBodySmall("${UHtmlDocument.readingMinutes(html)} ${U.s.minutes}"),
          const SizedBox(width: 12),
          UEditorToolButton(icon: Icons.zoom_out, tooltip: U.s.zoomOut, size: 16, onTap: () => setState(() => _zoom = (_zoom - 0.1).clamp(_minZoom, _maxZoom))),
          UTextBodySmall("${(_zoom * 100).round()}%"),
          UEditorToolButton(icon: Icons.zoom_in, tooltip: U.s.zoomIn, size: 16, onTap: () => setState(() => _zoom = (_zoom + 0.1).clamp(_minZoom, _maxZoom))),
        ],
      ),
    );
  }

  Widget _ribbon() {
    final Set<UInlineAttr> active = _controller.activeAttributes();
    final UParagraphMark mark = _controller.currentMark;
    final String? family = _controller.activeValue(UInlineAttr.fontFamily) as String?;
    final double? size = _controller.activeValue(UInlineAttr.fontSize) as double?;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Wrap(
        runSpacing: 4,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          UEditorToolButton(icon: Icons.undo, tooltip: U.s.undo, onTap: _canUndo ? _undo : null),
          UEditorToolButton(icon: Icons.redo, tooltip: U.s.redo, onTap: _canRedo ? _redo : null),
          const UEditorToolSeparator(),
          UEditorDropdown<UBlockType>(
            label: UEditorStyles.label(mark.type),
            tooltip: U.s.paragraph,
            width: 130,
            onSelected: (UBlockType t) {
              _controller.setParagraphType(t);
              _focusNode.requestFocus();
            },
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
                UBlockType.code,
              ])
                UEditorMenuEntry<UBlockType>(value: t, label: UEditorStyles.label(t)),
            ],
          ),
          UEditorDropdown<String>(
            label: family ?? U.s.fontFamily,
            tooltip: U.s.fontFamily,
            width: 120,
            onSelected: (String f) => _controller.applyValue(UInlineAttr.fontFamily, f == UEditorStyles.fontFamilies.first ? null : f),
            items: <UEditorMenuEntry<String>>[
              for (final String f in UEditorStyles.fontFamilies)
                UEditorMenuEntry<String>(
                  value: f,
                  label: f,
                  style: TextStyle(fontFamily: f == UEditorStyles.fontFamilies.first ? null : f),
                ),
            ],
          ),
          UEditorDropdown<double>(
            label: size == null ? U.s.fontSize : "${size.toInt()}",
            tooltip: U.s.fontSize,
            width: 78,
            onSelected: (double s) => _controller.applyValue(UInlineAttr.fontSize, s <= 0 ? null : s),
            items: <UEditorMenuEntry<double>>[
              UEditorMenuEntry<double>(value: 0, label: U.s.none),
              for (final double s in UEditorStyles.fontSizes) UEditorMenuEntry<double>(value: s, label: "${s.toInt()}"),
            ],
          ),
          const UEditorToolSeparator(),
          UEditorToolButton(icon: Icons.format_bold, tooltip: U.s.bold, active: active.contains(UInlineAttr.bold), onTap: () => _toggle(UInlineAttr.bold)),
          UEditorToolButton(icon: Icons.format_italic, tooltip: U.s.italic, active: active.contains(UInlineAttr.italic), onTap: () => _toggle(UInlineAttr.italic)),
          UEditorToolButton(icon: Icons.format_underlined, tooltip: U.s.underline, active: active.contains(UInlineAttr.underline), onTap: () => _toggle(UInlineAttr.underline)),
          UEditorToolButton(icon: Icons.strikethrough_s, tooltip: U.s.strikethrough, active: active.contains(UInlineAttr.strikethrough), onTap: () => _toggle(UInlineAttr.strikethrough)),
          UEditorToolButton(icon: Icons.code, tooltip: U.s.inlineCode, active: active.contains(UInlineAttr.code), onTap: () => _toggle(UInlineAttr.code)),
          UEditorToolButton(icon: Icons.superscript, tooltip: U.s.superscript, active: active.contains(UInlineAttr.superscript), onTap: () => _toggle(UInlineAttr.superscript)),
          UEditorToolButton(icon: Icons.subscript, tooltip: U.s.subscript, active: active.contains(UInlineAttr.subscript), onTap: () => _toggle(UInlineAttr.subscript)),
          UEditorToolButton(icon: Icons.format_color_text, tooltip: U.s.textColor, onTap: () => _pickColor(UInlineAttr.color)),
          UEditorToolButton(icon: Icons.border_color_outlined, tooltip: U.s.highlightColor, onTap: () => _pickColor(UInlineAttr.highlight)),
          UEditorToolButton(icon: Icons.link, tooltip: U.s.insertLink, active: _controller.activeLink() != null, onTap: _editLink),
          UEditorToolButton(icon: Icons.format_clear, tooltip: U.s.clearFormatting, onTap: _controller.clearFormatting),
          const UEditorToolSeparator(),
          UEditorToolButton(icon: Icons.format_list_bulleted, tooltip: U.s.bulletedList, active: mark.type == UBlockType.bulleted, onTap: () => _controller.setParagraphType(UBlockType.bulleted)),
          UEditorToolButton(icon: Icons.format_list_numbered, tooltip: U.s.numberedList, active: mark.type == UBlockType.numbered, onTap: () => _controller.setParagraphType(UBlockType.numbered)),
          UEditorToolButton(icon: Icons.checklist, tooltip: U.s.checklist, active: mark.type == UBlockType.checklist, onTap: () => _controller.setParagraphType(UBlockType.checklist)),
          UEditorToolButton(icon: Icons.format_indent_decrease, tooltip: U.s.decreaseIndent, onTap: () => _controller.indentBy(-1)),
          UEditorToolButton(icon: Icons.format_indent_increase, tooltip: U.s.increaseIndent, onTap: () => _controller.indentBy(1)),
          const UEditorToolSeparator(),
          UEditorToolButton(icon: Icons.format_align_left, tooltip: U.s.alignLeft, active: mark.align == TextAlign.left, onTap: () => _controller.setParagraphAlign(TextAlign.left)),
          UEditorToolButton(icon: Icons.format_align_center, tooltip: U.s.alignCenter, active: mark.align == TextAlign.center, onTap: () => _controller.setParagraphAlign(TextAlign.center)),
          UEditorToolButton(icon: Icons.format_align_right, tooltip: U.s.alignRight, active: mark.align == TextAlign.right, onTap: () => _controller.setParagraphAlign(TextAlign.right)),
          UEditorToolButton(icon: Icons.format_align_justify, tooltip: U.s.alignJustify, active: mark.align == TextAlign.justify, onTap: () => _controller.setParagraphAlign(TextAlign.justify)),
          const UEditorToolSeparator(),
          UEditorToolButton(icon: Icons.image_outlined, tooltip: U.s.insertImage, onTap: _insertImage),
          UEditorToolButton(icon: Icons.table_chart_outlined, tooltip: U.s.insertTable, onTap: _insertTable),
          UEditorToolButton(
            icon: Icons.horizontal_rule,
            tooltip: U.s.divider,
            onTap: () => _controller.insertEmbed(UEmbed(offset: 0, type: UBlockType.divider)),
          ),
          if (mark.type == UBlockType.code)
            UEditorDropdown<String>(
              label: (mark.language ?? "").isEmpty ? U.s.codeLanguage : mark.language!,
              tooltip: U.s.codeLanguage,
              onSelected: (String v) {
                setState(() => mark.language = v.isEmpty ? null : v);
                _onControllerChanged();
              },
              items: <UEditorMenuEntry<String>>[
                for (final String l in _codeLanguages) UEditorMenuEntry<String>(value: l, label: l.isEmpty ? U.s.none : l),
              ],
            ),
          const UEditorToolSeparator(),
          UEditorToolButton(icon: Icons.find_replace, tooltip: U.s.findAndReplace, onTap: _findReplace),
          UEditorToolButton(icon: Icons.data_object, tooltip: U.s.htmlSource, onTap: _editHtmlSource),
          UEditorToolButton(
            icon: Icons.info_outline,
            tooltip: U.s.documentInfo,
            onTap: () => UEditorDialogs.documentInfo(html: _controller.toHtml()),
          ),
          UEditorToolButton(icon: Icons.visibility_outlined, tooltip: U.s.preview, onTap: _preview),
        ],
      ),
    );
  }
}

/// Grid editor for a [UTableData] embedded in a document.
class _TableEditorDialog extends StatefulWidget {
  const _TableEditorDialog({required this.table});

  final UTableData table;

  @override
  State<_TableEditorDialog> createState() => _TableEditorDialogState();
}

class _TableEditorDialogState extends State<_TableEditorDialog> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    final BorderSide side = BorderSide(color: cs.outlineVariant);
    return AlertDialog(
      title: Text(U.s.editTable),
      content: SizedBox(
        width: 640,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Table(
                border: TableBorder(top: side, bottom: side, left: side, right: side, horizontalInside: side, verticalInside: side),
                children: <TableRow>[
                  for (int r = 0; r < widget.table.rows.length; r++)
                    TableRow(
                      decoration: BoxDecoration(color: widget.table.hasHeader && r == 0 ? cs.surfaceContainerHighest : null),
                      children: <Widget>[
                        for (int c = 0; c < widget.table.rows[r].length; c++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            child: TextFormField(
                              initialValue: widget.table.rows[r][c],
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: widget.table.hasHeader && r == 0 ? FontWeight.bold : null),
                              decoration: const InputDecoration(isDense: true, border: InputBorder.none),
                              onChanged: (String v) => widget.table.rows[r][c] = v,
                            ),
                          ),
                      ],
                    ),
                ],
              ),
              Row(
                children: <Widget>[
                  UEditorToolButton(icon: Icons.add, tooltip: U.s.addRow, size: 18, onTap: () => setState(widget.table.addRow)),
                  UEditorToolButton(icon: Icons.add_box_outlined, tooltip: U.s.addColumn, size: 18, onTap: () => setState(widget.table.addColumn)),
                  UEditorToolButton(icon: Icons.remove, tooltip: U.s.removeRow, size: 18, onTap: () => setState(() => widget.table.removeRow(widget.table.rowCount - 1))),
                  UEditorToolButton(
                    icon: Icons.indeterminate_check_box_outlined,
                    tooltip: U.s.removeColumn,
                    size: 18,
                    onTap: () => setState(() => widget.table.removeColumn(widget.table.columnCount - 1)),
                  ),
                  UEditorToolButton(
                    icon: Icons.table_rows_outlined,
                    tooltip: U.s.headerRow,
                    size: 18,
                    active: widget.table.hasHeader,
                    onTap: () => setState(() => widget.table.hasHeader = !widget.table.hasHeader),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[TextButton(onPressed: UNavigator.back, child: Text(U.s.ok))],
    );
  }
}

/// Full-screen page used by [UDocumentEditor.open].
class _UDocumentEditorPage extends StatefulWidget {
  const _UDocumentEditorPage({this.initialHtml, this.onUploadImage, this.title});

  final String? initialHtml;
  final URichImageUploader? onUploadImage;
  final String? title;

  @override
  State<_UDocumentEditorPage> createState() => _UDocumentEditorPageState();
}

class _UDocumentEditorPageState extends State<_UDocumentEditorPage> {
  late String _html = widget.initialHtml ?? "";

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(widget.title ?? U.s.documentEditor),
      actions: <Widget>[IconButton(icon: const Icon(Icons.check), tooltip: U.s.submit, onPressed: () => UNavigator.back(_html))],
    ),
    body: UDocumentEditor(initialHtml: widget.initialHtml, onUploadImage: widget.onUploadImage, autofocus: true, onChanged: (String h) => _html = h),
  );
}
