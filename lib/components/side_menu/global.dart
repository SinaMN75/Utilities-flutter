part of "side_menu.dart";

enum SideMenuHamburgerMode { open, close }

enum SideMenuDisplayMode { auto, open, compact }

class SideMenuController {
  late int _currentPage;

  int get currentPage => _currentPage;

  SideMenuController({int initialPage = 0}) {
    _currentPage = initialPage;
  }

  final StreamController<int> _streamController = StreamController<int>.broadcast();

  Stream<int> get stream => _streamController.stream;

  void changePage(int index) {
    _currentPage = index;
    _streamController.sink.add(index);
  }

  void dispose() => _streamController.close();

  void addListener(void Function(int index) listener) => _streamController.stream.listen(listener);

  void removeListener(void Function(int) listener) => _streamController.stream.listen(listener).cancel();
}

class SideMenuExpansionItem {
  final String? title;
  final void Function(int index, SideMenuController sideMenuController, bool isExpanded)? onTap;
  final Icon? icon;
  final Widget? iconWidget;
  final List<SideMenuItem> children;
  final bool? initialExpanded;

  const SideMenuExpansionItem({
    required this.children,
    this.onTap,
    this.title,
    this.icon,
    this.iconWidget,
    this.initialExpanded,
  }) : assert(title != null || icon != null, "Title and icon should not be empty at the same time"),
       super();
}

class SideMenuItem {
  final String? title;
  final void Function(int index, SideMenuController sideMenuController)? onTap;
  final Icon? icon;
  final Widget? iconWidget;
  final Widget? badgeContent;
  final Color? badgeColor;
  final String? tooltipContent;
  final Widget? trailing;
  final Widget Function(BuildContext context, SideMenuDisplayMode displayMode)? builder;

  const SideMenuItem({
    this.onTap,
    this.title,
    this.icon,
    this.iconWidget,
    this.badgeContent,
    this.badgeColor,
    this.tooltipContent,
    this.trailing,
    this.builder,
  }) : assert(title != null || icon != null || builder != null, "Title, icon and builder should not be empty at the same time"),
       super();
}

class SideMenuExpansionItemWithGlobal extends StatefulWidget {
  final String? title;
  final Global global;
  final Icon? icon;
  final Widget? iconWidget;
  final List<SideMenuItemWithGlobal> children;
  final int index;
  final void Function(int index, SideMenuController sideMenuController, bool isExpanded)? onTap;

  const SideMenuExpansionItemWithGlobal({
    required this.global,
    required this.index,
    required this.children,
    super.key,
    this.title,
    this.icon,
    this.iconWidget,
    this.onTap,
  }) : assert(title != null || icon != null, "Title and icon should not be empty at the same time");

  @override
  State<SideMenuExpansionItemWithGlobal> createState() => _SideMenuExpansionState();
}

class _SideMenuExpansionState extends State<SideMenuExpansionItemWithGlobal> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.global.expansionStateList[widget.index];
  }

  Widget _generateIconWidget(Icon? mainIcon, Widget? iconWidget) {
    if (mainIcon == null) return iconWidget ?? const SizedBox();

    final bool isExpanded = widget.global.expansionStateList[widget.index];
    final Color iconColor = isExpanded ? widget.global.style.selectedIconColorExpandable ?? widget.global.style.selectedColor ?? Colors.black : widget.global.style.unselectedIconColorExpandable ?? widget.global.style.unselectedIconColor ?? Colors.black54;
    final double iconSize = widget.global.style.iconSizeExpandable ?? widget.global.style.iconSize ?? 24;

    return Icon(mainIcon.icon, color: iconColor, size: iconSize);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<SideMenuDisplayMode>(
    valueListenable: widget.global.displayModeState,
    builder: (BuildContext context, Object? value, Widget? child) => ListTileTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: value == SideMenuDisplayMode.compact ? widget.global.style.itemInnerSpacing : widget.global.style.itemInnerSpacing + 5,
      ),
      horizontalTitleGap: 0,
      child: ExpansionTile(
        leading: SizedBox(width: 40, child: _generateIconWidget(widget.icon, widget.iconWidget)),
        maintainState: true,
        onExpansionChanged: (bool value) {
          setState(() {
            isExpanded = value;
            widget.global.expansionStateList[widget.index] = value;
          });
          widget.onTap?.call(widget.index, widget.global.controller, value);
        },
        trailing: Icon(
          isExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
          color: isExpanded ? widget.global.style.arrowOpen : widget.global.style.arrowCollapse,
        ),
        initiallyExpanded: widget.global.expansionStateList[widget.index],
        title: (value == SideMenuDisplayMode.open)
            ? Text(
                widget.title ?? "",
                style: widget.global.expansionStateList[widget.index] ? const TextStyle(fontSize: 17, color: Colors.black).merge(widget.global.style.selectedTitleTextStyleExpandable ?? widget.global.style.selectedTitleTextStyle) : const TextStyle(fontSize: 17, color: Colors.black54).merge(widget.global.style.unselectedTitleTextStyleExpandable ?? widget.global.style.unselectedTitleTextStyle),
              )
            : const Text(""),
        children: widget.children,
      ),
    ),
  );
}

class Global {
  late SideMenuController controller;
  late SideMenuStyle style;
  DisplayModeNotifier displayModeState = DisplayModeNotifier(SideMenuDisplayMode.auto);
  bool showTrailing = true;
  List<Function> itemsUpdate = <Function>[];
  List<dynamic> items = <dynamic>[];
  List<bool> expansionStateList = <bool>[];
}

class DisplayModeNotifier extends ValueNotifier<SideMenuDisplayMode> {
  DisplayModeNotifier(super.value);

  void change(SideMenuDisplayMode mode) {
    if (value != mode) {
      value = mode;
      notifyListeners();
    }
  }
}
