import 'package:utilities/utilities.dart';

abstract class ULocalStorage {
  static late SharedPreferences prefs;

  static void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void set(final String key, final dynamic value) {
    if (value is String) prefs.setString(key, value);
    if (value is bool) prefs.setBool(key, value);
    if (value is double) prefs.setDouble(key, value);
    if (value is int) prefs.setInt(key, value);
  }

  static int? getInt(final String key) => prefs.getInt(key);

  static String? getString(final String key) => prefs.getString(key);

  static bool? getBool(final String key) => prefs.getBool(key);

  static double? getDouble(final String key) => prefs.getDouble(key);

  static void clearData() => prefs.clear();

  static void remove(final String key) => prefs.remove(key);
}
