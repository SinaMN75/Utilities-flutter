import "package:u/utilities.dart";

/// Shared document core for the rich text editors and the read-only renderer.
///
/// Public API:
///  * [UInlineAttr] / [UBlockType] – the supported formatting vocabulary.
///  * [UStyleSpan] – an inline style over a character range.
///  * [URichTextController] – a [TextEditingController] that renders spans.
///  * [UEditorBlock] / [UTableData] – the block document model.
///  * [UHtmlDocument] – blocks ⇄ HTML serialize/parse plus HTML helpers.
///  * [UEditorStyles] – the visual styling shared by editors and [UHtmlView].
///
/// Consumed by `u_html_view.dart`, `u_rich_text_editor.dart` and
/// `u_document_editor.dart`.

// =============================================================================
//  MODEL
// =============================================================================

/// Inline formatting attributes that can be applied to a range of characters.
enum UInlineAttr { bold, italic, underline, strikethrough, code, superscript, subscript, color, highlight, fontSize, fontFamily, link }

/// Block level types the editor supports. All values except [UBlockType.image],
/// [UBlockType.divider] and [UBlockType.table] are text blocks that own a
/// [URichTextController].
enum UBlockType { paragraph, h1, h2, h3, h4, h5, h6, quote, bulleted, numbered, checklist, code, image, divider, table }

/// The attributes that behave as on/off toggles (no payload).
const List<UInlineAttr> uBooleanInlineAttrs = <UInlineAttr>[
  UInlineAttr.bold,
  UInlineAttr.italic,
  UInlineAttr.underline,
  UInlineAttr.strikethrough,
  UInlineAttr.code,
  UInlineAttr.superscript,
  UInlineAttr.subscript,
];

/// A single inline style span over the range [start, end) of a text block.
/// [value] carries the payload for value-attributes: `int` (ARGB) for
/// [UInlineAttr.color] and [UInlineAttr.highlight], `double` for
/// [UInlineAttr.fontSize], and `String` for [UInlineAttr.fontFamily] (family
/// name) and [UInlineAttr.link] (href). It is null for boolean attributes.
class UStyleSpan {
  UStyleSpan({required this.start, required this.end, required this.attr, this.value});

  int start;
  int end;
  final UInlineAttr attr;
  final Object? value;

  bool get isBoolean => value == null;

  UStyleSpan copy() => UStyleSpan(start: start, end: end, attr: attr, value: value);
}

/// A [TextEditingController] that keeps a list of [UStyleSpan]s in sync with
/// text edits and renders them via [buildTextSpan]. It survives
/// insertions/deletions by shifting spans and exposes helpers to toggle/apply
/// formatting on the current selection.
class URichTextController extends TextEditingController {
  URichTextController({super.text, List<UStyleSpan>? spans}) : spans = spans ?? <UStyleSpan>[];

  final List<UStyleSpan> spans;

  /// Formatting queued for the next typed character while the selection is
  /// collapsed (so pressing bold then typing produces bold text).
  final Map<UInlineAttr, Object?> pending = <UInlineAttr, Object?>{};

  /// Optional hook so subclasses can react to text edits before spans shift.
  void onBeforeTextChange(String oldText, String newText) {}

  // Keep spans aligned with the text whenever the value changes.
  @override
  set value(TextEditingValue newValue) {
    final String oldText = value.text;
    final String newText = newValue.text;
    if (oldText != newText) {
      onBeforeTextChange(oldText, newText);
      _shiftSpans(oldText, newText);
    }
    super.value = newValue;
  }

  // ---- span maintenance on text edits -------------------------------------

  void _shiftSpans(String oldText, String newText) {
    final int oldLen = oldText.length;
    final int newLen = newText.length;
    final int minLen = oldLen < newLen ? oldLen : newLen;

    int prefix = 0;
    while (prefix < minLen && oldText.codeUnitAt(prefix) == newText.codeUnitAt(prefix)) prefix++;

    int suffix = 0;
    while (suffix < minLen - prefix && oldText.codeUnitAt(oldLen - 1 - suffix) == newText.codeUnitAt(newLen - 1 - suffix)) suffix++;

    final int removedEnd = oldLen - suffix; // region [prefix, removedEnd) removed
    final int insertedEnd = newLen - suffix; // region [prefix, insertedEnd) added
    final int delta = insertedEnd - removedEnd;

    final List<UStyleSpan> next = <UStyleSpan>[];
    for (final UStyleSpan sp in spans) {
      final int a = mapOffsetStart(sp.start, prefix, removedEnd, delta);
      final int b = mapOffsetEnd(sp.end, prefix, removedEnd, delta);
      if (b > a) next.add(UStyleSpan(start: a, end: b, attr: sp.attr, value: sp.value));
    }
    spans
      ..clear()
      ..addAll(next);

    // Extend spans that ended exactly where new text was typed, so continuing to
    // type inside a styled run keeps the style.
    if (delta > 0 && removedEnd == prefix) {
      for (final UStyleSpan sp in spans) {
        if (sp.end == prefix && sp.start < prefix) sp.end = prefix + delta;
      }
      if (pending.isNotEmpty) {
        pending.forEach((UInlineAttr attr, Object? v) => spans.add(UStyleSpan(start: prefix, end: prefix + delta, attr: attr, value: v)));
        pending.clear();
      }
      normalize();
    }
  }

  /// Remaps a range start across an edit that replaced
  /// `[prefix, removedEnd)` with a region of length `removedEnd - prefix + delta`.
  static int mapOffsetStart(int x, int prefix, int removedEnd, int delta) {
    if (x <= prefix) return x;
    if (x >= removedEnd) return x + delta;
    return prefix;
  }

  /// Remaps a range end across the same edit as [mapOffsetStart].
  static int mapOffsetEnd(int x, int prefix, int removedEnd, int delta) {
    if (x < prefix) return x;
    if (x >= removedEnd) return x + delta;
    return prefix;
  }

  // ---- querying -----------------------------------------------------------

