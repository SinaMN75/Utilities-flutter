part of 'components.dart';

Widget scaffold({
  required final Widget body,
  final Key? key,
  final PreferredSizeWidget? appBar,
  final Widget? drawer,
  final Widget? endDrawer,
  final Widget? floatingActionButton,
  final Widget? bottomNavigationBar,
  final EdgeInsets? padding,
  final Color? color,
  final BoxDecoration? decoration,
  final bool resizeToAvoidBottomInset = false,
  final bool extendBodyBehindAppBar = false,
  final FloatingActionButtonLocation floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
  final BoxConstraints? constraints,
  final double? width,
  final double? height,
  final DrawerCallback? onDrawerChanged,
  final DrawerCallback? onEndDrawerChanged,
  final Alignment alignment = Alignment.center,
}) =>
    GestureDetector(
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

Widget smartRefresh({
  required final Widget child,
  required final RefreshController? controller,
  final ScrollController? scrollController,
  final VoidCallback? onRefresh,
  final VoidCallback? onLoading,
  final bool enablePullUp = false,
}) =>
    SmartRefresher(
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

Widget defaultTabBar({
  required final List<Widget> children,
  required final Widget tabBar,
  final double? width,
  final double? height,
  final int initialIndex = 0,
  final TabController? controller,
  final ScrollPhysics? physics,
}) =>
    DefaultTabController(
      initialIndex: initialIndex,
      length: children.length,
      child: Column(
        children: <Widget>[
          tabBar,
          SizedBox(
            width: width ?? getContext().width,
            height: height ?? getContext().height,
            child: TabBarView(
              physics: physics,
              children: children,
              controller: controller,
            ),
          ).expanded()
        ],
      ),
    );

Widget iconTextHorizontal({
  required final Widget leading,
  required final Widget trailing,
  final double spaceBetween = 6,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  final MainAxisSize mainAxisSize = MainAxisSize.min,
}) =>
    Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: <Widget>[leading, SizedBox(width: spaceBetween), trailing],
    );

Widget iconTextVertical({
  required final Widget leading,
  required final Widget trailing,
  final double spaceBetween = 6,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  final MainAxisSize mainAxisSize = MainAxisSize.min,
}) =>
    Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: <Widget>[leading, SizedBox(width: spaceBetween), trailing],
    );
