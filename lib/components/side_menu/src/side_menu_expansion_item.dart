import "package:flutter/material.dart";
import "package:u/components/side_menu/src/side_menu_controller.dart";
import "package:u/components/side_menu/src/side_menu_item.dart";

class SideMenuExpansionItem {
  /// #### Side Menu Item
  ///
  /// This is a widget as [SideMenu] items with text and icon

  /// name
  final String? title;

  /// A function that will be called when tap on [SideMenuExpansionItem] corresponding
  /// to this [SideMenuExpansionItem]
  final void Function(int index, SideMenuController sideMenuController, bool isExpanded)? onTap;

  /// A Icon to display before [title]
  final Icon? icon;

  /// This is displayed instead if [icon] is null
  final Widget? iconWidget;

  final List<SideMenuItem> children;

  /// Control whether or not the SideMenuExpansion should be expanded initialy or not.
  /// Default is collabsed
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
