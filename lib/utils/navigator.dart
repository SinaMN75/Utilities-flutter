import 'package:u/utilities.dart';

abstract class UNavigator {
  static ThemeData get theme => Theme.of(navigatorKey.currentContext!);

  static MediaQueryData get mediaQuery => MediaQuery.of(navigatorKey.currentContext!);

  static bool get canPop => Navigator.of(navigatorKey.currentContext!).canPop();

  static bool get isAndroid => theme.platform == TargetPlatform.android;

  static bool get isIOS => theme.platform == TargetPlatform.iOS;

  /// Push with optional custom transition
  static Future<T?> push<T>(
    Widget page, {
    bool fullscreenDialog = false,
    bool preventDuplicates = true,
    RouteTransitions transition = RouteTransitions.rightToLeft,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeOut,
    RouteSettings? settings,
  }) {
    if (preventDuplicates && _isCurrentRoute(page)) {
      return Future<T?>.value();
    }

    return Navigator.push<T>(
      navigatorKey.currentContext!,
      PageRouteBuilder<T>(
        pageBuilder: (BuildContext context, Animation<double> _, Animation<double> __) => page,
        transitionsBuilder: _getTransition(transition),
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        settings: settings ?? RouteSettings(name: page.runtimeType.toString()),
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  /// Replace current route
  static Future<T?> off<T>(
    Widget page, {
    RouteTransitions transition = RouteTransitions.fade,
    RouteSettings? settings,
    VoidCallback? onDismiss,
  }) =>
      Navigator.pushReplacement<T, dynamic>(
        navigatorKey.currentContext!,
        PageRouteBuilder<T>(
          pageBuilder: (BuildContext context, Animation<double> _, Animation<double> __) => page,
          transitionsBuilder: _getTransition(transition),
          settings: settings,
        ),
      ).then((T? value) {
        onDismiss?.call();
        return value;
      });

  /// Clear all routes and start fresh
  static void offAll(
    Widget page, {
    RouteTransitions transition = RouteTransitions.fade,
    RouteSettings? settings,
    VoidCallback? onDismiss,
  }) {
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      PageRouteBuilder<dynamic>(
        pageBuilder: (BuildContext context, Animation<double> _, Animation<double> __) => page,
        transitionsBuilder: _getTransition(transition),
        settings: settings,
      ),
      (Route<dynamic> route) => false,
    ).then((_) => onDismiss?.call());
  }

  /// Pop with optional result
  static void back<T>([T? result]) {
    if (canPop) {
      Navigator.pop<T>(navigatorKey.currentContext!, result);
    }
  }

  /// Adaptive dialog (Material/Cupertino)
  static Future<T?> dialog<T>(
    Widget child, {
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    Color? barrierColor,
    RouteSettings? settings,
    VoidCallback? onDismiss,
  }) {
    final Future<T?> dialogFuture = isIOS
        ? showCupertinoDialog<T>(
            context: navigatorKey.currentContext!,
            barrierDismissible: barrierDismissible,
            useRootNavigator: useRootNavigator,
            builder: (BuildContext context) => child,
          )
        : showDialog<T>(
            context: navigatorKey.currentContext!,
            barrierDismissible: barrierDismissible,
            useRootNavigator: useRootNavigator,
            barrierColor: barrierColor ?? Colors.black54,
            routeSettings: settings,
            builder: (BuildContext context) => child,
          );

    return dialogFuture.then((T? value) {
      onDismiss?.call();
      return value;
    });
  }

  /// Confirmation dialog with actions
  static void confirm({
    required String title,
    required String message,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool destructive = false,
    VoidCallback? onDismiss,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
  }) =>
      dialog(
        AlertDialog.adaptive(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(onPressed: onCancel ?? back, child: Text(cancelText)),
            TextButton(
              onPressed: onConfirm,
              style: destructive
                  ? TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.error,
                    )
                  : null,
              child: Text(confirmText),
            ),
          ],
        ),
        onDismiss: onDismiss,
      );

  /// Adaptive bottom sheet
  static Future<T?> bottomSheet<T>(
    Widget child, {
    bool isScrollControlled = true,
    bool useSafeArea = true,
    double? elevation,
    Color? backgroundColor,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    VoidCallback? onDismiss,
  }) {
    final Future<T?> sheetFuture = showModalBottomSheet<T>(
      context: navigatorKey.currentContext!,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
      backgroundColor: backgroundColor ?? theme.canvasColor,
      elevation: elevation,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      constraints: constraints,
      builder: (BuildContext context) => Padding(
        padding: EdgeInsets.only(
          bottom: mediaQuery.viewInsets.bottom,
        ),
        child: child,
      ),
    );

    return sheetFuture.then((T? value) {
      onDismiss?.call();
      return value;
    });
  }

