import 'package:u/utilities.dart';

class UScaffold extends StatelessWidget {
  const UScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.padding,
    this.color,
    this.decoration,
    this.constraints,
    this.width,
    this.height,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.resizeToAvoidBottomInset = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
    this.alignment = Alignment.center,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final EdgeInsets? padding;
  final Color? color;
  final BoxDecoration? decoration;
  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final DrawerCallback? onDrawerChanged;
  final DrawerCallback? onEndDrawerChanged;
  final Alignment alignment;

  @override
  Widget build(final BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          onDrawerChanged: onDrawerChanged,
          onEndDrawerChanged: onEndDrawerChanged,
          key: key,
          backgroundColor: color,
          appBar: appBar,
          drawer: drawer,
          extendBody: resizeToAvoidBottomInset ? true : false,
          endDrawer: endDrawer,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          bottomNavigationBar: bottomNavigationBar,
          body: Align(
            alignment: alignment,
            child: Container(
              width: width,
              height: height,
              constraints: constraints,
              decoration: decoration,
              padding: padding,
              child: body,
            ),
          ),
        ),
      );
}

class UDefaultTabBar extends StatelessWidget {
  const UDefaultTabBar({
    required this.children,
    required this.tabBar,
    super.key,
    this.width,
    this.height,
    this.controller,
    this.physics,
    this.initialIndex = 0,
  });

  final List<Widget> children;
  final Widget tabBar;
  final double? width;
  final double? height;
  final int initialIndex;
  final TabController? controller;
  final ScrollPhysics? physics;

  @override
  Widget build(final BuildContext context) => DefaultTabController(
        initialIndex: initialIndex,
        length: children.length,
        child: Column(
          children: <Widget>[
            tabBar,
            SizedBox(
              width: width ?? MediaQuery.sizeOf(navigatorKey.currentContext!).width,
              height: height ?? MediaQuery.sizeOf(navigatorKey.currentContext!).height,
              child: TabBarView(
                physics: physics,
                controller: controller,
                children: children,
              ),
            ).expanded()
          ],
        ),
      );
}

class UIconTextHorizontal extends StatelessWidget {
  const UIconTextHorizontal({
    required this.leading,
    required this.trailing,
    super.key,
    this.spaceBetween = 6,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
  });

  final Widget leading;
  final Widget trailing;
  final double spaceBetween;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(final BuildContext context) => Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: <Widget>[leading, SizedBox(width: spaceBetween), trailing],
      );
}

class UIconTextVertical extends StatelessWidget {
  const UIconTextVertical({
    required this.leading,
    required this.trailing,
    super.key,
    this.spaceBetween = 6,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
  });

  final Widget leading;
  final Widget trailing;
  final double spaceBetween;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: <Widget>[leading, SizedBox(height: spaceBetween), trailing],
      );
}
