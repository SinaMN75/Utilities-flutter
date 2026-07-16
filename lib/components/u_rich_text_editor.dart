import "package:u/utilities.dart";

/// A self-contained, cross-platform rich text editor that produces and consumes
/// HTML. No third-party editor packages are used.
///
/// Public API:
///  * [URichTextEditor] – embeddable block editor widget.
///  * [URichTextEditor.open] – push a full-screen editor and get the HTML back.
///  * [UHtmlView] – read-only renderer for stored HTML (native widgets, no WebView).
///  * [UHtmlDocument] – blocks ⇄ HTML serialize/parse.
///
/// Everything lives in this single file so it can be dropped into any project
/// that depends on the `u` package.

// =============================================================================
//  MODEL
// =============================================================================

/// Inline formatting attributes that can be applied to a range of characters.
enum UInlineAttr { bold, italic, underline, strikethrough, color, fontSize, link }

/// Block level types the editor supports. All values except [UBlockType.image]
/// and [UBlockType.divider] are text blocks that own a [URichTextController].
enum UBlockType { paragraph, h1, h2, h3, quote, bulleted, numbered, code, image, divider }

/// A single inline style span over the range [start, end) of a text block.
/// [value] carries the payload for value-attributes: `int` (ARGB) for
/// [UInlineAttr.color], `double` for [UInlineAttr.fontSize] and `String` (href)
/// for [UInlineAttr.link]. It is null for boolean attributes.
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

  // Keep spans aligned with the text whenever the value changes.
  @override
  set value(TextEditingValue newValue) {
    final String oldText = value.text;
    final String newText = newValue.text;
    if (oldText != newText) _shiftSpans(oldText, newText);
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
      final int a = _mapStart(sp.start, prefix, removedEnd, delta);
      final int b = _mapEnd(sp.end, prefix, removedEnd, delta);
      if (b > a) next.add(UStyleSpan(start: a, end: b, attr: sp.attr, value: sp.value));
    }
    spans
      ..clear()
      ..addAll(next);
  }

  int _mapStart(int x, int prefix, int removedEnd, int delta) {
    if (x <= prefix) return x;
    if (x >= removedEnd) return x + delta;
    return prefix;
  }

  int _mapEnd(int x, int prefix, int removedEnd, int delta) {
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
    for (final UInlineAttr attr in <UInlineAttr>[UInlineAttr.bold, UInlineAttr.italic, UInlineAttr.underline, UInlineAttr.strikethrough]) {
      if (s == e) {
        if (_attrCoversPoint(attr, s)) result.add(attr);
      } else if (_attrCoversRange(attr, s, e)) {
        result.add(attr);
      }
    }
    return result;
  }

  /// The href active at the current selection, or null.
  String? activeLink() {
    final TextSelection sel = selection;
    if (!sel.isValid) return null;
    final int probe = sel.isCollapsed ? sel.start - 1 : sel.start;
    for (final UStyleSpan sp in spans) {
      if (sp.attr == UInlineAttr.link && probe >= sp.start && probe < sp.end) return sp.value as String?;
    }
    return null;
  }

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

  /// Toggle a boolean attribute over the current selection.
  void toggleAttribute(UInlineAttr attr) {
    final TextSelection sel = selection;
    if (!sel.isValid || sel.isCollapsed) return;
    if (_attrCoversRange(attr, sel.start, sel.end))
      _removeAttr(attr, sel.start, sel.end);
    else
      _addSpan(UStyleSpan(start: sel.start, end: sel.end, attr: attr));
    _normalize();
    notifyListeners();
  }

  /// Apply (or clear when [value] is null) a value-attribute over the selection.
  void applyValue(UInlineAttr attr, Object? value) {
    final TextSelection sel = selection;
    if (!sel.isValid || sel.isCollapsed) return;
    _removeAttr(attr, sel.start, sel.end);
    if (value != null) _addSpan(UStyleSpan(start: sel.start, end: sel.end, attr: attr, value: value));
    _normalize();
    notifyListeners();
  }

  /// Remove every inline attribute over the current selection.
  void clearFormatting() {
    final TextSelection sel = selection;
    if (!sel.isValid || sel.isCollapsed) return;
    for (final UInlineAttr attr in UInlineAttr.values) _removeAttr(attr, sel.start, sel.end);
    _normalize();
    notifyListeners();
  }

  void _addSpan(UStyleSpan span) => spans.add(span);

  // Subtract the range [s, e) from every span of [attr], splitting as needed.
  void _removeAttr(UInlineAttr attr, int s, int e) {
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

  // Merge touching/overlapping spans that share attr + value.
  void _normalize() {
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

  // ---- rendering ----------------------------------------------------------

  @override
  TextSpan buildTextSpan({required BuildContext context, required bool withComposing, TextStyle? style}) {
    final String t = text;
    final TextStyle base = style ?? const TextStyle();
    if (t.isEmpty || spans.isEmpty) return TextSpan(style: base, text: t);

    final Color linkColor = Theme.of(context).colorScheme.primary;
    final List<InlineSpan> children = <InlineSpan>[];
    int runStart = 0;
    TextStyle current = _styleAt(0, base, linkColor);
    for (int i = 1; i <= t.length; i++) {
      final TextStyle st = i < t.length ? _styleAt(i, base, linkColor) : current;
      if (i == t.length || st != current) {
        children.add(TextSpan(text: t.substring(runStart, i), style: current));
        runStart = i;
        current = st;
      }
    }
    return TextSpan(style: base, children: children);
  }

  TextStyle _styleAt(int i, TextStyle base, Color linkColor) {
    bool bold = false;
    bool italic = false;
    bool underline = false;
    bool strike = false;
    bool link = false;
    int? color;
    double? size;
    for (final UStyleSpan sp in spans) {
      if (i < sp.start || i >= sp.end) continue;
      switch (sp.attr) {
        case UInlineAttr.bold:
          bold = true;
        case UInlineAttr.italic:
          italic = true;
        case UInlineAttr.underline:
          underline = true;
        case UInlineAttr.strikethrough:
          strike = true;
        case UInlineAttr.color:
          color = sp.value as int?;
        case UInlineAttr.fontSize:
          size = sp.value as double?;
        case UInlineAttr.link:
          link = true;
      }
    }
    final List<TextDecoration> decos = <TextDecoration>[
      if (underline || link) TextDecoration.underline,
      if (strike) TextDecoration.lineThrough,
    ];
    return base.copyWith(
      fontWeight: bold ? FontWeight.bold : null,
      fontStyle: italic ? FontStyle.italic : null,
      decoration: decos.isEmpty ? null : TextDecoration.combine(decos),
      color: link ? linkColor : (color != null ? Color(color) : null),
      fontSize: size,
    );
  }
}

/// One block in the editor document.
class UEditorBlock {
  UEditorBlock({required this.type, this.controller, this.focusNode, this.imageUrl, this.imageAlt, this.align = TextAlign.left}) : id = "b${DateTime.now().microsecondsSinceEpoch}_${_seq++}";

  static int _seq = 0;

  final String id;
  UBlockType type;
  URichTextController? controller;
  FocusNode? focusNode;
  String? imageUrl;
  String? imageAlt;
  TextAlign align;

  bool get isText => type != UBlockType.image && type != UBlockType.divider;

  /// Convenience factory for a text block seeded with [text] and [spans].
  factory UEditorBlock.text(UBlockType type, {String text = "", List<UStyleSpan>? spans, TextAlign align = TextAlign.left}) => UEditorBlock(
    type: type,
    controller: URichTextController(text: text, spans: spans),
    focusNode: FocusNode(),
    align: align,
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
  // ---- serialize (blocks -> html) -----------------------------------------

  static String serialize(List<UEditorBlock> blocks) {
    final StringBuffer sb = StringBuffer();
    int i = 0;
    while (i < blocks.length) {
      final UEditorBlock b = blocks[i];
      if (b.type == UBlockType.bulleted || b.type == UBlockType.numbered) {
        final UBlockType listType = b.type;
        final String tag = listType == UBlockType.bulleted ? "ul" : "ol";
        sb.write("<$tag>");
        while (i < blocks.length && blocks[i].type == listType) {
          sb.write("<li>${_inline(blocks[i].controller!)}</li>");
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

  static String _serializeBlock(UEditorBlock b) {
    final String align = _alignAttr(b.align);
    switch (b.type) {
      case UBlockType.paragraph:
        return "<p$align>${_inline(b.controller!)}</p>";
      case UBlockType.h1:
        return "<h1$align>${_inline(b.controller!)}</h1>";
      case UBlockType.h2:
        return "<h2$align>${_inline(b.controller!)}</h2>";
      case UBlockType.h3:
        return "<h3$align>${_inline(b.controller!)}</h3>";
      case UBlockType.quote:
        return "<blockquote$align>${_inline(b.controller!)}</blockquote>";
      case UBlockType.code:
        return "<pre><code>${_escape(b.controller!.text)}</code></pre>";
      case UBlockType.divider:
        return "<hr>";
      case UBlockType.image:
        final String alt = _escapeAttr(b.imageAlt ?? "");
        return '<figure><img src="${_escapeAttr(b.imageUrl ?? "")}" alt="$alt"></figure>';
      case UBlockType.bulleted:
      case UBlockType.numbered:
        return "<li>${_inline(b.controller!)}</li>";
    }
  }

  static String _alignAttr(TextAlign align) {
    switch (align) {
      case TextAlign.center:
        return ' style="text-align:center"';
      case TextAlign.right:
      case TextAlign.end:
        return ' style="text-align:right"';
      case TextAlign.justify:
        return ' style="text-align:justify"';
      case TextAlign.left:
      case TextAlign.start:
        return "";
    }
  }

  // Priority order (outer -> inner) for nesting inline tags.
  static const List<UInlineAttr> _priority = <UInlineAttr>[
    UInlineAttr.link,
    UInlineAttr.color,
    UInlineAttr.fontSize,
    UInlineAttr.bold,
    UInlineAttr.italic,
    UInlineAttr.underline,
    UInlineAttr.strikethrough,
  ];

  static String _inline(URichTextController c) {
    final String t = c.text;
    if (t.isEmpty) return "";
    final StringBuffer out = StringBuffer();
    final List<_Tag> stack = <_Tag>[];

    for (int i = 0; i < t.length; i++) {
      final List<_Tag> active = _tagsAt(c.spans, i);
      int common = 0;
      while (common < stack.length && common < active.length && stack[common] == active[common]) common++;
      for (int k = stack.length - 1; k >= common; k--) out.write(stack[k].close());
      stack.removeRange(common, stack.length);
      for (int k = common; k < active.length; k++) {
        out.write(active[k].open());
        stack.add(active[k]);
      }
      final String ch = t[i];
      out.write(ch == "\n" ? "<br>" : _escape(ch));
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

  static String _escape(String s) => s.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");

  static String _escapeAttr(String s) => _escape(s).replaceAll('"', "&quot;");

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
          _addInlineBlock(node, UBlockType.paragraph, blocks);
        case "h1":
          _addInlineBlock(node, UBlockType.h1, blocks);
        case "h2":
          _addInlineBlock(node, UBlockType.h2, blocks);
        case "h3":
        case "h4":
        case "h5":
        case "h6":
          _addInlineBlock(node, UBlockType.h3, blocks);
        case "blockquote":
          _addInlineBlock(node, UBlockType.quote, blocks);
        case "pre":
          blocks.add(UEditorBlock.text(UBlockType.code, text: _plainText(node)));
        case "hr":
          blocks.add(UEditorBlock(type: UBlockType.divider));
        case "ul":
          _addList(node, UBlockType.bulleted, blocks);
        case "ol":
          _addList(node, UBlockType.numbered, blocks);
        case "figure":
          final _Node? img = _findFirst(node, "img");
          if (img != null) blocks.add(_imageBlock(img));
          _walkTopLevel(node.children.where((_Node n) => !n.isText && n.tag != "img" && n.tag != "figcaption").toList(), blocks);
        case "img":
          blocks.add(_imageBlock(node));
        case "br":
          break;
        default:
          _walkTopLevel(node.children, blocks);
      }
    }
  }

  static void _addInlineBlock(_Node node, UBlockType type, List<UEditorBlock> blocks) {
    final _Inline inline = _collectInline(node);
    blocks.add(UEditorBlock.text(type, text: inline.text, spans: inline.spans, align: _alignOf(node)));
  }

  static void _addList(_Node node, UBlockType itemType, List<UEditorBlock> blocks) {
    for (final _Node li in node.children.where((_Node n) => !n.isText && n.tag == "li")) {
      final _Inline inline = _collectInline(li);
      blocks.add(UEditorBlock.text(itemType, text: inline.text, spans: inline.spans, align: _alignOf(li)));
    }
  }

  static UEditorBlock _imageBlock(_Node img) => UEditorBlock(type: UBlockType.image, imageUrl: img.attrs["src"], imageAlt: img.attrs["alt"]);

  static TextAlign _alignOf(_Node node) {
    final String? style = node.attrs["style"];
    if (style == null) return TextAlign.left;
    final String s = style.toLowerCase();
    if (s.contains("center")) return TextAlign.center;
    if (s.contains("right")) return TextAlign.right;
    if (s.contains("justify")) return TextAlign.justify;
    return TextAlign.left;
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
      final int? c = _parseColor(colorAttr);
      if (c != null) result[UInlineAttr.color] = c;
    }
    if (style == null) return result;
    for (final String decl in style.split(";")) {
      final int idx = decl.indexOf(":");
      if (idx <= 0) continue;
      final String prop = decl.substring(0, idx).trim().toLowerCase();
      final String value = decl.substring(idx + 1).trim();
      if (prop == "color") {
        final int? c = _parseColor(value);
        if (c != null) result[UInlineAttr.color] = c;
      } else if (prop == "font-size") {
        final double? size = _parseFontSize(value);
        if (size != null) result[UInlineAttr.fontSize] = size;
      } else if (prop == "font-weight") {
        if (value == "bold" || (int.tryParse(value) ?? 0) >= 600) result[UInlineAttr.bold] = null;
      } else if (prop == "font-style" && value == "italic") {
        result[UInlineAttr.italic] = null;
      } else if (prop == "text-decoration") {
        if (value.contains("underline")) result[UInlineAttr.underline] = null;
        if (value.contains("line-through")) result[UInlineAttr.strikethrough] = null;
      }
    }
    return result;
  }

  static int? _parseColor(String raw) {
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
      case UInlineAttr.link:
        return '<a href="${UHtmlDocument._escapeAttr("$value")}">';
      case UInlineAttr.color:
        return '<span style="color:${_hex(value! as int)}">';
      case UInlineAttr.fontSize:
        return '<span style="font-size:${_size(value! as double)}">';
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
      case UInlineAttr.link:
        return "</a>";
      case UInlineAttr.color:
      case UInlineAttr.fontSize:
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

  static const Set<String> _void = <String>{"img", "hr", "br", "input", "meta", "link"};

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
//  STYLES + READ-ONLY VIEW
// =============================================================================

/// Shared visual styling for editor blocks (used by both the editor and the
/// read-only [UHtmlView]).
abstract class UEditorStyles {
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
      case UBlockType.quote:
        return (t.bodyLarge ?? const TextStyle(fontSize: 16)).copyWith(fontStyle: FontStyle.italic, color: cs.onSurfaceVariant);
      case UBlockType.code:
        return (t.bodyMedium ?? const TextStyle(fontSize: 14)).copyWith(fontFamily: "monospace", color: cs.onSurface);
      case UBlockType.paragraph:
      case UBlockType.bulleted:
      case UBlockType.numbered:
      case UBlockType.image:
      case UBlockType.divider:
        return t.bodyLarge ?? const TextStyle(fontSize: 16);
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
}

/// Read-only widget that renders stored HTML using native Flutter widgets so it
/// works on every platform without a WebView. Powered by the same parser used
/// for editing.
class UHtmlView extends StatelessWidget {
  const UHtmlView({required this.html, super.key});

  final String html;

  @override
  Widget build(BuildContext context) {
    final List<UEditorBlock> blocks = UHtmlDocument.parse(html);
    final List<Widget> children = <Widget>[];
    int i = 0;
    while (i < blocks.length) {
      final UEditorBlock b = blocks[i];
      if (b.type == UBlockType.bulleted || b.type == UBlockType.numbered) {
        final UBlockType listType = b.type;
        int ordinal = 0;
        while (i < blocks.length && blocks[i].type == listType) {
          ordinal++;
          children.add(_listItem(context, blocks[i], listType == UBlockType.numbered ? "$ordinal." : "•"));
          i++;
        }
        continue;
      }
      children.add(_block(context, b));
      i++;
    }
    for (final UEditorBlock b in blocks) b.dispose();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: children);
  }

  Widget _block(BuildContext context, UEditorBlock b) {
    switch (b.type) {
      case UBlockType.divider:
        return const Divider(thickness: 1).pSymmetric(vertical: 8);
      case UBlockType.image:
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: UImage(b.imageUrl ?? "", width: double.infinity),
        ).pSymmetric(vertical: 8);
      case UBlockType.code:
        return UEditorStyles.decorate(context, b.type, _richText(context, b)).pSymmetric(vertical: 4);
      default:
        return UEditorStyles.decorate(context, b.type, _richText(context, b)).pSymmetric(vertical: 4);
    }
  }

  Widget _listItem(BuildContext context, UEditorBlock b, String marker) => Padding(
    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(marker, style: UEditorStyles.baseStyle(context, b.type)),
        ),
        _richText(context, b).expanded(),
      ],
    ),
  );

  Widget _richText(BuildContext context, UEditorBlock b) {
    final TextStyle base = UEditorStyles.baseStyle(context, b.type);
    final TextSpan span = b.controller!.buildTextSpan(context: context, style: base, withComposing: false);
    return Text.rich(span, textAlign: b.align);
  }
}

// =============================================================================
//  EDITOR WIDGET
// =============================================================================

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
  const URichTextEditor({super.key, this.initialHtml, this.onChanged, this.onUploadImage, this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12)});

  final String? initialHtml;
  final ValueChanged<String>? onChanged;
  final URichImageUploader? onUploadImage;
  final EdgeInsets padding;

  /// Push a full-screen editor and await the resulting HTML (null if cancelled).
  static Future<String?> open({String? initialHtml, URichImageUploader? onUploadImage}) =>
      UNavigator.push<String>(_URichTextEditorPage(initialHtml: initialHtml, onUploadImage: onUploadImage), fullscreenDialog: true);

  @override
  State<URichTextEditor> createState() => _URichTextEditorState();
}

