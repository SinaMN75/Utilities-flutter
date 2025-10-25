import "package:u/utilities.dart";

/// Manages key-value storage using SharedPreferences for small data.
class ULocalStorage {
  static late SharedPreferences _sp;

  static Future<void> init() async => _sp = await SharedPreferences.getInstance();

  static Set<String> getKeys() => _sp.getKeys();

  static void set(String key, dynamic value, {Duration? expireTime}) {
    if (value is String) {
      _sp.setString(key, value);
    } else if (value is bool) {
      _sp.setBool(key, value);
    } else if (value is double) {
      _sp.setDouble(key, value);
    } else if (value is int) {
      _sp.setInt(key, value);
    } else if (value is List<String>) {
      _sp.setStringList(key, value);
    } else {
      throw ArgumentError("Unsupported value type for key: $key");
    }

    if (expireTime != null) {
      _sp.setInt("_expiry_$key", DateTime.now().add(expireTime).millisecondsSinceEpoch);
    }
  }

  static Future<void> setBatch(Map<String, dynamic> keyValuePairs) async {
    for (MapEntry<String, dynamic> entry in keyValuePairs.entries) {
      set(entry.key, entry.value);
    }
  }

  static int? getInt(String key) => getIfNotExpired(key);

  static String? getString(String key) => getIfNotExpired(key);

  static bool? getBool(String key) => getIfNotExpired(key);

  static double? getDouble(String key) => getIfNotExpired(key);

  static List<String>? getStringList(String key) => getIfNotExpired(key);

  static void setToken(String value, {Duration? expireTime}) => set(UConstants.token, value, expireTime: expireTime);

  static String? getToken() => getIfNotExpired(UConstants.token);

  static bool hasToken() => getIfNotExpired(UConstants.token) != null;

  static String? getUserId() => getIfNotExpired(UConstants.userId);

  static bool containsKey(String key) => _sp.containsKey(key);

  static Future<void> remove(String key) async => _sp.remove(key);

  static Future<void> clear() async => _sp.clear();

  static Map<String, dynamic> getAll() {
    final Set<String> keys = getKeys();
    final Map<String, dynamic> data = <String, dynamic>{};
    for (String key in keys) {
      data[key] = _sp.get(key);
    }
    return data;
  }

  static dynamic getIfNotExpired(String key) {
    final String expiryKey = "_expiry_$key";
    final int? expiryTime = _sp.getInt(expiryKey);
    if (expiryTime != null && DateTime.now().millisecondsSinceEpoch > expiryTime) {
      remove(key);
      remove(expiryKey);
      return null;
    }
    return _sp.get(key);
  }
}

class UFileStorage {
  static late Directory _directory;
  static late Directory _bigFilesDirectory;

  /// Initializes file storage directories.
  static Future<void> init() async {
    if (!kIsWeb) {
      _directory = await getApplicationDocumentsDirectory();
      _bigFilesDirectory = Directory("${_directory.path}/big_files");
      if (!await _bigFilesDirectory.exists()) {
        await _bigFilesDirectory.create(recursive: true);
      }
    } else {
      throw UnsupportedError("File storage is not supported on web.");
    }
  }

  /// Stores bytes as a base64-encoded string in a .dat file.
  static Future<void> setBytes(String key, List<int> bytes) async {
    try {
      final String base64String = base64Encode(bytes);
      await File("${_bigFilesDirectory.path}/$key.dat").writeAsString(base64String);
    } catch (e) {
      throw Exception("Failed to store bytes for key: $key");
    }
  }

  /// Retrieves bytes from a base64-encoded .dat file.
  static Future<Uint8List?> getBytes(String key) async {
    try {
      final File file = File("${_bigFilesDirectory.path}/$key.dat");
      if (await file.exists()) {
        final String base64String = await file.readAsString();
        return base64Decode(base64String);
      }
      return null;
    } catch (e) {
      throw Exception("Failed to retrieve bytes for key: $key");
    }
  }

  /// Checks if a .dat file exists for the given key.
  static Future<bool> fileExists(String key) async {
    try {
      final File file = File("${_bigFilesDirectory.path}/$key.dat");
      return await file.exists();
    } catch (e) {
      return false;
    }
  }

