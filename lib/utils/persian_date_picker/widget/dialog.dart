import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CDialog extends StatelessWidget {
  const CDialog({
    Key? key,
    this.maxWidth = 300.0,
    this.maxHeight = 300.0,
    this.backgroundColor,
    this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.shape,
    this.child,
  }) : super(key: key);

  final maxWidth;

  final maxHeight;

  final Color? backgroundColor;

  final double? elevation;

  final Duration insetAnimationDuration;

  final Curve insetAnimationCurve;

  final ShapeBorder? shape;

  final Widget? child;

  static const RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0)));
  static const double _defaultElevation = 24.0;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return AnimatedPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: Container(
            width: 320,
            child: Material(
              color: backgroundColor ?? dialogTheme.backgroundColor ?? Theme.of(context).dialogBackgroundColor,
              elevation: elevation ?? dialogTheme.elevation ?? _defaultElevation,
              shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
              type: MaterialType.card,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class CAlertDialog extends StatelessWidget {
  const CAlertDialog({
    Key? key,
    this.maxHeight,
    this.maxWidth,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.shape,
  }) : super(key: key);

  final double? maxWidth;
  final double? maxHeight;

  final Widget? title;

  final EdgeInsetsGeometry? titlePadding;

  final TextStyle? titleTextStyle;

  final Widget? content;

  final EdgeInsetsGeometry contentPadding;

  final TextStyle? contentTextStyle;

  final List<Widget>? actions;

  final Color? backgroundColor;

  final double? elevation;

  final String? semanticLabel;

  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final List<Widget> children = <Widget>[];
    String? label = semanticLabel;

    if (title != null) {
      children.add(Padding(
        padding: titlePadding ?? EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0),
        child: DefaultTextStyle(
          style: titleTextStyle ?? dialogTheme.titleTextStyle ?? theme.textTheme.headline1!,
          child: Semantics(
            child: title,
            namesRoute: true,
            container: true,
          ),
        ),
      ));
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          label = semanticLabel;
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          label = semanticLabel ?? MaterialLocalizations.of(context).alertDialogLabel;
          break;

        case TargetPlatform.linux:
        case TargetPlatform.windows:
        case TargetPlatform.macOS:
          throw PlatformException(code: "10", message: "not support");
      }
    }

    if (content != null) {
      children.add(Flexible(
        child: Padding(
          padding: contentPadding,
          child: DefaultTextStyle(
            style: contentTextStyle ?? dialogTheme.contentTextStyle ?? theme.textTheme.headline2!,
            child: content!,
          ),
        ),
      ));
    }

    if (actions != null) {
      children.add(
        ButtonBar(
          children: actions!,
        ),
      );
    }

    Widget dialogChild = Container(
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    if (label != null)
      dialogChild = Semantics(
        namesRoute: true,
        label: label,
        child: dialogChild,
      );

    return CDialog(
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      child: dialogChild,
    );
  }
}

class SimpleDialogOption extends StatelessWidget {
  const SimpleDialogOption({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  final VoidCallback? onPressed;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: child,
      ),
    );
  }
}

class SimpleDialog extends StatelessWidget {
  const SimpleDialog({
    Key? key,
    this.title,
    this.titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    this.children,
    this.contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.shape,
  }) : super(key: key);

  final Widget? title;

  final EdgeInsetsGeometry titlePadding;

  final List<Widget>? children;

  final EdgeInsetsGeometry contentPadding;

  final Color? backgroundColor;

  final double? elevation;

  final String? semanticLabel;

  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final List<Widget> body = <Widget>[];
    String? label = semanticLabel;

    if (title != null) {
      body.add(Padding(
        padding: titlePadding,
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline1!,
          child: Semantics(namesRoute: true, child: title),
        ),
      ));
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          label = semanticLabel;
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          label = semanticLabel ?? MaterialLocalizations.of(context).dialogLabel;
          break;
        case TargetPlatform.linux:
        case TargetPlatform.windows:
        case TargetPlatform.macOS:
          throw PlatformException(code: "10", message: "not support");
      }
    }

    if (children != null) {
      body.add(Flexible(
        child: SingleChildScrollView(
          padding: contentPadding,
          child: ListBody(children: children!),
        ),
      ));
    }

    Widget dialogChild = IntrinsicWidth(
      stepWidth: 56.0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 280.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: body,
        ),
      ),
    );

    if (label != null)
      dialogChild = Semantics(
        namesRoute: true,
        label: label,
        child: dialogChild,
      );
    return Dialog(
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      child: dialogChild,
    );
  }
}

Widget _buildMaterialDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

Future<T?> showCDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  @Deprecated('Instead of using the "child" argument, return the child from a closure '
      'provided to the "builder" argument. This will ensure that the BuildContext '
      'is appropriate for components built in the dialog.')
      Widget? child,
  WidgetBuilder? builder,
}) {
  assert(child == null || builder == null);
  assert(debugCheckHasMaterialLocalizations(context));

  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      final Widget pageChild = child ?? Builder(builder: builder!);
      return SafeArea(
        child: Builder(builder: (BuildContext context) => Theme(data: theme, child: pageChild)),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}
