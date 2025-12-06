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
  }) {
    final Future<T?> dialogFuture = UApp.isIos
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

  static Future<T?> responsiveDialog<T>(
    Widget child, {
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    Color? barrierColor,
    RouteSettings? settings,
    VoidCallback? onDismiss,

    // Responsive configuration
    bool responsive = true,
    double breakpoint = 600,
    DialogSizeMode smallScreenMode = DialogSizeMode.bottomSheet,
    DialogSizeMode largeScreenMode = DialogSizeMode.dialog,

    // BottomSheet customization
    bool isScrollControlled = true,
    double initialChildSize = 0.9,
    double minChildSize = 0.5,
    double maxChildSize = 0.95,
    bool showDragHandle = true,
    bool showCloseButton = true,
    Widget? headerBuilder,
    Widget? footerBuilder,
  }) {
    final BuildContext context = navigatorKey.currentContext!;

    // Check if we should use responsive behavior
    if (responsive) {
      final double screenWidth = MediaQuery.of(context).size.width;
      final bool isSmallScreen = screenWidth < breakpoint;
      final DialogSizeMode mode = isSmallScreen ? smallScreenMode : largeScreenMode;

      switch (mode) {
        case DialogSizeMode.bottomSheet:
          return _showResponsiveBottomSheet<T>(
            context: context,
            child: child,
            barrierDismissible: barrierDismissible,
            useRootNavigator: useRootNavigator,
            barrierColor: barrierColor,
            onDismiss: onDismiss,
            isScrollControlled: isScrollControlled,
            showDragHandle: showDragHandle,
            showCloseButton: showCloseButton,
            headerBuilder: headerBuilder,
            footerBuilder: footerBuilder,
          );

        case DialogSizeMode.draggableSheet:
          return draggableSheet<T>(
            _buildResponsiveDialogContent(
              context: context,
              child: child,
              showCloseButton: showCloseButton,
              headerBuilder: headerBuilder,
              footerBuilder: footerBuilder,
            ),
            initialChildSize: initialChildSize,
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            useRootNavigator: useRootNavigator,
            onDismiss: onDismiss,
          );

        case DialogSizeMode.fullScreen:
          return fullScreenDialog<T>(
            _buildFullScreenDialog(
              context: context,
              child: child,
              showCloseButton: showCloseButton,
            ),
            onDismiss: onDismiss,
          );

        case DialogSizeMode.dialog:
          break;
      }
    }

    // Use original dialog method
    return dialog<T>(
      child,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      barrierColor: barrierColor,
      settings: settings,
      onDismiss: onDismiss,
    );
  }

  // Helper method for responsive bottom sheet
  static Future<T?> _showResponsiveBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    required bool barrierDismissible,
    required bool useRootNavigator,
    required Color? barrierColor,
    required VoidCallback? onDismiss,
    required bool isScrollControlled,
    required bool showDragHandle,
    required bool showCloseButton,
    required Widget? headerBuilder,
    required Widget? footerBuilder,
  }) =>
      showModalBottomSheet<T>(
        context: context,
        isScrollControlled: isScrollControlled,
        useRootNavigator: useRootNavigator,
        backgroundColor: Colors.transparent,
        barrierColor: barrierColor ?? Colors.black54,
        isDismissible: barrierDismissible,
        builder: (BuildContext context) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (showDragHandle)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

              if (headerBuilder != null) headerBuilder,

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: child,
                ),
              ),

              if (footerBuilder != null) footerBuilder,
            ],
          ),
        ),
      ).then((T? value) {
        onDismiss?.call();
        return value;
      });

  // Helper method to build responsive dialog content
  static Widget _buildResponsiveDialogContent({
    required BuildContext context,
    required Widget child,
    required bool showCloseButton,
    required Widget? headerBuilder,
    required Widget? footerBuilder,
  }) {
    final List<Widget> children = <Widget>[];

    // Add header if provided
    if (headerBuilder != null) {
      children.add(headerBuilder);
    }

    // Add main content
    children.add(
      Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );

    // Add footer if provided
    if (footerBuilder != null) {
      children.add(footerBuilder);
    }

    return Column(
      children: children,
    );
  }

  // Helper method to build full screen dialog
  static Widget _buildFullScreenDialog({
    required BuildContext context,
    required Widget child,
    required bool showCloseButton,
  }) => Scaffold(
    appBar: AppBar(
      leading: showCloseButton
          ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            )
          : null,
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    ),
  );

  // Helper method to automatically convert AlertDialog to responsive
  static Future<T?> alertDialog<T>(
    Widget dialog, {
    bool responsive = true,
    double breakpoint = 600,
    DialogSizeMode smallScreenMode = DialogSizeMode.bottomSheet,
    DialogSizeMode largeScreenMode = DialogSizeMode.dialog,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    Color? barrierColor,
    VoidCallback? onDismiss,
  }) {
    if (dialog is AlertDialog) {
      return responsiveDialog<T>(
        _buildAlertDialogContent(dialog),
        responsive: responsive,
        breakpoint: breakpoint,
        smallScreenMode: smallScreenMode,
        largeScreenMode: largeScreenMode,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
        barrierColor: barrierColor,
        onDismiss: onDismiss,
        headerBuilder: dialog.title != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (dialog.title is Text)
                      Text(
                        (dialog.title! as Text).data ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const IconButton(
                      icon: Icon(Icons.close),
                      onPressed: UNavigator.back,
                    ),
                  ],
                ),
              )
            : null,
        footerBuilder: dialog.actions != null && dialog.actions!.isNotEmpty
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: const Border(
                    top: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: dialog.actions!,
                ),
              )
            : null,
      );
    }

    return responsiveDialog<T>(
      dialog,
      responsive: responsive,
      breakpoint: breakpoint,
      smallScreenMode: smallScreenMode,
      largeScreenMode: largeScreenMode,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      barrierColor: barrierColor,
      onDismiss: onDismiss,
    );
  }

  // Helper to extract content from AlertDialog
  static Widget _buildAlertDialogContent(AlertDialog dialog) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      if (dialog.content != null) dialog.content!,
    ],
  );
}

enum DialogSizeMode {
  dialog,
  bottomSheet,
  draggableSheet,
  fullScreen,
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
