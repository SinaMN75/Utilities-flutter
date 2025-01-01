import 'package:u/utilities.dart';

class UBarcode extends StatefulWidget {
  const UBarcode(
    this.value, {
    this.type = UBarcodeQrCodeType.qrcode,
    this.color,
    this.backgroundColor,
    this.showValue = false,
    super.key,
  });

  final String value;
  final UBarcodeQrCodeType type;
  final Color? color;
  final Color? backgroundColor;
  final bool showValue;

  @override
  State<UBarcode> createState() => _UBarcodeState();
}

class _UBarcodeState extends State<UBarcode> {
  Symbology symbology = QRCode();

  @override
  void initState() {
    if (widget.type == UBarcodeQrCodeType.qrcode) symbology = QRCode(errorCorrectionLevel: ErrorCorrectionLevel.low);
    if (widget.type == UBarcodeQrCodeType.dataMatrix) symbology = DataMatrix();
    if (widget.type == UBarcodeQrCodeType.code128) symbology = Code128();
    if (widget.type == UBarcodeQrCodeType.code128A) symbology = Code128A();
    if (widget.type == UBarcodeQrCodeType.code128B) symbology = Code128B();
    if (widget.type == UBarcodeQrCodeType.code128C) symbology = Code128C();
    if (widget.type == UBarcodeQrCodeType.code39) symbology = Code39();
    if (widget.type == UBarcodeQrCodeType.code39Extended) symbology = Code39Extended();
    if (widget.type == UBarcodeQrCodeType.code93) symbology = Code93();
    if (widget.type == UBarcodeQrCodeType.ean8) symbology = EAN8();
    if (widget.type == UBarcodeQrCodeType.ean13) symbology = EAN13();
    if (widget.type == UBarcodeQrCodeType.upca) symbology = UPCA();
    if (widget.type == UBarcodeQrCodeType.upce) symbology = UPCE();

    super.initState();
  }

  @override
  Widget build(final BuildContext context) => SfBarcodeGenerator(
        value: widget.value,
        symbology: symbology,
        barColor: widget.color,
        backgroundColor: widget.backgroundColor,
        showValue: widget.showValue,
      );
}

enum UBarcodeQrCodeType {
  qrcode,
  dataMatrix,
  code128,
  code128A,
  code128B,
  code128C,
  code39,
  code39Extended,
  code93,
  ean8,
  ean13,
  upca,
  upce,
}
