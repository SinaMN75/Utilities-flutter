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
  final List<UtilitiesMapMarker>? markers,
}) {
  final List<UtilitiesMapMarker> _markers = markers ?? <UtilitiesMapMarker>[];
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
        markerTooltipBuilder: (final BuildContext context, final int index) {
          final UtilitiesMapMarker i = _markers[index];
          return i.tooltip ?? Text(i.title ?? "");
        },
        markerBuilder: (final BuildContext context, final int index) {
          final UtilitiesMapMarker i = _markers[index];
          return MapMarker(
            latitude: i.latitude,
            longitude: i.longitude,
            size: Size(i.width, i.height),
            child: i.marker,
          );
        },
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        zoomPanBehavior: _zoomPanBehavior,
      ),
    ],
  );
}

class UtilitiesMapMarker {
  UtilitiesMapMarker({
    required this.latitude,
    required this.longitude,
    required this.marker,
    this.tooltip,
    this.width = 20,
    this.height = 20,
    this.imageUrl,
    this.title,
    this.subtitle,
    this.description,
  });

  final double latitude;
  final double longitude;
  final double width;
  final double height;
  final Widget marker;
  final Widget? tooltip;
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? description;
}
