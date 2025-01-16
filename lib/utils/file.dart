import 'package:u/utilities.dart';

abstract class UFile {
  static Future<List<FileData>> showImagePicker({
    required final ImageSource source,
    final bool allowMultiple = false,
    final Function(List<FileData>)? action,
  }) async {
    final List<FileData> files = <FileData>[];
    final ImagePicker imagePicker = ImagePicker();

    if (allowMultiple) {
      List<XFile> images = await imagePicker.pickMultiImage(
        requestFullMetadata: true,
      );
      images.forEach((final XFile i) async {
        final Uint8List bytes = await i.readAsBytes();
        files.add(FileData(bytes: bytes, path: i.path, extension: i.path.split(".").last));
      });
      if (action != null) action(files);
      return files;
    } else {
      XFile? image = await imagePicker.pickImage(
        source: source,
        requestFullMetadata: true,
      );
      if (image == null) return <FileData>[];
      final Uint8List bytes = await image.readAsBytes();
      files.add(FileData(bytes: bytes, path: image.path, extension: image.path.split(".").last));
      if (action != null) action(files);
      return files;
    }
  }

  static void showFilePicker({
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
                path: UApp.isWeb ? null : i.path,
                bytes: i.bytes,
                extension: ".${i.extension}",
                jsonDetail: MediaJsonDetail(title: i.name.split(".").first),
              ),
            );
          },
        );
        action(files);
      } else {
        action(
          <FileData>[
            FileData(
              path: result.files.single.path,
              bytes: result.files.single.bytes,
              extension: result.files.single.extension,
              jsonDetail: MediaJsonDetail(title: result.files[0].name),
            ),
          ],
        );
      }
    }
  }

  static Future<File> writeToFile(final Uint8List data) async {
    final Directory tempDir = await getTemporaryDirectory();
    return File('${tempDir.path}/${Random.secure().nextInt(10000)}.tmp').writeAsBytes(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
  }

  static Future<FileData?> cropImage({
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
      uiSettings: <PlatformUiSettings>[
        androidUiSettings ??
            AndroidUiSettings(
              aspectRatioPresets: aspectRatioPresets,
              cropStyle: cropStyle,
              toolbarTitle: 'Crop Your Image',
              showCropGrid: true,
              hideBottomControls: false,
              lockAspectRatio: true,
              initAspectRatio: CropAspectRatioPreset.square,
              activeControlsWidgetColor: activeControlsWidgetColor ?? Theme.of(navigatorKey.currentContext!).colorScheme.primary,
              statusBarColor: statusBarColor ?? Theme.of(navigatorKey.currentContext!).colorScheme.primary,
              toolbarColor: toolbarColor ?? Theme.of(navigatorKey.currentContext!).colorScheme.primary,
              toolbarWidgetColor: toolbarWidgetColor ?? Theme.of(navigatorKey.currentContext!).cardColor,
            ),
        iOSUiSettings ??
            IOSUiSettings(
              aspectRatioPresets: aspectRatioPresets,
              cropStyle: cropStyle,
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
              context: navigatorKey.currentContext!,
              cropBoxMovable: true,
              background: true,
              center: true,
              checkCrossOrigin: true,
              checkOrientation: true,
              cropBoxResizable: true,
              guides: true,
              highlight: true,
              rotatable: true,
              zoomable: true,
              zoomOnTouch: true,
              zoomOnWheel: true,
            ),
      ],
    );
    final FileData fileData = FileData(
      path: result?.path,
      bytes: await result?.readAsBytes(),
      extension: result?.path.split(".").last,
    );
    if (action != null) action(fileData);
    return fileData;
  }

  static Widget filePickerList({
    required final Function(List<FileData> fileData) onFileSelected,
    required final Function(List<FileData> fileData) onFileDeleted,
    required final Function(List<FileData> fileData) onFileEdited,
    final String? title,
    final List<FileData> files = const <FileData>[],
    final FileType? fileType,
    final String? parentId,
  }) {
    final RxList<FileData> oldFiles = files.obs;
    final RxList<FileData> addedFiles = <FileData>[].obs;
    final RxList<FileData> deletedFiles = <FileData>[].obs;

    Widget addIcon({required final VoidCallback onTap}) => const Icon(Icons.add, color: Colors.blue, size: 50)
        .container(
          radius: 12,
          width: 150,
          height: 150,
          borderWidth: 4,
          borderColor: Colors.blue,
          margin: const EdgeInsets.all(12),
        )
        .onTap(onTap);

    Widget fileIcon({
      required final FileData data,
      required final Function(FileData i) onFileDeleted,
      required final Function(FileData i) onFileEdited,
    }) =>
        Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                ExpansionTile(
                  title: Row(
                    children: <Widget>[
                      if (data.url != null && data.url!.isImageFileName)
                        UImage(
                          data.url!,
                          width: 150,
                          height: 150,
                          borderRadius: 12,
                          fit: BoxFit.cover,
                        ).pAll(12)
                      else if (data.url != null && !data.url!.isImageFileName)
                        Icon(
                          data.url!.isPDFFileName ? Icons.picture_as_pdf_outlined : Icons.videocam_outlined,
                          color: Colors.red,
                          size: 50,
                        ).container(
                          radius: 12,
                          width: 150,
                          height: 150,
                          borderWidth: 4,
                          borderColor: Colors.red,
                          margin: const EdgeInsets.all(12),
                        )
                      else if (data.extension!.isImageFileName)
                        UImage(
                          "",
                          fileData: data,
                          width: 150,
                          height: 150,
                          borderRadius: 12,
                          fit: BoxFit.cover,
                        ).pAll(12)
                      else if (!data.extension!.isImageFileName)
                        Icon(
                          data.extension!.isPDFFileName ? Icons.picture_as_pdf_outlined : Icons.videocam_outlined,
                          color: Colors.red,
                          size: 50,
                        ).container(
                          radius: 12,
                          width: 150,
                          height: 150,
                          borderWidth: 4,
                          borderColor: Colors.red,
                          margin: const EdgeInsets.all(12),
                        ),
                      Column(
                        children: <Widget>[
                          UTextField(
                            labelText: "عنوان",
                            initialValue: data.jsonDetail?.title,
                            onChanged: (final String value) {
                              data.jsonDetail?.title = value;
                              onFileEdited(data);
                            },
                          ).pAll(8),
                          UTextField(
                            labelText: "توضیحات",
                            initialValue: data.jsonDetail?.description,
                            onChanged: (final String value) {
                              data.jsonDetail?.description = value;
                              onFileEdited(data);
                            },
                          ).pAll(8),
                          Row(
                            children: <Widget>[
                              UTextField(
                                labelText: "لینک ۱",
                                initialValue: data.jsonDetail?.link1,
                                onChanged: (final String value) {
                                  data.jsonDetail?.link1 = value;
                                  onFileEdited(data);
                                },
                              ).pAll(8).expanded(),
                              UTextField(
                                labelText: "لینک ۲",
                                initialValue: data.jsonDetail?.link2,
                                onChanged: (final String value) {
                                  data.jsonDetail?.link2 = value;
                                  onFileEdited(data);
                                },
                              ).pAll(8).expanded(),
                            ],
                          ),
                        ],
                      ).expanded(),
                      if (data.parentId == null)
                        addIcon(
                          onTap: () {
                            showFilePicker(
                              allowMultiple: true,
                              action: (final List<FileData> files) {
                                addedFiles.addAll(
                                  files.map((final FileData e) => e..parentId = data.id).toList(),
                                );
                                onFileSelected(addedFiles);
                              },
                            );
                          },
                        ),
                      IconButton(
                        onPressed: () => onFileDeleted(data),
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ).pOnly(
                    top: data.parentId == null ? 20 : 8,
                    bottom: data.parentId == null ? 20 : 8,
                    right: data.parentId == null ? 0 : 60,
                  ),
                  children: <Widget>[
                    ...(data.children ?? <FileData>[]).map(
                      (final FileData e) => fileIcon(
                        data: e,
                        onFileDeleted: onFileDeleted,
                        onFileEdited: (final FileData i) {},
                      ),
                    ),
                  ],
                ),
                if (data.parentId == null) const Divider(thickness: 4, color: Colors.blue) else const Divider(),
              ],
            ),
          ],
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null) Text(title).titleMedium(),
        const SizedBox(height: 8),
        Obx(
          () => Column(
            children: <Widget>[
              ...oldFiles.mapIndexed(
                (final int index, final FileData i) => fileIcon(
                  data: i,
                  onFileDeleted: (final FileData data) {
                    oldFiles.remove(data);
                    deletedFiles.add(data);
                    onFileDeleted(deletedFiles);
                  },
                  onFileEdited: (final FileData i) {
                    oldFiles[index] = i;
                    onFileEdited(oldFiles);
                  },
                ),
              ),
              ...addedFiles.mapIndexed(
                (final int index, final FileData i) => fileIcon(
                  data: i,
                  onFileDeleted: (final FileData i) {
                    addedFiles.remove(i);
                    deletedFiles.add(i);
                    onFileDeleted(deletedFiles);
                  },
                  onFileEdited: (final FileData i) => addedFiles[index] = i,
                ),
              ),
              addIcon(
                onTap: () => showFilePicker(
                  allowMultiple: true,
                  action: (final List<FileData> files) {
                    addedFiles.addAll(files.map((final FileData e) => e..id = uuidV4()).toList());
                    onFileSelected(addedFiles);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
