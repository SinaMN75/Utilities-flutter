part of 'components.dart';

Widget customImageCropper({
  required final Function(List<(String, Uint8List)> cropFiles) result,
  final List<MediaReadDto>? images,
  final Function(MediaReadDto dto)? onMediaDelete,
  final CropAspectRatio? aspectRatio,
  final int maxImages = 5,
}) {
  final RxList<MediaReadDto> media = (images ?? <MediaReadDto>[]).obs;
  final RxList<(String, Uint8List)> cropperFiles = <(String, Uint8List)>[].obs;
  Widget _items({required final (String, Uint8List) file, required final int index}) => Stack(
    alignment: Alignment.bottomLeft,
    children: <Widget>[
      Image.network(file.$1, width: 128, height: 128),
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
              children: <Widget>[
                if (images != null)
                  ...media
                      .map(
                        (final MediaReadDto i) => Stack(
                      children: <Widget>[
                        image(i.url, width: 110, height: 110, fit: BoxFit.cover),
                        if (onMediaDelete != null)
                          Icon(Icons.close, color: context.theme.colorScheme.background)
                              .container(
                            backgroundColor: context.theme.colorScheme.error,
                            radius: 100,
                          )
                              .onTap(
                                () => alertDialog(
                              title: "حذف تصویر",
                              subtitle: "آیا از حذف تصویر اطمینان دارید؟",
                              action1: (
                              "بله",
                                  () {
                                media.remove(i);
                                onMediaDelete(i);
                                back();
                              }
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                      .toList(),
                ...cropperFiles
                    .mapIndexed(
                      (final int index, final (String, Uint8List) item) => _items(file: cropperFiles[index], index: index),
                )
                    .toList()
              ],
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
                  aspectRatio: aspectRatio,
                  result: (final (String, Uint8List) cropped) {
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
  required final Function((String, Uint8List) croppedFile) result,
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
      aspectRatio: aspectRatio ?? const CropAspectRatio(ratioX: 4, ratioY: 3),
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
      result((croppedFile.path, await croppedFile.readAsBytes()));
    }
  }
}
