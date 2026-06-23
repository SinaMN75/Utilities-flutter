import "package:u/utilities.dart";

mixin UControllerMixin {
  void okCallback(String? message, void Function() reload) {
    UToast.snackBar(message: message ?? U.s.submitted);
    reload();
  }

  void errorCallBack(String? message, void Function() reload) {
    UToast.error(message: message ?? "");
    reload();
  }
}
