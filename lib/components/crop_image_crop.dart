part of 'components.dart';


Widget customImageCropper({
  required final Function(List<CroppedFile> cropFiles) result,
  final int maxImages = 5,
}) {
  final RxList<CroppedFile> cropperFiles = <CroppedFile>[].obs;
  Widget _items({required final CroppedFile param, required final int index}) => Stack(
    alignment: Alignment.bottomLeft,
    children: <Widget>[
      imageFile(File(param.path), width: 128, height: 128),
      const Icon(
        Icons.close_outlined,
        size: 32,
        color: Colors.white,
      ).container(width: 32, height: 32, backgroundColor: Colors.red, radius: 50).onTap(() {
        cropperFiles.removeAt(index);
        result(cropperFiles);
      }),
    ],
  ).marginSymmetric(horizontal: 4);

  return SizedBox(
    height: 110,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
            () => Row(
          children: <Widget>[
            Row(
              children: cropperFiles.mapIndexed((final int index, final CroppedFile item) => _items(param: cropperFiles[index], index: index)).toList(),
            ),
            const SizedBox(width: 8),
            if (cropperFiles.length < maxImages)
              Icon(Icons.add, size: 60, color: context.theme.dividerColor)
                  .container(
                radius: 10,
                borderColor: context.theme.dividerColor,
                width: 100,
                height: 100,
              )
                  .onTap(
                    () => cropImageCrop(
                  aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
                  result: (final CroppedFile cropped) {
                    cropperFiles.add(cropped);
                    result(cropperFiles);
                  },
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

Widget customWebImageCropper({
  required final Function(List<CroppedFile> cropFiles) result,
  final int maxImages = 5,
}) {
  final RxList<CroppedFile> cropperFiles = <CroppedFile>[].obs;
  Widget _items({required final CroppedFile param, required final int index}) => Stack(
    alignment: Alignment.bottomLeft,
    children: <Widget>[
      Image.network(param.path, width: 128, height: 128),
      const Icon(
        Icons.close_outlined,
        size: 32,
        color: Colors.white,
      ).container(width: 32, height: 32, backgroundColor: Colors.red, radius: 50).onTap(() {
        cropperFiles.removeAt(index);
        result(cropperFiles);
      }),
    ],
  ).marginSymmetric(horizontal: 4);

  return SizedBox(
    height: 110,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
            () => Row(
          children: <Widget>[
            Row(
              children: cropperFiles.mapIndexed((final int index, final CroppedFile item) => _items(param: cropperFiles[index], index: index)).toList(),
            ),
            const SizedBox(width: 8),
            if (cropperFiles.length < maxImages)
              Icon(Icons.add, size: 60, color: context.theme.dividerColor)
                  .container(
                radius: 10,
                borderColor: context.theme.dividerColor,
                width: 100,
                height: 100,
              )
                  .onTap(
                    () => cropImageCrop(
                  result: (final CroppedFile cropped) {
                    cropperFiles.add(cropped);
                    result(cropperFiles);
                  },
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

Future<void> cropImageCrop({
  required final Function(CroppedFile croppedFile) result,
  final int? compressQuality,
  final int? boundaryWidth,
  final int? boundaryHeight,
  final CropAspectRatio? aspectRatio,
  final WebTranslations? webTranslations,
}) async {
  final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio:aspectRatio?? const CropAspectRatio(ratioX: 9, ratioY: 16),
      uiSettings: <PlatformUiSettings>[
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
