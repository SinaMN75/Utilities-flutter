part of 'components.dart';

void bottomSheet({
  required final Widget child,
  final bool isDismissible = true,
}) =>
    Get.bottomSheet(
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: context.theme.colorScheme.background, borderRadius: BorderRadius.circular(20)),
        constraints: BoxConstraints(maxHeight: context.height - 100),
        padding: const EdgeInsets.all(20),
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
}) =>
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        child: DraggableScrollableSheet(
          expand: false,
          builder: (final BuildContext context, final ScrollController controller) =>
              child ??
              ListView(
                controller: controller,
                children: children!,
              ),
        ),
      ),
      backgroundColor: context.theme.colorScheme.background,
      isDismissible: isDismissible,
      isScrollControlled: true,
    );