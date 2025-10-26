import "package:u/utilities.dart";

class UScaffold extends StatelessWidget {
  const UScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.persistentFooterButtons,
    this.padding,
    this.margin,
    this.color,
    this.decoration,
    this.constraints,
    this.width,
    this.height,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.primary = true,
    this.drawerScrimColor,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.alignment,
    this.safeArea = true,
    this.safeAreaEdges = EdgeInsets.zero,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final List<Widget>? persistentFooterButtons;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final BoxDecoration? decoration;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final bool primary;
  final Color? drawerScrimColor;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final DrawerCallback? onDrawerChanged;
  final DrawerCallback? onEndDrawerChanged;
  final Alignment? alignment;
  final bool safeArea;
  final EdgeInsets safeAreaEdges;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(final BuildContext context) {
    Widget content = GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        width: width,
        height: height,
        constraints: constraints,
        decoration: decoration,
        padding: padding,
        margin: margin,
        alignment: alignment,
        child: body,
      ),
    );

    if (safeArea) {
      content = Padding(
        padding: safeAreaEdges,
        child: SafeArea(child: content),
      );
    }

    return Scaffold(
      key: key,
      backgroundColor: color,
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      persistentFooterButtons: persistentFooterButtons,
      onDrawerChanged: onDrawerChanged,
      onEndDrawerChanged: onEndDrawerChanged,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      extendBody: extendBody,
      primary: primary,
      drawerScrimColor: drawerScrimColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation ?? (floatingActionButton is FloatingActionButton ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerFloat),
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      body: content,
    );
  }
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
    this.indicatorColor,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.indicatorWeight = 2.0,
    this.isScrollable = false,
    this.dragStartBehavior = DragStartBehavior.start,
    this.viewportFraction = 1.0,
    this.constraints,
  });

  final List<Widget> children;
  final Widget tabBar;
  final double? width;
  final double? height;
  final int initialIndex;
  final TabController? controller;
  final ScrollPhysics? physics;
  final Color? indicatorColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final double indicatorWeight;
  final bool isScrollable;
  final DragStartBehavior dragStartBehavior;
  final double viewportFraction;
  final BoxConstraints? constraints;

  @override
  Widget build(final BuildContext context) => DefaultTabController(
        initialIndex: initialIndex,
        length: children.length,
        child: Column(
          children: <Widget>[
            tabBar,
            Expanded(
              child: ConstrainedBox(
                constraints: constraints ?? const BoxConstraints(),
                child: SizedBox(
                  width: width ?? MediaQuery.of(context).size.width,
                  height: height ?? MediaQuery.of(context).size.height,
                  child: TabBarView(
                    physics: physics,
                    controller: controller,
                    dragStartBehavior: dragStartBehavior,
                    viewportFraction: viewportFraction,
                    children: children,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class UIconTextHorizontal extends StatelessWidget {
  const UIconTextHorizontal({
    required this.leading,
    required this.trailing,
    super.key,
    this.spaceBetween = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.elevation = 0.0,
    this.padding = EdgeInsets.zero,
  });

  final Widget leading;
  final Widget trailing;
  final double spaceBetween;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double elevation;
  final EdgeInsets padding;

  @override
  Widget build(final BuildContext context) {
    Widget content = Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: <Widget>[leading, SizedBox(width: spaceBetween), trailing],
    );

    content = Padding(padding: padding, child: content);

    if (onTap != null || elevation > 0 || backgroundColor != null || borderRadius != null) {
      content = Card(
        elevation: elevation,
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(8)),
        child: InkWell(onTap: onTap, child: content),
      );
    }

    return content;
  }
}

class UIconTextVertical extends StatelessWidget {
  const UIconTextVertical({
    required this.leading,
    required this.trailing,
    super.key,
    this.spaceBetween = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.elevation = 0.0,
    this.padding = EdgeInsets.zero,
  });

  final Widget leading;
  final Widget trailing;
  final double spaceBetween;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double elevation;
  final EdgeInsets padding;

  @override
  Widget build(final BuildContext context) {
    Widget content = Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: <Widget>[leading, SizedBox(height: spaceBetween), trailing],
    );

    content = Padding(padding: padding, child: content);

    if (onTap != null || elevation > 0 || backgroundColor != null || borderRadius != null) {
      content = Card(
        elevation: elevation,
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(8)),
        child: InkWell(onTap: onTap, child: content),
      );
    }

    return content;
  }
}

class UContainer extends StatelessWidget {
  const UContainer({
    this.child,
    super.key,
    this.padding,
    this.margin,
    this.color,
    this.gradient,
    this.image,
    this.border,
    this.radius,
    this.boxShadow,
    this.width,
    this.height,
    this.constraints,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.transform,
    this.foregroundDecoration,
  });

  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final Gradient? gradient;
  final DecorationImage? image;
  final BoxBorder? border;
  final double? radius;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final Clip clipBehavior;
  final Matrix4? transform;
  final Decoration? foregroundDecoration;

  @override
  Widget build(final BuildContext context) => Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        constraints: constraints,
        alignment: alignment,
        transform: transform,
        foregroundDecoration: foregroundDecoration,
        decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          image: image,
          border: border,
          borderRadius: BorderRadius.circular(radius ?? 0),
          boxShadow: boxShadow,
        ),
        clipBehavior: clipBehavior,
        child: child,
      );
}

class UColumn extends StatelessWidget {
  const UColumn({
    required this.children,
    super.key,
    this.spacing = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.divider,
    this.wrap = false,
    this.runSpacing = 8.0,
    this.width,
    this.height,
    this.flexFactors,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.radius,
  });

  final List<Widget> children;
  final double spacing;
  final double? width;
  final double? height;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Widget? divider;
  final bool wrap;
  final double runSpacing;
  final List<int>? flexFactors;
  final double? radius;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(final BuildContext context) {
    final List<Widget> spacedChildren = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      Widget child = children[i];
      if (flexFactors != null && i < flexFactors!.length && flexFactors![i] > 0) {
        child = Expanded(flex: flexFactors![i], child: child);
      }
      spacedChildren.add(child);
      if (i < children.length - 1) {
        spacedChildren.add(divider ?? SizedBox(height: spacing));
      }
    }

    if (wrap) {
      return UContainer(
        color: backgroundColor,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        radius: radius,
        child: Wrap(
          direction: Axis.vertical,
          spacing: spacing,
          runSpacing: runSpacing,
          alignment: mainAxisAlignment == MainAxisAlignment.start ? WrapAlignment.start : WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: spacedChildren,
        ),
      );
    }

    return UContainer(
      color: backgroundColor,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      radius: radius,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: spacedChildren,
      ),
    );
  }
}

