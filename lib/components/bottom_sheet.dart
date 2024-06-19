part of 'components.dart';

void bottomSheet({
  required final Widget child,
  final EdgeInsets padding = const EdgeInsets.all(20),
  final bool isDismissible = true,
}) =>
    showModalBottomSheet(
      builder: (final BuildContext context) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: getContext().theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: BoxConstraints(maxHeight: getContext().height - 100),
        padding: padding,
        child: SingleChildScrollView(child: child),
      ),
      backgroundColor: getContext().theme.colorScheme.surface,
      isDismissible: isDismissible,
      isScrollControlled: true,
      context: getContext(),
    );

void scrollableBottomSheet({
  final List<Widget>? children,
  final Widget? child,
  final bool isDismissible = true,
  final EdgeInsets padding = const EdgeInsets.all(20),
  final bool expand = false,
  final double maxChildSize = 1.0,
  final double minChildSize = 0.4,
  final VoidCallback? onDismiss,
}) =>
    showModalBottomSheet(
      context: getContext(),
      builder: (final BuildContext context) =>
          Container(
            padding: padding,
            child: DraggableScrollableSheet(
              expand: expand,
              initialChildSize: minChildSize,
              maxChildSize: maxChildSize,
              minChildSize: minChildSize,
              builder: (final BuildContext _, final ScrollController c) =>
                  SingleChildScrollView(
                    controller: c,
                    child: child ??
                        Column(
                          children: children!,
                        ),
                  ),
            ),
          ),
      backgroundColor: getContext().theme.colorScheme.surface,
      isDismissible: isDismissible,
      isScrollControlled: true,
    ).whenComplete(onDismiss ?? () {});
