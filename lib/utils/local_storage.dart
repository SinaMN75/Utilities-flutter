import 'package:get_storage/get_storage.dart';
import 'package:utilities/utils/constants.dart';

void setData(final String key, final dynamic value) => GetStorage().write(key, value);

void setLogin(final bool isLogin) => GetStorage().write(UtilitiesConstants.userLogin, isLogin);

int? getInt(final String key) => GetStorage().read(key);

String? getString(final String key) => GetStorage().read(key);

bool? getBool(final String key) => GetStorage().read(key);

bool isLogin() => GetStorage().read(UtilitiesConstants.userLogin) ?? false;

double? getDouble(final String key) => GetStorage().read(key);

dynamic getData(final String key) => GetStorage().read(key);

void clearData() => GetStorage().erase();
