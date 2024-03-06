part of 'utils.dart';

void showFilePicker({
  required final Function(List<FileData> file) action,
  final FileType fileType = FileType.any,
  final bool allowMultiple = false,
  final String? initialDirectory,
  final String? dialogTitle,
  final bool allowCompression = true,
  final bool withReadStream = false,
  final bool lockParentWindow = false,
  final List<String>? allowedExtensions,
}) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    dialogTitle: dialogTitle,
    initialDirectory: initialDirectory,
    allowCompression: allowCompression,
    withReadStream: withReadStream,
    lockParentWindow: lockParentWindow,
    allowMultiple: allowMultiple,
    allowedExtensions: allowedExtensions,
  );
  final List<FileData> files = <FileData>[];

  if (result != null) {
    if (allowMultiple) {
      result.files.forEach(
        (final PlatformFile i) async {
          files.add(
            FileData(
              path: isWeb ? null : i.path,
              bytes: i.bytes,
              extension: ".${i.extension}",
            ),
          );
        },
      );
      action(files);
    } else
      action(
        <FileData>[
          FileData(
            path: result.files.single.path,
            bytes: result.files.single.bytes,
            extension: result.files.single.extension,
          ),
        ],
      );
  }
}

Future<List<XFile>> multiImagePicker() => ImagePicker().pickMultiImage();

Future<XFile?> imagePicker() => ImagePicker().pickImage(source: ImageSource.gallery);

Future<File> writeToFile(final Uint8List data) async {
  final Directory tempDir = await getTemporaryDirectory();
  return File('${tempDir.path}/${Random.secure().nextInt(10000)}.tmp').writeAsBytes(
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
  );
}

Future<FileData?> cropImage({
  required final String filePath,
  final Function(FileData file)? action,
  final int? maxWidth,
  final int? maxHeight,
  final CropStyle cropStyle = CropStyle.rectangle,
  final CropAspectRatio cropAspectRatio = const CropAspectRatio(ratioX: 3, ratioY: 1.2),
  final ImageCompressFormat imageCompressFormat = ImageCompressFormat.png,
  final AndroidUiSettings? androidUiSettings,
  final WebUiSettings? webUiSettings,
  final IOSUiSettings? iOSUiSettings,
  final Color? activeControlsWidgetColor,
  final Color? statusBarColor,
  final Color? toolbarColor,
  final Color? toolbarWidgetColor,
  final List<CropAspectRatioPreset> aspectRatioPresets = const <CropAspectRatioPreset>[
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9,
  ],
}) async {
  final CroppedFile? result = await ImageCropper().cropImage(
    sourcePath: filePath,
    maxWidth: maxWidth,
    maxHeight: maxHeight,
    aspectRatio: cropAspectRatio,
    compressFormat: imageCompressFormat,
    cropStyle: cropStyle,
    aspectRatioPresets: aspectRatioPresets,
    uiSettings: <PlatformUiSettings>[
      androidUiSettings ??
          AndroidUiSettings(
            toolbarTitle: 'Crop Your Image',
            showCropGrid: true,
            hideBottomControls: false,
            lockAspectRatio: true,
            initAspectRatio: CropAspectRatioPreset.square,
            activeControlsWidgetColor: activeControlsWidgetColor ?? context.theme.primaryColor,
            statusBarColor: statusBarColor ?? context.theme.primaryColor,
            toolbarColor: toolbarColor ?? context.theme.primaryColor,
            toolbarWidgetColor: toolbarWidgetColor ?? context.theme.cardColor,
          ),
      iOSUiSettings ??
          IOSUiSettings(
            resetAspectRatioEnabled: false,
            minimumAspectRatio: 1,
            aspectRatioPickerButtonHidden: true,
            title: 'Crop Your Image',
            aspectRatioLockDimensionSwapEnabled: true,
            aspectRatioLockEnabled: true,
            hidesNavigationBar: true,
          ),
      webUiSettings ??
          WebUiSettings(
            context: context,
            enableZoom: true,
            enableResize: true,
            enforceBoundary: true,
            showZoomer: false,
            presentStyle: CropperPresentStyle.page,
          ),
    ],
  );
  final FileData fileData = FileData(path: result?.path, bytes: await result?.readAsBytes());
  if (action != null) action(FileData(path: result?.path, bytes: await result?.readAsBytes()));
  return fileData;
}

