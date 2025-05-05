import 'package:u/utilities.dart';
import 'package:universal_html/html.dart' as html;

abstract class UApp {
  static late PackageInfo packageInfo;
  static DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  static late AndroidDeviceInfo androidDeviceInfo;
  static late IosDeviceInfo iosDeviceInfo;
  static late WebBrowserInfo webBrowserInfo;
  static late MacOsDeviceInfo macOsDeviceInfo;
  static late WindowsDeviceInfo windowsDeviceInfo;
  static late LinuxDeviceInfo linuxDeviceInfo;

  static String name = packageInfo.appName;

  static String packageName = packageInfo.packageName;

  static String version = packageInfo.version;

  static String buildNumber = packageInfo.buildNumber;

  static bool get isWeb => kIsWeb;
  static bool get isAndroid => !isWeb && Platform.isAndroid;
  static bool get isIos => !isWeb && Platform.isIOS;
  static bool get isMacOs => !isWeb && Platform.isMacOS;
  static bool get isWindows => !isWeb && Platform.isWindows;
  static bool get isLinux => !isWeb && Platform.isLinux;
  static bool get isFuchsia => !isWeb && Platform.isFuchsia;
  static bool get isMobile => isAndroid || isIos;
  static bool get isDesktop => isMacOs || isWindows || isLinux;

  static bool isLandscape() => MediaQuery.of(navigatorKey.currentContext!).orientation == Orientation.landscape;
  static bool isPortrait() => MediaQuery.of(navigatorKey.currentContext!).orientation == Orientation.portrait;
  static bool isTablet() => !isWeb && MediaQuery.of(navigatorKey.currentContext!).size.shortestSide >= 600;
  static bool isPhone() => !isWeb && MediaQuery.of(navigatorKey.currentContext!).size.shortestSide < 600;
  static bool isMobileSize() => MediaQuery.of(navigatorKey.currentContext!).size.width < 850;
  static bool isTabletSize() => MediaQuery.of(navigatorKey.currentContext!).size.width < 1100 && MediaQuery.of(navigatorKey.currentContext!).size.width >= 850;

  static bool isDesktopSize() => MediaQuery.of(navigatorKey.currentContext!).size.width >= 1100;
  static bool isPwa = html.window.matchMedia('(display-mode: standalone)').matches;

  static void reloadWeb() => html.window.location.reload();

  static String locale() => Get.locale?.languageCode ?? "en";

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
