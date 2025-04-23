import 'package:u/utilities.dart';

part 'src/global_loader_overlay.dart';
part 'src/loader_overlay.dart';
part 'src/overlay_controller_widget.dart';
part 'src/overlay_controller_widget_extension.dart';

class ULoading {
  static void show() => navigatorKey.currentContext!..loaderOverlay.show();
  static void dismiss() => navigatorKey.currentContext!..loaderOverlay.hide();
}