import "package:u/utilities.dart";

abstract class ULocalStorage {
  static late SharedPreferences sp;
  static late Directory _directory;
  static late Directory _bigFilesDirectory;

  static Future<void> init() async {
    sp = await SharedPreferences.getInstance();
    _directory = await getApplicationDocumentsDirectory();
    _bigFilesDirectory = Directory("${_directory.path}/big_files");
    if (!await _bigFilesDirectory.exists()) {
      await _bigFilesDirectory.create(recursive: true);
    }
  }

  static Set<String> getKeys() => sp.getKeys();

  static void set(final String key, final dynamic value) {
    if (value is String) sp.setString(key, value);
    if (value is bool) sp.setBool(key, value);
    if (value is double) sp.setDouble(key, value);
    if (value is int) sp.setInt(key, value);
    if (value is List<String>) sp.setStringList(key, value);
  }

  static void setToken(final String value) => sp.setString(UConstants.token, value);

  static int? getInt(final String key) => sp.getInt(key);

  static String? getString(final String key) => sp.getString(key);

  static bool? getBool(final String key) => sp.getBool(key);

  static double? getDouble(final String key) => sp.getDouble(key);

  static List<String>? getStringList(final String key) => sp.getStringList(key);

  static String? getToken() => sp.getString(UConstants.token);

  static bool hasToken() => sp.getString(UConstants.token) != null;

  static String? getUserId() => sp.getString(UConstants.userId);

  // Store bytes as base64 string - ONLY USE .dat FILES FOR BYTES
  static Future<void> setBigBytes(String key, List<int> bytes) async {
    try {
      final String base64String = base64Encode(bytes);
      await File("${_bigFilesDirectory.path}/$key.dat").writeAsString(base64String);
    } catch (e) {
      rethrow;
    }
  }

  // Get bytes from base64 string
  static Future<Uint8List?> getBigBytes(String key) async {
    try {
      final File file = File("${_bigFilesDirectory.path}/$key.dat");
      if (await file.exists()) {
        final String base64String = await file.readAsString();
        final Uint8List bytes = base64Decode(base64String);
        return bytes;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Check if big file exists
  static Future<bool> bigFileExists(String key) async {
    try {
      final File file = File("${_bigFilesDirectory.path}/$key.dat");
      final bool exists = await file.exists();
      return exists;
    } catch (e) {
      return false;
    }
  }

  // Get file size for storage info
  static Future<int> getFileSize(String key) async {
    try {
      final File file = File("${_bigFilesDirectory.path}/$key.dat");
      if (await file.exists()) {
        final FileStat stat = await file.stat();
        return stat.size;
      }
      return 0;
    } catch (e) {
      return 0;
    }
  }

  // Get total storage used by all big files
  static Future<int> getTotalStorageUsed() async {
    try {
      final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
      int totalSize = 0;

      for (final FileSystemEntity file in files) {
        if (file is File && file.path.endsWith(".dat")) {
          final FileStat stat = await file.stat();
          totalSize += stat.size;
        }
      }
      return totalSize;
    } catch (e) {
      return 0;
    }
  }

  // Get storage info for all files
  static Future<Map<String, int>> getAllFilesStorageInfo() async {
    try {
      final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
      final Map<String, int> storageInfo = <String, int>{};

      for (final FileSystemEntity file in files) {
        if (file is File && file.path.endsWith(".dat")) {
          final String fileName = file.uri.pathSegments.last;
          final String key = fileName.substring(0, fileName.length - 4); // Remove '.dat'
          final FileStat stat = await file.stat();
          storageInfo[key] = stat.size;
        }
      }
      return storageInfo;
    } catch (e) {
      return <String, int>{};
    }
  }

  static Future<void> clear() async {
    final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
    for (final FileSystemEntity file in files) {
      if (file is File) {
        await file.delete();
      }
    }
    await sp.clear();
  }

  static Future<void> remove(String key) async {
    // Remove from SharedPreferences
    await sp.remove(key);

    // Remove .dat file from big files directory
    final File datFile = File("${_bigFilesDirectory.path}/$key.dat");
    if (await datFile.exists()) {
      await datFile.delete();
    } else {}

    // Also remove .txt file from main directory (for backward compatibility)
    final File txtFile = File("${_directory.path}/$key.txt");
    if (await txtFile.exists()) {
      await txtFile.delete();
    }
  }

  // OLD METHODS - KEEP FOR BACKWARD COMPATIBILITY BUT DON'T USE
  static Future<void> setBig(String key, String value) async {
    try {
      await File("${_directory.path}/$key.txt").writeAsString(value);
    } catch (e) {}
  }

  static Future<String?> getBigString(String key) async {
    try {
      final File file = File("${_directory.path}/$key.txt");
      if (await file.exists()) {
        return await file.readAsString();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<List<String>> getBigKeys() async {
    try {
      final List<FileSystemEntity> files = _directory.listSync();
      return files.where((FileSystemEntity file) => file is File && file.path.endsWith(".txt")).map((FileSystemEntity file) {
        final String fileName = file.uri.pathSegments.last;
        return fileName.substring(0, fileName.length - 4);
      }).toList();
    } catch (e) {
      return <String>[];
    }
  }
}
