import 'package:u/utilities.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> initUtilities({
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
  ULoading.initialize(key: navigatorKey, blurAmount: 1, overlayColor: Colors.black12);
  // await CustomCrashlytics.initialize();
  return;
}

class UMaterialApp extends StatelessWidget {
  const UMaterialApp({
    required this.localizationsDelegates,
    required this.supportedLocales,
    required this.locale,
    required this.home,
    required this.themeData,
    super.key,
  });

  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final List<Locale> supportedLocales;
  final Locale locale;
  final Widget home;
  final UThemeData themeData;

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        navigatorKey: navigatorKey,
        enableLog: false,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        home: home,
        locale: Locale(ULocalStorage.getString(UConstants.locale) ?? locale.languageCode),
        themeMode: (ULocalStorage.getBool(UConstants.isDarkMode) ?? false) ? ThemeMode.dark : ThemeMode.light,
        theme: uLightTheme(themeData),
        darkTheme: uLightTheme(themeData),
      );

  ThemeData uLightTheme(UThemeData data) => ThemeData(
        disabledColor: data.disabledColor,
        fontFamily: data.fontFamily,
        highlightColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: data.primaryColor,
          primary: data.primaryColor,
          secondary: data.secondaryColor,
          error: data.errorColor,
        ),
        cardTheme: CardThemeData(
          elevation: data.cardElevation,
          shadowColor: data.primaryColor.withValues(alpha: 0.2),
          color: data.cardColor,
          clipBehavior: Clip.antiAlias,
        ),
        tabBarTheme: TabBarThemeData(
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(fontFamily: data.fontFamily, fontSize: 18),
          labelPadding: const EdgeInsets.symmetric(vertical: 12),
          unselectedLabelStyle: TextStyle(fontFamily: data.fontFamily, fontSize: 18),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
            textStyle: WidgetStatePropertyAll<TextStyle>(
              TextStyle(fontFamily: data.fontFamily, color: Colors.white, fontSize: 16),
            ),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            ),
            backgroundColor: WidgetStateProperty.resolveWith((
              final Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return data.disabledColor;
              } else {
                return data.secondaryColor;
              }
            }),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            ),
          ),
        ),
        drawerTheme: DrawerThemeData(
          shape: Border.all(color: Colors.transparent, width: 0.1),
        ),
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: data.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: data.disabledColor.withValues(alpha: 0.5)),
          ),
          labelStyle: TextStyle(fontFamily: data.fontFamily, color: data.disabledColor),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(data.primaryColor),
        ),
        navigationRailTheme: NavigationRailThemeData(
          unselectedLabelTextStyle: TextStyle(
            fontFamily: data.fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white60,
          ),
          selectedLabelTextStyle: TextStyle(
            fontFamily: data.fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedIconTheme: const IconThemeData(color: Colors.white60),
          backgroundColor: data.primaryColor,
          indicatorColor: Colors.white,
        ),
      );
}

class UThemeData {
  final String fontFamily;
  final Color disabledColor;
  final Color primaryColor;
  final Color secondaryColor;
  final Color errorColor;
  final Color cardColor;
  final double cardElevation;

  UThemeData({
    required this.fontFamily,
    required this.disabledColor,
    required this.primaryColor,
    required this.secondaryColor,
    this.errorColor = Colors.red,
    this.cardColor = Colors.white,
    this.cardElevation = 1,
  });
}
