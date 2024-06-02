part of 'components.dart';

Widget map({
  required final MapController controller,
  final LatLng center = const LatLng(35, 55),
  final double zoom = 10,
  final double minZoom = 5,
  final double maxZoom = 18,
  final List<Marker>? markers,
  final Widget? centerWidget,
  final bool currentLocationButton = true,
  final bool zoomButtons = true,
  final Function(TapPosition tapPosition, LatLng point)? onTap,
  final Function(TapPosition tapPosition, LatLng point)? onLongPress,
  final Function(MapCamera position, bool hasGesture)? onPositionChanged,
  final Function(PointerUpEvent event, LatLng point)? onPointerUp,
}) =>
    Stack(
      children: <Widget>[
        FlutterMap(
          mapController: controller,
          options: MapOptions(
            initialCenter: center,
            initialZoom: zoom,
            onTap: onTap,
            maxZoom: maxZoom,
            minZoom: minZoom,
            onLongPress: onLongPress,
            onPositionChanged: onPositionChanged,
            onPointerUp: onPointerUp,
          ),
          children: <Widget>[
            TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
            MarkerLayer(markers: markers ?? <Marker>[]),
          ],
        ),
        if (currentLocationButton)
          FloatingActionButton(
            mini: true,
            onPressed: () async {
              try {
                // final LocationData? location = await getLocation();
                // controller.move(LatLng(location!.latitude!, location.longitude!), 15);
              } catch (e) {
                debugPrint("");
              }
            },
            child: const Icon(Icons.my_location),
          ).paddingAll(16).alignAtBottomLeft(),
        if (zoomButtons)
          iconTextVertical(
            leading: FloatingActionButton(
              mini: true,
              child: const Icon(Icons.add),
              onPressed: () => controller.move(controller.camera.center, controller.camera.zoom + 1),
            ),
            trailing: FloatingActionButton(
              mini: true,
              child: const Icon(Icons.remove),
              onPressed: () => controller.move(controller.camera.center, controller.camera.zoom - 1),
            ),
          ).paddingAll(16).alignAtBottomRight(),
        if (centerWidget != null) Align(child: centerWidget),
      ],
    );
