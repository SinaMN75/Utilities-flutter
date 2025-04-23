part of "../loader_overlay.dart";

///The inherited widget that guarantees the behavior of the overlay
class OverlayControllerWidget extends InheritedWidget {
  OverlayControllerWidget({
    super.key,
    required super.child,
  });

  static OverlayControllerWidget? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<OverlayControllerWidget>();

  final StreamController<Map<String, dynamic>> visibilityController =
      StreamController();

  Stream<Map<String, dynamic>> get visibilityStream =>
      visibilityController.stream;

  ///Set the visibility of the overlay
  void setOverlayVisible(
    bool loading, {
    Widget Function(dynamic progress)? widgetBuilder,
    dynamic progress,
    bool showOverlay = true,
  }) =>
      visibilityController.add(<String, dynamic>{
        cLoading: loading,
        cWidgetBuilder: widgetBuilder,
        cProgress: progress,
        cShowOverlay: showOverlay,
      });

  ///Dispose the controller
  void dispose() => visibilityController.close();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
