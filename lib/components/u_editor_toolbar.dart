import "package:u/utilities.dart";

/// Toolbar widgets and dialogs shared by [URichTextEditor] and
/// [UDocumentEditor]. Nothing here holds editor state — every helper takes what
/// it needs and returns a plain result.

/// A single square toolbar button with an active/selected state.
class UEditorToolButton extends StatelessWidget {
  const UEditorToolButton({required this.icon, required this.tooltip, super.key, this.active = false, this.onTap, this.size = 20});

  final IconData icon;
  final String tooltip;
  final bool active;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return IconButton(
      icon: Icon(icon, size: size),
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
}

/// A thin vertical rule between toolbar groups.
class UEditorToolSeparator extends StatelessWidget {
  const UEditorToolSeparator({super.key});

  @override
  Widget build(BuildContext context) => Container(width: 1, height: 24, margin: const EdgeInsets.symmetric(horizontal: 6), color: Theme.of(context).dividerColor);
}

/// A compact bordered dropdown used for the block-type and font pickers.
class UEditorDropdown<T> extends StatelessWidget {
  const UEditorDropdown({required this.label, required this.items, required this.onSelected, super.key, this.tooltip, this.width});

  final String label;
  final List<UEditorMenuEntry<T>> items;
  final ValueChanged<T> onSelected;
  final String? tooltip;
  final double? width;

  @override
  Widget build(BuildContext context) => PopupMenuButton<T>(
    tooltip: tooltip ?? label,
    onSelected: onSelected,
    itemBuilder: (BuildContext context) => <PopupMenuEntry<T>>[
      for (final UEditorMenuEntry<T> e in items)
        PopupMenuItem<T>(
          value: e.value,
          child: Text(e.label, style: e.style),
        ),
    ],
    child: Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(child: UTextBodyMedium(label, maxLines: 1, overflow: TextOverflow.ellipsis)),
          const Icon(Icons.arrow_drop_down, size: 18),
        ],
      ),
    ),
  );
}

/// One entry of a [UEditorDropdown].
class UEditorMenuEntry<T> {
  UEditorMenuEntry({required this.value, required this.label, this.style});

  final T value;
  final String label;
  final TextStyle? style;
}

/// The result of the find & replace dialog.
class UFindReplaceRequest {
  UFindReplaceRequest({required this.find, required this.replace, this.matchCase = false, this.replaceAll = true});

  final String find;
  final String replace;
  final bool matchCase;
  final bool replaceAll;
}

