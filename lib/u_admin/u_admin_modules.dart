part of "u_admin.dart";

// A single feature: a menu item that opens its page as a tab. Used as a UAdminGroup
// child and as the dashboard. Role-gated via [roles].
class UAdminModule {
  UAdminModule({required this.title, required this.icon, required this.page, this.id, this.selectedIcon, this.tabTitle, this.roles});

  final String title;
  final IconData icon;
  final Widget Function() page;
  final String? id;
  final IconData? selectedIcon;
  final String? tabTitle;
  final List<TagUser>? roles;

  String get resolvedId => id ?? title;

  bool get visible => UAdmin.canAccess(roles);

  UMenuItem toItem() => UMenuItem(id: resolvedId, title: title, icon: icon, selectedIcon: selectedIcon, onTap: () => U.addOrSwitchTab(tabTitle ?? title, page()));
}

// The one and only top-level menu node: a titled group of modules. Compose your menu
// entirely from these. Hidden when the user is gated out of the group ([roles]) or can
// see none of its modules. [header] is an optional uppercase section label above the group.
class UAdminGroup {
  UAdminGroup({
    required this.title,
    required this.icon,
    required this.modules,
    this.id,
    this.header,
    this.roles,
    this.expanded = false,
  });

  final String title;
  final IconData icon;
  final List<UAdminModule> modules;
  final String? id;
  final String? header;
  final bool expanded;
  final List<TagUser>? roles;

  String get resolvedId => id ?? title;

  List<UMenuEntry> toEntries() {
    if (!UAdmin.canAccess(roles)) return <UMenuEntry>[];
    final List<UAdminModule> shown = modules.where((UAdminModule m) => m.visible).toList();
    if (shown.isEmpty) return <UMenuEntry>[];
    return <UMenuEntry>[
      if (header != null) UMenuHeader(header!),
      UMenuGroup(
        id: resolvedId,
        title: title,
        icon: icon,
        initiallyExpanded: true,
        children: shown.map((UAdminModule m) => m.toItem()).toList(),
      ),
    ];
  }
}

// ---------------------------------------------------------------------------
// Catalog of individual modules. Compose them into UAdminGroups in your app config
// (see main.dart). List modules accept an optional per-row `actions` override.
// ---------------------------------------------------------------------------

abstract class UAdminModules {
  // ---- Dashboards ----
  static UAdminModule financialOpsDashboard({List<TagUser>? roles}) => UAdminModule(id: "paymentDashboard", title: "${U.s.financialOpsDashboard} ⚡", icon: Icons.account_balance_wallet_rounded, page: () => const UAdminFinancialOpsDashboardPage(), roles: roles);

  static UAdminModule propertyDashboard({List<TagUser>? roles}) => UAdminModule(id: "hotelDashboard", title: "${U.s.propertyDashboard} ⚡", icon: Icons.apartment_rounded, page: () => const UAdminHotelDashboardPage(), roles: roles);

  // ---- Accommodation ----
  static UAdminModule hotels({List<TagUser>? roles}) => UAdminModule(id: "hotels", title: U.s.hotels, icon: Icons.apartment_rounded, page: () => const UAdminHotelPage(), roles: roles);

  static UAdminModule hotelRooms({List<TagUser>? roles}) => UAdminModule(id: "hotel-rooms", title: U.s.hotelRooms, icon: Icons.meeting_room_rounded, page: () => const UAdminHotelRoomPage(), roles: roles);

  static UAdminModule reservations({List<TagUser>? roles}) => UAdminModule(id: "reservations", title: U.s.reservations, icon: Icons.event_available_rounded, page: () => const UAdminReservationPage(), roles: roles);

  // ---- Dorms ----
  static UAdminModule dorms({List<TagUser>? roles}) => UAdminModule(id: "dorm-list", title: U.s.dorms, icon: Icons.bedroom_parent_rounded, page: () => const UAdminDormPage(), roles: roles);

  static UAdminModule dormRooms({List<TagUser>? roles}) => UAdminModule(id: "dorm-rooms", title: U.s.dormRooms, icon: Icons.meeting_room_rounded, page: () => const UAdminDormRoomPage(), roles: roles);

  static UAdminModule dormBeds({List<TagUser>? roles}) => UAdminModule(id: "dorm-beds", title: U.s.beds, icon: Icons.bed_rounded, page: () => const UAdminDormBedPage(), roles: roles);

  // ---- Leasing ----
  static UAdminModule contracts({List<TagUser>? roles}) => UAdminModule(id: "contracts", title: U.s.contracts, icon: Icons.description_rounded, page: () => const UAdminContractPage(), roles: roles);