class URow extends StatelessWidget {
  const URow({
    required this.children,
    super.key,
    this.spacing = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.divider,
    this.wrap = false,
    this.runSpacing = 8.0,
    this.width,
    this.height,
    this.flexFactors,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.radius,
  });

  final List<Widget> children;
  final double spacing;
  final double? width;
  final double? height;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Widget? divider;
  final bool wrap;
  final double runSpacing;
  final List<int>? flexFactors;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? radius;

  @override
  Widget build(final BuildContext context) {
    final List<Widget> spacedChildren = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      Widget child = children[i];
      if (flexFactors != null && i < flexFactors!.length && flexFactors![i] > 0) {
        child = Expanded(flex: flexFactors![i], child: child);
      }
      spacedChildren.add(child);
      if (i < children.length - 1) {
        spacedChildren.add(divider ?? SizedBox(height: spacing));
      }
    }

    if (wrap) {
      return UContainer(
        color: backgroundColor,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        radius: radius,
        child: Wrap(
          direction: Axis.vertical,
          spacing: spacing,
          runSpacing: runSpacing,
          alignment: mainAxisAlignment == MainAxisAlignment.start ? WrapAlignment.start : WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: spacedChildren,
        ),
      );
    }

    return UContainer(
      color: backgroundColor,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      radius: radius,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: spacedChildren,
      ),
    );
  }
}

class UCard extends StatelessWidget {
  const UCard({
    required this.child,
    this.header,
    this.footer,
    this.actions,
    super.key,
    this.elevation = 2.0,
    this.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.shadowColor,
  });

  final Widget? header;
  final Widget child;
  final Widget? footer;
  final List<Widget>? actions;
  final double elevation;
  final Color? color;
  final BorderRadius borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final Color? shadowColor;

  @override
  Widget build(final BuildContext context) => Card(
        elevation: elevation,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        margin: margin,
        shadowColor: shadowColor,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (header != null) ...<Widget>[
                header!,
                const SizedBox(height: 8),
              ],
              Padding(padding: padding, child: child),
              if (footer != null) ...<Widget>[
                const SizedBox(height: 8),
                footer!,
              ],
              if (actions != null) ...<Widget>[
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!,
                ),
              ],
            ],
          ),
        ),
      );
}

class UListView extends StatelessWidget {
  const UListView({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
    this.header,
    this.footer,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.scrollController,
    this.primary,
    this.reverse = false,
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount; // number of main items
  final Widget? header;
  final Widget? footer;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final bool? primary;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final int totalCount = itemCount + (header != null ? 1 : 0) + (footer != null ? 1 : 0);

    return ListView.builder(
      itemCount: totalCount,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      controller: scrollController,
      primary: primary,
      reverse: reverse,
      itemBuilder: (BuildContext context, int index) {
        if (header != null && index == 0) {
          return header!;
        }

        final int headerOffset = header != null ? 1 : 0;
        if (footer != null && index == totalCount - 1) {
          return footer!;
        }

        // Regular item
        final int adjustedIndex = index - headerOffset;
        return itemBuilder(context, adjustedIndex);
      },
    );
  }
}
