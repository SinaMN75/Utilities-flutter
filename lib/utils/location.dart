part of 'utils.dart';

// Future<LocationData?> getLocation() async => (await checkAndGetLocationPermission() ?? false) ? Location().getLocation() : null;
//
// Future<bool?> checkAndGetLocationPermission() async {
//   final Location location = Location();
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//   _serviceEnabled = await location.serviceEnabled();
//   if (!_serviceEnabled) {
//     _serviceEnabled = await location.requestService();
//     if (!_serviceEnabled) return false;
//   }
//   _permissionGranted = await location.hasPermission();
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) return false;
//   }
//   return true;
// }