  /// Draggable scrollable sheet
  static Future<T?> draggableSheet<T>(
    Widget child, {
    double initialChildSize = 0.5,
    double minChildSize = 0.25,
    double maxChildSize = 0.9,
    bool expand = false,
    bool useRootNavigator = true,
    VoidCallback? onDismiss,
  }) =>
      showModalBottomSheet<T>(
        context: navigatorKey.currentContext!,
        isScrollControlled: true,
        useRootNavigator: useRootNavigator,
        builder: (BuildContext context) => DraggableScrollableSheet(
          expand: expand,
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          builder: (BuildContext context, ScrollController controller) => SingleChildScrollView(
            controller: controller,
            child: child,
          ),
        ),
      ).then((T? value) {
        onDismiss?.call();
        return value;
      });

  /// Standard snackbar
  static void snackbar({
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 4),
    Color? backgroundColor,
    Color? textColor,
    SnackBarAction? action,
    DismissDirection dismissDirection = DismissDirection.down,
    EdgeInsets? margin,
    double? width,
    VoidCallback? onDismiss,
  }) =>
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(
            content: Text(message, style: TextStyle(color: textColor)),
            backgroundColor: backgroundColor ?? theme.snackBarTheme.backgroundColor,
            duration: duration,
            action: action,
            dismissDirection: dismissDirection,
            behavior: margin != null ? SnackBarBehavior.floating : null,
            margin: margin,
            width: width,
          ))
          .closed
          .then((_) {
        onDismiss?.call();
      });

  /// Floating toast-style notification
  static void toast({
    required String message,
    Duration duration = const Duration(seconds: 2),
    Color? backgroundColor,
    Color? textColor,
    double borderRadius = 20,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    EdgeInsets margin = const EdgeInsets.only(bottom: 30),
    VoidCallback? onDismiss,
  }) =>
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(
            content: Text(
              message,
              style: TextStyle(color: textColor ?? theme.colorScheme.onSurface),
              textAlign: TextAlign.center,
            ),
            backgroundColor: backgroundColor ?? theme.colorScheme.surface,
            elevation: 6,
            duration: duration,
            behavior: SnackBarBehavior.floating,
            margin: margin,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ))
          .closed
          .then((_) {
        onDismiss?.call();
      });

  /// Error notification
  static void error({
    required String message,
    Duration duration = const Duration(seconds: 4),
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) =>
      snackbar(
        message: message,
        backgroundColor: theme.colorScheme.error,
        textColor: theme.colorScheme.onError,
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

  /// Full-screen dialog
  static Future<T?> fullScreenDialog<T>(
    Widget page, {
    RouteTransitions transition = RouteTransitions.upToDown,
    VoidCallback? onDismiss,
  }) =>
      push<T>(
        page,
        fullscreenDialog: true,
        transition: transition,
      ).then((T? value) {
        onDismiss?.call();
        return value;
      });

  /// Overlay notification (non-intrusive)
  static OverlayEntry? _currentOverlay;

  static void showOverlay({
    required Widget child,
    Duration duration = const Duration(seconds: 3),
    Alignment alignment = Alignment.topCenter,
    EdgeInsets padding = const EdgeInsets.all(20),
    VoidCallback? onDismiss,
  }) {
    dismissOverlay();

    final OverlayEntry overlay = OverlayEntry(
      builder: (BuildContext context) => SafeArea(
        child: Padding(
          padding: padding,
          child: Align(
            alignment: alignment,
            child: Material(
              color: Colors.transparent,
              child: child,
            ),
          ),
        ),
      ),
    );

    _currentOverlay = overlay;
    Overlay.of(navigatorKey.currentContext!).insert(overlay);

    if (duration != Duration.zero) {
      Future<void>.delayed(duration, () {
        dismissOverlay();
        onDismiss?.call();
      });
    }
  }

  static void dismissOverlay() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }

  static Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) _getTransition(RouteTransitions transition) {
    switch (transition) {
      case RouteTransitions.fade:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return FadeTransition(opacity: animation, child: child);
        };
      case RouteTransitions.rightToLeft:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            )),
            child: child,
          );
        };
      case RouteTransitions.leftToRight:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        };
      case RouteTransitions.upToDown:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        };
      case RouteTransitions.downToUp:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        };
      case RouteTransitions.scale:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        };
      case RouteTransitions.rotate:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        };
      case RouteTransitions.size:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return SizeTransition(
            sizeFactor: animation,
            child: child,
          );
        };
    }
  }

  static bool _isCurrentRoute(Widget page) {
    final ModalRoute<dynamic>? currentRoute = ModalRoute.of(navigatorKey.currentContext!);
    return currentRoute?.settings.name == page.runtimeType.toString();
  }
}

enum RouteTransitions {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
}
