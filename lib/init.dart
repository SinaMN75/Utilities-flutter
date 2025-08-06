import 'package:u/utilities.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late UThemeData uThemeData;

Future<void> initUtilities({
  required final UThemeData themeData,
  final List<DeviceOrientation> deviceOrientations = const <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ],
}) async {
  uThemeData = themeData;
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
  ULoading.initialize(key: navigatorKey, blurAmount: 1, overlayColor: Colors.black12);
  // await CustomCrashlytics.initialize();
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
        home: home,
        locale: Locale(ULocalStorage.getString(UConstants.locale) ?? locale.languageCode),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: (ULocalStorage.getBool(UConstants.isDarkMode) ?? false) ? ThemeMode.dark : ThemeMode.light,
      );
}
