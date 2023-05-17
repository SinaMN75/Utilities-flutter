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