  /// The active boolean attributes covering the whole current selection.
  Set<UInlineAttr> activeAttributes() {
    final TextSelection sel = selection;
    if (!sel.isValid) return <UInlineAttr>{};
    final int s = sel.start;
    final int e = sel.end;
    final Set<UInlineAttr> result = <UInlineAttr>{};
    for (final UInlineAttr attr in uBooleanInlineAttrs) {
      if (pending.containsKey(attr)) {
        result.add(attr);
        continue;
      }
      if (s == e) {
        if (_attrCoversPoint(attr, s)) result.add(attr);
      } else if (_attrCoversRange(attr, s, e)) {
        result.add(attr);
      }
    }
    return result;
  }

  /// The value of a value-attribute at the current selection, or null when the
  /// selection is not uniformly covered by it.
  Object? activeValue(UInlineAttr attr) {
    final TextSelection sel = selection;
    if (!sel.isValid) return null;
    if (pending.containsKey(attr)) return pending[attr];
    final int probe = sel.isCollapsed ? sel.start - 1 : sel.start;
    if (probe < 0) return null;
    for (final UStyleSpan sp in spans) {
      if (sp.attr == attr && probe >= sp.start && probe < sp.end) return sp.value;
    }
    return null;
  }

  /// The href active at the current selection, or null.
  String? activeLink() => activeValue(UInlineAttr.link) as String?;

  bool _attrCoversPoint(UInlineAttr attr, int caret) {
    final int i = caret - 1;
    if (i < 0) return false;
    return spans.any((UStyleSpan sp) => sp.attr == attr && i >= sp.start && i < sp.end);
  }

  bool _attrCoversRange(UInlineAttr attr, int s, int e) {
    for (int i = s; i < e; i++) {
      if (!spans.any((UStyleSpan sp) => sp.attr == attr && i >= sp.start && i < sp.end)) return false;
    }
    return true;
  }

  // ---- mutation -----------------------------------------------------------

  /// Toggle a boolean attribute over the current selection. With a collapsed
  /// selection the attribute is queued for the next typed characters.
  void toggleAttribute(UInlineAttr attr) {
    final TextSelection sel = selection;
    if (!sel.isValid) return;
    if (sel.isCollapsed) {
      if (pending.containsKey(attr))
        pending.remove(attr);
      else
        pending[attr] = null;
      notifyListeners();
      return;
    }
    if (_attrCoversRange(attr, sel.start, sel.end))
      removeAttr(attr, sel.start, sel.end);
    else
      spans.add(UStyleSpan(start: sel.start, end: sel.end, attr: attr));
    normalize();
    notifyListeners();
  }

  /// Apply (or clear when [value] is null) a value-attribute over the selection.
  void applyValue(UInlineAttr attr, Object? value) {
    final TextSelection sel = selection;
    if (!sel.isValid) return;
    if (sel.isCollapsed) {
      if (value == null)
        pending.remove(attr);
      else
        pending[attr] = value;
      notifyListeners();
      return;
    }
    removeAttr(attr, sel.start, sel.end);
    if (value != null) spans.add(UStyleSpan(start: sel.start, end: sel.end, attr: attr, value: value));
    normalize();
    notifyListeners();
  }

  /// Remove every inline attribute over the current selection.
  void clearFormatting() {
    final TextSelection sel = selection;
    pending.clear();
    if (!sel.isValid || sel.isCollapsed) {
      notifyListeners();
      return;
    }
    for (final UInlineAttr attr in UInlineAttr.values) removeAttr(attr, sel.start, sel.end);
    normalize();
    notifyListeners();
  }

  /// Replace the whole styled content in one shot.
  void setContent(String newText, List<UStyleSpan> newSpans, {int? caret}) {
    value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: (caret ?? newText.length).clamp(0, newText.length)),
    );
    spans
      ..clear()
      ..addAll(newSpans.map((UStyleSpan sp) => sp.copy()));
    normalize();
    notifyListeners();
  }

  /// Subtract the range [s, e) from every span of [attr], splitting as needed.
  void removeAttr(UInlineAttr attr, int s, int e) {
    final List<UStyleSpan> result = <UStyleSpan>[];
    for (final UStyleSpan sp in spans) {
      if (sp.attr != attr || sp.end <= s || sp.start >= e) {
        result.add(sp);
        continue;
      }
      if (sp.start < s) result.add(UStyleSpan(start: sp.start, end: s, attr: attr, value: sp.value));
      if (sp.end > e) result.add(UStyleSpan(start: e, end: sp.end, attr: attr, value: sp.value));
    }
    spans
      ..clear()
      ..addAll(result);
  }

  /// Merge touching/overlapping spans that share attr + value.
  void normalize() {
    spans.removeWhere((UStyleSpan sp) => sp.end <= sp.start);
    spans.sort((UStyleSpan a, UStyleSpan b) => a.attr.index != b.attr.index ? a.attr.index - b.attr.index : a.start - b.start);
    final List<UStyleSpan> merged = <UStyleSpan>[];
    for (final UStyleSpan sp in spans) {
      if (merged.isNotEmpty) {
        final UStyleSpan last = merged.last;
        if (last.attr == sp.attr && last.value == sp.value && sp.start <= last.end) {
          if (sp.end > last.end) last.end = sp.end;
          continue;
        }
      }
      merged.add(sp.copy());
    }
    spans
      ..clear()
      ..addAll(merged);
  }

  /// A deep copy of the current spans, for undo snapshots.
  List<UStyleSpan> snapshotSpans() => <UStyleSpan>[for (final UStyleSpan sp in spans) sp.copy()];

  // ---- rendering ----------------------------------------------------------

  @override
  TextSpan buildTextSpan({required BuildContext context, required bool withComposing, TextStyle? style}) {
    final String t = text;
    final TextStyle base = style ?? const TextStyle();
    if (t.isEmpty || spans.isEmpty) return TextSpan(style: base, text: t);

    final ColorScheme cs = Theme.of(context).colorScheme;
    final List<InlineSpan> children = <InlineSpan>[];
    int runStart = 0;
    TextStyle current = styleAt(0, base, cs);
    for (int i = 1; i <= t.length; i++) {
      final TextStyle st = i < t.length ? styleAt(i, base, cs) : current;
      if (i == t.length || st != current) {
        children.add(TextSpan(text: t.substring(runStart, i), style: current));
        runStart = i;
        current = st;
      }
    }
    return TextSpan(style: base, children: children);
  }

  /// The resolved [TextStyle] for the character at index [i].
  TextStyle styleAt(int i, TextStyle base, ColorScheme cs) {
    final Map<UInlineAttr, Object?> active = <UInlineAttr, Object?>{};
    for (final UStyleSpan sp in spans) {
      if (i >= sp.start && i < sp.end) active[sp.attr] = sp.value;
    }
    return resolveStyle(active, base, cs);
  }

  /// Turns a map of active attributes into a [TextStyle] on top of [base].
  static TextStyle resolveStyle(Map<UInlineAttr, Object?> active, TextStyle base, ColorScheme cs) {
    final bool link = active.containsKey(UInlineAttr.link);
    final bool inlineCode = active.containsKey(UInlineAttr.code);
    final List<TextDecoration> decos = <TextDecoration>[
      if (active.containsKey(UInlineAttr.underline) || link) TextDecoration.underline,
      if (active.containsKey(UInlineAttr.strikethrough)) TextDecoration.lineThrough,
    ];
    final int? color = active[UInlineAttr.color] as int?;
    final int? highlight = active[UInlineAttr.highlight] as int?;
    final double? size = active[UInlineAttr.fontSize] as double?;
    final bool sup = active.containsKey(UInlineAttr.superscript);
    final bool sub = active.containsKey(UInlineAttr.subscript);
    // Sub/superscript are approximated with a smaller font plus a baseline shift.
    final double? resolvedSize = sup || sub ? (size ?? base.fontSize ?? 16) * 0.72 : size;
    return base.copyWith(
      fontWeight: active.containsKey(UInlineAttr.bold) ? FontWeight.bold : null,
      fontStyle: active.containsKey(UInlineAttr.italic) ? FontStyle.italic : null,
      decoration: decos.isEmpty ? null : TextDecoration.combine(decos),
      decorationColor: link
          ? cs.primary
          : color != null
          ? Color(color)
          : null,
      color: link
          ? cs.primary
          : color != null
          ? Color(color)
          : (inlineCode ? cs.error : null),
      backgroundColor: highlight != null ? Color(highlight) : (inlineCode ? cs.surfaceContainerHighest : null),
      fontSize: resolvedSize,
      fontFamily: active.containsKey(UInlineAttr.fontFamily) ? active[UInlineAttr.fontFamily] as String? : (inlineCode ? "monospace" : null),
      height: sup || sub ? 1.0 : null,
      textBaseline: TextBaseline.alphabetic,
    );
  }
}

