import 'package:flutter/cupertino.dart';
import 'package:u/utilities.dart';

abstract class UNavigator {
  static void push(
    final Widget page, {
    final bool dialog = false,
    final Transition transition = Transition.cupertino,
    final bool preventDuplicates = true,
    final int milliSecondDelay = 10,
  }) async =>
      delay(
        milliSecondDelay,
        () => Get.to(
          page,
          fullscreenDialog: dialog,
          popGesture: true,
          opaque: dialog ? false : true,
          transition: transition,
          preventDuplicates: preventDuplicates,
        ),
      );

  static void dialog(
    final Widget page, {
    final bool barrierDismissible = true,
    final bool useSafeArea = false,
    final VoidCallback? onDismiss,
  }) =>
      Get.dialog(page, useSafeArea: useSafeArea, barrierDismissible: barrierDismissible).then(
        (final _) => onDismiss != null ? onDismiss() : null,
      );

  static void offAll(
    final Widget page, {
    final bool dialog = false,
    final Transition transition = Transition.cupertino,
    final int milliSecondDelay = 10,
  }) =>
      delay(
        milliSecondDelay,
        () => Get.offAll(
          () => page,
          fullscreenDialog: dialog,
          popGesture: true,
          opaque: dialog ? false : true,
          transition: transition,
        ),
      );

  static void off(final Widget page, {final bool preventDuplicates = true}) => delay(
        10,
        () => Get.off(() => page, preventDuplicates: preventDuplicates),
      );

  static void back({final bool closeOverlays = false}) => delay(
        10,
        () => Get.back(closeOverlays: closeOverlays),
      );

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
      Get.dialog(
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
                  icon: Icon(
                    Icons.close,
                    color: navigatorKey.currentContext!.theme.colorScheme.error,
                  ),
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
        useSafeArea: useSafeArea,
        barrierDismissible: barrierDismissible,
      ).then(
        (final _) => onDismiss != null ? onDismiss() : null,
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
  }) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        subtitle,
        backgroundColor: backgroundColor ?? Colors.green,
        colorText: colorText ?? Colors.white,
        maxWidth: maxWidth,
        onTap: onTap,
        margin: margin,
        borderRadius: borderRadius,
        snackPosition: snackPosition,
        padding: padding,
        animationDuration: animationDuration,
        backgroundGradient: backgroundGradient,
        barBlur: barBlur,
        borderColor: borderColor,
        borderWidth: borderWidth,
        boxShadows: boxShadows,
        dismissDirection: dismissDirection,
        duration: Duration(seconds: duration),
        forwardAnimationCurve: forwardAnimationCurve,
        icon: icon,
        instantInit: instantInit,
        isDismissible: isDismissible,
        leftBarIndicatorColor: leftBarIndicatorColor,
        mainButton: mainButton,
        messageText: messageText,
        overlayBlur: overlayBlur,
        overlayColor: overlayColor,
        progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
        progressIndicatorController: progressIndicatorController,
        progressIndicatorValueColor: progressIndicatorValueColor,
        reverseAnimationCurve: reverseAnimationCurve,
        shouldIconPulse: shouldIconPulse,
        showProgressIndicator: showProgressIndicator,
        snackbarStatus: snackbarStatus,
        snackStyle: snackStyle,
        titleText: titleText,
        userInputForm: userInputForm,
      );
    }
  }

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
  }) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        subtitle,
        backgroundColor: backgroundColor ?? Colors.red,
        colorText: colorText ?? Colors.white,
        maxWidth: maxWidth,
        onTap: onTap,
        margin: margin,
        borderRadius: borderRadius,
        snackPosition: snackPosition,
        padding: padding,
        animationDuration: animationDuration,
        backgroundGradient: backgroundGradient,
        barBlur: barBlur,
        borderColor: borderColor,
        borderWidth: borderWidth,
        boxShadows: boxShadows,
        dismissDirection: dismissDirection,
        duration: Duration(seconds: duration),
        forwardAnimationCurve: forwardAnimationCurve,
        icon: icon,
        instantInit: instantInit,
        isDismissible: isDismissible,
        leftBarIndicatorColor: leftBarIndicatorColor,
        mainButton: mainButton,
        messageText: messageText,
        overlayBlur: overlayBlur,
        overlayColor: overlayColor,
        progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
        progressIndicatorController: progressIndicatorController,
        progressIndicatorValueColor: progressIndicatorValueColor,
        reverseAnimationCurve: reverseAnimationCurve,
        shouldIconPulse: shouldIconPulse,
        showProgressIndicator: showProgressIndicator,
        snackbarStatus: snackbarStatus,
        snackStyle: snackStyle,
        titleText: titleText,
        userInputForm: userInputForm,
      );
    }
  }

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

  static void bottomSheet({
    required final Widget child,
    final EdgeInsets padding = const EdgeInsets.all(20),
    final bool isDismissible = true,
    final VoidCallback? onDismiss,
  }) =>
      showModalBottomSheet(
        builder: (final BuildContext context) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(navigatorKey.currentContext!).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(navigatorKey.currentContext!).height - 100,
          ),
          padding: padding,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(navigatorKey.currentContext!).viewInsets.bottom,
            ),
            child: SingleChildScrollView(child: child),
          ),
        ),
        backgroundColor: Theme.of(navigatorKey.currentContext!).colorScheme.surface,
        isDismissible: isDismissible,
        isScrollControlled: true,
        context: navigatorKey.currentContext!,
      ).then((final _) => onDismiss != null ? onDismiss() : null);

  static void scrollableBottomSheet({
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
        context: navigatorKey.currentContext!,
        builder: (final BuildContext context) => Container(
          padding: padding,
          child: DraggableScrollableSheet(
            expand: expand,
            initialChildSize: minChildSize,
            maxChildSize: maxChildSize,
            minChildSize: minChildSize,
            builder: (final BuildContext _, final ScrollController c) => SingleChildScrollView(
              controller: c,
              child: child ??
                  Column(
                    children: children!,
                  ),
            ),
          ),
        ),
        backgroundColor: Theme.of(navigatorKey.currentContext!).colorScheme.surface,
        isDismissible: isDismissible,
        isScrollControlled: true,
      ).whenComplete(onDismiss ?? () {});
}
