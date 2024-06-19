/// mobile_scanner: ^5.1.1
///https://pub.dev/packages/mobile_scanner
///
///iOS:
/// <key>NSCameraUsageDescription</key>
/// <string>This app needs camera access to scan QR codes</string>
/// <key>NSPhotoLibraryUsageDescription</key>
/// <string>This app needs photos access to get QR code from photo library</string>

// Widget qrScanner({
//   required final Function(String? value) onResponse,
//   final MobileScannerController? controller,
// }) =>
//     MobileScanner(
//       controller: controller,
//       onDetect: (final BarcodeCapture capture) {
//         for (final Barcode barcode in capture.barcodes) onResponse(barcode.rawValue);
//       },
//     );
//
// Widget qrcodeScannerPage({required final Function(String? value) onResponse}) => scaffold(
//       appBar: AppBar(),
//       body: qrScanner(onResponse: onResponse),
//     );

/// syncfusion_flutter_sliders: ^25.2.6
///
///

// Widget numericRangeSlider({
//   required final double min,
//   required final double max,
//   required final Function(int min, int max) onChanged,
// }) {
//   final Rx<SfRangeValues> _values = SfRangeValues(min, max).obs;
//   return SfRangeSlider(
//       showLabels: true,
//       interval: 20,
//       max: 100.0,
//       stepSize: 20,
//       showTicks: true,
//       enableIntervalSelection: true,
//       values: _values.value,
//       onChanged: (final SfRangeValues values) {
//         _values(values);
//         onChanged(values.start, values.end);
//       },
//       enableTooltip: true);
// }