part of 'components.dart';

enum BarcodeQrCodeType { qrcode, dataMatrix, code128, code128A, code128B, code128C, code39, code39Extended, code93, ean8, ean13, upca, upce }

Widget barcode(
  final String value, {
  final BarcodeQrCodeType type = BarcodeQrCodeType.qrcode,
  final Color? color,
  final Color? backgroundColor,
  final bool showValue = false,
}) {
  Symbology symbology = QRCode();
  if (type == BarcodeQrCodeType.qrcode) symbology = QRCode();
  if (type == BarcodeQrCodeType.dataMatrix) symbology = DataMatrix();
  if (type == BarcodeQrCodeType.code128) symbology = Code128();
  if (type == BarcodeQrCodeType.code128A) symbology = Code128A();
  if (type == BarcodeQrCodeType.code128B) symbology = Code128B();
  if (type == BarcodeQrCodeType.code128C) symbology = Code128C();
  if (type == BarcodeQrCodeType.code39) symbology = Code39();
  if (type == BarcodeQrCodeType.code39Extended) symbology = Code39Extended();
  if (type == BarcodeQrCodeType.code93) symbology = Code93();
  if (type == BarcodeQrCodeType.ean8) symbology = EAN8();
  if (type == BarcodeQrCodeType.ean13) symbology = EAN13();
  if (type == BarcodeQrCodeType.upca) symbology = UPCA();
  if (type == BarcodeQrCodeType.upce) symbology = UPCE();
  return SfBarcodeGenerator(
    value: value,
    symbology: symbology,
    barColor: color,
    backgroundColor: backgroundColor,
    showValue: showValue,
  );
}