class _URichTextEditorState extends State<URichTextEditor> {
  final List<UEditorBlock> _blocks = <UEditorBlock>[];
  final Map<String, TextSelection> _selCache = <String, TextSelection>{};
  int _activeIndex = 0;
  bool _uploading = false;

  static const List<double> _fontSizes = <double>[12, 14, 16, 18, 20, 24, 28, 32];

  @override
  void initState() {
    super.initState();
    _blocks.addAll(UHtmlDocument.parse(widget.initialHtml));
    for (int i = 0; i < _blocks.length; i++) _wireBlock(_blocks[i], i);
  }

  @override
  void dispose() {
    for (final UEditorBlock b in _blocks) b.dispose();
    super.dispose();
  }

  void _wireBlock(UEditorBlock b, int index) {
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

  void _notifyChanged() => widget.onChanged?.call(UHtmlDocument.serialize(_blocks));

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

  // ---- key handling --------------------------------------------------------

  KeyEventResult _handleKey(UEditorBlock b, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) return KeyEventResult.ignored;
    if (event.logicalKey != LogicalKeyboardKey.backspace) return KeyEventResult.ignored;
    final URichTextController c = b.controller!;
    if (!c.selection.isValid || !c.selection.isCollapsed || c.selection.baseOffset != 0) return KeyEventResult.ignored;
    final int index = _blocks.indexOf(b);
    if (index <= 0) return KeyEventResult.ignored;
    _mergeWithPrevious(index);
    return KeyEventResult.handled;
  }