/// The cells of a [UBlockType.table] block. Cells hold plain text.
class UTableData {
  UTableData({required this.rows, this.hasHeader = true});

  /// Creates an empty table of [rows] x [columns].
  factory UTableData.empty({int rows = 3, int columns = 3}) => UTableData(
    rows: <List<String>>[
      for (int r = 0; r < rows; r++) <String>[for (int c = 0; c < columns; c++) ""],
    ],
  );

  final List<List<String>> rows;
  bool hasHeader;

  int get rowCount => rows.length;

  int get columnCount => rows.isEmpty ? 0 : rows.first.length;

  void addRow() => rows.add(<String>[for (int c = 0; c < columnCount; c++) ""]);

  void addColumn() {
    for (final List<String> row in rows) row.add("");
  }

  void removeRow(int index) {
    if (rows.length > 1 && index >= 0 && index < rows.length) rows.removeAt(index);
  }

  void removeColumn(int index) {
    if (columnCount <= 1) return;
    for (final List<String> row in rows) {
      if (index >= 0 && index < row.length) row.removeAt(index);
    }
  }

  UTableData copy() => UTableData(rows: <List<String>>[for (final List<String> r in rows) List<String>.from(r)], hasHeader: hasHeader);
}

/// One block in the editor document.
class UEditorBlock {
  UEditorBlock({
    required this.type,
    this.controller,
    this.focusNode,
    this.imageUrl,
    this.imageAlt,
    this.imageWidth,
    this.align = TextAlign.left,
    this.indent = 0,
    this.checked = false,
    this.language,
    this.table,
  }) : id = "b${DateTime.now().microsecondsSinceEpoch}_${_seq++}";

  static int _seq = 0;

  final String id;
  UBlockType type;
  URichTextController? controller;
  FocusNode? focusNode;
  String? imageUrl;
  String? imageAlt;
  double? imageWidth;
  TextAlign align;
  int indent;
  bool checked;
  String? language;
  UTableData? table;

  bool get isText => type != UBlockType.image && type != UBlockType.divider && type != UBlockType.table;

  bool get isList => type == UBlockType.bulleted || type == UBlockType.numbered || type == UBlockType.checklist;

  /// Convenience factory for a text block seeded with [text] and [spans].
  factory UEditorBlock.text(
    UBlockType type, {
    String text = "",
    List<UStyleSpan>? spans,
    TextAlign align = TextAlign.left,
    int indent = 0,
    bool checked = false,
    String? language,
  }) => UEditorBlock(
    type: type,
    controller: URichTextController(text: text, spans: spans),
    focusNode: FocusNode(),
    align: align,
    indent: indent,
    checked: checked,
    language: language,
  );

  void dispose() {
    controller?.dispose();
    focusNode?.dispose();
  }
}

// =============================================================================
//  HTML  (serialize / parse)
// =============================================================================

/// Serializes editor blocks to clean semantic HTML and parses HTML back into
/// blocks. Pure Dart, no external dependencies.
abstract class UHtmlDocument {
  /// Width of a single indent level in CSS pixels.
  static const double indentStep = 24;

  // ---- serialize (blocks -> html) -----------------------------------------

  static String serialize(List<UEditorBlock> blocks) {
    final StringBuffer sb = StringBuffer();
    int i = 0;
    while (i < blocks.length) {
      final UEditorBlock b = blocks[i];
      if (b.isList) {
        final UBlockType listType = b.type;
        final String tag = listType == UBlockType.numbered ? "ol" : "ul";
        final String cls = listType == UBlockType.checklist ? ' class="checklist"' : "";
        sb.write("<$tag$cls>");
        while (i < blocks.length && blocks[i].type == listType) {
          sb.write(_listItem(blocks[i]));
          i++;
        }
        sb.write("</$tag>");
        continue;
      }
      sb.write(_serializeBlock(b));
      i++;
    }
    return sb.toString();
  }

  static String _listItem(UEditorBlock b) {
    final String checked = b.type == UBlockType.checklist ? ' data-checked="${b.checked}"' : "";
    return "<li$checked${_styleAttr(b)}>${inlineHtml(b.controller!)}</li>";
  }

