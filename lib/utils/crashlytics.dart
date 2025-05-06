import 'package:u/utilities.dart';

class CustomCrashlytics {
  static Future<void> initialize() async {
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      _recordError(error, stack);
      return true;
    };

    FlutterError.onError = (FlutterErrorDetails details) {
      _recordFlutterError(details);
    };
  }

  static Future<void> _recordError(dynamic error, StackTrace stack) async {
    final String message = '''
====== DART ERROR ======
${await _getSystemInfo()}
Error: $error
Stack Trace:
$stack
=======================
''';
    _writeToLogFile(message);
  }

  static Future<void> _recordFlutterError(FlutterErrorDetails details) async {
    final String message = '''
====== FLUTTER ERROR ======
${await _getSystemInfo()}
Library: ${details.library}
Exception: ${details.exception}
Stack Trace:
${details.stack}
Context:
${details.context}
=======================
''';
    _writeToLogFile(message);
  }

  static Future<String> _getSystemInfo() async {
    final String deviceInfo = '''
Time: ${DateTime.now()}
App: ${UApp.name} (${UApp.packageName})
Version: ${UApp.version} (build ${UApp.buildNumber})
Platform: ${_getPlatformInfo()}
Device: ${await _getDeviceInfo()}
Screen: ${_getScreenInfo()}
Locale: ${UApp.locale()}
''';

    return deviceInfo;
  }

  static String _getPlatformInfo() {
    if (UApp.isWeb) return 'Web';
    if (UApp.isAndroid) return 'Android';
    if (UApp.isIos) return 'iOS';
    if (UApp.isMacOs) return 'macOS';
    if (UApp.isWindows) return 'Windows';
    if (UApp.isLinux) return 'Linux';
    if (UApp.isFuchsia) return 'Fuchsia';
    return 'Unknown';
  }

  static Future<String> _getDeviceInfo() async {
    try {
      if (UApp.isAndroid) {
        return '${UApp.androidDeviceInfo.model} (${UApp.androidDeviceInfo.manufacturer}) - Android ${UApp.androidDeviceInfo.version.release}';
      } else if (UApp.isIos) {
        return '${UApp.iosDeviceInfo.model} - iOS ${UApp.iosDeviceInfo.systemVersion}';
      } else if (UApp.isWeb) {
        return '${UApp.webBrowserInfo.browserName.name} ${UApp.webBrowserInfo.appVersion}';
      } else if (UApp.isMacOs) {
        return '${UApp.macOsDeviceInfo.model} - macOS ${UApp.macOsDeviceInfo.osRelease}';
      } else if (UApp.isWindows) {
        return '${UApp.windowsDeviceInfo.computerName} - Windows ${UApp.windowsDeviceInfo.majorVersion}';
      } else if (UApp.isLinux) {
        return '${UApp.linuxDeviceInfo.name} - ${UApp.linuxDeviceInfo.version}';
      }
    } catch (e) {
      return 'Failed to get detailed device info: $e';
    }
    return 'Unknown device';
  }

  static String _getScreenInfo() {
    try {
      final BuildContext context = navigatorKey.currentContext!;
      final MediaQueryData media = MediaQuery.of(context);
      final Size size = media.size;

      return '''
Size: ${size.width.toStringAsFixed(0)}x${size.height.toStringAsFixed(0)}
Pixel ratio: ${media.devicePixelRatio.toStringAsFixed(2)}
Orientation: ${media.orientation.name}
Device type: ${_getDeviceType(context)}
''';
    } catch (e) {
      return 'Failed to get screen info: $e';
    }
  }

  static String _getDeviceType(BuildContext context) {
    if (UApp.isWeb) return 'Web';
    if (UApp.isTablet()) return 'Tablet';
    if (UApp.isPhone()) return 'Phone';
    if (UApp.isDesktop) {
      if (UApp.isDesktopSize()) return 'Desktop (large)';
      return 'Desktop';
    }
    return 'Unknown';
  }

  static void _writeToLogFile(String message) {
    UNavigator.draggableSheet(Text(message));
  }
}
