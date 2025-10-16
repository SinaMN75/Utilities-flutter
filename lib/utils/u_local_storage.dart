import "package:u/utilities.dart";

abstract class ULocalStorage {
  static late SharedPreferences sp;
  static late Directory _directory;

  static Future<void> init() async {
    sp = await SharedPreferences.getInstance();
    _directory = await getApplicationDocumentsDirectory();
  }

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

  static Future<void> setBig(String key, String value) async => File("${_directory.path}/$key.txt").writeAsString(value);

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

  static Future<void> clear() async {
    final List<FileSystemEntity> files = _directory.listSync();
    for (FileSystemEntity file in files) {
      if (file is File) {
        await file.delete();
      }
    }
    await sp.clear();
  }

  static Future<void> remove(String key) async {
    final File file = File("${_directory.path}/$key.txt");
    if (await file.exists()) {
      await file.delete();
    }
    await sp.remove(key);
  }
}
