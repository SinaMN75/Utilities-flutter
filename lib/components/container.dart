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

// Improved UIconTextHorizontal: Added optional subtitle, icon color, text styles,
// onTap callback, background color, border, and elevation for card-like behavior.
class UIconTextHorizontal extends StatelessWidget {
  const UIconTextHorizontal({
    required this.leading,
    required this.trailing,
    super.key,
    this.subtitle,
    this.spaceBetween = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.iconColor,
    this.textStyle,
    this.subtitleStyle,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.all(8),
  });

  final Widget leading;
  final Widget trailing;
  final Widget? subtitle;
  final double spaceBetween;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Color? iconColor;
  final TextStyle? textStyle;
  final TextStyle? subtitleStyle;
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
      children: <Widget>[
        ColorFiltered(
          colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
          child: leading,
        ),
        SizedBox(width: spaceBetween),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DefaultTextStyle(style: textStyle ?? Theme.of(context).textTheme.bodyMedium!, child: trailing),
              if (subtitle != null) ...<Widget>[
                const SizedBox(height: 4),
                DefaultTextStyle(style: subtitleStyle ?? Theme.of(context).textTheme.bodySmall!, child: subtitle!),
              ],
            ],
          ),
        ),
      ],
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

// Improved UIconTextVertical: Similar improvements as horizontal version, with subtitle,
// styles, onTap, card-like options.
class UIconTextVertical extends StatelessWidget {
  const UIconTextVertical({
    required this.leading,
    required this.trailing,
    super.key,
    this.subtitle,
    this.spaceBetween = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.iconColor,
    this.textStyle,
    this.subtitleStyle,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.all(8),
  });

  final Widget leading;
  final Widget trailing;
  final Widget? subtitle;
  final double spaceBetween;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Color? iconColor;
  final TextStyle? textStyle;
  final TextStyle? subtitleStyle;
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
      children: <Widget>[
        ColorFiltered(
          colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
          child: leading,
        ),
        SizedBox(height: spaceBetween),
        DefaultTextStyle(style: textStyle ?? Theme.of(context).textTheme.bodyMedium!, child: trailing),
        if (subtitle != null) ...<Widget>[
          const SizedBox(height: 4),
          DefaultTextStyle(style: subtitleStyle ?? Theme.of(context).textTheme.bodySmall!, child: subtitle!),
        ],
      ],
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

// New: UContainer - A highly customizable container that combines Container, DecoratedBox, and more.
// Supports shadow, border, gradient, image background, clip behavior, and transform.
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
    this.borderRadius,
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
  final BorderRadius? borderRadius;
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
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        clipBehavior: clipBehavior,
        child: child,
      );
}

// New: USpacedRow - A Row with automatic spacing between children, optional dividers, and wrap if needed.
// Supports flex for children via Expanded wrappers.
class USpacedRow extends StatelessWidget {
  const USpacedRow({
    required this.children,
    super.key,
    this.spacing = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.divider,
    this.wrap = false,
    this.runSpacing = 8.0,
    this.flexFactors,
  });

  final List<Widget> children;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Widget? divider;
  final bool wrap;
  final double runSpacing;
  final List<int>? flexFactors; // Optional flex for each child

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
        spacedChildren.add(divider ?? SizedBox(width: spacing));
      }
    }

    if (wrap) {
      return Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        alignment: mainAxisAlignment == MainAxisAlignment.start ? WrapAlignment.start : WrapAlignment.center,
        // Simplified mapping
        crossAxisAlignment: WrapCrossAlignment.center,
        children: spacedChildren,
      );
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: spacedChildren,
    );
  }
}

// New: USpacedColumn - Similar to USpacedRow but for Column.
class USpacedColumn extends StatelessWidget {
  const USpacedColumn({
    required this.children,
    super.key,
    this.spacing = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.divider,
    this.wrap = false,
    this.runSpacing = 8.0,
    this.flexFactors,
  });

  final List<Widget> children;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Widget? divider;
  final bool wrap;
  final double runSpacing;
  final List<int>? flexFactors;

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
      return Wrap(
        direction: Axis.vertical,
        spacing: spacing,
        runSpacing: runSpacing,
        alignment: mainAxisAlignment == MainAxisAlignment.start ? WrapAlignment.start : WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: spacedChildren,
      );
    }

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: spacedChildren,
    );
  }
}

// New: UCard - A customizable card with header, body, footer, actions, and elevation.
// Supports onTap, border, color overrides.
class UCard extends StatelessWidget {
  const UCard({
    required this.body,
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
  final Widget body;
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
              Padding(padding: padding, child: body),
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

// New: UListView - A customizable ListView with optional separators, headers, footers,
// physics, and itemBuilder for dynamic lists to reduce boilerplate.
// Updated UListView: Removed separator and related logic
class UListView extends StatelessWidget {
  const UListView({
    this.items,
    this.itemBuilder,
    this.itemCount,
    super.key,
    this.header,
    this.footer,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.scrollController,
    this.primary,
    this.reverse = false,
  }) : assert(items != null || (itemBuilder != null && itemCount != null), "Provide either items or itemBuilder with itemCount.");

  final List<Widget>? items;
  final IndexedWidgetBuilder? itemBuilder;
  final int? itemCount;
  final Widget? header;
  final Widget? footer;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final bool? primary;
  final bool reverse;

  @override
  Widget build(final BuildContext context) {
    final List<Widget> children = <Widget>[];
    if (header != null) children.add(header!);
    if (items != null) children.addAll(items!);
    if (footer != null) children.add(footer!);

    return ListView.builder(
      itemCount: itemBuilder != null ? itemCount : children.length,
      itemBuilder: itemBuilder ?? (_, int index) => children[index],
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      controller: scrollController,
      primary: primary,
      reverse: reverse,
    );
  }
}