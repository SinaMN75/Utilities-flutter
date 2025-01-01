import 'package:u/utilities.dart';
import 'package:universal_html/html.dart' as html;

abstract class UApp {
  static late PackageInfo packageInfo;

  static String appName = packageInfo.appName;

  static String appPackageName = packageInfo.packageName;

  static String appVersion = packageInfo.version;

  static String appBuildNumber = packageInfo.buildNumber;

  static bool isAndroid = GetPlatform.isAndroid && !kIsWeb;

  static bool isIos = GetPlatform.isIOS && !kIsWeb;

  static bool isMacOs = GetPlatform.isMacOS && !kIsWeb;

  static bool isWindows = GetPlatform.isWindows && !kIsWeb;

  static bool isLinux = GetPlatform.isLinux && !kIsWeb;

  static bool isFuchsia = GetPlatform.isFuchsia && !kIsWeb;

  static bool isMobile = GetPlatform.isMobile && !kIsWeb;

  static bool isWeb = GetPlatform.isWeb && kIsWeb;

  static bool isDesktop = GetPlatform.isDesktop && !kIsWeb;

  static bool isLandScape() => navigatorKey.currentContext!.isLandscape;

  static bool isPortrait() => navigatorKey.currentContext!.isPortrait;

  static bool isTablet() => navigatorKey.currentContext!.isTablet && !kIsWeb;

  static bool isPhone() => navigatorKey.currentContext!.isPhone && !kIsWeb;

  static bool isMobileSize() => navigatorKey.currentContext!.width < 850;

  static bool isTabletSize() => navigatorKey.currentContext!.width < 1100 && navigatorKey.currentContext!.width >= 850;

  static bool isDesktopSize() => navigatorKey.currentContext!.width >= 1100;

  static bool isPwa = html.window.matchMedia('(display-mode: standalone)').matches;

  static void reloadWeb() => html.window.location.reload();

  static void updateLocale(final Locale locale) {
    Get.updateLocale(locale);
    ULocalStorage.set(UConstants.locale, locale.languageCode);
  }

  static void switchTheme() {
    if (ULocalStorage.getBool(UConstants.isDarkMode) ?? false) {
      Get.changeThemeMode(ThemeMode.light);
      ULocalStorage.set(UConstants.isDarkMode, false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      ULocalStorage.set(UConstants.isDarkMode, true);
    }
  }
}
