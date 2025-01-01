import 'package:u/utilities.dart';

abstract class ULocalStorage {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async => sharedPreferences = await SharedPreferences.getInstance();

  static void set(final String key, final dynamic value) {
    if (value is String) sharedPreferences.setString(key, value);
    if (value is bool) sharedPreferences.setBool(key, value);
    if (value is double) sharedPreferences.setDouble(key, value);
    if (value is int) sharedPreferences.setInt(key, value);
  }

  static int? getInt(final String key) => sharedPreferences.getInt(key);

  static String? getString(final String key) => sharedPreferences.getString(key);

  static bool? getBool(final String key) => sharedPreferences.getBool(key);

  static double? getDouble(final String key) => sharedPreferences.getDouble(key);

  static void clear() => sharedPreferences.clear();

  static void remove(final String key) => sharedPreferences.remove(key);
}