  static String _serializeBlock(UEditorBlock b) {
    final String style = _styleAttr(b);
    switch (b.type) {
      case UBlockType.paragraph:
        return "<p$style>${inlineHtml(b.controller!)}</p>";
      case UBlockType.h1:
        return "<h1$style>${inlineHtml(b.controller!)}</h1>";
      case UBlockType.h2:
        return "<h2$style>${inlineHtml(b.controller!)}</h2>";
      case UBlockType.h3:
        return "<h3$style>${inlineHtml(b.controller!)}</h3>";
      case UBlockType.h4:
        return "<h4$style>${inlineHtml(b.controller!)}</h4>";
      case UBlockType.h5:
        return "<h5$style>${inlineHtml(b.controller!)}</h5>";
      case UBlockType.h6:
        return "<h6$style>${inlineHtml(b.controller!)}</h6>";
      case UBlockType.quote:
        return "<blockquote$style>${inlineHtml(b.controller!)}</blockquote>";
      case UBlockType.code:
        final String lang = (b.language ?? "").trim().isEmpty ? "" : ' class="language-${escapeAttr(b.language!.trim())}"';
        return "<pre><code$lang>${escapeHtml(b.controller!.text)}</code></pre>";
      case UBlockType.divider:
        return "<hr>";
      case UBlockType.image:
        final String alt = escapeAttr(b.imageAlt ?? "");
        final String width = b.imageWidth == null ? "" : ' width="${b.imageWidth!.round()}"';
        return '<figure${_alignStyle(b.align)}><img src="${escapeAttr(b.imageUrl ?? "")}" alt="$alt"$width></figure>';
      case UBlockType.table:
        return _serializeTable(b.table ?? UTableData.empty());
      case UBlockType.bulleted:
      case UBlockType.numbered:
      case UBlockType.checklist:
        return _listItem(b);
    }
  }

  static String _serializeTable(UTableData table) {
    final StringBuffer sb = StringBuffer("<table>");
    for (int r = 0; r < table.rows.length; r++) {
      final bool header = table.hasHeader && r == 0;
      if (header) sb.write("<thead>");
      if (r == (table.hasHeader ? 1 : 0)) sb.write("<tbody>");
      sb.write("<tr>");
      for (final String cell in table.rows[r]) sb.write(header ? "<th>${escapeHtml(cell)}</th>" : "<td>${escapeHtml(cell)}</td>");
      sb.write("</tr>");
      if (header) sb.write("</thead>");
    }
    if (table.rows.length > (table.hasHeader ? 1 : 0)) sb.write("</tbody>");
    sb.write("</table>");
    return sb.toString();
  }

  // Combines alignment and indentation into a single style attribute.
  static String _styleAttr(UEditorBlock b) {
    final List<String> decls = <String>[
      if (_alignValue(b.align) != null) "text-align:${_alignValue(b.align)}",
      if (b.indent > 0) "margin-inline-start:${(b.indent * indentStep).round()}px",
    ];
    return decls.isEmpty ? "" : ' style="${decls.join(";")}"';
  }

  static String _alignStyle(TextAlign align) {
    final String? value = _alignValue(align);
    return value == null ? "" : ' style="text-align:$value"';
  }

  static String? _alignValue(TextAlign align) {
    switch (align) {
      case TextAlign.center:
        return "center";
      case TextAlign.right:
      case TextAlign.end:
        return "right";
      case TextAlign.justify:
        return "justify";
      case TextAlign.left:
      case TextAlign.start:
        return null;
    }
  }

  // Priority order (outer -> inner) for nesting inline tags.
  static const List<UInlineAttr> _priority = <UInlineAttr>[
    UInlineAttr.link,
    UInlineAttr.fontFamily,
    UInlineAttr.highlight,
    UInlineAttr.color,
    UInlineAttr.fontSize,
    UInlineAttr.bold,
    UInlineAttr.italic,
    UInlineAttr.underline,
    UInlineAttr.strikethrough,
    UInlineAttr.code,
    UInlineAttr.superscript,
    UInlineAttr.subscript,
  ];

  /// Serializes one styled text run to inline HTML.
  static String inlineHtml(URichTextController c) => inlineHtmlOf(c.text, c.spans);

  /// Serializes [text] with [spans] to inline HTML.
  static String inlineHtmlOf(String text, List<UStyleSpan> spans) {
    if (text.isEmpty) return "";
    final StringBuffer out = StringBuffer();
    final List<_Tag> stack = <_Tag>[];

    for (int i = 0; i < text.length; i++) {
      final List<_Tag> active = _tagsAt(spans, i);
      int common = 0;
      while (common < stack.length && common < active.length && stack[common] == active[common]) common++;
      for (int k = stack.length - 1; k >= common; k--) out.write(stack[k].close());
      stack.removeRange(common, stack.length);
      for (int k = common; k < active.length; k++) {
        out.write(active[k].open());
        stack.add(active[k]);
      }
      final String ch = text[i];
      out.write(ch == "\n" ? "<br>" : escapeHtml(ch));
    }
    for (int k = stack.length - 1; k >= 0; k--) out.write(stack[k].close());
    return out.toString();
  }

  static List<_Tag> _tagsAt(List<UStyleSpan> spans, int i) {
    final Map<UInlineAttr, Object?> active = <UInlineAttr, Object?>{};
    for (final UStyleSpan sp in spans) {
      if (i >= sp.start && i < sp.end) active[sp.attr] = sp.value;
    }
    final List<_Tag> tags = <_Tag>[];
    for (final UInlineAttr attr in _priority) {
      if (active.containsKey(attr)) tags.add(_Tag(attr, active[attr]));
    }
    return tags;
  }

  static String escapeHtml(String s) => s.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");

  static String escapeAttr(String s) => escapeHtml(s).replaceAll('"', "&quot;");

  // ---- parse (html -> blocks) ---------------------------------------------

  static List<UEditorBlock> parse(String? html) {
    final String input = (html ?? "").trim();
    if (input.isEmpty) return <UEditorBlock>[UEditorBlock.text(UBlockType.paragraph)];

    final List<_Node> nodes = _Parser(input).parse();
    final List<UEditorBlock> blocks = <UEditorBlock>[];
    _walkTopLevel(nodes, blocks);

    if (blocks.isEmpty) blocks.add(UEditorBlock.text(UBlockType.paragraph));
    return blocks;
  }

