part of "u_admin.dart";

// App theme relocated from the u_admin app's `Core`, parameterized by primary color + font
// so every consuming project gets the same look from its UAdminConfig.
abstract class UAdminTheme {
  // Light theme built from the config's primary color.
  static ThemeData light({required Color primary, String? font}) => _build(primary: primary, font: font, brightness: Brightness.light, surface: AppColors.white);

  // Dark theme built from the config's primary color.
  static ThemeData dark({required Color primary, String? font}) => _build(primary: primary, font: font, brightness: Brightness.dark, surface: AppColors.black);

  static ThemeData _build({required Color primary, required Brightness brightness, required Color surface, String? font, double baseRadius = 8}) {
    // Fall back to the bundled Vazir font when the app doesn't specify one.
    final String family = font ?? UFonts.vazir.fontFamily!;
    final Color disabled = AppColors.grey.shade400;
    return ThemeData(
      dividerTheme: DividerThemeData(color: disabled, space: 0),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: primary, shadow: primary, brightness: brightness),
      fontFamily: family,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(baseRadius),
          borderSide: const BorderSide(color: AppColors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(baseRadius),
          borderSide: const BorderSide(color: AppColors.transparent),
        ),
        outlineBorder: const BorderSide(color: AppColors.transparent),
        labelStyle: TextStyle(fontFamily: family, color: AppColors.grey, fontSize: 12),
        filled: true,
        fillColor: surface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: surface,
          textStyle: TextStyle(fontFamily: family, color: primary, fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(baseRadius)),
          backgroundColor: primary,
        ),
      ),
      listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.symmetric(horizontal: 8)),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actionsPadding: EdgeInsets.zero,
      ),
    );
  }
}
