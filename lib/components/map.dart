part of 'components.dart';

class UMap extends StatelessWidget {
  const UMap({
    super.key,
    required this.controller,
    this.center = const LatLng(35, 55),
    this.zoom = 10,
    this.minZoom = 5,
    this.maxZoom = 18,
    this.markers,
    this.centerWidget,
    this.zoomButtons = true,
    this.currentLocationLayer = true,
    this.onTap,
    this.onLongPress,
    this.onPositionChanged,
    this.onMyLocationTap,
    this.onPointerUp,
  });

  final MapController controller;
  final LatLng center;
  final double zoom;
  final double minZoom;
  final double maxZoom;
  final List<Marker>? markers;
  final Widget? centerWidget;
  final bool zoomButtons;
  final bool currentLocationLayer;
  final Function(TapPosition tapPosition, LatLng point)? onTap;
  final Function(TapPosition tapPosition, LatLng point)? onMyLocationTap;
  final Function(TapPosition tapPosition, LatLng point)? onLongPress;
  final Function(MapCamera position, bool hasGesture)? onPositionChanged;
  final Function(PointerUpEvent event, LatLng point)? onPointerUp;

  @override
  Widget build(BuildContext context) => Stack(
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
              if (currentLocationLayer)
                CurrentLocationLayer(
                  alignDirectionOnUpdate: AlignOnUpdate.always,
                  style: const LocationMarkerStyle(
                    markerSize: Size(16, 16),
                    markerDirection: MarkerDirection.heading,
                  ),
                ),
            ],
          ),
          if (onMyLocationTap != null)
            FloatingActionButton(
              mini: true,
              onPressed: () async => onMyLocationTap,
              child: const Icon(Icons.my_location),
            ).paddingAll(16).alignAtBottomLeft(),
          if (zoomButtons)
            iconTextVertical(
              leading: FloatingActionButton(
                mini: true,
                child: const Icon(Icons.add),
                onPressed: () => controller.move(
                  controller.camera.center,
                  controller.camera.zoom + 1,
                ),
              ),
              trailing: FloatingActionButton(
                mini: true,
                child: const Icon(Icons.remove),
                onPressed: () => controller.move(
                  controller.camera.center,
                  controller.camera.zoom - 1,
                ),
              ),
            ).paddingAll(16).alignAtBottomRight(),
          if (centerWidget != null) Align(child: centerWidget),
        ],
      );
}
