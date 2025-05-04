import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The ultimate navigation utility with every feature imaginable (no packages)
abstract class UNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static ThemeData get theme => Theme.of(context);

  static MediaQueryData get mediaQuery => MediaQuery.of(context);

  static bool get canPop => Navigator.of(context).canPop();

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
      context,
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
  }) =>
      Navigator.pushReplacement<T, dynamic>(
        context,
        PageRouteBuilder<T>(
          pageBuilder: (BuildContext context, Animation<double> _, Animation<double> __) => page,
          transitionsBuilder: _getTransition(transition),
          settings: settings,
        ),
      );

  /// Clear all routes and start fresh
  static void offAll(
    Widget page, {
    RouteTransitions transition = RouteTransitions.fade,
    RouteSettings? settings,
  }) =>
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder<dynamic>(
          pageBuilder: (BuildContext context, Animation<double> _, Animation<double> __) => page,
          transitionsBuilder: _getTransition(transition),
          settings: settings,
        ),
        (Route<dynamic> route) => false,
      );

  /// Pop with optional result
  static void back<T>([T? result]) {
    if (canPop) {
      Navigator.pop<T>(context, result);
    }
  }

  /// Adaptive dialog (Material/Cupertino)
  static Future<T?> dialog<T>({
    required Widget child,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    Color? barrierColor,
    RouteSettings? settings,
    VoidCallback? onDismiss,
  }) {
    final Future<T?> dialogFuture = isIOS
        ? showCupertinoDialog<T>(
            context: context,
            barrierDismissible: barrierDismissible,
            useRootNavigator: useRootNavigator,
            builder: (BuildContext context) => child,
          )
        : showDialog<T>(
            context: context,
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
  static Future<bool> confirm({
    required String title,
    required String message,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool destructive = false,
    VoidCallback? onDismiss,
  }) async {
    final bool? result = await dialog<bool>(
      child: AlertDialog.adaptive(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => back(false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => back(true),
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
    return result ?? false;
  }

  //===============================
  // Bottom Sheets (with onDismiss)
  //===============================

  /// Adaptive bottom sheet
  static Future<T?> bottomSheet<T>({
    required Widget child,
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
      context: context,
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
  static Future<T?> draggableSheet<T>({
    required Widget child,
    double initialChildSize = 0.5,
    double minChildSize = 0.25,
    double maxChildSize = 0.9,
    bool expand = false,
    bool useRootNavigator = true,
    VoidCallback? onDismiss,
  }) {
    final Future<T?> sheetFuture = showModalBottomSheet<T>(
      context: context,
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
    );

    return sheetFuture.then((T? value) {
      onDismiss?.call();
      return value;
    });
  }

  //===============================
  // Notifications (Snackbars & Toasts)
  //===============================

  /// Standard snackbar with onDismiss
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
  }) {
    final SnackBar snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor ?? theme.snackBarTheme.backgroundColor,
      duration: duration,
      action: action,
      dismissDirection: dismissDirection,
      behavior: margin != null ? SnackBarBehavior.floating : null,
      margin: margin,
      width: width,
    );

    scaffoldKey.currentState?.showSnackBar(snackBar).closed.then((_) {
      onDismiss?.call();
    });
  }

  /// Floating toast-style notification with onDismiss
  static void toast({
    required String message,
    Duration duration = const Duration(seconds: 2),
    Color? backgroundColor,
    Color? textColor,
    double borderRadius = 20,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    EdgeInsets margin = const EdgeInsets.only(bottom: 30),
    VoidCallback? onDismiss,
  }) {
    final SnackBar snackBar = SnackBar(
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
    );

    scaffoldKey.currentState?.showSnackBar(snackBar).closed.then((_) {
      onDismiss?.call();
    });
  }

  //===============================
  // Advanced Features
  //===============================

  /// Full-screen dialog with onDismiss
  static Future<T?> fullScreenDialog<T>(Widget page, {VoidCallback? onDismiss}) {
    return push<T>(
      page,
      fullscreenDialog: true,
      transition: RouteTransitions.upToDown,
    ).then((T? value) {
      onDismiss?.call();
      return value;
    });
  }

  /// Overlay notification (non-intrusive)
  static OverlayEntry? _currentOverlay;

  static void showOverlay({
    required Widget child,
    Duration duration = const Duration(seconds: 3),
    Alignment alignment = Alignment.topCenter,
    EdgeInsets padding = const EdgeInsets.all(20),
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
    Overlay.of(context).insert(overlay);

    if (duration != Duration.zero) {
      Future<void>.delayed(duration, dismissOverlay);
    }
  }

  static void dismissOverlay() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }

  //===============================
  // Helpers & Utilities
  //===============================

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
    final ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
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
