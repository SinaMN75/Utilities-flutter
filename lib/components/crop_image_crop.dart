import 'package:image_picker/image_picker.dart';
import 'package:utilities/utilities.dart';

Widget customImageCropper({
  required Function(List<CroppedFile> cropFiles) result,
  double? aspect,
  int? compressQuality,
  int? boundaryWidth,
  int? boundaryHeight,
  double? imageWidth,
}) {
  RxList<CroppedFile> cropperFiles = <CroppedFile>[].obs;
  Widget _items({required CroppedFile param, required int index}) => Stack(
        children: [
          Image.network(
            param.path,
            width: imageWidth ?? 128,
          ),
          const Icon(
            Icons.close_fullscreen,
            size: 32,
          ).onTap(() {
            cropperFiles.removeAt(index);
            result(cropperFiles);
          }),
        ],
      ).marginSymmetric(horizontal: 4);

  return StatefulBuilder(
    builder: (context, setState) => SizedBox(
      height: 250,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Obx(() => Row(
                  children: cropperFiles.mapIndexed((index, item) => _items(param: cropperFiles[index], index: index)).toList(),
                )),
            const Icon(Icons.add).onTap(() {
              cropImageCrop(
                compressQuality: compressQuality,
                boundaryWidth: boundaryWidth,
                boundaryHeight: boundaryHeight,
                result: (cropped) {
                  cropperFiles.add(cropped);

                  result(cropperFiles);
                },
              );
            }),
          ],
        ),
      ),
    ),
  );
}

Future<void> cropImageCrop({
  required Function(CroppedFile croppedFile) result,
  int? compressQuality,
  int? boundaryWidth,
  int? boundaryHeight,
  WebTranslations? webTranslations,
}) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    final blobUrl = pickedFile.path;
    debugPrint('picked blob: $blobUrl');

    WebUiSettings settings;
    settings = WebUiSettings(
      context: context,
      presentStyle: CropperPresentStyle.dialog,
      translations: webTranslations,
      boundary: CroppieBoundary(width: boundaryWidth, height: boundaryHeight),
      viewPort: CroppieViewPort(width: boundaryWidth, height: boundaryHeight),
      enforceBoundary: true,
      enableExif: true,
      enableZoom: true,
      showZoomer: true,
    );
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: blobUrl,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: compressQuality ?? 100,
      aspectRatio: const CropAspectRatio(ratioX: 9, ratioY: 16),
      uiSettings: [settings],
    );
    if (croppedFile != null) {
      result(croppedFile);
    }
  }
}
