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

/// flutter_contacts: ^1.1.9+1
///
/// iOS: info.plist
///    <key>NSContactsUsageDescription</key>
///    <string>Reason we need access to the contact list</string>
///
/// Android: Manifest
///     <uses-permission android:name="android.permission.READ_CONTACTS"/>
///     <uses-permission android:name="android.permission.WRITE_CONTACTS"/>

// Future<List<Contact>> readContacts() async {
//   final bool hasPermission = await contact.FlutterContacts.requestPermission(readonly: true);
//   if (hasPermission)
//     return contact.FlutterContacts.getContacts(withAccounts: true, withGroups: true, withPhoto: true, withProperties: true, withThumbnail: true);
//   else
//     return <Contact>[];
// }
//
// Future<void> createContact({
//   required final String firstName,
//   required final String lastName,
//   required final String number,
// }) async {
//   final bool hasPermission = await contact.FlutterContacts.requestPermission();
//   if (hasPermission)
//     await contact.FlutterContacts.insertContact(
//       Contact(
//         displayName: firstName + " " + lastName,
//         phones: <contact.Phone>[contact.Phone(number)],
//         name: contact.Name(
//           first: firstName,
//           last: lastName,
//           nickname: firstName + " " + lastName,
//         ),
//       ),
//     );
//   return;
// }
