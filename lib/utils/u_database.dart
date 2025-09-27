import "package:u/utilities.dart";

/// A flexible, unlimited key–value store backed by the file system.
/// Supports strings, JSON, bytes, files, backup/restore, and metadata.
abstract class UKeyValueDb {
  static late Directory _dir;

  /// Initialize storage.
  /// Optionally provide [subDir] for separation.
  static Future<void> init({String? subDir}) async {
    final Directory base = await getApplicationDocumentsDirectory();
    _dir = subDir != null ? Directory("${base.path}/$subDir") : base;
    if (!await _dir.exists()) {
      await _dir.create(recursive: true);
    }
  }

  static Future<File> _getFile(String key) async {
    final String safeKey = base64Url.encode(utf8.encode(key));
    return File("${_dir.path}/$safeKey.dat");
  }

  // ----------------- STORE -----------------

  static Future<void> setString(String key, String value, {bool overwrite = true}) async {
    final File file = await _getFile(key);
    if (!overwrite && await file.exists()) return;
    await file.writeAsString(value, flush: true);
  }

  static Future<void> setBytes(String key, List<int> bytes, {bool overwrite = true}) async {
    final File file = await _getFile(key);
    if (!overwrite && await file.exists()) return;
    await file.writeAsBytes(bytes, flush: true);
  }

  static Future<void> setJson(String key, dynamic jsonObj, {bool overwrite = true}) async {
    final String jsonStr = jsonEncode(jsonObj);
    await setString(key, jsonStr, overwrite: overwrite);
  }

  static Future<void> setFile(String key, File source, {bool base64 = false}) async {
    final Uint8List bytes = await source.readAsBytes();
    if (base64) {
      await setString(key, base64Encode(bytes));
    } else {
      await setBytes(key, bytes);
    }
  }

  // ----------------- RETRIEVE -----------------

  static Future<String?> getString(String key) async {
    final File file = await _getFile(key);
    if (!await file.exists()) return null;
    return file.readAsString();
  }

  static Future<List<int>?> getBytes(String key) async {
    final File file = await _getFile(key);
    if (!await file.exists()) return null;
    return file.readAsBytes();
  }

  static Future<dynamic> getJson(String key) async {
    final String? str = await getString(key);
    return str != null ? jsonDecode(str) : null;
  }

  static Future<File?> getFile(String key, {bool base64 = false, String? outPath}) async {
    final String? str = await getString(key);
    if (str == null) return null;

    final Uint8List bytes = base64 ? base64Decode(str) : utf8.encode(str);
    final String path = outPath ?? "${_dir.path}/$key.restored";
    final File file = File(path);
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  // ----------------- META & MGMT -----------------

  static Future<bool> containsKey(String key) async => (await _getFile(key)).exists();

  static Future<int?> getSize(String key) async {
    final File file = await _getFile(key);
    if (!await file.exists()) return null;
    return file.length();
  }

  static Future<DateTime?> getModified(String key) async {
    final File file = await _getFile(key);
    if (!await file.exists()) return null;
    return file.lastModified();
  }

  static Future<void> remove(String key) async {
    final File file = await _getFile(key);
    if (await file.exists()) await file.delete();
  }

  static Future<void> clear() async {
    for (final FileSystemEntity f in _dir.listSync()) {
      if (f is File && f.path.endsWith(".dat")) {
        await f.delete();
      }
    }
  }

  static Future<List<String>> keys() async {
    final Iterable<File> files = _dir.listSync().whereType<File>().where((File f) => f.path.endsWith(".dat"));
    return files.map((File f) {
      final String fileName = f.uri.pathSegments.last.replaceAll(".dat", "");
      return utf8.decode(base64Url.decode(fileName));
    }).toList();
  }

  // ----------------- BACKUP/RESTORE -----------------

  static Future<File> backup(String backupPath) async {
    final Map<String, String> data = <String, String>{};
    for (final String key in await keys()) {
      final String? str = await getString(key);
      if (str != null) data[key] = str;
    }
    final String jsonStr = jsonEncode(data);
    final File file = File(backupPath);
    await file.writeAsString(jsonStr, flush: true);
    return file;
  }

  static Future<void> restore(String backupPath) async {
    final File file = File(backupPath);
    if (!await file.exists()) return;
    final String content = await file.readAsString();
    final Map<String, dynamic> data = jsonDecode(content) as Map<String, dynamic>;
    for (final MapEntry<String, dynamic> entry in data.entries) {
      await setString(entry.key, entry.value.toString());
    }
  }
}
