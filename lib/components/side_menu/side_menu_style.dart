part of "side_menu.dart";

class SideMenuStyle {
  double? openSideMenuWidth;
  double? compactSideMenuWidth;
  Color? backgroundColor;
  Color? selectedColor;
  Color? hoverColor;
  Color? selectedHoverColor;
  SideMenuDisplayMode? displayMode;
  TextStyle? selectedTitleTextStyle;
  TextStyle? unselectedTitleTextStyle;
  Color? selectedIconColor;
  Color? unselectedIconColor;
  double? iconSize;
  TextStyle? selectedTitleTextStyleExpandable;
  TextStyle? unselectedTitleTextStyleExpandable;
  Color? selectedIconColorExpandable;
  Color? unselectedIconColorExpandable;
  Color? arrowCollapse;
  Color? arrowOpen;
  double? iconSizeExpandable;
  BoxDecoration? decoration;
  Color? toggleColor;
  EdgeInsetsGeometry itemOuterPadding;
  double itemInnerSpacing;
  double itemHeight;
  BorderRadius itemBorderRadius;
  bool showTooltip;
  bool showHamburger;

  SideMenuStyle({
    this.openSideMenuWidth = 300,
    this.compactSideMenuWidth = 70,
    this.showHamburger = false,
    this.backgroundColor,
    this.selectedColor,
    this.hoverColor = Colors.transparent,
    this.selectedHoverColor,
    this.displayMode = SideMenuDisplayMode.auto,
    this.selectedTitleTextStyle,
    this.unselectedTitleTextStyle,
    this.selectedIconColor = Colors.black,
    this.unselectedIconColor = Colors.black54,
    this.iconSize = 24,
    this.selectedTitleTextStyleExpandable,
    this.unselectedTitleTextStyleExpandable,
    this.selectedIconColorExpandable = Colors.black,
    this.unselectedIconColorExpandable = Colors.black54,
    this.iconSizeExpandable = 24,
    this.arrowOpen = Colors.black,
    this.arrowCollapse = Colors.black54,
    this.decoration,
    this.toggleColor = Colors.black54,
    this.itemOuterPadding = const EdgeInsets.symmetric(horizontal: 5),
    this.itemInnerSpacing = 8.0,
    this.itemHeight = 50.0,
    this.itemBorderRadius = const BorderRadius.all(Radius.circular(5)),
    this.showTooltip = true,
  });
}
