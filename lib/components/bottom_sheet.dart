import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utils/get.dart';

class CancelAction {
  final String title;

  final VoidCallback? onPressed;

  final TextStyle? textStyle;

  CancelAction({required final this.title, final this.onPressed, final this.textStyle});
}

class BottomSheetAction {
  final String title;

  final VoidCallback onPressed;

  final TextStyle? textStyle;

  BottomSheetAction({required final this.title, required final this.onPressed, final this.textStyle});
}

Future<T?> showAdaptiveActionSheet<T>({
  required final BuildContext context,
  required final List<BottomSheetAction> actions,
  final Widget? title,
  final CancelAction? cancelAction,
  final Color? barrierColor,
  final Color? bottomSheetColor,
}) async {
  assert(barrierColor != Colors.transparent, 'The barrier color cannot be transparent.');

  return _show<T>(context, title, actions, cancelAction, barrierColor, bottomSheetColor);
}

Future<T?> _show<T>(
  final BuildContext context,
  final Widget? title,
  final List<BottomSheetAction> actions,
  final CancelAction? cancelAction,
  final Color? barrierColor,
  final Color? bottomSheetColor,
) {
  if (isIos)
    return _showCupertinoBottomSheet(
      context,
      title,
      actions,
      cancelAction,
    );
  else
    return _showMaterialBottomSheet(
      context,
      title,
      actions,
      cancelAction,
      barrierColor,
      bottomSheetColor,
    );
}

Future<T?> _showCupertinoBottomSheet<T>(
  final BuildContext context,
  final Widget? title,
  final List<BottomSheetAction> actions,
  final CancelAction? cancelAction,
) =>
    showCupertinoModalPopup(
        context: context,
        builder: (final BuildContext context) => CupertinoActionSheet(
              title: title,
              actions: actions
                  .map((final BottomSheetAction action) => CupertinoActionSheetAction(
                      onPressed: action.onPressed,
                      child: Text(
                        action.title,
                        style: action.textStyle ?? theme.textTheme.headline6,
                      )))
                  .toList(),
              cancelButton: cancelAction != null
                  ? CupertinoActionSheetAction(
                      onPressed: cancelAction.onPressed ?? () => Navigator.of(context).pop(),
                      child: Text(
                        cancelAction.title,
                        style: cancelAction.textStyle ?? theme.textTheme.headline6!.copyWith(color: Colors.lightBlue),
                      ))
                  : null,
            ));


Future<T?> _showMaterialBottomSheet<T>(
  final BuildContext context,
  final Widget? title,
  final List<BottomSheetAction> actions,
  final CancelAction? cancelAction,
  final Color? barrierColor,
  final Color? bottomSheetColor,
) =>
    showModalBottomSheet<T>(
        context: context,
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: bottomSheetColor ?? theme.bottomSheetTheme.modalBackgroundColor ?? theme.bottomSheetTheme.backgroundColor,
        barrierColor: barrierColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        builder: (final BuildContext context) {
          final double screenHeight = MediaQuery.of(context).size.height;
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: screenHeight - (screenHeight / 10)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (title != null) ...<Widget>[Padding(padding: const EdgeInsets.all(16), child: Center(child: title))],
                  ...actions
                      .map<Widget>(
                        (final BottomSheetAction action) => InkWell(
                          onTap: action.onPressed,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              action.title,
                              style: action.textStyle ?? theme.textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  if (cancelAction != null)
                    InkWell(
                      onTap: cancelAction.onPressed ?? () => Navigator.of(context).pop(),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            cancelAction.title,
                            style: cancelAction.textStyle ?? theme.textTheme.headline6!.copyWith(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        });