/// Dialogs used by both editors.
abstract class UEditorDialogs {
  /// A quick swatch grid plus a full colour picker. Returns the chosen ARGB
  /// value, or `0` when the user picks "none" (i.e. clear the colour).
  static Future<int?> pickColor({required BuildContext context, int? current, bool allowNone = true, String? title}) async {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return UNavigator.dialog<int>(
      AlertDialog(
        title: Text(title ?? U.s.selectAColor),
        content: SizedBox(
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  for (final int c in UEditorStyles.palette)
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(c),
                        shape: BoxShape.circle,
                        border: Border.all(color: current == c ? cs.primary : cs.outlineVariant, width: current == c ? 3 : 1),
                      ),
                    ).onTap(() => UNavigator.back(c)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: <Widget>[
                  TextButton.icon(
                    icon: const Icon(Icons.palette_outlined, size: 18),
                    label: Text(U.s.more),
                    onPressed: () async {
                      final Color? picked = await UNavigator.colorPicker(defaultColor: current != null ? Color(current) : cs.onSurface);
                      if (picked != null) UNavigator.back(picked.toARGB32());
                    },
                  ),
                  if (allowNone) TextButton(onPressed: () => UNavigator.back(0), child: Text(U.s.none)),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[TextButton(onPressed: UNavigator.back, child: Text(U.s.cancel))],
      ),
    );
  }

  /// Prompts for a link href. Returns an empty string to remove the link.
  static Future<String?> editLink({String? existing}) => UNavigator.inputDialog(title: U.s.insertLink, hint: U.s.url, defaultValue: existing ?? "https://");

  /// Asks for a row/column count and returns a fresh empty table.
  static Future<UTableData?> insertTable() {
    int rows = 3;
    int columns = 3;
    bool header = true;
    return UNavigator.dialog<UTableData>(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setInner) => AlertDialog(
          title: Text(U.s.insertTable),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _counter(context, U.s.rows, rows, (int v) => setInner(() => rows = v.clamp(1, 20))),
              _counter(context, U.s.columns, columns, (int v) => setInner(() => columns = v.clamp(1, 10))),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: header,
                title: UTextBodyMedium(U.s.headerRow),
                onChanged: (bool v) => setInner(() => header = v),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(onPressed: UNavigator.back, child: Text(U.s.cancel)),
            TextButton(
              onPressed: () => UNavigator.back(UTableData.empty(rows: rows, columns: columns)..hasHeader = header),
              child: Text(U.s.insert),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _counter(BuildContext context, String label, int value, ValueChanged<int> onChanged) => Row(
    children: <Widget>[
      UTextBodyMedium(label).expanded(),
      IconButton(icon: const Icon(Icons.remove_circle_outline, size: 20), onPressed: () => onChanged(value - 1)),
      SizedBox(width: 28, child: Center(child: UTextBodyMedium("$value"))),
      IconButton(icon: const Icon(Icons.add_circle_outline, size: 20), onPressed: () => onChanged(value + 1)),
    ],
  );

  /// Shows the raw HTML and lets the user edit it. Returns the edited HTML, or
  /// null when cancelled.
  static Future<String?> htmlSource({required String html, bool editable = true}) {
    final TextEditingController controller = TextEditingController(text: _prettyHtml(html));
    return UNavigator.dialog<String>(
      AlertDialog(
        title: Text(U.s.htmlSource),
        content: SizedBox(
          width: 700,
          child: TextField(
            controller: controller,
            readOnly: !editable,
            maxLines: 20,
            minLines: 8,
            style: const TextStyle(fontFamily: "monospace", fontSize: 12),
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        actions: <Widget>[
          TextButton(onPressed: () => UClipboard.set(controller.text, snackBar: true), child: Text(U.s.copy)),
          TextButton(onPressed: UNavigator.back, child: Text(U.s.cancel)),
          if (editable) TextButton(onPressed: () => UNavigator.back(controller.text), child: Text(U.s.apply)),
        ],
      ),
    );
  }

  /// Inserts a newline before each top level tag so the source is readable.
  static String _prettyHtml(String html) => html.replaceAllMapped(RegExp(r"<(p|h[1-6]|ul|ol|li|blockquote|pre|figure|hr|table|thead|tbody|tr)\b"), (Match m) => "\n<${m.group(1)}").trim();

  /// Find & replace prompt.
  static Future<UFindReplaceRequest?> findReplace() {
    final TextEditingController find = TextEditingController();
    final TextEditingController replace = TextEditingController();
    bool matchCase = false;
    return UNavigator.dialog<UFindReplaceRequest>(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setInner) => AlertDialog(
          title: Text(U.s.findAndReplace),
          content: SizedBox(
            width: 420,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: find,
                  autofocus: true,
                  decoration: InputDecoration(labelText: U.s.find, border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: replace,
                  decoration: InputDecoration(labelText: U.s.replaceWith, border: const OutlineInputBorder()),
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: matchCase,
                  title: UTextBodyMedium(U.s.matchCase),
                  onChanged: (bool? v) => setInner(() => matchCase = v ?? false),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(onPressed: UNavigator.back, child: Text(U.s.cancel)),
            TextButton(
              onPressed: () => UNavigator.back(UFindReplaceRequest(find: find.text, replace: replace.text, matchCase: matchCase)),
              child: Text(U.s.replaceAll),
            ),
          ],
        ),
      ),
    );
  }

  /// Word / character / reading-time summary for [html].
  static Future<void> documentInfo({required String html}) => UNavigator.dialog(
    AlertDialog(
      title: Text(U.s.documentInfo),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _infoRow(U.s.words, "${UHtmlDocument.wordCount(html)}"),
          _infoRow(U.s.characters, "${UHtmlDocument.characterCount(html)}"),
          _infoRow(U.s.readingTime, "${UHtmlDocument.readingMinutes(html)} ${U.s.minutes}"),
        ],
      ),
      actions: <Widget>[TextButton(onPressed: UNavigator.back, child: Text(U.s.ok))],
    ),
  );

  static Widget _infoRow(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(children: <Widget>[UTextBodyMedium(label).expanded(), UTextBodyMedium(value)]),
  );
}
