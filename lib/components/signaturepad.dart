import "dart:ui" as ui;

import "package:u/utilities.dart"; // Assuming this contains UFile and FileData

// Enhanced SignaturePad: Added customization for stroke widths, colors, background,
// border, padding, button styles, and error handling. Optimized for performance and flexibility.
class SignaturePad extends StatelessWidget {
  SignaturePad({
    required this.onSave,
    super.key,
    this.saveButtonText = "Save",
    this.clearButtonText = "Clear",
    this.backgroundColor = Colors.white,
    this.strokeColor = Colors.black,
    this.minStrokeWidth = 1.0,
    this.maxStrokeWidth = 4.0,
    this.border = const Border.fromBorderSide(BorderSide(color: Colors.grey)),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.margin = const EdgeInsets.all(10),
    this.padding = const EdgeInsets.all(8),
    this.buttonStyle,
    this.saveButtonIcon,
    this.clearButtonIcon,
    this.spacing = 10.0,
    this.alignment = MainAxisAlignment.center,
    this.errorTextStyle,
    this.onError,
    this.pixelRatio = 3.0,
    this.constraints,
  });

  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  final Function(FileData) onSave;
  final String saveButtonText;
  final String clearButtonText;
  final Color backgroundColor;
  final Color strokeColor;
  final double minStrokeWidth;
  final double maxStrokeWidth;
  final Border? border;
  final BorderRadius borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final ButtonStyle? buttonStyle;
  final Widget? saveButtonIcon;
  final Widget? clearButtonIcon;
  final double spacing;
  final MainAxisAlignment alignment;
  final TextStyle? errorTextStyle;
  final Function(String)? onError;
  final double pixelRatio;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: alignment,
        children: <Widget>[
          UContainer(
            margin: margin,
            padding: padding,
            border: border,
            borderRadius: borderRadius,
            constraints: constraints,
            child: SfSignaturePad(
              key: signatureGlobalKey,
              backgroundColor: backgroundColor,
              strokeColor: strokeColor,
              minimumStrokeWidth: minStrokeWidth,
              maximumStrokeWidth: maxStrokeWidth,
            ),
          ),
          SizedBox(height: spacing),
          USpacedRow(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: spacing,
            children: <Widget>[
              OutlinedButton.icon(
                onPressed: () => handleSaveButtonPressed(context),
                icon: saveButtonIcon ?? const SizedBox.shrink(),
                label: Text(saveButtonText),
                style: buttonStyle,
              ),
              OutlinedButton.icon(
                onPressed: () => signatureGlobalKey.currentState!.clear(),
                icon: clearButtonIcon ?? const SizedBox.shrink(),
                label: Text(clearButtonText),
                style: buttonStyle,
              ),
            ],
          ),
        ],
      );

  Future<void> handleSaveButtonPressed(BuildContext context) async {
    try {
      final ui.Image data = await signatureGlobalKey.currentState!.toImage(pixelRatio: pixelRatio);
      final ByteData? bytes = await data.toByteData(format: ui.ImageByteFormat.png);
      if (bytes == null) {
        onError?.call("Failed to convert signature to bytes.");
        return;
      }
      final Uint8List byte = bytes.buffer.asUint8List();
      final File file = await UFile.writeToFile(byte);
      onSave(FileData(path: file.path, bytes: byte, extension: "png"));
    } catch (e) {
      onError?.call("Error saving signature: $e");
      if (context.mounted) {
        UNavigator.snackbar(message: "Error saving signature");
      }
    }
  }
}
