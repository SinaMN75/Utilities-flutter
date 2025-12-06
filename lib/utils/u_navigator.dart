import "package:u/utilities.dart";

abstract class UNavigator {
  static Future<T?> push<T>(
    Widget page, {
    bool fullscreenDialog = false,
    bool preventDuplicates = true,
    RouteTransitions transition = RouteTransitions.rightToLeft,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeOut,
    RouteSettings? settings,
  }) {
    if (preventDuplicates && ModalRoute.of(navigatorKey.currentContext!)?.settings.name == page.runtimeType.toString()) {
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

  static Future<void> offAll(
    Widget page, {
    RouteTransitions transition = RouteTransitions.fade,
    RouteSettings? settings,
    VoidCallback? onDismiss,
  }) async {
    await Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      PageRouteBuilder<dynamic>(
        pageBuilder: (BuildContext context, Animation<double> _, Animation<double> __) => page,
        transitionsBuilder: _getTransition(transition),
        settings: settings,
      ),
      (Route<dynamic> route) => false,
    ).then((_) => onDismiss?.call());
  }

  static void back<T>([T? result]) {
    if (Navigator.of(navigatorKey.currentContext!).canPop()) {
      Navigator.pop<T>(navigatorKey.currentContext!, result);
    }
  }

  static Future<T?> dialog<T>(
    Widget child, {
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    Color? barrierColor,
    RouteSettings? settings,
    VoidCallback? onDismiss,
  }) => UApp.isIos
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
        ).then((T? value) {
          onDismiss?.call();
          return value;
        });

  static Future<T?> dialogResponsive<T>({
    required Widget child,
    Widget? title,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    Color? barrierColor,
    RouteSettings? settings,
    VoidCallback? onDismiss,
    double initialChildSize = 0.5,
    double minChildSize = 0.25,
    double maxChildSize = 0.9,
    bool expand = false,
  }) {
    if (UApp.isMobileSize()) {
      return showModalBottomSheet<T>(
        context: navigatorKey.currentContext!,
        isScrollControlled: true,
        useRootNavigator: useRootNavigator,
        builder: (BuildContext context) => DraggableScrollableSheet(
          expand: expand,
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          builder: (BuildContext context, ScrollController controller) => UScaffold(
            appBar: AppBar(title: title),
            body: SingleChildScrollView(controller: controller, child: child),
          ),
        ),
      ).then((T? value) {
        onDismiss?.call();
        return value;
      });
    }
    return dialog(
      AlertDialog(title: title, content: child),
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      barrierColor: barrierColor,
      settings: settings,
      onDismiss: onDismiss,
    );
  }

  static void confirm({
    required String title,
    required String message,
    bool destructive = false,
    VoidCallback? onDismiss,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
  }) => dialog(
    AlertDialog.adaptive(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(onPressed: onCancel ?? back, child: Text(U.s.cancel)),
        TextButton(
          onPressed: onConfirm,
          style: destructive ? TextButton.styleFrom(foregroundColor: Theme.of(navigatorKey.currentContext!).colorScheme.error) : null,
          child: Text(U.s.ok),
        ),
      ],
    ),
    onDismiss: onDismiss,
  );

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
      backgroundColor: backgroundColor ?? Theme.of(navigatorKey.currentContext!).canvasColor,
      elevation: elevation,
      shape:
          shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      constraints: constraints,
      builder: (BuildContext context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(navigatorKey.currentContext!).viewInsets.bottom,
        ),
        child: child,
      ),
    );

    return sheetFuture.then((T? value) {
      onDismiss?.call();
      return value;
    });
  }

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

  static Future<T?> fullScreenDialog<T>(
    Widget page, {
    RouteTransitions transition = RouteTransitions.upToDown,
    VoidCallback? onDismiss,
  }) => push<T>(page, fullscreenDialog: true, transition: transition).then((T? value) {
    onDismiss?.call();
    return value;
  });

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

  static Future<String?> inputDialog({
    required String title,
    required String hint,
    Function(String)? onSubmit,
    VoidCallback? onCancel,
    String defaultValue = "",
  }) async {
    final TextEditingController controller = TextEditingController(text: defaultValue);
    final String? text = await showDialog<String>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog.adaptive(
        title: Text(title),
        content: Material(
          child: UTextField(
            hintText: hint,
            lines: 4,
            controller: controller,
            keyboardType: TextInputType.multiline,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          ),
        ),
        actions: <Widget>[
          TextButton(onPressed: onCancel ?? back, child: Text(U.s.cancel)),
          TextButton(
            onPressed: () => back(controller.text),
            child: Text(U.s.submit),
          ),
        ],
      ),
    );
    if (text != null && onSubmit != null) {
      onSubmit(text);
    }
    return text;
  }

  static void dismissOverlay() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }

  static Future<Color?> colorPicker({
    required Color defaultColor,
    final List<Color>? colors,
  }) async => UNavigator.dialog<Color>(
    AlertDialog(
      title: Text(U.s.selectAColor),
      content: SizedBox(
        width: 200,
        height: 100,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: (colors ?? <Color>[Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.orange, Colors.purple, Colors.pink, Colors.cyan, Colors.black, Colors.teal])
              .map(
                (Color color) => UContainer(
                  width: 40,
                  height: 40,
                  color: color,
                  radius: 100,
                  border: color == defaultColor ? Border.all(width: 3) : null,
                ).onTap(() => UNavigator.back(color)),
              )
              .toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(onPressed: UNavigator.back, child: Text(U.s.cancel)),
      ],
    ),
  );

  static Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) _getTransition(RouteTransitions transition) {
    switch (transition) {
      case RouteTransitions.fade:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => FadeTransition(
          opacity: animation,
          child: child,
        );
      case RouteTransitions.rightToLeft:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
          child: child,
        );
      case RouteTransitions.leftToRight:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(animation),
          child: child,
        );
      case RouteTransitions.upToDown:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(animation),
          child: child,
        );
      case RouteTransitions.downToUp:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(animation),
          child: child,
        );
      case RouteTransitions.scale:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => ScaleTransition(
          scale: animation,
          child: child,
        );
      case RouteTransitions.rotate:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => RotationTransition(
          turns: animation,
          child: child,
        );
      case RouteTransitions.size:
        return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => SizeTransition(
          sizeFactor: animation,
          child: child,
        );
    }
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