void showMultiFilePicker({
  required final Function(List<File> file) action,
  final FileType fileType = FileType.image,
  final bool allowMultiple = false,
  final List<String>? allowedExtensions,
}) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    allowMultiple: allowMultiple,
    allowedExtensions: allowedExtensions,
  );
  if (result != null) {
    if (allowMultiple) {
      final List<File> files = <File>[];
      result.files.forEach((final PlatformFile i) {
        if (i.path != null) files.add(File(i.path!));
      });
    } else {
      final File file = File(result.files.single.path!);
      action(<File>[file]);
    }
  }
}

Future<XFile> getCompressImageFile({
  required final File file,
  final int quality = 70,
  final bool advanceCompress = true,
}) async {
  int advanceQuality = 20;
  advanceQuality = (100 - ((file.lengthSync() / 1000000) * 0.85)).toInt();
  final Directory dir = Directory.systemTemp;
  final String targetPath = "${dir.absolute.path}/temp.jpg";
  final XFile? result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: advanceCompress ? advanceQuality : quality,
  );

  return result ?? XFile("--");
}

Future<Uint8List> getCompressImageFileWeb({
  required final Uint8List bytes,
  final int quality = 70,
  final bool advanceCompress = true,
}) async {
  final Uint8List result = await FlutterImageCompress.compressWithList(
    bytes,
    quality: advanceCompress ? 20 : quality,
  );
  return result;
}

