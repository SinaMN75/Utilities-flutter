part of 'components.dart';

class UScaffold extends StatelessWidget {
  const UScaffold({
    required this.body,
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
    this.key,
  });

  final Widget body;
  final Key? key;
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
  Widget build(BuildContext context) => GestureDetector(
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

class USmartRefresh extends StatelessWidget {
  const USmartRefresh({
    super.key,
    required this.child,
    this.controller,
    this.scrollController,
    this.onRefresh,
    this.onLoading,
    this.enablePullUp = false,
  });

  final Widget child;
  final RefreshController? controller;
  final ScrollController? scrollController;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final bool enablePullUp;

  @override
  Widget build(BuildContext context) => SmartRefresher(
        scrollController: scrollController,
        enablePullUp: enablePullUp,
        header: const WaterDropHeader(),
        footer: CustomFooter(
          builder: (final BuildContext? context, final LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle)
              body = const Text("pull up load");
            else if (mode == LoadStatus.loading)
              body = const CupertinoActivityIndicator();
            else if (mode == LoadStatus.failed)
              body = const Text("Load Failed!Click retry!");
            else if (mode == LoadStatus.canLoading)
              body = const Text("release to load more");
            else
              body = const Text("No more Data");
            return SizedBox(height: 55.0, child: Center(child: body));
          },
        ),
        controller: controller ?? RefreshController(),
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: child,
      );
}

class UDefaultTabBar extends StatelessWidget {
  const UDefaultTabBar({
    super.key,
    required this.children,
    required this.tabBar,
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
  Widget build(BuildContext context) => DefaultTabController(
        initialIndex: initialIndex,
        length: children.length,
        child: Column(
          children: <Widget>[
            tabBar,
            SizedBox(
              width: width ?? navigatorKey.currentContext!.width,
              height: height ?? navigatorKey.currentContext!.height,
              child: TabBarView(
                physics: physics,
                children: children,
                controller: controller,
              ),
            ).expanded()
          ],
        ),
      );
}

class UIconTextHorizontal extends StatelessWidget {
  const UIconTextHorizontal({
    super.key,
    required this.leading,
    required this.trailing,
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
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: <Widget>[leading, SizedBox(width: spaceBetween), trailing],
      );
}

class UIconTextVertical extends StatelessWidget {
  const UIconTextVertical({
    super.key,
    required this.leading,
    required this.trailing,
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
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: <Widget>[leading, SizedBox(height: spaceBetween), trailing],
      );
}
