import 'package:flutter/cupertino.dart';
import 'package:u/utilities.dart';

abstract class UNavigator2 {
  static void push(final Widget page) async => Navigator.of(navigatorKey.currentContext!).push(
        MaterialPageRoute(builder: (context) => page),
      );

  static void dialog(
    final Widget page, {
    final bool barrierDismissible = true,
    final VoidCallback? onDismiss,
  }) =>
      showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) => page,
      ).then((value) {
        if (onDismiss != null) onDismiss();
      });

  static void offAll(final Widget page) => Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (route) => false,
      );

  static void off(final Widget page, {final bool preventDuplicates = true}) => Navigator.of(
        navigatorKey.currentContext!,
      ).pushReplacement(MaterialPageRoute(builder: (context) => page));

  static void back() => Navigator.of(navigatorKey.currentContext!).pop();

  static void alertDialog({
    required final (String, VoidCallback) action1,
    final String? title,
    final Widget? titleWidget,
    final String? subtitle,
    final Widget? content,
    final (String, VoidCallback)? action2,
    final (String, VoidCallback)? action3,
    final VoidCallback? onDismiss,
    final bool barrierDismissible = true,
  }) =>
      dialog(
        CupertinoAlertDialog(
          title: titleWidget ?? Text(title ?? '').bodyLarge().fit(),
          content: content ?? Text(subtitle!),
          actions: <Widget>[
            TextButton(onPressed: action1.$2, child: Text(action1.$1)),
            if (action2 != null) TextButton(onPressed: action2.$2, child: Text(action2.$1)),
            if (action3 != null) TextButton(onPressed: action3.$2, child: Text(action3.$1)),
          ],
        ),
        barrierDismissible: barrierDismissible,
        onDismiss: onDismiss,
      );

  static void dialogAlert(
    final Widget page, {
    final bool barrierDismissible = true,
    final bool useSafeArea = false,
    final Clip clipBehavior = Clip.hardEdge,
    final bool scrollable = false,
    final EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
    final EdgeInsetsGeometry? contentPadding = EdgeInsets.zero,
    final bool defaultCloseButton = false,
    final VoidCallback? onDismiss,
    final Widget? icon,
    final EdgeInsetsGeometry? iconPadding,
    final Color? iconColor,
    final Widget? title,
    final EdgeInsetsGeometry? titlePadding,
    final TextStyle? titleTextStyle,
    final TextStyle? contentTextStyle,
    final List<Widget>? actions,
    final EdgeInsetsGeometry? actionsPadding,
    final MainAxisAlignment? actionsAlignment,
    final OverflowBarAlignment? actionsOverflowAlignment,
    final VerticalDirection? actionsOverflowDirection,
    final double? actionsOverflowButtonSpacing,
    final EdgeInsetsGeometry? buttonPadding,
    final Color? backgroundColor,
    final double? elevation,
    final Color? shadowColor,
    final Color? surfaceTintColor,
    final String? semanticLabel,
    final ShapeBorder? shape,
    final AlignmentGeometry? alignment,
    final ScrollController? scrollController,
    final ScrollController? actionScrollController,
    final Duration? insetAnimationDuration,
    final Curve? insetAnimationCurve,
  }) async =>
      dialog(
        AlertDialog(
          content: page,
          title: title,
          contentPadding: contentPadding,
          alignment: alignment,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          elevation: elevation,
          actions: actions,
          actionsAlignment: actionsAlignment,
          actionsOverflowAlignment: actionsOverflowAlignment,
          actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
          actionsOverflowDirection: actionsOverflowDirection,
          actionsPadding: actionsPadding,
          buttonPadding: buttonPadding,
          clipBehavior: clipBehavior,
          contentTextStyle: contentTextStyle,
          icon: defaultCloseButton
              ? IconButton(
                  onPressed: UNavigator.back,
                  icon: Icon(Icons.close, color: navigatorKey.currentContext!.theme.colorScheme.error),
                ).alignAtCenterRight()
              : icon,
          iconColor: iconColor,
          iconPadding: iconPadding,
          insetPadding: insetPadding,
          scrollable: scrollable,
          semanticLabel: semanticLabel,
          shape: shape,
          surfaceTintColor: surfaceTintColor,
          titlePadding: titlePadding,
          titleTextStyle: titleTextStyle,
        ),
        barrierDismissible: barrierDismissible,
        onDismiss: onDismiss,
      );

  static void snackbarGreen({
    required final String title,
    required final String subtitle,
    final SnackPosition? snackPosition,
    final Widget? titleText,
    final Widget? messageText,
    final Widget? icon,
    final bool? shouldIconPulse,
    final double? maxWidth,
    final EdgeInsets? margin,
    final EdgeInsets? padding,
    final double? borderRadius,
    final Color? borderColor,
    final double? borderWidth,
    final Color? backgroundColor,
    final Color? leftBarIndicatorColor,
    final List<BoxShadow>? boxShadows,
    final Gradient? backgroundGradient,
    final TextButton? mainButton,
    final OnTap? onTap,
    final bool? isDismissible,
    final bool? showProgressIndicator,
    final DismissDirection? dismissDirection,
    final AnimationController? progressIndicatorController,
    final Color? progressIndicatorBackgroundColor,
    final Animation<Color>? progressIndicatorValueColor,
    final SnackStyle? snackStyle,
    final Curve? forwardAnimationCurve,
    final Curve? reverseAnimationCurve,
    final Duration? animationDuration,
    final double? barBlur,
    final double? overlayBlur,
    final SnackbarStatusCallback? snackbarStatus,
    final Color? overlayColor,
    final Form? userInputForm,
    final Color? colorText,
    final int duration = 5,
    final bool instantInit = true,
  }) =>
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon != null) icon,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(color: colorText ?? Colors.white)),
                    Text(subtitle, style: TextStyle(color: colorText ?? Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor ?? Colors.green,
          duration: Duration(seconds: duration),
          behavior: SnackBarBehavior.floating,
          margin: margin,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          ),
        ),
      );

  static void snackbarRed({
    required final String title,
    required final String subtitle,
    final SnackPosition? snackPosition,
    final Widget? titleText,
    final Widget? messageText,
    final Widget? icon,
    final bool? shouldIconPulse,
    final double? maxWidth,
    final EdgeInsets? margin,
    final EdgeInsets? padding,
    final double? borderRadius,
    final Color? borderColor,
    final double? borderWidth,
    final Color? backgroundColor,
    final Color? leftBarIndicatorColor,
    final List<BoxShadow>? boxShadows,
    final Gradient? backgroundGradient,
    final TextButton? mainButton,
    final OnTap? onTap,
    final bool? isDismissible,
    final bool? showProgressIndicator,
    final DismissDirection? dismissDirection,
    final AnimationController? progressIndicatorController,
    final Color? progressIndicatorBackgroundColor,
    final Animation<Color>? progressIndicatorValueColor,
    final SnackStyle? snackStyle,
    final Curve? forwardAnimationCurve,
    final Curve? reverseAnimationCurve,
    final Duration? animationDuration,
    final double? barBlur,
    final double? overlayBlur,
    final SnackbarStatusCallback? snackbarStatus,
    final Color? overlayColor,
    final Form? userInputForm,
    final Color? colorText,
    final int duration = 5,
    final bool instantInit = true,
  }) =>
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon != null) icon,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(color: colorText ?? Colors.white)),
                    Text(subtitle, style: TextStyle(color: colorText ?? Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor ?? Colors.green,
          duration: Duration(seconds: duration),
          behavior: SnackBarBehavior.floating,
          margin: margin,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          ),
        ),
      );

  static void logout({
    required final VoidCallback onLoggedOut,
    final String title = "خروج از سیستم",
    final String description = "آیا از خروج از سیستم اطمینان دارید؟",
    final VoidCallback? onCancelButtonTap,
    final String yesButtonTitle = "بله",
    final String cancelButtonTitle = 'انصراف',
  }) =>
      showYesCancelDialog(
        title: title,
        description: description,
        onYesButtonTap: onLoggedOut,
        cancelButtonTitle: cancelButtonTitle,
        onCancelButtonTap: onCancelButtonTap,
        yesButtonTitle: yesButtonTitle,
      );

  static void showYesCancelDialog({
    required final String title,
    required final String description,
    required final VoidCallback onYesButtonTap,
    final VoidCallback? onCancelButtonTap,
    final String yesButtonTitle = "بله",
    final String cancelButtonTitle = 'انصراف',
  }) =>
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (final BuildContext context) => AlertDialog.adaptive(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(title).bodyLarge(),
          content: Text(description).bodyMedium(),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              onPressed: onCancelButtonTap ?? UNavigator.back,
              child: Text(cancelButtonTitle),
            ),
            TextButton(
              onPressed: onYesButtonTap,
              child: Text(yesButtonTitle),
            ),
          ],
        ),
      );
}