  /// Strips all tags, returning the readable text of [html].
  static String toPlainText(String? html) {
    final List<UEditorBlock> blocks = parse(html);
    final String text = blocks
        .map((UEditorBlock b) => b.isText ? b.controller!.text : (b.type == UBlockType.table ? (b.table?.rows.map((List<String> r) => r.join(" ")).join("\n") ?? "") : ""))
        .where((String s) => s.isNotEmpty)
        .join("\n");
    for (final UEditorBlock b in blocks) b.dispose();
    return text;
  }

  /// Number of whitespace-separated words in [html].
  static int wordCount(String? html) => toPlainText(html).split(RegExp(r"\s+")).where((String w) => w.trim().isNotEmpty).length;

  /// Number of characters (excluding markup) in [html].
  static int characterCount(String? html) => toPlainText(html).replaceAll("\n", "").length;

  /// Rough reading time in minutes at [wordsPerMinute].
  static int readingMinutes(String? html, {int wordsPerMinute = 200}) {
    final int words = wordCount(html);
    return words == 0 ? 0 : (words / wordsPerMinute).ceil();
  }

  static void _walkTopLevel(List<_Node> nodes, List<UEditorBlock> blocks) {
    for (final _Node node in nodes) {
      if (node.isText) {
        final String txt = node.text!.trim();
        if (txt.isNotEmpty) blocks.add(UEditorBlock.text(UBlockType.paragraph, text: node.text!));
        continue;
      }
      switch (node.tag) {
        case "p":
        case "div":
        case "section":
        case "article":
          _addInlineBlock(node, UBlockType.paragraph, blocks);
        case "h1":
          _addInlineBlock(node, UBlockType.h1, blocks);
        case "h2":
          _addInlineBlock(node, UBlockType.h2, blocks);
        case "h3":
          _addInlineBlock(node, UBlockType.h3, blocks);
        case "h4":
          _addInlineBlock(node, UBlockType.h4, blocks);
        case "h5":
          _addInlineBlock(node, UBlockType.h5, blocks);
        case "h6":
          _addInlineBlock(node, UBlockType.h6, blocks);
        case "blockquote":
          _addInlineBlock(node, UBlockType.quote, blocks);
        case "pre":
          blocks.add(UEditorBlock.text(UBlockType.code, text: _plainText(node), language: _languageOf(node)));
        case "hr":
          blocks.add(UEditorBlock(type: UBlockType.divider));
        case "ul":
          _addList(node, node.attrs["class"]?.contains("checklist") ?? false ? UBlockType.checklist : UBlockType.bulleted, blocks);
        case "ol":
          _addList(node, UBlockType.numbered, blocks);
        case "table":
          blocks.add(UEditorBlock(type: UBlockType.table, table: _parseTable(node)));
        case "figure":
          final _Node? img = _findFirst(node, "img");
          if (img != null) blocks.add(_imageBlock(img, _alignOf(node)));
          _walkTopLevel(node.children.where((_Node n) => !n.isText && n.tag != "img" && n.tag != "figcaption").toList(), blocks);
        case "img":
          blocks.add(_imageBlock(node, TextAlign.left));
        case "br":
          break;
        default:
          _walkTopLevel(node.children, blocks);
      }
    }
  }

  static String? _languageOf(_Node pre) {
    final _Node? code = _findFirst(pre, "code");
    final String cls = code?.attrs["class"] ?? pre.attrs["class"] ?? "";
    final RegExpMatch? m = RegExp(r"language-([\w+#-]+)").firstMatch(cls);
    return m?.group(1);
  }

  static UTableData _parseTable(_Node node) {
    final List<List<String>> rows = <List<String>>[];
    bool hasHeader = false;
    void walkRows(_Node n) {
      if (n.isText) return;
      if (n.tag == "tr") {
        final List<String> cells = <String>[];
        for (final _Node cell in n.children.where((_Node c) => !c.isText && (c.tag == "td" || c.tag == "th"))) {
          if (cell.tag == "th" && rows.isEmpty) hasHeader = true;
          cells.add(_plainText(cell).trim());
        }
        if (cells.isNotEmpty) rows.add(cells);
        return;
      }
      n.children.forEach(walkRows);
    }

    node.children.forEach(walkRows);
    if (rows.isEmpty) return UTableData.empty();
    // Pad short rows so the grid stays rectangular.
    final int width = rows.map((List<String> r) => r.length).reduce((int a, int b) => a > b ? a : b);
    for (final List<String> r in rows) {
      while (r.length < width) r.add("");
    }
    return UTableData(rows: rows, hasHeader: hasHeader);
  }

  static void _addInlineBlock(_Node node, UBlockType type, List<UEditorBlock> blocks) {
    final _Inline inline = _collectInline(node);
    blocks.add(UEditorBlock.text(type, text: inline.text, spans: inline.spans, align: _alignOf(node), indent: _indentOf(node)));
  }

  static void _addList(_Node node, UBlockType itemType, List<UEditorBlock> blocks) {
    for (final _Node li in node.children.where((_Node n) => !n.isText && n.tag == "li")) {
      final _Inline inline = _collectInline(li);
      final bool checked = (li.attrs["data-checked"] ?? "").toLowerCase() == "true";
      blocks.add(UEditorBlock.text(itemType, text: inline.text, spans: inline.spans, align: _alignOf(li), indent: _indentOf(li), checked: checked));
      // Nested lists become deeper-indented items of the same kind.
      for (final _Node nested in li.children.where((_Node n) => !n.isText && (n.tag == "ul" || n.tag == "ol"))) {
        final int before = blocks.length;
        _addList(nested, nested.tag == "ol" ? UBlockType.numbered : itemType, blocks);
        for (int i = before; i < blocks.length; i++) blocks[i].indent += 1;
      }
    }
  }

  static UEditorBlock _imageBlock(_Node img, TextAlign align) => UEditorBlock(
    type: UBlockType.image,
    imageUrl: img.attrs["src"],
    imageAlt: img.attrs["alt"],
    imageWidth: double.tryParse((img.attrs["width"] ?? "").replaceAll("px", "")),
    align: align,
  );

