import 'dart:ui' as ui;

import 'package:u/utilities.dart';

class SignaturePad extends StatelessWidget {
  SignaturePad({
    super.key,
    required this.onSave,
    this.saveButtonText = "Save",
    this.clearButtonText = "Clear",
  });

  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  final Function(FileData) onSave;
  final String saveButtonText;
  final String clearButtonText;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: SfSignaturePad(
              key: signatureGlobalKey,
              backgroundColor: Colors.white,
              strokeColor: Colors.black,
              minimumStrokeWidth: 1,
              maximumStrokeWidth: 4,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(onPressed: handleSaveButtonPressed, child: Text(saveButtonText)),
              TextButton(onPressed: () => signatureGlobalKey.currentState!.clear(), child: Text(clearButtonText)),
            ],
          )
        ],
      );

  void handleSaveButtonPressed() async {
    final ui.Image data = await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final ByteData? bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List byte = bytes!.buffer.asUint8List();
    File file = await UFile.writeToFile(byte);
    onSave(FileData(path: file.path, bytes: byte, extension: "png"));
  }
}
