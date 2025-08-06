import 'package:flutter/material.dart';

class UThemeData {
  final String fontFamily;
  final Color disabledColor;
  final Color primaryColor;
  final Color secondaryColor;
  final Color errorColor;

  UThemeData({
    required this.disabledColor,
    required this.fontFamily,
    required this.primaryColor,
    required this.secondaryColor,
    required this.errorColor,
  });

  ThemeData lightTheme() => ThemeData(
        disabledColor: disabledColor,
        fontFamily: fontFamily,
        highlightColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
          error: errorColor,
        ),
        cardTheme: CardThemeData(
          elevation: 10,
          shadowColor: primaryColor.withValues(alpha: 0.2),
        ),
        tabBarTheme: TabBarThemeData(
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(fontFamily: fontFamily, fontSize: 18),
          labelPadding: const EdgeInsets.symmetric(vertical: 12),
          unselectedLabelStyle: TextStyle(fontFamily: fontFamily, fontSize: 18),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
            textStyle: WidgetStatePropertyAll<TextStyle>(
              TextStyle(
                  fontFamily: fontFamily, color: Colors.white, fontSize: 16),
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
                return disabledColor;
              } else {
                return secondaryColor;
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
            borderSide: BorderSide(color: primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: disabledColor.withValues(alpha: 0.5)),
          ),
          labelStyle: TextStyle(fontFamily: fontFamily, color: disabledColor),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(primaryColor),
        ),
        navigationRailTheme: NavigationRailThemeData(
          unselectedLabelTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white60,
          ),
          selectedLabelTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedIconTheme: const IconThemeData(color: Colors.white60),
          backgroundColor: primaryColor,
          indicatorColor: Colors.white,
        ),
      );
}
