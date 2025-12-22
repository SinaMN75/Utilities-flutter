import "package:flutter/widgets.dart";
import "package:u/easy_sidemenu/src/models/side_menu_item_with_global_base.dart";
import "package:u/easy_sidemenu/src/side_menu_controller.dart";
import "package:u/easy_sidemenu/src/side_menu_display_mode.dart";
import "package:u/easy_sidemenu/src/side_menu_style.dart";

class Global extends ChangeNotifier {
  late SideMenuController controller;
  late SideMenuStyle? _style;

  SideMenuStyle get style => _style!;

  set style(SideMenuStyle value) {
    _style = value;
    notifyListeners();
  }

  DisplayModeNotifier displayModeState = DisplayModeNotifier(SideMenuDisplayMode.auto);
  bool _showTrailing = true;

  bool get showTrailing => _showTrailing;

  set showTrailing(bool value) {
    if (_showTrailing != value) {
      _showTrailing = value;
      notifyListeners();
    }
  }

  List<SideMenuItemWithGlobalBase> _items = <SideMenuItemWithGlobalBase>[];

  List<SideMenuItemWithGlobalBase> get items => _items;

  set items(List<SideMenuItemWithGlobalBase> value) {
    _items = value;
    notifyListeners();
  }

  List<bool> expansionStateList = <bool>[];
}

class DisplayModeNotifier extends ValueNotifier<SideMenuDisplayMode> {
  DisplayModeNotifier(SideMenuDisplayMode value) : super(value);

  void change(SideMenuDisplayMode mode) {
    if (value != mode) {
      value = mode;
      notifyListeners();
    }
  }
}
