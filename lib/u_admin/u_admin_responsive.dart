part of "u_admin.dart";
// Responsive helpers/widgets relocated from the u_admin app for cross-project reuse.

/// Central responsive breakpoints for the admin panel.
///
/// [mobile] matches the side-menu drawer breakpoint so the shell navigation and
/// page content always agree on when a phone layout is active.
abstract class AdminBreakpoints {
  /// Below this width the phone layout (hamburger drawer) is used.
  static const double mobile = 720;

  /// At or above this width the wide desktop layout is used.
  static const double desktop = 1100;

  /// Content is centered and never grows wider than this on huge screens.
  static const double maxContentWidth = 1400;
}

/// Screen size buckets derived from the current width.
enum ScreenType { mobile, tablet, desktop }

/// Responsive helpers exposed on [BuildContext] so any widget can adapt to the
/// current screen size without repeating [MediaQuery] math.
extension ResponsiveContext on BuildContext {
  /// Current logical width of the screen.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Current logical height of the screen.
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// The active [ScreenType] for the current width.
  ScreenType get screenType {
    final double w = screenWidth;
    if (w < AdminBreakpoints.mobile) return ScreenType.mobile;
    if (w < AdminBreakpoints.desktop) return ScreenType.tablet;
    return ScreenType.desktop;
  }

  /// True on phone-sized screens.
  bool get isMobileWidth => screenType == ScreenType.mobile;

  /// True on tablet-sized screens.
  bool get isTabletWidth => screenType == ScreenType.tablet;

  /// True on desktop-sized screens.
  bool get isDesktopWidth => screenType == ScreenType.desktop;

  /// Horizontal padding that scales with the screen size.
  double get pagePadding => isMobileWidth ? 12 : (isTabletWidth ? 20 : 28);

  /// A dialog content width that never overflows small screens.
  double dialogWidth({double max = 420}) {
    final double available = screenWidth - 48;
    return available < max ? available : max;
  }

  /// A dialog content height that never overflows short screens.
  double dialogHeight({double max = 600}) {
    final double available = screenHeight - 96;
    return available < max ? available : max;
  }

  /// Picks a value per screen type; [tablet] falls back to [desktop] when omitted.
  T responsive<T>({required T mobile, required T desktop, T? tablet}) => switch (screenType) {
    ScreenType.mobile => mobile,
    ScreenType.tablet => tablet ?? desktop,
    ScreenType.desktop => desktop,
  };
}

/// A grid that adapts its column count to the available width, giving each tile
/// at least [minTileWidth] logical pixels. Use for KPI cards, stat tiles, and
/// any collection that should reflow from 1 column on phones up to many columns
/// on wide desktops.
class UResponsiveGrid extends StatelessWidget {
  const UResponsiveGrid({required this.children, super.key, this.minTileWidth = 260, this.spacing = 16, this.runSpacing = 16});

  /// Tiles to lay out.
  final List<Widget> children;

  /// Minimum width each tile should get before adding another column.
  final double minTileWidth;

  /// Horizontal gap between tiles.
  final double spacing;

  /// Vertical gap between rows of tiles.
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;
        final int rawColumns = (maxWidth / minTileWidth).floor();
        final int columns = rawColumns.clamp(1, children.length);
        final double tileWidth = columns == 1 ? maxWidth : (maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          children: children.map((Widget child) => SizedBox(width: tileWidth, child: child)).toList(),
        );
      },
    );
  }
}

/// Wraps page content so it is comfortably padded on every device and stops
/// stretching edge-to-edge on ultra-wide monitors (content is centered and
/// capped at [maxWidth]).
class AdminPageBody extends StatelessWidget {
  const AdminPageBody({required this.child, super.key, this.maxWidth = AdminBreakpoints.maxContentWidth, this.padded = true});

  /// The page content.
  final Widget child;

  /// Maximum content width on large screens.
  final double maxWidth;

  /// Whether to apply responsive horizontal padding.
  final bool padded;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.topCenter,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: padded
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: context.pagePadding),
              child: child,
            )
          : child,
    ),
  );
}
