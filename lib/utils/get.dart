import 'package:flutter/foundation.dart';
import 'package:utilities/utilities.dart';

bool isAndroid = GetPlatform.isAndroid;
bool isIos = GetPlatform.isIOS;
bool isMacOs = GetPlatform.isMacOS;
bool isWindows = GetPlatform.isWindows;
bool isLinux = GetPlatform.isLinux;
bool isFuchsia = GetPlatform.isFuchsia;
bool isMobile = GetPlatform.isMobile;
bool isWeb = GetPlatform.isWeb;
bool isDesktop = GetPlatform.isDesktop;
bool isLandScape = context.isLandscape;
bool isPortrait = context.isPortrait;
bool isTablet = context.isTablet;
bool isPhone = context.isPhone;
BuildContext context = Get.context!;
double screenHeight = context.height;
double screenWidth = context.width;
ThemeData theme = context.theme;
TextTheme textTheme = context.textTheme;
ColorScheme colorScheme = context.theme.colorScheme;
Locale? currentLocale = Get.locale;
bool isDebugMode = kDebugMode;

void updateLocale(final Locale locale) => Get.updateLocale(locale);

Future<dynamic> push(
  final Widget page, {
  final bool dialog = false,
  final Transition transition = Transition.cupertino,
  final bool backFirst = false,
  final bool preventDuplicates = true,
  final int milliSecondDelay = 1,
}) async {
  if (backFirst) back();
  final Widget _page = await Future<Widget>.microtask(() => page);
  delay(
    milliSecondDelay,
    () async => await Get.to(
      _page,
      fullscreenDialog: dialog,
      popGesture: true,
      opaque: dialog ? false : true,
      transition: transition,
      preventDuplicates: preventDuplicates,
    ),
  );
}

Future<dynamic> pushReturn(
  final Widget page, {
  final bool dialog = false,
  final Transition transition = Transition.cupertino,
  final bool preventDuplicates = true,
}) async {
  final Widget _page = await Future<Widget>.microtask(() => page);
  return await Get.to(
    _page,
    fullscreenDialog: dialog,
    popGesture: true,
    opaque: dialog ? false : true,
    transition: transition,
    preventDuplicates: preventDuplicates,
  );
}

Future<void> dialog(
  final Widget page, {
  final bool dialog = false,
  final bool barrierDismissible = true,
  final VoidCallback? onDismiss,
}) async {
  final Widget _page = await Future<Widget>.microtask(() => page);

  await Get.dialog(_page, useSafeArea: true, barrierDismissible: barrierDismissible).then((final _) => onDismiss != null ? onDismiss() : null);
}

Future<void> offAll(
  final Widget page, {
  final bool dialog = false,
  final Transition transition = Transition.cupertino,
  final int milliSecondDelay = 1,
}) async {
  final Widget _page = await Future<Widget>.microtask(() => page);
  delay(
    milliSecondDelay,
    () => Get.offAll(
      () => _page,
      fullscreenDialog: dialog,
      popGesture: true,
      opaque: dialog ? false : true,
      transition: transition,
    ),
  );
}

void off(final Widget page) => Get.off(() => page);

void back() => Get.back();

void snackbarGreen({
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
  final Duration? duration = const Duration(seconds: 3),
  final bool instantInit = true,
}) {
  if (!Get.isSnackbarOpen)
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
      duration: duration,
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

void snackbarRed({
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
  final Duration? duration = const Duration(seconds: 3),
  final bool instantInit = true,
}) {
  if (!Get.isSnackbarOpen)
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
      duration: duration,
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

void alertDialog({
  required final String title,
  required final String subtitle,
  required final (String, VoidCallback) action1,
  final (String, VoidCallback)? action2,
  final (String, VoidCallback)? action3,
  final VoidCallback? onDismiss,
  final bool barrierDismissible = true,
}) =>
    dialog(
      AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: <Widget>[
          TextButton(onPressed: action1.$2, child: Text(action1.$1)),
          if (action2 != null) TextButton(onPressed: action2.$2, child: Text(action2.$1)),
          if (action3 != null) TextButton(onPressed: action3.$2, child: Text(action3.$1)),
        ],
      ),
      barrierDismissible: barrierDismissible,
      onDismiss: onDismiss,
    );
