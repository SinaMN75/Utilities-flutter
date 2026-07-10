part of "u_admin.dart";

abstract class UAdminTheme {
  static ThemeData light({required Color primary, String? font}) => _build(primary: primary, font: font, brightness: Brightness.light, surface: UAdminAppColors.white);

  static ThemeData dark({required Color primary, String? font}) => _build(primary: primary, font: font, brightness: Brightness.dark, surface: UAdminAppColors.black);

  static ThemeData _build({required Color primary, required Brightness brightness, required Color surface, String? font, double baseRadius = 8}) {
    final String family = font ?? UFonts.vazir.fontFamily!;
    final Color disabled = UAdminAppColors.grey.shade400;
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
          borderSide: const BorderSide(color: UAdminAppColors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(baseRadius),
          borderSide: const BorderSide(color: UAdminAppColors.transparent),
        ),
        outlineBorder: const BorderSide(color: UAdminAppColors.transparent),
        labelStyle: TextStyle(fontFamily: family, color: UAdminAppColors.grey, fontSize: 12),
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
