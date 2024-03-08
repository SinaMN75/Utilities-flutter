part of 'components.dart';

void bottomSheet({
  required final Widget child,
  final EdgeInsets padding = const EdgeInsets.all(20),
  final bool isDismissible = true,
}) =>
    Get.bottomSheet(
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: context.theme.colorScheme.background, borderRadius: BorderRadius.circular(20)),
        constraints: BoxConstraints(maxHeight: context.height - 100),
        padding: padding,
        child: SingleChildScrollView(child: child),
      ),
      backgroundColor: context.theme.colorScheme.background,
      isDismissible: isDismissible,
      isScrollControlled: true,
    );

void scrollableBottomSheet({
  final List<Widget>? children,
  final Widget? child,
  final bool isDismissible = true,
  final EdgeInsets padding = const EdgeInsets.all(20),
  final bool expand = false,
  final double maxChildSize = 1.0,
  final double minChildSize = 0.4,
}) =>
    Get.bottomSheet(
      Container(
        padding: padding,
        child: DraggableScrollableSheet(
          expand: expand,
          initialChildSize: minChildSize,
          maxChildSize: maxChildSize,
          minChildSize: minChildSize,
          builder: (final BuildContext context, final ScrollController controller) =>
              child ??
              ListView(
                padding: EdgeInsets.zero,
                controller: controller,
                children: children!,
              ),
        ),
      ),
      backgroundColor: context.theme.colorScheme.background,
      isDismissible: isDismissible,
      isScrollControlled: true,
    );