Widget filePickerList({
  required final String title,
  required final Function(List<FileData> fileData) onFileSelected,
  required final Function(List<FileData> fileData) onFileDeleted,
  required final Function(List<FileData> fileData) onFileEdited,
  final List<FileData> files = const <FileData>[],
  final FileType? fileType,
  final String? parentId,
}) {
  final RxList<FileData> oldFiles = files.obs;
  final RxList<FileData> addedFiles = <FileData>[].obs;
  final RxList<FileData> deletedFiles = <FileData>[].obs;

  Widget menu({
    required final VoidCallback onDelete,
    required final VoidCallback onEdit,
  }) =>
      PopupMenuButton<int>(
        onSelected: (final int index) {
          if (index == 0) onDelete();
          if (index == 1) onEdit();
        },
        itemBuilder: (final BuildContext context) => <PopupMenuEntry<int>>[
          const PopupMenuItem<int>(value: 0, child: Text('حذف')),
          const PopupMenuItem<int>(value: 1, child: Text('ویرایش')),
        ],
        child: const Icon(Icons.more_vert, color: Colors.black).container(
          backgroundColor: Colors.white,
          radius: 100,
        ),
      );

  Widget fileIcon({
    required final IconData icon,
    required final Color color,
  }) =>
      Icon(icon, color: color, size: 50).container(
        radius: 12,
        width: 100,
        height: 100,
        borderWidth: 4,
        borderColor: color,
        margin: const EdgeInsets.symmetric(horizontal: 8),
      );

  void edit({
    required final FileData dto,
    required final Function(FileData fileData) onSubmit,
  }) {
    final TextEditingController controllerTitle = TextEditingController(
      text: dto.jsonDetail?.title ?? "",
    );
    final TextEditingController controllerDescription = TextEditingController(
      text: dto.jsonDetail?.description ?? "",
    );
    dialogAlert(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          textField(labelText: "عنوان", controller: controllerTitle).paddingSymmetric(vertical: 8),
          textField(labelText: "توضیحات", controller: controllerDescription).paddingSymmetric(vertical: 8),
          filePickerList(
            title: "زیر مجموعه",
            files: dto.children ?? <FileData>[],
            parentId: dto.id,
            onFileSelected: onFileSelected,
            onFileDeleted: onFileDeleted,
            onFileEdited: onFileEdited,
          ),
          button(
            title: "ثبت",
            onTap: () {
              onSubmit(
                FileData(
                  id: dto.id,
                  bytes: dto.bytes,
                  order: dto.order,
                  tags: dto.tags,
                  extension: dto.extension,
                  url: dto.url,
                  path: dto.path,
                  parentId: dto.parentId,
                  jsonDetail: MediaJsonDetail(
                    title: controllerTitle.text,
                    description: controllerDescription.text,
                    album: dto.jsonDetail?.album,
                    link3: dto.jsonDetail?.link3,
                    link2: dto.jsonDetail?.link2,
                    link1: dto.jsonDetail?.link1,
                    artist: dto.jsonDetail?.artist,
                    size: dto.jsonDetail?.size,
                    time: dto.jsonDetail?.time,
                    link: dto.jsonDetail?.link,
                    isPrivate: dto.jsonDetail?.isPrivate,
                  ),
                ),
              );
              back();
            },
          ).paddingSymmetric(vertical: 20),
        ],
      ).container(width: context.width / 2),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(title).titleMedium(),
      const SizedBox(height: 8),
      Obx(
        () => Row(
          children: <Widget>[
            ...oldFiles
                .mapIndexed(
                  (final int index, final FileData i) => Stack(
                    children: <Widget>[
                      if (i.url!.isImageFileName)
                        image(
                          i.url!,
                          width: 100,
                          height: 100,
                          borderRadius: 12,
                          fit: BoxFit.cover,
                        ).paddingSymmetric(horizontal: 8),
                      if (i.url!.isPDFFileName) fileIcon(icon: Icons.picture_as_pdf_outlined, color: Colors.red),
                      if (i.url!.isVideoFileName) fileIcon(icon: Icons.videocam_outlined, color: Colors.red),
                      menu(
                        onDelete: () {
                          oldFiles.remove(i);
                          deletedFiles.add(i);
                          onFileDeleted(deletedFiles);
                        },
                        onEdit: () => edit(
                          dto: i,
                          onSubmit: (final FileData fileData) {
                            oldFiles[index] = fileData;
                            onFileEdited(oldFiles);
                          },
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            ...addedFiles
                .mapIndexed(
                  (final int index, final FileData i) => Stack(
                    children: <Widget>[
                      if (i.extension!.isImageFileName)
                        image(
                          "",
                          fileData: i,
                          width: 100,
                          height: 100,
                          borderRadius: 12,
                          fit: BoxFit.cover,
                        ).paddingSymmetric(horizontal: 8),
                      if (i.extension!.isPDFFileName)
                        fileIcon(
                          icon: Icons.picture_as_pdf_outlined,
                          color: Colors.red,
                        ),
                      if (i.extension!.isVideoFileName)
                        fileIcon(
                          icon: Icons.videocam_outlined,
                          color: Colors.red,
                        ),
                      menu(
                        onDelete: () => addedFiles.removeAt(index),
                        onEdit: () => edit(
                          dto: i,
                          onSubmit: (final FileData fileData) {
                            addedFiles[index] = fileData;
                          },
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            PopupMenuButton<int>(
              onSelected: (final int index) {
                if (index == 0)
                  showFilePicker(
                    allowMultiple: true,
                    fileType: FileType.image,
                    action: (final List<FileData> files) {
                      addedFiles.addAll(
                        files
                            .map(
                              (final FileData e) => e
                                ..parentId = parentId
                                ..id = generateUUID(),
                            )
                            .toList(),
                      );
                      onFileSelected(addedFiles);
                    },
                  );
                if (index == 1)
                  showFilePicker(
                    allowMultiple: true,
                    action: (final List<FileData> files) {
                      addedFiles.addAll(
                        files
                            .map(
                              (final FileData e) => e
                                ..parentId = parentId
                                ..id = parentId == null ? null : generateUUID(),
                            )
                            .toList(),
                      );

                      onFileSelected(addedFiles);
                    },
                  );
              },
              itemBuilder: (final BuildContext context) => <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(value: 0, child: Text('تصویر')),
                const PopupMenuItem<int>(value: 1, child: Text('فایل')),
              ],
              child: fileIcon(icon: Icons.add, color: context.theme.colorScheme.primary),
            ),
          ],
        ),
      ),
    ],
  );
}
