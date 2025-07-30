import 'package:u/utilities.dart';

abstract class ULocalStorage {
  static late SharedPreferences sp;

  static Future<void> init() async => sp = await SharedPreferences.getInstance();

  static void set(final String key, final dynamic value) {
    if (value is String) sp.setString(key, value);
    if (value is bool) sp.setBool(key, value);
    if (value is double) sp.setDouble(key, value);
    if (value is int) sp.setInt(key, value);
  }

  static int? getInt(final String key) => sp.getInt(key);

  static String? getString(final String key) => sp.getString(key);

  static bool? getBool(final String key) => sp.getBool(key);

  static double? getDouble(final String key) => sp.getDouble(key);

  static void clear() => sp.clear();

  static void remove(final String key) => sp.remove(key);

  static String? getToken() => sp.getString(UConstants.token);

  static bool hasToken() => sp.getString(UConstants.token) != null;

  static String? getUserId() => sp.getString(UConstants.userId);
}