  static TextAlign _alignOf(_Node node) {
    final String? style = node.attrs["style"];
    if (style == null) return TextAlign.left;
    final RegExpMatch? m = RegExp(r"text-align\s*:\s*([a-z]+)").firstMatch(style.toLowerCase());
    switch (m?.group(1)) {
      case "center":
        return TextAlign.center;
      case "right":
        return TextAlign.right;
      case "justify":
        return TextAlign.justify;
      default:
        return TextAlign.left;
    }
  }

  static int _indentOf(_Node node) {
    final String style = (node.attrs["style"] ?? "").toLowerCase();
    final RegExpMatch? m = RegExp(r"(?:margin-inline-start|margin-left|padding-left)\s*:\s*([\d.]+)px").firstMatch(style);
    if (m == null) return 0;
    final double px = double.tryParse(m.group(1)!) ?? 0;
    return (px / indentStep).round().clamp(0, 8);
  }

  static _Node? _findFirst(_Node node, String tag) {
    for (final _Node c in node.children) {
      if (!c.isText && c.tag == tag) return c;
      final _Node? deep = _findFirst(c, tag);
      if (deep != null) return deep;
    }
    return null;
  }

  static String _plainText(_Node node) {
    final StringBuffer sb = StringBuffer();
    void walk(_Node n) {
      if (n.isText) {
        sb.write(n.text);
        return;
      }
      if (n.tag == "br") {
        sb.write("\n");
        return;
      }
      n.children.forEach(walk);
    }

    node.children.forEach(walk);
    return sb.toString();
  }

  static _Inline _collectInline(_Node node) {
    final StringBuffer buffer = StringBuffer();
    final List<UStyleSpan> spans = <UStyleSpan>[];

    void walk(_Node n) {
      if (n.isText) {
        buffer.write(n.text);
        return;
      }
      if (n.tag == "br") {
        buffer.write("\n");
        return;
      }
      // Nested lists are handled by the caller, not inlined into the item text.
      if (n.tag == "ul" || n.tag == "ol") return;
      final int start = buffer.length;
      final List<UStyleSpan> local = <UStyleSpan>[];
      switch (n.tag) {
        case "strong":
        case "b":
          local.add(UStyleSpan(start: start, end: start, attr: UInlineAttr.bold));
        case "em":
        case "i":
          local.add(UStyleSpan(start: start, end: start, attr: UInlineAttr.italic));
        case "u":
        case "ins":
          local.add(UStyleSpan(start: start, end: start, attr: UInlineAttr.underline));
        case "s":
        case "strike":
        case "del":
          local.add(UStyleSpan(start: start, end: start, attr: UInlineAttr.strikethrough));
        case "code":
        case "kbd":
        case "samp":
          local.add(UStyleSpan(start: start, end: start, attr: UInlineAttr.code));
        case "sup":
          local.add(UStyleSpan(start: start, end: start, attr: UInlineAttr.superscript));
        case "sub":
          local.add(UStyleSpan(start: start, end: start, attr: UInlineAttr.subscript));
        case "mark":
          final Map<UInlineAttr, Object?> styles = _parseInlineStyle(n.attrs["style"], null);
          local.add(UStyleSpan(start: start, end: start, attr: UInlineAttr.highlight, value: styles[UInlineAttr.highlight] ?? 0xFFFFF59D));
        case "a":
          final String? href = n.attrs["href"];
          if (href != null) local.add(UStyleSpan(start: start, end: start, attr: UInlineAttr.link, value: href));
        case "span":
        case "font":
          final Map<UInlineAttr, Object?> styles = _parseInlineStyle(n.attrs["style"], n.attrs["color"]);
          styles.forEach((UInlineAttr attr, Object? value) => local.add(UStyleSpan(start: start, end: start, attr: attr, value: value)));
      }
      n.children.forEach(walk);
      final int end = buffer.length;
      for (final UStyleSpan sp in local) {
        if (end > start) spans.add(UStyleSpan(start: start, end: end, attr: sp.attr, value: sp.value));
      }
    }

    node.children.forEach(walk);
    return _Inline(buffer.toString(), spans);
  }

  static Map<UInlineAttr, Object?> _parseInlineStyle(String? style, String? colorAttr) {
    final Map<UInlineAttr, Object?> result = <UInlineAttr, Object?>{};
    if (colorAttr != null) {
      final int? c = parseCssColor(colorAttr);
      if (c != null) result[UInlineAttr.color] = c;
    }
    if (style == null) return result;
    for (final String decl in style.split(";")) {
      final int idx = decl.indexOf(":");
      if (idx <= 0) continue;
      final String prop = decl.substring(0, idx).trim().toLowerCase();
      final String value = decl.substring(idx + 1).trim();
      if (prop == "color") {
        final int? c = parseCssColor(value);
        if (c != null) result[UInlineAttr.color] = c;
      } else if (prop == "background-color" || prop == "background") {
        final int? c = parseCssColor(value);
        if (c != null) result[UInlineAttr.highlight] = c;
      } else if (prop == "font-size") {
        final double? size = _parseFontSize(value);
        if (size != null) result[UInlineAttr.fontSize] = size;
      } else if (prop == "font-family") {
        final String family = value.split(",").first.replaceAll('"', "").replaceAll("'", "").trim();
        if (family.isNotEmpty) result[UInlineAttr.fontFamily] = family;
      } else if (prop == "font-weight") {
        if (value == "bold" || (int.tryParse(value) ?? 0) >= 600) result[UInlineAttr.bold] = null;
      } else if (prop == "font-style" && value == "italic") {
        result[UInlineAttr.italic] = null;
      } else if (prop == "vertical-align") {
        if (value == "super") result[UInlineAttr.superscript] = null;
        if (value == "sub") result[UInlineAttr.subscript] = null;
      } else if (prop == "text-decoration" || prop == "text-decoration-line") {
        if (value.contains("underline")) result[UInlineAttr.underline] = null;
        if (value.contains("line-through")) result[UInlineAttr.strikethrough] = null;
      }
    }
    return result;
  }

