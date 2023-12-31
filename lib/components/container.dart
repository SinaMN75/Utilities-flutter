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
        endDrawer: endDrawer,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
        body: Container(
          width: width,
          height: height,
          constraints: constraints ?? const BoxConstraints(maxWidth: 600),
          decoration: decoration,
          padding: padding,
          child: body,
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
  final EdgeInsets? scrollPadding,
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
              child: Padding(
                padding: scrollPadding ?? EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: mainAxisAlignment,
                  mainAxisSize: mainAxisSize,
                  crossAxisAlignment: crossAxisAlignment,
                  verticalDirection: verticalDirection,
                  children: children,
                ),
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
  final int? count,
  final ScrollPhysics? physics,
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
          ? count != null
              ? ListView.builder(
                  itemCount: count,
                  physics: physics,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (final BuildContext context, final int index) => Row(
                    mainAxisAlignment: mainAxisAlignment,
                    mainAxisSize: mainAxisSize,
                    crossAxisAlignment: crossAxisAlignment,
                    verticalDirection: verticalDirection,
                    children: children,
                  ),
                )
              : SingleChildScrollView(
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
            width: width ?? context.width,
            height: height ?? context.height,
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
  final EdgeInsets margin = EdgeInsets.zero,
  final double spaceBetween = 6,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  final MainAxisSize mainAxisSize = MainAxisSize.min,
  final VoidCallback? onTap,
  final BoxDecoration? decoration,
  final double? width,
  final double? height,
}) =>
    GestureDetector(
      onTap: onTap,
      child: row(
        decoration: decoration,
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
  final BoxDecoration? decoration,
  final double? width,
  final double? height,
}) =>
    GestureDetector(
      onTap: onTap,
      child: column(
        decoration: decoration,
        width: width,
        height: height,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        margin: margin,
        children: <Widget>[leading, SizedBox(height: spaceBetween), trailing],
      ),
    );
