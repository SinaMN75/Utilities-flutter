part of 'components.dart';

Widget map({
  required final MapController controller,
  final LatLng center = const LatLng(35, 55),
  final double zoom = 10,
  final double minZoom = 5,
  final double maxZoom = 30,
  final List<Marker>? markers,
  final Widget? centerWidget,
  final Function(TapPosition tapPosition, LatLng point)? onTap,
  final Function(TapPosition tapPosition, LatLng point)? onLongPress,
  final Function(MapPosition position, bool hasGesture)? onPositionChanged,
}) =>
    FlutterMap(
      mapController: controller,
      options: MapOptions(
        center: center,
        zoom: zoom,
        onTap: onTap,
        maxZoom: maxZoom,
        minZoom: minZoom,
        onLongPress: onLongPress,
        enableMultiFingerGestureRace: true,
        onPositionChanged: onPositionChanged,
      ),
      nonRotatedChildren: <Widget>[
        if (centerWidget != null) Align(child: centerWidget),
      ],
      children: <Widget>[
        TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
        MarkerLayer(markers: markers ?? <Marker>[]),
      ],
    );

Widget sfMap({
  final MapTileLayerController? controller,
  final MapZoomPanBehavior? zoomPanBehavior,
  final List<MapMarker>? markers,
}) {
  final List<MapMarker> _markers = markers ?? <MapMarker>[];
  final MapZoomPanBehavior _zoomPanBehavior = zoomPanBehavior ??
      MapZoomPanBehavior(
        minZoomLevel: 5,
        maxZoomLevel: 22,
        focalLatLng: const MapLatLng(35, 55),
        enableDoubleTapZooming: true,
        enableMouseWheelZooming: true,
      );
  return SfMaps(
    layers: <MapTileLayer>[
      MapTileLayer(
        controller: controller,
        initialZoomLevel: 10,
        initialMarkersCount: _markers.length,
        tooltipSettings: const MapTooltipSettings(color: Colors.white),
        markerBuilder: (final BuildContext context, final int index) {
          final MapMarker i = _markers[index];
          return MapMarker(
            latitude: i.latitude,
            longitude: i.longitude,
            size: i.size,
            child: i.child,
          );
        },
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        zoomPanBehavior: _zoomPanBehavior,
      ),
    ],
  );
}