  /// Parses `#rgb`, `#rrggbb`, `#aarrggbb` and `rgb()/rgba()` into ARGB.
  static int? parseCssColor(String raw) {
    String v = raw.trim().toLowerCase();
    if (v.startsWith("#")) {
      v = v.substring(1);
      if (v.length == 3) v = v.split("").map((String c) => "$c$c").join();
      if (v.length == 6) {
        final int? rgb = int.tryParse(v, radix: 16);
        if (rgb != null) return 0xFF000000 | rgb;
      }
      if (v.length == 8) return int.tryParse(v, radix: 16);
      return null;
    }
    if (v.startsWith("rgb")) {
      final RegExpMatch? m = RegExp(r"(\d+)\D+(\d+)\D+(\d+)").firstMatch(v);
      if (m != null) {
        final int r = int.parse(m.group(1)!);
        final int g = int.parse(m.group(2)!);
        final int b = int.parse(m.group(3)!);
        return 0xFF000000 | (r << 16) | (g << 8) | b;
      }
    }
    return null;
  }

  static double? _parseFontSize(String raw) {
    final RegExpMatch? m = RegExp(r"([\d.]+)\s*px").firstMatch(raw.toLowerCase());
    if (m != null) return double.tryParse(m.group(1)!);
    return double.tryParse(raw);
  }
}

// ---- serialize helpers ------------------------------------------------------

class _Tag {
  _Tag(this.attr, this.value);

  final UInlineAttr attr;
  final Object? value;

  String open() {
    switch (attr) {
      case UInlineAttr.bold:
        return "<strong>";
      case UInlineAttr.italic:
        return "<em>";
      case UInlineAttr.underline:
        return "<u>";
      case UInlineAttr.strikethrough:
        return "<s>";
      case UInlineAttr.code:
        return "<code>";
      case UInlineAttr.superscript:
        return "<sup>";
      case UInlineAttr.subscript:
        return "<sub>";
      case UInlineAttr.link:
        return '<a href="${UHtmlDocument.escapeAttr("$value")}">';
      case UInlineAttr.color:
        return '<span style="color:${_hex(value! as int)}">';
      case UInlineAttr.highlight:
        return '<mark style="background-color:${_hex(value! as int)}">';
      case UInlineAttr.fontSize:
        return '<span style="font-size:${_size(value! as double)}">';
      case UInlineAttr.fontFamily:
        return '<span style="font-family:${UHtmlDocument.escapeAttr("$value")}">';
    }
  }

  String close() {
    switch (attr) {
      case UInlineAttr.bold:
        return "</strong>";
      case UInlineAttr.italic:
        return "</em>";
      case UInlineAttr.underline:
        return "</u>";
      case UInlineAttr.strikethrough:
        return "</s>";
      case UInlineAttr.code:
        return "</code>";
      case UInlineAttr.superscript:
        return "</sup>";
      case UInlineAttr.subscript:
        return "</sub>";
      case UInlineAttr.link:
        return "</a>";
      case UInlineAttr.highlight:
        return "</mark>";
      case UInlineAttr.color:
      case UInlineAttr.fontSize:
      case UInlineAttr.fontFamily:
        return "</span>";
    }
  }

  static String _hex(int argb) => "#${(argb & 0xFFFFFF).toRadixString(16).padLeft(6, "0")}";

  static String _size(double px) => px == px.roundToDouble() ? "${px.toInt()}px" : "${px}px";

  @override
  bool operator ==(Object other) => other is _Tag && other.attr == attr && other.value == value;

  @override
  int get hashCode => Object.hash(attr, value);
}

// ---- parse model ------------------------------------------------------------

class _Inline {
  _Inline(this.text, this.spans);

  final String text;
  final List<UStyleSpan> spans;
}

class _Node {
  _Node.element(this.tag) : isText = false, text = null;

  _Node.textNode(this.text) : isText = true, tag = "";

  final bool isText;
  String tag;
  final String? text;
  final Map<String, String> attrs = <String, String>{};
  final List<_Node> children = <_Node>[];
}

/// Minimal, forgiving HTML tokenizer + tree builder for the supported subset.
class _Parser {
  _Parser(this.src);

  final String src;
  int _pos = 0;

  static const Set<String> _void = <String>{"img", "hr", "br", "input", "meta", "link", "source", "col"};

  List<_Node> parse() {
    final _Node root = _Node.element("#root");
    final List<_Node> stack = <_Node>[root];

    while (_pos < src.length) {
      final int lt = src.indexOf("<", _pos);
      if (lt < 0) {
        _appendText(stack.last, src.substring(_pos));
        break;
      }
      if (lt > _pos) _appendText(stack.last, src.substring(_pos, lt));

      final int gt = src.indexOf(">", lt);
      if (gt < 0) {
        _appendText(stack.last, src.substring(lt));
        break;
      }
      String raw = src.substring(lt + 1, gt).trim();
      _pos = gt + 1;

      if (raw.startsWith("!") || raw.startsWith("?")) continue;

      if (raw.startsWith("/")) {
        final String name = raw.substring(1).trim().toLowerCase();
        for (int i = stack.length - 1; i > 0; i--) {
          if (stack[i].tag == name) {
            stack.removeRange(i, stack.length);
            break;
          }
        }
        continue;
      }

      final bool selfClose = raw.endsWith("/");
      if (selfClose) raw = raw.substring(0, raw.length - 1).trim();

      final _Node el = _parseTag(raw);
      // Drop non-content elements entirely, including their inner text.
      if (el.tag == "script" || el.tag == "style") {
        final int end = src.toLowerCase().indexOf("</${el.tag}>", _pos);
        _pos = end < 0 ? src.length : end + el.tag.length + 3;
        continue;
      }
      stack.last.children.add(el);
      if (!selfClose && !_void.contains(el.tag)) stack.add(el);
    }
    return root.children;
  }

  void _appendText(_Node parent, String raw) {
    if (raw.isEmpty) return;
    parent.children.add(_Node.textNode(_decode(raw)));
  }

  _Node _parseTag(String raw) {
    int i = 0;
    while (i < raw.length && !_isSpace(raw[i])) i++;
    final _Node el = _Node.element(raw.substring(0, i).toLowerCase());
    final RegExp attr = RegExp("""([a-zA-Z_:-][a-zA-Z0-9_:.-]*)\\s*(?:=\\s*("[^"]*"|'[^']*'|[^\\s>]+))?""");
    for (final RegExpMatch m in attr.allMatches(raw.substring(i))) {
      final String key = m.group(1)!.toLowerCase();
      String? value = m.group(2);
      if (value != null && value.length >= 2 && (value.startsWith('"') || value.startsWith("'"))) value = value.substring(1, value.length - 1);
      el.attrs[key] = _decode(value ?? "");
    }
    return el;
  }

