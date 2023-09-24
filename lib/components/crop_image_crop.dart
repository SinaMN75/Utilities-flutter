import 'package:image_picker/image_picker.dart';
import 'package:utilities/utilities.dart';

Widget customImageCropper({
  required Function(List<CroppedFile> cropFiles) result,
}) {
  RxList<CroppedFile> cropperFiles = <CroppedFile>[].obs;
  Widget _items({required CroppedFile param, required int index}) => Stack(
        children: [
          Image.network(param.path, width: 128),
          Icon(
            Icons.close_outlined,
            size: 32,
            color: Colors.white,
          ).container(width: 32, height: 32, backgroundColor: Colors.red, radius: 50).alignAtCenter().onTap(() {
            cropperFiles.removeAt(index);
            result(cropperFiles);
          }),
        ],
      ).marginSymmetric(horizontal: 4);

  return SizedBox(
    height: 250,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Obx(() => Row(children: cropperFiles.mapIndexed((index, item) => _items(param: cropperFiles[index], index: index)).toList())),
          SizedBox(width: 8),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(50)),
            child: Center(child: Icon(Icons.add, size: 44, color: Colors.white)),
          ).onTap(() {
            cropImageCrop(
              result: (cropped) {
                cropperFiles.add(cropped);
                result(cropperFiles);
              },
            );
          }),
        ],
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
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: blobUrl,
      aspectRatio: const CropAspectRatio(ratioX: 9, ratioY: 16),
      uiSettings: [
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.dialog,
          translations: webTranslations,
          boundary: CroppieBoundary(width: boundaryWidth, height: boundaryHeight),
          viewPort: CroppieViewPort(width: boundaryWidth, height: boundaryHeight),
          enforceBoundary: true,
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
      ],
    );
    if (croppedFile != null) {
      result(croppedFile);
    }
  }
}
