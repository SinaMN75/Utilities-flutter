import "package:u/utilities.dart";

// Full wwwroot file manager for SystemAdmins: breadcrumb navigation plus create-folder, upload,
// download, rename, move and delete against the backend FileManager endpoints.
class UAdminFileManagerPage extends StatefulWidget {
  const UAdminFileManagerPage({super.key});

  @override
  State<UAdminFileManagerPage> createState() => _UAdminFileManagerPageState();
}

class _UAdminFileManagerPageState extends State<UAdminFileManagerPage> {
  String _path = "";
  UFileManagerList? _data;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load("");
  }

  Future<void> _load(final String path) async {
    setState(() => _loading = true);
    await UServices.fileManager.browse(
      p: UFileManagerBrowseParams(path: path),
      onOk: (final UResponse<UFileManagerList> r) => setState(() {
        _data = r.result;
        _path = r.result?.path ?? path;
        _loading = false;
      }),
      onError: (final UEmptyResponse e) => setState(() {
        _loading = false;
        UToast.error(message: e.message);
      }),
      onException: (final String e) => setState(() {
        _loading = false;
        UToast.error(message: e);
      }),
    );
  }

  String get _parentPath => _path.contains("/") ? _path.substring(0, _path.lastIndexOf("/")) : "";

  Future<void> _createFolder() async {
    final String? name = await UNavigator.inputDialog(title: U.s.newFolder, hint: U.s.folderName);
    if (name == null || name.trim().isEmpty) return;
    await UServices.fileManager.createFolder(
      p: UFileManagerCreateFolderParams(path: _path, name: name.trim()),
      onOk: (final UEmptyResponse r) {
        UToast.snackBar(message: r.message);
        _load(_path);
      },
      onError: (final UEmptyResponse e) => UToast.error(message: e.message),
      onException: (final String e) => UToast.error(message: e),
    );
  }

  Future<void> _upload() async {
    await UFile.showFilePicker(
      action: (final List<FileData> files) async {
        if (files.isEmpty) return;
        ULoading.show();
        for (final FileData f in files) {
          await UServices.fileManager.upload(
            p: UFileManagerUploadParams(file: f, path: _path),
            onOk: (final UResponse<String> r) {},
            onError: (final UEmptyResponse e) => UToast.error(message: e.message),
            onException: (final String e) => UToast.error(message: e),
          );
        }
        ULoading.dismiss();
        _load(_path);
      },
    );
  }

  Future<void> _rename(final UFileManagerEntry entry) async {
    final String? name = await UNavigator.inputDialog(title: U.s.rename, hint: U.s.newName, defaultValue: entry.name);
    if (name == null || name.trim().isEmpty || name.trim() == entry.name) return;
    await UServices.fileManager.rename(
      p: UFileManagerRenameParams(path: entry.path, newName: name.trim()),
      onOk: (final UEmptyResponse r) {
        UToast.snackBar(message: r.message);
        _load(_path);
      },
      onError: (final UEmptyResponse e) => UToast.error(message: e.message),
      onException: (final String e) => UToast.error(message: e),
    );
  }

  Future<void> _move(final UFileManagerEntry entry) async {
    final String? destination = await UNavigator.inputDialog(title: U.s.moveTo, hint: U.s.path, defaultValue: _parentPath);
    if (destination == null) return;
    await UServices.fileManager.move(
      p: UFileManagerMoveParams(path: entry.path, destination: destination.trim()),
      onOk: (final UEmptyResponse r) {
        UToast.snackBar(message: r.message);
        _load(_path);
      },
      onError: (final UEmptyResponse e) => UToast.error(message: e.message),
      onException: (final String e) => UToast.error(message: e),
    );
  }

  void _delete(final UFileManagerEntry entry) => UNavigator.confirm(
    title: U.s.delete,
    message: U.s.deleteItemConfirm,
    onConfirm: () {
      UNavigator.back();
      UServices.fileManager.delete(
        p: UFileManagerDeleteParams(path: entry.path),
        onOk: (final UEmptyResponse r) {
          UToast.snackBar(message: r.message);
          _load(_path);
        },
        onError: (final UEmptyResponse e) => UToast.error(message: e.message),
        onException: (final String e) => UToast.error(message: e),
      );
    },
  );

  void _open(final UFileManagerEntry entry) {
    if (entry.isDirectory) {
      _load(entry.path);
    } else {
      launchUrl(Uri.parse(UServices.fileManager.downloadUrl(entry.path)), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return UScaffold(
      padding: const EdgeInsets.all(20),
      body: UColumn(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _header(cs),
          _toolbar(cs),
          _breadcrumb(cs),
          if (_loading)
            const Center(child: CircularProgressIndicator()).pAll(40).expanded()
          else if ((_data?.all ?? <UFileManagerEntry>[]).isEmpty)
            _empty(cs).expanded()
          else
            SingleChildScrollView(child: _grid(cs)).expanded(),
        ],
      ),
    );
  }

  Widget _header(final ColorScheme cs) => URow(
    spacing: 14,
    children: <Widget>[
      Icon(Icons.folder_open_rounded, size: 32, color: cs.primary).container(
        padding: const EdgeInsets.all(12),
        backgroundColor: cs.primary.withValues(alpha: 0.12),
        radius: 16,
      ),
      UColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UTextHeadlineSmall(U.s.fileManager, fontWeight: FontWeight.bold),
          UTextBodySmall("${U.baseUrl}/${_path.isEmpty ? "" : _path}", color: cs.onSurface.withValues(alpha: 0.6)),
        ],
      ).expanded(),
    ],
  );

  Widget _toolbar(final ColorScheme cs) => Wrap(
    spacing: 10,
    runSpacing: 10,
    children: <Widget>[
      UButton(
        title: U.s.parentDirectory,
        icon: const Icon(Icons.arrow_upward_rounded, size: 18),
        enabled: _path.isNotEmpty,
        onTap: () => _load(_parentPath),
      ),
      UButton(
        title: U.s.newFolder,
        icon: const Icon(Icons.create_new_folder_rounded, size: 18),
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        onTap: _createFolder,
      ),
      UButton(
        title: U.s.upload,
        icon: const Icon(Icons.upload_file_rounded, size: 18),
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        onTap: _upload,
      ),
      UButton(
        title: U.s.refresh,
        icon: const Icon(Icons.refresh_rounded, size: 18),
        onTap: () => _load(_path),
      ),
    ],
  );

  Widget _breadcrumb(final ColorScheme cs) {
    final List<String> segments = _path.isEmpty ? <String>[] : _path.split("/");
    final List<Widget> crumbs = <Widget>[
      _crumb("wwwroot", "", cs, active: segments.isEmpty),
    ];
    String acc = "";
    for (int i = 0; i < segments.length; i++) {
      acc = acc.isEmpty ? segments[i] : "$acc/${segments[i]}";
      final String target = acc;
      crumbs
        ..add(Icon(Icons.chevron_right_rounded, size: 18, color: cs.onSurface.withValues(alpha: 0.4)))
        ..add(_crumb(segments[i], target, cs, active: i == segments.length - 1));
    }
    return Wrap(crossAxisAlignment: WrapCrossAlignment.center, spacing: 2, runSpacing: 4, children: crumbs);
  }

  Widget _crumb(final String label, final String target, final ColorScheme cs, {required final bool active}) => UTextLabelLarge(
    label,
    color: active ? cs.primary : cs.onSurface.withValues(alpha: 0.7),
    fontWeight: active ? FontWeight.bold : FontWeight.w500,
  ).pSymmetric(horizontal: 8, vertical: 4).onTap(() => _load(target));

  Widget _empty(final ColorScheme cs) => Center(
    child: UColumn(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: <Widget>[
        Icon(Icons.folder_off_rounded, size: 56, color: cs.onSurface.withValues(alpha: 0.3)),
        UTextBodyMedium(U.s.emptyFolder, color: cs.onSurface.withValues(alpha: 0.6)),
      ],
    ),
  );

  Widget _grid(final ColorScheme cs) => LayoutBuilder(
    builder: (final BuildContext context, final BoxConstraints constraints) {
      const double target = 240;
      final int columns = (constraints.maxWidth / target).floor().clamp(1, 6);
      final double width = (constraints.maxWidth - (columns - 1) * 12) / columns;
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: (_data?.all ?? <UFileManagerEntry>[]).map((final UFileManagerEntry e) => SizedBox(width: width, child: _entryCard(e, cs))).toList(),
      );
    },
  );

  Widget _entryCard(final UFileManagerEntry e, final ColorScheme cs) => UCard(
    child: URow(
      spacing: 12,
      children: <Widget>[
        Icon(_iconFor(e), color: e.isDirectory ? cs.primary : cs.onSurface.withValues(alpha: 0.7), size: 30),
        UColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UTextTitleSmall(e.name, fontWeight: FontWeight.w600, maxLines: 1, overflow: TextOverflow.ellipsis),
            UTextBodySmall(
              e.isDirectory ? U.s.folder : _humanSize(e.size),
              color: cs.onSurface.withValues(alpha: 0.55),
            ),
          ],
        ).expanded(),
        _menu(e, cs),
      ],
    ).pAll(12).onTap(() => _open(e)),
  );

  Widget _menu(final UFileManagerEntry e, final ColorScheme cs) => PopupMenuButton<String>(
    icon: Icon(Icons.more_vert_rounded, color: cs.onSurface.withValues(alpha: 0.6)),
    onSelected: (final String value) {
      switch (value) {
        case "open":
          _open(e);
        case "rename":
          _rename(e);
        case "move":
          _move(e);
        case "delete":
          _delete(e);
      }
    },
    itemBuilder: (final BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(value: "open", child: _menuRow(e.isDirectory ? Icons.folder_open_rounded : Icons.download_rounded, e.isDirectory ? U.s.folder : U.s.download)),
      PopupMenuItem<String>(value: "rename", child: _menuRow(Icons.drive_file_rename_outline_rounded, U.s.rename)),
      PopupMenuItem<String>(value: "move", child: _menuRow(Icons.drive_file_move_rounded, U.s.move)),
      PopupMenuItem<String>(
        value: "delete",
        child: _menuRow(Icons.delete_outline_rounded, U.s.delete, color: cs.error),
      ),
    ],
  );

  Widget _menuRow(final IconData icon, final String label, {final Color? color}) => URow(
    spacing: 10,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(icon, size: 18, color: color),
      UTextBodyMedium(label, color: color),
    ],
  );

  IconData _iconFor(final UFileManagerEntry e) {
    if (e.isDirectory) return Icons.folder_rounded;
    switch (e.extension) {
      case "png" || "jpg" || "jpeg" || "gif" || "webp" || "svg" || "bmp":
        return Icons.image_rounded;
      case "mp4" || "mov" || "mkv" || "avi" || "webm":
        return Icons.movie_rounded;
      case "mp3" || "wav" || "aac" || "ogg" || "m4a":
        return Icons.audiotrack_rounded;
      case "pdf":
        return Icons.picture_as_pdf_rounded;
      case "zip" || "rar" || "7z" || "tar" || "gz":
        return Icons.folder_zip_rounded;
      case "doc" || "docx" || "txt" || "md":
        return Icons.description_rounded;
      case "xls" || "xlsx" || "csv":
        return Icons.table_chart_rounded;
      case "json" || "xml" || "html" || "js" || "css" || "dart" || "cs":
        return Icons.code_rounded;
      default:
        return Icons.insert_drive_file_rounded;
    }
  }

  String _humanSize(final int bytes) {
    if (bytes < 1024) return "$bytes B";
    const List<String> units = <String>["KB", "MB", "GB", "TB"];
    double size = bytes / 1024;
    int unit = 0;
    while (size >= 1024 && unit < units.length - 1) {
      size /= 1024;
      unit++;
    }
    return "${size.toStringAsFixed(size >= 100 ? 0 : 1)} ${units[unit]}";
  }
}
