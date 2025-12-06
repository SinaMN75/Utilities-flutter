import "package:u/utilities.dart";

abstract class UToast {
  static ThemeData get theme => Theme.of(navigatorKey.currentContext!);

  static void snackBar({
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 4),
    Color? backgroundColor,
    TextStyle? textStyle,
    SnackBarAction? action,
    DismissDirection dismissDirection = DismissDirection.down,
    EdgeInsets? margin,
    double? width,
    VoidCallback? onDismiss,
  }) => ScaffoldMessenger.of(navigatorKey.currentContext!)
      .showSnackBar(
        SnackBar(
          content: Text(message, style: textStyle),
          backgroundColor: backgroundColor ?? theme.snackBarTheme.backgroundColor,
          duration: duration,
          action: action,
          dismissDirection: dismissDirection,
          behavior: margin != null ? SnackBarBehavior.floating : null,
          margin: margin,
          width: width,
        ),
      )
      .closed
      .then((_) => onDismiss?.call());

  static void error({
    required String message,
    Duration duration = const Duration(seconds: 4),
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) => snackBar(
    message: message,
    backgroundColor: theme.colorScheme.error,
    action: actionLabel != null
        ? SnackBarAction(
            label: actionLabel,
            onPressed: onAction ?? () {},
            textColor: theme.colorScheme.onError,
          )
        : null,
    duration: duration,
    onDismiss: onDismiss,
  );
}
