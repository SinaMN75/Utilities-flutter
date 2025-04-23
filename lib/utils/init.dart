import 'package:u/utilities.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> initUtilities({
  final FirebaseOptions? firebaseOptions,
  final bool safeDevice = false,
  final bool protectDataLeaking = false,
  final bool preventScreenShot = false,
  final List<DeviceOrientation> deviceOrientations = const <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ],
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(deviceOrientations);
  await ULocalStorage.init();
  UApp.packageInfo = await PackageInfo.fromPlatform();
  if (UApp.isAndroid) UApp.androidDeviceInfo = await UApp.deviceInfo.androidInfo;
  if (UApp.isIos) UApp.iosDeviceInfo = await UApp.deviceInfo.iosInfo;
  if (UApp.isWeb) UApp.webBrowserInfo = await UApp.deviceInfo.webBrowserInfo;
  if (UApp.isWindows) UApp.windowsDeviceInfo = await UApp.deviceInfo.windowsInfo;
  if (UApp.isMacOs) UApp.macOsDeviceInfo = await UApp.deviceInfo.macOsInfo;
  if (UApp.isLinux) UApp.linuxDeviceInfo = await UApp.deviceInfo.linuxInfo;
  if (firebaseOptions != null) {
    try {
      await Firebase.initializeApp(options: firebaseOptions);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (final Object error, final StackTrace stack) {
        FirebaseCrashlytics.instance.recordError(error, stack);
        return true;
      };
    } catch (e) {}
  }
  try {
    if (protectDataLeaking) await ScreenProtector.protectDataLeakageWithColor(Colors.white);
    if (preventScreenShot) await ScreenProtector.preventScreenshotOn();
  } catch (e) {}
  return;
}

class UMaterialApp extends StatelessWidget {
  const UMaterialApp({
    required this.localizationsDelegates,
    required this.supportedLocales,
    required this.locale,
    required this.lightTheme,
    required this.darkTheme,
    required this.home,
    super.key,
  });

  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final List<Locale> supportedLocales;
  final Locale locale;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final Widget home;

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        navigatorKey: navigatorKey,
        enableLog: false,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        home: LoaderOverlay(child: home),
        locale: Locale(ULocalStorage.getString(UConstants.locale) ?? locale.languageCode),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: (ULocalStorage.getBool(UConstants.isDarkMode) ?? false) ? ThemeMode.dark : ThemeMode.light,
      );
}