  static UAdminModule invoices({List<TagUser>? roles}) => UAdminModule(id: "invoices", title: U.s.invoices, icon: Icons.receipt_long_rounded, page: () => const UAdminInvoicePage(), roles: roles);

  // ---- Users ----
  static UAdminModule users({List<TagUser>? roles}) => UAdminModule(
    id: "users",
    title: U.s.users,
    icon: Icons.person_rounded,
    page: () => UAdminUserPage(args: UAdminUsersPageArgs()),
    roles: roles,
  );

  // ---- Payments (list modules accept an optional per-row `actions` override) ----
  static UAdminModule adminUsers({List<TagUser>? roles, UAdminActionBuilder<UUserResponse>? actions}) => UAdminModule(
    id: "admin-users",
    title: U.s.users,
    tabTitle: U.s.usersManagement,
    icon: Icons.manage_accounts_rounded,
    page: () => UAdminUsersPage(actions: actions),
    roles: roles,
  );

  static UAdminModule merchants({List<TagUser>? roles, UAdminActionBuilder<UMerchantResponse>? actions}) => UAdminModule(
    id: "merchants",
    title: U.s.merchants,
    tabTitle: U.s.merchantsManagement,
    icon: Icons.storefront_rounded,
    page: () => UAdminMerchantsPage(actions: actions),
    roles: roles,
  );

  static UAdminModule terminals({List<TagUser>? roles, UAdminActionBuilder<UTerminalResponse>? actions}) => UAdminModule(
    id: "terminals",
    title: U.s.terminals,
    tabTitle: U.s.terminalsManagement,
    icon: Icons.point_of_sale_rounded,
    page: () => UAdminTerminalsPage(actions: actions),
    roles: roles,
  );

  // ---- Finance ----
  static UAdminModule wallet({List<TagUser>? roles}) => UAdminModule(id: "wallet", title: U.s.wallets, tabTitle: U.s.walletManagement, icon: Icons.account_balance_wallet_rounded, page: () => const UAdminWalletPage(), roles: roles);

  static UAdminModule transactions({List<TagUser>? roles}) => UAdminModule(id: "transactions", title: U.s.transactions, icon: Icons.swap_horiz_rounded, page: () => const UAdminTransactionsPage(), roles: roles);

  static UAdminModule accounting({List<TagUser>? roles}) => UAdminModule(id: "accounting", title: U.s.accounting, icon: Icons.bar_chart_rounded, page: () => const UAdminAccountingPage(), roles: roles);

  // ---- Parking ----
  static UAdminModule parking({List<TagUser>? roles, UAdminActionBuilder<UParkingResponse>? actions}) =>
      UAdminModule(id: "parking",
          title: U.s.parking,
          tabTitle: U.s.parkingManagement,
          icon: Icons.local_parking_rounded,
          page: () => UAdminParkingPage(actions: actions),
          roles: roles);

  static UAdminModule parkingReport({List<TagUser>? roles}) =>
      UAdminModule(id: "parking-report",
          title: U.s.parkingReports,
          icon: Icons.assessment_rounded,
          page: () => const UAdminParkingReportPage(),
          roles: roles);

  // ---- Content ----
  static UAdminModule blogs({List<TagUser>? roles}) => UAdminModule(id: "blogs", title: U.s.blogs, icon: Icons.article_rounded, page: () => const UAdminBlogPage(), roles: roles);

  static UAdminModule contents({List<TagUser>? roles}) => UAdminModule(id: "contents", title: U.s.content, icon: Icons.content_copy, selectedIcon: Icons.content_copy_outlined, page: () => const UAdminContentsPage(), roles: roles);

  // ---- External API ----
  static UAdminModule pnApiTester({List<TagUser>? roles}) =>
      UAdminModule(id: "pn-api-tester",
          title: U.s.pnApiTester,
          icon: Icons.api_rounded,
          page: () => const UAdminPnTesterPage(),
          roles: roles);

  // ---- System ----
  static UAdminModule settings({List<TagUser>? roles}) => UAdminModule(id: "settings", title: U.s.settings, icon: Icons.settings_rounded, page: () => const UAdminSettingsPage(), roles: roles);

  static UAdminModule apiLogs({List<TagUser>? roles}) => UAdminModule(id: "api-logs", title: U.s.apiRequestLogs, icon: Icons.travel_explore_rounded, page: () => const UAdminApiLogPage(), roles: roles);
}
