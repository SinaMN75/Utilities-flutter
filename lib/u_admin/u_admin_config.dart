part of "u_admin.dart";

// Per-project configuration for a U-Admin app. A consuming project (avahamrah, khabroom, ...)
// supplies branding, backend, locales and the ordered list of modules it wants; the package
// builds the whole app (theme, splash, login, side-menu shell) from this.
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

  // Branding / identity.
  final String appName;
  final String logo;
  final String? loginBackground;
  final Color primaryColor;
  final String? font;

  // Backend.
  final String baseUrl;
  final String apiKey;

  // Localization.
  final List<Locale> locales;
  final Locale defaultLocale;

  // Misc app data.
  final List<String> chargeList;

  // The initial dashboard tab shown after login.
  final UAdminModule dashboard;

  // Ordered side-menu content (groups / sections / standalone modules).
  // A function so titles resolve against the active locale each build, and role gating is re-evaluated.
  final List<UAdminMenuNode> Function() menu;

  // Per-entity row operations (cross-nav + edit/delete/...). Opt-in: unconfigured entities show none.
  final UAdminActions? actions;
}

// Global access point to the active config + role-gating helper. Set once by [runUAdminApp].
abstract class UAdmin {
  static late UAdminConfig config;

  static String get logo => config.logo;

  static String? get loginBackground => config.loginBackground;

  static List<String> get chargeList => config.chargeList;

  // True when [roles] is null/empty, or the signed-in user carries at least one of them.
  // Full admins (superAdmin / systemAdmin) bypass granular permission gating.
  static bool canAccess(List<TagUser>? roles) {
    if (roles == null || roles.isEmpty) return true;
    try {
      if (U.user.tags.contains(TagUser.superAdmin.number) || U.user.tags.contains(TagUser.systemAdmin.number)) return true;
      return roles.any((TagUser r) => U.user.tags.contains(r.number));
    } catch (_) {
      // U.user not set yet (e.g. before login) -> treat as no access.
      return false;
    }
  }
}