  // ---- block structure operations -----------------------------------------

  void _onChanged(UEditorBlock b, String value) {
    final int index = _blocks.indexOf(b);
    if (value.contains("\n")) {
      final int nl = value.indexOf("\n");
      if ((b.type == UBlockType.bulleted || b.type == UBlockType.numbered) && value.trim().isEmpty) {
        setState(() {
          b.type = UBlockType.paragraph;
          b.controller!.value = const TextEditingValue();
        });
        _notifyChanged();
        return;
      }
      _splitAtNewline(index, nl);
      return;
    }
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

    final UBlockType nextType = (block.type == UBlockType.bulleted || block.type == UBlockType.numbered || block.type == UBlockType.paragraph) ? block.type : UBlockType.paragraph;
    final UEditorBlock newBlock = UEditorBlock.text(nextType, text: after, spans: afterSpans, align: block.align);

    setState(() => _blocks.insert(index + 1, newBlock));
    _wireBlock(newBlock, index + 1);
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

    pc.value = TextEditingValue(
      text: pc.text + cc.text,
      selection: TextSelection.collapsed(offset: junction),
    );
    pc.spans
      ..clear()
      ..addAll(merged);

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
        _wireBlock(p, 0);
      }
      _activeIndex = index.clamp(0, _blocks.length - 1);
    });
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

  void _insertBlockAfterActive(UEditorBlock block) {
    final int at = (_activeIndex + 1).clamp(0, _blocks.length);
    setState(() => _blocks.insert(at, block));
    if (block.isText) _wireBlock(block, at);
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
    final UEditorBlock? b = _active;
    if (b == null) return;
    setState(() => b.align = align);
    _notifyChanged();
  }

  TextSelection? _restoredSelection() {
    final UEditorBlock? b = _active;
    final URichTextController? c = b?.controller;
    if (b == null || c == null) return null;
    if (!c.selection.isValid || c.selection.isCollapsed) {
      final TextSelection? cached = _selCache[b.id];
      if (cached != null && cached.isValid && !cached.isCollapsed) c.selection = cached;
    }
    return (c.selection.isValid && !c.selection.isCollapsed) ? c.selection : null;
  }

  Future<void> _pickColor() async {
    final TextSelection? sel = _restoredSelection();
    final URichTextController? c = _activeController;
    if (sel == null || c == null) return;
    final Color? color = await UNavigator.colorPicker(defaultColor: Theme.of(context).colorScheme.onSurface);
    if (color != null) {
      c.selection = sel;
      c.applyValue(UInlineAttr.color, color.toARGB32());
      _active?.focusNode!.requestFocus();
    }
  }

  Future<void> _editLink() async {
    final TextSelection? sel = _restoredSelection();
    final URichTextController? c = _activeController;
    if (sel == null || c == null) return;
    final String? existing = c.activeLink();
    final String? url = await UNavigator.inputDialog(title: U.s.insertLink, hint: U.s.url, defaultValue: existing ?? "https://");
    if (url == null) return;
    c.selection = sel;
    c.applyValue(UInlineAttr.link, url.trim().isEmpty ? null : url.trim());
    _active?.focusNode!.requestFocus();
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

  // ---- build ---------------------------------------------------------------

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      _toolbar(),
      if (_uploading) LinearProgressIndicator(minHeight: 2, color: Theme.of(context).colorScheme.primary),
      const Divider(height: 1),
      ListView.builder(
        padding: widget.padding,
        itemCount: _blocks.length,
        itemBuilder: (BuildContext context, int index) => _blockRow(index),
      ).expanded(),
    ],
  );

  Widget _toolbar() {
    final URichTextController? c = _activeController;
    final Set<UInlineAttr> active = c?.activeAttributes() ?? <UInlineAttr>{};
    final UBlockType type = _active?.type ?? UBlockType.paragraph;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: <Widget>[
          _blockTypeMenu(type),
          _sep(),
          _fmtButton(Icons.format_bold, U.s.bold, active.contains(UInlineAttr.bold), () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.bold))),
          _fmtButton(Icons.format_italic, U.s.italic, active.contains(UInlineAttr.italic), () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.italic))),
          _fmtButton(Icons.format_underlined, U.s.underline, active.contains(UInlineAttr.underline), () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.underline))),
          _fmtButton(Icons.strikethrough_s, U.s.strikethrough, active.contains(UInlineAttr.strikethrough), () => _onSelection((URichTextController c) => c.toggleAttribute(UInlineAttr.strikethrough))),
          _sep(),
          _fmtButton(Icons.format_color_text, U.s.textColor, false, _pickColor),
          _fontSizeMenu(),
          _fmtButton(Icons.link, U.s.insertLink, c?.activeLink() != null, _editLink),
          _sep(),
          _fmtButton(Icons.format_align_left, U.s.alignLeft, _active?.align == TextAlign.left, () => _setAlign(TextAlign.left)),
          _fmtButton(Icons.format_align_center, U.s.alignCenter, _active?.align == TextAlign.center, () => _setAlign(TextAlign.center)),
          _fmtButton(Icons.format_align_right, U.s.alignRight, _active?.align == TextAlign.right, () => _setAlign(TextAlign.right)),
          _fmtButton(Icons.format_align_justify, U.s.alignJustify, _active?.align == TextAlign.justify, () => _setAlign(TextAlign.justify)),
          _sep(),
          _fmtButton(Icons.image_outlined, U.s.insertImage, false, _insertImage),
          _fmtButton(Icons.horizontal_rule, U.s.divider, false, () => _insertBlockAfterActive(UEditorBlock(type: UBlockType.divider))),
          _fmtButton(Icons.format_clear, U.s.clearFormatting, false, () => _onSelection((URichTextController c) => c.clearFormatting())),
        ].map((Widget w) => Padding(padding: const EdgeInsets.symmetric(horizontal: 1), child: w)).toList(),
      ),
    );
  }

  Widget _sep() => Container(width: 1, height: 24, margin: const EdgeInsets.symmetric(horizontal: 6), color: Theme.of(context).dividerColor);

  Widget _fmtButton(IconData icon, String tooltip, bool active, VoidCallback? onTap) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return IconButton(
      icon: Icon(icon, size: 20),
      tooltip: tooltip,
      isSelected: active,
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: active ? cs.primary.withValues(alpha: 0.16) : null,
        foregroundColor: active ? cs.primary : cs.onSurface,
        minimumSize: const Size(36, 36),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _blockTypeMenu(UBlockType type) => PopupMenuButton<UBlockType>(
    tooltip: U.s.paragraph,
    initialValue: type,
    onSelected: _setBlockType,
    itemBuilder: (BuildContext context) => <PopupMenuEntry<UBlockType>>[
      _typeItem(UBlockType.paragraph, U.s.normalText),
      _typeItem(UBlockType.h1, U.s.heading1),
      _typeItem(UBlockType.h2, U.s.heading2),
      _typeItem(UBlockType.h3, U.s.heading3),
      _typeItem(UBlockType.quote, U.s.quote),
      _typeItem(UBlockType.bulleted, U.s.bulletedList),
      _typeItem(UBlockType.numbered, U.s.numberedList),
      _typeItem(UBlockType.code, U.s.codeBlock),
    ],
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[UTextBodyMedium(_typeLabel(type)), const Icon(Icons.arrow_drop_down, size: 18)],
      ),
    ),
  );

  PopupMenuItem<UBlockType> _typeItem(UBlockType t, String label) => PopupMenuItem<UBlockType>(value: t, child: Text(label));

  String _typeLabel(UBlockType t) {
    switch (t) {
      case UBlockType.paragraph:
        return U.s.normalText;
      case UBlockType.h1:
        return U.s.heading1;
      case UBlockType.h2:
        return U.s.heading2;
      case UBlockType.h3:
        return U.s.heading3;
      case UBlockType.quote:
        return U.s.quote;
      case UBlockType.bulleted:
        return U.s.bulletedList;
      case UBlockType.numbered:
        return U.s.numberedList;
      case UBlockType.code:
        return U.s.codeBlock;
      case UBlockType.image:
      case UBlockType.divider:
        return U.s.normalText;
    }
  }

  Widget _fontSizeMenu() => PopupMenuButton<double>(
    tooltip: U.s.fontSize,
    icon: const Icon(Icons.format_size, size: 20),
    onSelected: (double size) => _onSelection((URichTextController c) => c.applyValue(UInlineAttr.fontSize, size)),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<double>>[
      for (final double s in _fontSizes) PopupMenuItem<double>(value: s, child: Text("${s.toInt()} px")),
      const PopupMenuDivider(),
      PopupMenuItem<double>(child: Text(U.s.clearFormatting), onTap: () => _onSelection((URichTextController c) => c.applyValue(UInlineAttr.fontSize, null))),
    ],
  );

  // ---- block rendering -----------------------------------------------------

  Widget _blockRow(int index) {
    final UEditorBlock b = _blocks[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _blockBody(b).expanded(),
          _blockControls(index),
        ],
      ),
    );
  }

  Widget _blockControls(int index) => PopupMenuButton<String>(
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
        onTap: () => _removeBlock(index),
        child: UIconTextHorizontal(
          leading: Icon(Icons.delete_outline, size: 18, color: Theme.of(context).colorScheme.error),
          trailing: Text(U.s.removeBlock, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ),
      ),
    ],
  );

  Widget _blockBody(UEditorBlock b) {
    switch (b.type) {
      case UBlockType.image:
        return _imageBlock(b);
      case UBlockType.divider:
        return const Divider(thickness: 2).pSymmetric(vertical: 8);
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
      keyboardType: TextInputType.multiline,
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration.collapsed(
        hintText: U.s.writeSomething,
        hintStyle: style.copyWith(color: Theme.of(context).hintColor),
      ),
      onChanged: (String v) => _onChanged(b, v),
    );

    Widget content = field;
    if (b.type == UBlockType.bulleted || b.type == UBlockType.numbered) {
      final int n = _listOrdinal(b);
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 2, right: 8, left: 4),
            child: Text(b.type == UBlockType.numbered ? "$n." : "•", style: style),
          ),
          field.expanded(),
        ],
      );
    }

    return UEditorStyles.decorate(context, b.type, content);
  }

  int _listOrdinal(UEditorBlock b) {
    int n = 0;
    for (final UEditorBlock x in _blocks) {
      if (x.type == b.type) n++;
      if (identical(x, b)) break;
      if (x.type != b.type) n = 0;
    }
    return n;
  }

  Widget _imageBlock(UEditorBlock b) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: UImage(b.imageUrl ?? "", width: double.infinity, height: 220),
      ),
      TextFormField(
        initialValue: b.imageAlt,
        decoration: InputDecoration(isDense: true, hintText: U.s.imageAltText, border: InputBorder.none),
        style: Theme.of(context).textTheme.bodySmall,
        onChanged: (String v) => b.imageAlt = v,
      ),
    ],
  ).pSymmetric(vertical: 6);
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

  double _dialogWidth() {
    final double w = MediaQuery.sizeOf(context).width - 48;
    return w < 720 ? w : 720;
  }

  void _preview() => UNavigator.dialog(
    AlertDialog(
      title: Text(U.s.preview),
      content: SizedBox(
        width: _dialogWidth(),
        child: SingleChildScrollView(child: UHtmlView(html: _html)),
      ),
      actions: <Widget>[TextButton(onPressed: UNavigator.back, child: Text(U.s.ok))],
    ),
  );

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(U.s.richTextEditor),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.visibility_outlined), tooltip: U.s.preview, onPressed: _preview),
        IconButton(icon: const Icon(Icons.check), tooltip: U.s.submit, onPressed: () => UNavigator.back(_html)),
      ],
    ),
    body: URichTextEditor(
      initialHtml: widget.initialHtml,
      onUploadImage: widget.onUploadImage,
      onChanged: (String h) => _html = h,
    ),
  );
}
