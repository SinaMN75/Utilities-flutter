import 'package:u/utilities.dart';

class UMap extends StatefulWidget {
  const UMap({
    required this.controller,
    super.key,
    this.center = const LatLng(35, 55),
    this.zoom = 10,
    this.minZoom = 5,
    this.maxZoom = 18,
    this.markers,
    this.centerWidget,
    this.zoomButtons = true,
    this.currentLocationLayer = true,
    this.myLocationButton = true,
    this.initOnUserLocation = true,
    this.onTap,
    this.onLongPress,
    this.onPositionChanged,
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
  final bool myLocationButton;
  final bool initOnUserLocation;
  final Function(TapPosition tapPosition, LatLng point)? onTap;
  final Function(TapPosition tapPosition, LatLng point)? onLongPress;
  final Function(MapCamera position, bool hasGesture)? onPositionChanged;
  final Function(PointerUpEvent event, LatLng point)? onPointerUp;

  @override
  State<UMap> createState() => _UMapState();
}

class _UMapState extends State<UMap> {
  @override
  void initState() {
    if (widget.initOnUserLocation) {
      ULocation.getUserLocation(
        onUserLocationFound: (final dynamic location) {
          widget.controller.move(LatLng(location.latitude, location.longitude), widget.controller.camera.zoom);
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Stack(
        children: <Widget>[
          FlutterMap(
            mapController: widget.controller,
            options: MapOptions(
              initialCenter: widget.center,
              initialZoom: widget.zoom,
              onTap: widget.onTap,
              maxZoom: widget.maxZoom,
              minZoom: widget.minZoom,
              onLongPress: widget.onLongPress,
              onPositionChanged: widget.onPositionChanged,
              onPointerUp: widget.onPointerUp,
            ),
            children: <Widget>[
              TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
              MarkerLayer(markers: widget.markers ?? <Marker>[]),
              if (widget.currentLocationLayer)
                CurrentLocationLayer(
                  alignDirectionOnUpdate: AlignOnUpdate.always,
                  style: const LocationMarkerStyle(
                    markerSize: Size(16, 16),
                    markerDirection: MarkerDirection.heading,
                  ),
                ),
            ],
          ),
          if (widget.myLocationButton)
            FloatingActionButton(
              heroTag: "UMapFab1",
              mini: true,
              onPressed: () async => ULocation.getUserLocation(
                onUserLocationFound: (final dynamic location) {
                  widget.controller.move(LatLng(location.latitude, location.longitude), widget.controller.camera.zoom);
                },
              ),
              child: const Icon(Icons.my_location),
            ).pAll(16).alignAtBottomLeft(),
          if (widget.zoomButtons)
            UIconTextVertical(
              leading: FloatingActionButton(
                heroTag: "UMapFab2",
                mini: true,
                child: const Icon(Icons.add),
                onPressed: () => widget.controller.move(
                  widget.controller.camera.center,
                  widget.controller.camera.zoom + 1,
                ),
              ),
              trailing: FloatingActionButton(
                heroTag: "UMapFab3",
                mini: true,
                child: const Icon(Icons.remove),
                onPressed: () => widget.controller.move(
                  widget.controller.camera.center,
                  widget.controller.camera.zoom - 1,
                ),
              ),
            ).pAll(16).alignAtBottomRight(),
          if (widget.centerWidget != null) Align(child: widget.centerWidget),
        ],
      );
}
