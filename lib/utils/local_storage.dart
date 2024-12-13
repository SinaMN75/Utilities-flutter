import 'package:utilities/utilities.dart';

abstract class ULocalStorage {
  static void set(final String key, final dynamic value) => GetStorage().write(key, value);

  static int? getInt(final String key) => GetStorage().read(key);

  static String? getString(final String key) => GetStorage().read(key);

  static bool? getBool(final String key) => GetStorage().read(key);

  static double? getDouble(final String key) => GetStorage().read(key);

  static dynamic getData(final String key) => GetStorage().read(key);

  static void remove(final String key) => GetStorage().remove(key);

  static void clearData() => GetStorage().erase();
}
