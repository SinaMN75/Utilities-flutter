import 'package:utilities_framework_flutter/utilities.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class UCore {
  static late String apiKey;
}

Future<void> initUtilities({
  final String? apiKey,
  final FirebaseOptions? firebaseOptions,
  final String? baseUrl,
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

  UCore.apiKey = apiKey ?? "";
  if (baseUrl != null) URemoteDataSource.baseUrl = baseUrl;

  UNetwork.connectivityResult = await Connectivity().checkConnectivity();
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
        builder: EasyLoading.init(),
      );
}
