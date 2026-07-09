part of "u_admin.dart";

class UAdminConfig {
  UAdminConfig({
    required this.appName,
    required this.baseUrl,
    required this.primaryColor,
    required this.logo,
    required this.dashboard,
    required this.menu,
    this.apiKey = "",
    this.loginBackground,
    this.font,
    this.locales = const <Locale>[Locale("en"), Locale("fa")],
    this.defaultLocale = const Locale("fa"),
    this.chargeList = const <String>["200000", "500000", "700000", "1000000"],
    this.actions,
  });

  final String appName;
  final String logo;
  final String? loginBackground;
  final Color primaryColor;
  final String? font;

  final String baseUrl;
  final String apiKey;

  final List<Locale> locales;
  final Locale defaultLocale;

  final List<String> chargeList;

  final UAdminModule dashboard;

  final List<UAdminMenuNode> Function() menu;

  final UAdminActions? actions;
}

abstract class UAdmin {
  static late UAdminConfig config;

  static String get logo => config.logo;

  static String? get loginBackground => config.loginBackground;

  static List<String> get chargeList => config.chargeList;

  static bool canAccess(List<TagUser>? roles) {
    if (roles == null || roles.isEmpty) return true;
    try {
      if (U.user.tags.contains(TagUser.superAdmin.number) || U.user.tags.contains(TagUser.systemAdmin.number)) return true;
      return roles.any((TagUser r) => U.user.tags.contains(r.number));
    } catch (_) {
      return false;
    }
  }
}
