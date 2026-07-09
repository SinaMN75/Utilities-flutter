part of "u_admin.dart";

// One-call bootstrap for a U-Admin project: stores the config, initializes the SDK, and runs
// the app (splash -> login/shell) with theme + localization derived from the config.
Future<void> runUAdminApp(UAdminConfig config) async {
  UAdmin.config = config;
  await initU(baseUrl: config.baseUrl, apiKey: config.apiKey);
  runApp(
    UMaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: config.locales,
      locale: Locale(ULocalStorage.getString(UConstants.locale) ?? config.defaultLocale.languageCode),
      home: UAdminSplashPage(
        logo: config.logo,
        onError: () => UNavigator.offAll(const UAdminLoginPage()),
        onFinish: () => UNavigator.offAll(const UAdminShell()),
      ),
      lightThemeData: UAdminTheme.light(primary: config.primaryColor, font: config.font),
      darkThemeData: UAdminTheme.dark(primary: config.primaryColor, font: config.font),
    ),
  );
}
