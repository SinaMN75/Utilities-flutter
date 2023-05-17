///https://pub.dev/packages/mobile_scanner
///
///iOS:
/// <key>NSCameraUsageDescription</key>
/// <string>This app needs camera access to scan QR codes</string>
/// <key>NSPhotoLibraryUsageDescription</key>
/// <string>This app needs photos access to get QR code from photo library</string>

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:utilities/utilities.dart';

Widget qrScanner({required final Function(String? value) onResponse}) => MobileScanner(
      onDetect: (final BarcodeCapture capture) {
        for (final Barcode barcode in capture.barcodes) onResponse(barcode.rawValue);
      },
    );

Widget qrcodeScannerPage({required final Function(String? value) onResponse}) => scaffold(
      appBar: AppBar(),
      body: qrScanner(onResponse: onResponse),
    );
