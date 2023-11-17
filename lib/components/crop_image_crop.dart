part of 'components.dart';

Widget customImageCropper({
  required final Function(List<CroppedFile> cropFiles) result,
  final List<MediaReadDto>? images,
  final Function(MediaReadDto dto)? onMediaDelete,
  final CropAspectRatio? aspectRatio,
  final int maxImages = 5,
}) {
  final RxList<CroppedFile> cropperFiles = <CroppedFile>[].obs;
  Widget _items({required final CroppedFile file, required final int index}) => Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Image.network(file.path, width: 128, height: 128),
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
                  ...images
                      .map(
                        (final MediaReadDto i) => Stack(
                          children: [
                            image(i.url, width: 110, height: 110),
                            if (onMediaDelete != null)
                              IconButton(
                                onPressed: () => alertDialog(
                                  title: "حذف تصویر",
                                  subtitle: "آیا از حذف تصویر اطمینان دارید؟",
                                  action1: ("", () => onMediaDelete(i)),
                                ),
                                icon: Icon(Icons.close),
                              ).container(
                                backgroundColor: context.theme.colorScheme.error,
                                radius: 100,
                              ),
                          ],
                        ),
                      )
                      .toList(),
                ...cropperFiles
                    .mapIndexed(
                      (final int index, final CroppedFile item) => _items(file: cropperFiles[index], index: index),
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
      result(croppedFile);
    }
  }
}