  /// Retrieves the file size for a .dat file.
  static Future<int> fileSize(String key) async {
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

  /// Calculates the total storage used by all .dat files.
  static int totalStorageUsed() {
    try {
      final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
      int totalSize = 0;
      for (final FileSystemEntity file in files) {
        if (file is File && file.path.endsWith(".dat")) {
          final FileStat stat = file.statSync();
          totalSize += stat.size;
        }
      }
      return totalSize;
    } catch (e) {
      return 0;
    }
  }

  /// Retrieves storage info for all .dat files.
  static Map<String, int> allFilesStorageInfo() {
    try {
      final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
      final Map<String, int> storageInfo = <String, int>{};
      for (final FileSystemEntity file in files) {
        if (file is File && file.path.endsWith(".dat")) {
          final String fileName = file.uri.pathSegments.last;
          final String key = fileName.substring(0, fileName.length - 4); // Remove '.dat'
          final FileStat stat = file.statSync();
          storageInfo[key] = stat.size;
        }
      }
      return storageInfo;
    } catch (e) {
      return <String, int>{};
    }
  }

  /// Removes a specific .dat file and legacy .txt file.
  static Future<void> remove(String key) async {
    try {
      final File datFile = File("${_bigFilesDirectory.path}/$key.dat");
      if (await datFile.exists()) {
        await datFile.delete();
      }
      final File txtFile = File("${_directory.path}/$key.txt");
      if (await txtFile.exists()) {
        await txtFile.delete();
      }
    } catch (e) {
      throw Exception("Failed to remove file for key: $key");
    }
  }

  /// Clears all .dat files and legacy .txt files.
  static Future<void> clear() async {
    try {
      final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
      for (final FileSystemEntity file in files) {
        if (file is File) {
          await file.delete();
        }
      }
      final List<FileSystemEntity> legacyFiles = _directory.listSync();
      for (final FileSystemEntity file in legacyFiles) {
        if (file is File && file.path.endsWith(".txt")) {
          await file.delete();
        }
      }
    } catch (e) {
      throw Exception("Failed to clear file storage");
    }
  }

  /// Legacy method: Stores a string in a .txt file (for backward compatibility).
  static Future<void> set(String key, String value) async {
    try {
      await File("${_directory.path}/$key.txt").writeAsString(value);
    } catch (e) {
      throw Exception("Failed to store string for key: $key");
    }
  }

  /// Legacy method: Retrieves a string from a .txt file (for backward compatibility).
  static Future<String?> getString(String key) async {
    try {
      final File file = File("${_directory.path}/$key.txt");
      if (await file.exists()) {
        return await file.readAsString();
      }
      return null;
    } catch (e) {
      throw Exception("Failed to retrieve string for key: $key");
    }
  }

  /// Legacy method: Retrieves all keys for .txt files (for backward compatibility).
  static Future<List<String>> getKeys() async {
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

  /// New utility: Stores JSON-serializable data as a .dat file.
  static Future<void> setJson(String key, Map<String, dynamic> jsonData) async {
    try {
      final String jsonString = jsonEncode(jsonData);
      await File("${_bigFilesDirectory.path}/$key.dat").writeAsString(jsonString);
    } catch (e) {
      throw Exception("Failed to store JSON for key: $key");
    }
  }

  /// New utility: Retrieves and decodes JSON from a .dat file.
  static Future<Map<String, dynamic>?> getJson(String key) async {
    try {
      final File file = File("${_bigFilesDirectory.path}/$key.dat");
      if (await file.exists()) {
        final String jsonString = await file.readAsString();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      throw Exception("Failed to retrieve JSON for key: $key");
    }
  }

  /// New utility: Lists all keys for .dat files.
  static Future<List<String>> getDatKeys() async {
    try {
      final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
      return files.where((FileSystemEntity file) => file is File && file.path.endsWith(".dat")).map((FileSystemEntity file) {
        final String fileName = file.uri.pathSegments.last;
        return fileName.substring(0, fileName.length - 4);
      }).toList();
    } catch (e) {
      return <String>[];
    }
  }

  /// New utility: Copies a file to a new key.
  static Future<void> copyFile(String sourceKey, String destinationKey) async {
    try {
      final File sourceFile = File("${_bigFilesDirectory.path}/$sourceKey.dat");
      if (await sourceFile.exists()) {
        await sourceFile.copy("${_bigFilesDirectory.path}/$destinationKey.dat");
      } else {
        throw Exception("Source file for key $sourceKey does not exist");
      }
    } catch (e) {
      throw Exception("Failed to copy file from $sourceKey to $destinationKey");
    }
  }
}

// import "package:u/utilities.dart";
//
// abstract class ULocalStorage {
//   static late SharedPreferences sp;
//   static late Directory _directory;
//   static late Directory _bigFilesDirectory;
//
//   static Future<void> init() async {
//     sp = await SharedPreferences.getInstance();
//     if (!kIsWeb) {
//       _directory = await getApplicationDocumentsDirectory();
//       _bigFilesDirectory = Directory("${_directory.path}/big_files");
//       if (!await _bigFilesDirectory.exists()) {
//         await _bigFilesDirectory.create(recursive: true);
//       }
//     }
//   }
//
//   static Set<String> getKeys() => sp.getKeys();
//
//   static void set(final String key, final dynamic value) {
//     if (value is String) sp.setString(key, value);
//     if (value is bool) sp.setBool(key, value);
//     if (value is double) sp.setDouble(key, value);
//     if (value is int) sp.setInt(key, value);
//     if (value is List<String>) sp.setStringList(key, value);
//   }
//
//   static void setToken(final String value) => sp.setString(UConstants.token, value);
//
//   static int? getInt(final String key) => sp.getInt(key);
//
//   static String? getString(final String key) => sp.getString(key);
//
//   static bool? getBool(final String key) => sp.getBool(key);
//
//   static double? getDouble(final String key) => sp.getDouble(key);
//
//   static List<String>? getStringList(final String key) => sp.getStringList(key);
//
//   static String? getToken() => sp.getString(UConstants.token);
//
//   static bool hasToken() => sp.getString(UConstants.token) != null;
//
//   static String? getUserId() => sp.getString(UConstants.userId);
//
//   // Store bytes as base64 string - ONLY USE .dat FILES FOR BYTES
//   static Future<void> setBigBytes(String key, List<int> bytes) async {
//     try {
//       final String base64String = base64Encode(bytes);
//       await File("${_bigFilesDirectory.path}/$key.dat").writeAsString(base64String);
//     } catch (_) {}
//   }
//
//   // Get bytes from base64 string
//   static Future<Uint8List?> getBigBytes(String key) async {
//     try {
//       final File file = File("${_bigFilesDirectory.path}/$key.dat");
//       if (await file.exists()) {
//         final String base64String = await file.readAsString();
//         final Uint8List bytes = base64Decode(base64String);
//         return bytes;
//       }
//       return null;
//     } catch (e) {
//       return null;
//     }
//   }
//
//   // Check if big file exists
//   static Future<bool> bigFileExists(String key) async {
//     try {
//       final File file = File("${_bigFilesDirectory.path}/$key.dat");
//       final bool exists = await file.exists();
//       return exists;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   // Get file size for storage info
//   static Future<int> getFileSize(String key) async {
//     try {
//       final File file = File("${_bigFilesDirectory.path}/$key.dat");
//       if (await file.exists()) {
//         final FileStat stat = await file.stat();
//         return stat.size;
//       }
//       return 0;
//     } catch (e) {
//       return 0;
//     }
//   }
//
//   // Get total storage used by all big files
//   static Future<int> getTotalStorageUsed() async {
//     try {
//       final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
//       int totalSize = 0;
//
//       for (final FileSystemEntity file in files) {
//         if (file is File && file.path.endsWith(".dat")) {
//           final FileStat stat = await file.stat();
//           totalSize += stat.size;
//         }
//       }
//       return totalSize;
//     } catch (e) {
//       return 0;
//     }
//   }
//
//   // Get storage info for all files
//   static Map<String, int> getAllFilesStorageInfo() {
//     try {
//       final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
//       final Map<String, int> storageInfo = <String, int>{};
//
//       for (final FileSystemEntity file in files) {
//         if (file is File && file.path.endsWith(".dat")) {
//           final String fileName = file.uri.pathSegments.last;
//           final String key = fileName.substring(0, fileName.length - 4); // Remove '.dat'
//           final FileStat stat = file.statSync();
//           storageInfo[key] = stat.size;
//         }
//       }
//       return storageInfo;
//     } catch (e) {
//       return <String, int>{};
//     }
//   }
//
//   static Future<void> clear() async {
//     if (!kIsWeb) {
//       final List<FileSystemEntity> files = _bigFilesDirectory.listSync();
//       for (final FileSystemEntity file in files) {
//         if (file is File) {
//           await file.delete();
//         }
//       }
//     }
//     await sp.clear();
//   }
//
//   static Future<void> remove(String key) async {
//     // Remove from SharedPreferences
//     await sp.remove(key);
//
//     // Remove .dat file from big files directory
//     final File datFile = File("${_bigFilesDirectory.path}/$key.dat");
//     if (await datFile.exists()) {
//       await datFile.delete();
//     } else {}
//
//     // Also remove .txt file from main directory (for backward compatibility)
//     final File txtFile = File("${_directory.path}/$key.txt");
//     if (await txtFile.exists()) {
//       await txtFile.delete();
//     }
//   }
//
//   // OLD METHODS - KEEP FOR BACKWARD COMPATIBILITY BUT DON'T USE
//   static Future<void> setBig(String key, String value) async {
//     try {
//       await File("${_directory.path}/$key.txt").writeAsString(value);
//     } catch (e) {}
//   }
//
//   static Future<String?> getBigString(String key) async {
//     try {
//       final File file = File("${_directory.path}/$key.txt");
//       if (await file.exists()) {
//         return await file.readAsString();
//       }
//       return null;
//     } catch (e) {
//       return null;
//     }
//   }
//
//   static Future<List<String>> getBigKeys() async {
//     try {
//       final List<FileSystemEntity> files = _directory.listSync();
//       return files.where((FileSystemEntity file) => file is File && file.path.endsWith(".txt")).map((FileSystemEntity file) {
//         final String fileName = file.uri.pathSegments.last;
//         return fileName.substring(0, fileName.length - 4);
//       }).toList();
//     } catch (e) {
//       return <String>[];
//     }
//   }
// }