  bool _isSpace(String c) => c == " " || c == "\t" || c == "\n" || c == "\r";

  static String _decode(String s) {
    if (!s.contains("&")) return s;
    return s
        .replaceAll("&nbsp;", " ")
        .replaceAll("&amp;", "&")
        .replaceAll("&lt;", "<")
        .replaceAll("&gt;", ">")
        .replaceAll("&quot;", '"')
        .replaceAll("&#39;", "'")
        .replaceAll("&#x27;", "'")
        .replaceAllMapped(RegExp(r"&#(\d+);"), (Match m) => String.fromCharCode(int.parse(m.group(1)!)))
        .replaceAllMapped(RegExp(r"&#x([0-9a-fA-F]+);"), (Match m) => String.fromCharCode(int.parse(m.group(1)!, radix: 16)));
  }
}

// =============================================================================
//  STYLES
// =============================================================================

/// Shared visual styling for editor blocks (used by the editors and [UHtmlView]).
abstract class UEditorStyles {
  /// Font families offered by the editors' font picker.
  static const List<String> fontFamilies = <String>["Default", "serif", "sans-serif", "monospace", "cursive"];

  /// Font sizes offered by the editors' size picker.
  static const List<double> fontSizes = <double>[10, 11, 12, 14, 16, 18, 20, 24, 28, 32, 40, 48, 64];

  /// A small palette used for quick text/highlight colour picking.
  static const List<int> palette = <int>[
    0xFF000000,
    0xFF616161,
    0xFF9E9E9E,
    0xFFD32F2F,
    0xFFE64A19,
    0xFFF9A825,
    0xFF388E3C,
    0xFF0288D1,
    0xFF1976D2,
    0xFF7B1FA2,
    0xFFFFF59D,
    0xFFA5D6A7,
    0xFF90CAF9,
    0xFFF48FB1,
    0xFFFFFFFF,
  ];

  static TextStyle baseStyle(BuildContext context, UBlockType type) {
    final TextTheme t = Theme.of(context).textTheme;
    final ColorScheme cs = Theme.of(context).colorScheme;
    switch (type) {
      case UBlockType.h1:
        return (t.headlineMedium ?? const TextStyle(fontSize: 30)).copyWith(fontWeight: FontWeight.bold);
      case UBlockType.h2:
        return (t.headlineSmall ?? const TextStyle(fontSize: 24)).copyWith(fontWeight: FontWeight.bold);
      case UBlockType.h3:
        return (t.titleLarge ?? const TextStyle(fontSize: 20)).copyWith(fontWeight: FontWeight.bold);
      case UBlockType.h4:
        return (t.titleMedium ?? const TextStyle(fontSize: 18)).copyWith(fontWeight: FontWeight.bold);
      case UBlockType.h5:
        return (t.titleSmall ?? const TextStyle(fontSize: 16)).copyWith(fontWeight: FontWeight.bold);
      case UBlockType.h6:
        return (t.bodyLarge ?? const TextStyle(fontSize: 15)).copyWith(fontWeight: FontWeight.bold, color: cs.onSurfaceVariant);
      case UBlockType.quote:
        return (t.bodyLarge ?? const TextStyle(fontSize: 16)).copyWith(fontStyle: FontStyle.italic, color: cs.onSurfaceVariant);
      case UBlockType.code:
        return (t.bodyMedium ?? const TextStyle(fontSize: 14)).copyWith(fontFamily: "monospace", color: cs.onSurface);
      case UBlockType.paragraph:
      case UBlockType.bulleted:
      case UBlockType.numbered:
      case UBlockType.checklist:
      case UBlockType.image:
      case UBlockType.divider:
      case UBlockType.table:
        return t.bodyLarge ?? const TextStyle(fontSize: 16);
    }
  }

  /// Vertical breathing room above/below a block of [type].
  static EdgeInsets spacing(UBlockType type) {
    switch (type) {
      case UBlockType.h1:
      case UBlockType.h2:
        return const EdgeInsets.only(top: 16, bottom: 6);
      case UBlockType.h3:
      case UBlockType.h4:
      case UBlockType.h5:
      case UBlockType.h6:
        return const EdgeInsets.only(top: 12, bottom: 4);
      case UBlockType.divider:
      case UBlockType.image:
      case UBlockType.table:
        return const EdgeInsets.symmetric(vertical: 10);
      case UBlockType.paragraph:
      case UBlockType.quote:
      case UBlockType.code:
      case UBlockType.bulleted:
      case UBlockType.numbered:
      case UBlockType.checklist:
        return const EdgeInsets.symmetric(vertical: 4);
    }
  }

  /// Wrap a block's content with type-specific chrome (quote bar, code panel).
  static Widget decorate(BuildContext context, UBlockType type, Widget child) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    switch (type) {
      case UBlockType.quote:
        return Container(
          padding: const EdgeInsets.only(left: 12, top: 4, bottom: 4),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 4, color: cs.primary)),
          ),
          child: child,
        );
      case UBlockType.code:
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: cs.surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
          child: child,
        );
      default:
        return child;
    }
  }

  /// Localized label for a block type.
  static String label(UBlockType t) {
    switch (t) {
      case UBlockType.paragraph:
        return U.s.normalText;
      case UBlockType.h1:
        return U.s.heading1;
      case UBlockType.h2:
        return U.s.heading2;
      case UBlockType.h3:
        return U.s.heading3;
      case UBlockType.h4:
        return U.s.heading4;
      case UBlockType.h5:
        return U.s.heading5;
      case UBlockType.h6:
        return U.s.heading6;
      case UBlockType.quote:
        return U.s.quote;
      case UBlockType.bulleted:
        return U.s.bulletedList;
      case UBlockType.numbered:
        return U.s.numberedList;
      case UBlockType.checklist:
        return U.s.checklist;
      case UBlockType.code:
        return U.s.codeBlock;
      case UBlockType.table:
        return U.s.table;
      case UBlockType.image:
        return U.s.insertImage;
      case UBlockType.divider:
        return U.s.divider;
    }
  }
}
