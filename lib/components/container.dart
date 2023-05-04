import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

Widget scaffold({
  required final Widget body,
  final Key? key,
  final PreferredSizeWidget? appBar,
  final Widget? drawer,
  final Widget? floatingActionButton,
  final Widget? bottomNavigationBar,
  final EdgeInsets? padding,
  final Color? color,
  final BoxDecoration? decoration,
  final bool resizeToAvoidBottomInset = false,
  final bool extendBodyBehindAppBar = false,
  final FloatingActionButtonLocation floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
  final BoxConstraints? constraints,
  final Alignment? alignment,
}) =>
    GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        key: key,
        backgroundColor: color,
        appBar: appBar,
        drawer: drawer,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
        body: Container(
          constraints: constraints ?? BoxConstraints(maxWidth: 600),
          decoration: decoration,
          padding: padding,
          child: body,
        ).alignAtTopCenter(),
      ),
    );

Widget radius({
  required final Widget child,
  final double? radius,
  final double topLeft = 0,
  final double topRight = 0,
  final double bottomLeft = 0,
  final double bottomRight = 0,
}) =>
    ClipRRect(
      borderRadius: radius != null
          ? BorderRadius.circular(radius)
          : BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
            ),
      child: child,
    );

Widget column({
  final EdgeInsets padding = EdgeInsets.zero,
  final EdgeInsets margin = EdgeInsets.zero,
  final List<Widget> children = const <Widget>[],
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  final MainAxisSize mainAxisSize = MainAxisSize.max,
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  final VerticalDirection verticalDirection = VerticalDirection.down,
  final BoxDecoration? decoration,
  final double? width,
  final double? height,
  final bool isScrollable = false,
  final VoidCallback? onTap,
  final ScrollController? scrollController,
}) =>
    Container(
      width: width,
      height: height,
      decoration: decoration,
      padding: padding,
      margin: margin,
      child: isScrollable
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              child: Column(
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: crossAxisAlignment,
                verticalDirection: verticalDirection,
                children: children,
              ),
            )
          : GestureDetector(
              onTap: onTap,
              child: Column(
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: crossAxisAlignment,
                verticalDirection: verticalDirection,
                children: children,
              ),
            ),
    );

Widget row({
  final EdgeInsets padding = EdgeInsets.zero,
  final EdgeInsets margin = EdgeInsets.zero,
  final List<Widget> children = const <Widget>[],
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  final MainAxisSize mainAxisSize = MainAxisSize.max,
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  final VerticalDirection verticalDirection = VerticalDirection.down,
  final BoxDecoration? decoration,
  final double? width,
  final double? height,
  final bool isScrollable = false,
  final VoidCallback? onTap,
}) =>
    Container(
      width: width,
      height: height,
      decoration: decoration,
      padding: padding,
      margin: margin,
      child: isScrollable
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: crossAxisAlignment,
                verticalDirection: verticalDirection,
                children: children,
              ),
            )
          : GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: crossAxisAlignment,
                verticalDirection: verticalDirection,
                children: children,
              ),
            ),
    );

class TabBarViewModel {
  final Tab tab;
  final Widget view;

  TabBarViewModel({required final this.tab, required final this.view});
}

Widget defaultTabBar({
  required final List<TabBarViewModel> tabs,
  required final Widget tabBar,
  final double? width,
  final double? height = 500,
  final int initialIndex = 0,
}) =>
    DefaultTabController(
      initialIndex: initialIndex,
      length: tabs.length,
      child: Column(
        children: <Widget>[
          tabBar,
          SizedBox(
            width: width ?? screenWidth,
            height: height,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: tabs.map((final TabBarViewModel view) => view.view).toList(),
            ),
          )
        ],
      ),
    );

Widget iconTextHorizontal({
  required final Widget leading,
  required final Widget trailing,
  final EdgeInsets margin = EdgeInsets.zero,
  final double spaceBetween = 6,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  final MainAxisSize mainAxisSize = MainAxisSize.min,
  final VoidCallback? onTap,
  final double? width,
  final double? height,
}) =>
    GestureDetector(
      onTap: onTap,
      child: row(
        width: width,
        height: height,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        margin: margin,
        children: <Widget>[leading, SizedBox(width: spaceBetween), trailing],
      ),
    );

Widget iconTextVertical({
  required final Widget leading,
  required final Widget trailing,
  final EdgeInsets margin = EdgeInsets.zero,
  final double spaceBetween = 6,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  final MainAxisSize mainAxisSize = MainAxisSize.min,
  final VoidCallback? onTap,
  final double? width,
  final double? height,
}) =>
    GestureDetector(
      onTap: onTap,
      child: column(
        width: width,
        height: height,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        margin: margin,
        children: <Widget>[leading, SizedBox(height: spaceBetween), trailing],
      ),
    );
