part of "u_admin.dart";

abstract class AdminBreakpoints {
  static const double mobile = 720;

  static const double desktop = 1100;

  static const double maxContentWidth = 1400;
}

enum ScreenType { mobile, tablet, desktop }

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  ScreenType get screenType {
    final double w = screenWidth;
    if (w < AdminBreakpoints.mobile) return ScreenType.mobile;
    if (w < AdminBreakpoints.desktop) return ScreenType.tablet;
    return ScreenType.desktop;
  }

  bool get isMobileWidth => screenType == ScreenType.mobile;

  bool get isTabletWidth => screenType == ScreenType.tablet;

  bool get isDesktopWidth => screenType == ScreenType.desktop;

  double get pagePadding => isMobileWidth ? 12 : (isTabletWidth ? 20 : 28);

  double dialogWidth({double max = 420}) {
    final double available = screenWidth - 48;
    return available < max ? available : max;
  }

  double dialogHeight({double max = 600}) {
    final double available = screenHeight - 96;
    return available < max ? available : max;
  }

  T responsive<T>({required T mobile, required T desktop, T? tablet}) => switch (screenType) {
    ScreenType.mobile => mobile,
    ScreenType.tablet => tablet ?? desktop,
    ScreenType.desktop => desktop,
  };
}

class UResponsiveGrid extends StatelessWidget {
  const UResponsiveGrid({required this.children, super.key, this.minTileWidth = 260, this.spacing = 16, this.runSpacing = 16});

  final List<Widget> children;

  final double minTileWidth;

  final double spacing;

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

class AdminPageBody extends StatelessWidget {
  const AdminPageBody({required this.child, super.key, this.maxWidth = AdminBreakpoints.maxContentWidth, this.padded = true});

  final Widget child;

  final double maxWidth;

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
