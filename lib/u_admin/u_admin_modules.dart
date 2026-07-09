part of "u_admin.dart";

abstract class UAdminMenuNode {
  List<UMenuEntry> toEntries();
}

class UAdminModule extends UAdminMenuNode {
  UAdminModule({required this.id, required this.title, required this.icon, required this.page, this.selectedIcon, this.tabTitle, this.roles});

  final String id;
  final String Function() title;
  final IconData icon;
  final IconData? selectedIcon;
  final Widget Function() page;
  final String Function()? tabTitle;
  final List<TagUser>? roles;

  bool get visible => UAdmin.canAccess(roles);

  UMenuItem toItem() => UMenuItem(id: id, title: title(), icon: icon, selectedIcon: selectedIcon, onTap: () => U.addOrSwitchTab((tabTitle ?? title)(), page()));

  @override
  List<UMenuEntry> toEntries() => visible ? <UMenuEntry>[toItem()] : <UMenuEntry>[];
}

class UAdminGroup extends UAdminMenuNode {
  UAdminGroup({required this.id, required this.title, required this.icon, required this.modules, this.header});

  final String id;
  final String Function() title;
  final IconData icon;
  final String Function()? header;
  final List<UAdminModule> modules;

  @override
  List<UMenuEntry> toEntries() {
    final List<UAdminModule> shown = modules.where((UAdminModule m) => m.visible).toList();
    if (shown.isEmpty) return <UMenuEntry>[];
    return <UMenuEntry>[
      if (header != null) UMenuHeader(header!()),
      UMenuGroup(id: id, title: title(), icon: icon, children: shown.map((UAdminModule m) => m.toItem()).toList()),
    ];
  }
}

class UAdminSection extends UAdminMenuNode {
  UAdminSection({required this.header, required this.modules});

  final String Function() header;
  final List<UAdminModule> modules;

  @override
  List<UMenuEntry> toEntries() {
    final List<UAdminModule> shown = modules.where((UAdminModule m) => m.visible).toList();
    if (shown.isEmpty) return <UMenuEntry>[];
    return <UMenuEntry>[UMenuHeader(header()), ...shown.map((UAdminModule m) => m.toItem())];
  }
}

abstract class UAdminModules {
  static UAdminModule financialOpsDashboard({List<TagUser>? roles}) => UAdminModule(
    id: "paymentDashboard",
    title: () => "${U.s.financialOpsDashboard} ⚡",
    icon: Icons.account_balance_wallet_rounded,
    page: () => const FinancialOpsDashboardPage(),
    roles: roles,
  );

  static UAdminModule propertyDashboard({List<TagUser>? roles}) => UAdminModule(
    id: "hotelDashboard",
    title: () => "${U.s.propertyDashboard} ⚡",
    icon: Icons.apartment_rounded,
    page: () => const HotelDashboardPage(),
    roles: roles,
  );

  static UAdminModule hotels({List<TagUser>? roles}) => UAdminModule(id: "hotels", title: () => U.s.hotels, icon: Icons.apartment_rounded, page: () => const HotelPage(), roles: roles);

  static UAdminModule hotelRooms({List<TagUser>? roles}) => UAdminModule(id: "hotel-rooms", title: () => U.s.hotelRooms, icon: Icons.meeting_room_rounded, page: () => const HotelRoomPage(), roles: roles);

  static UAdminModule reservations({List<TagUser>? roles}) => UAdminModule(id: "reservations", title: () => U.s.reservations, icon: Icons.event_available_rounded, page: () => const ReservationPage(), roles: roles);

  static UAdminGroup hotelGroup({List<TagUser>? roles}) => UAdminGroup(
    id: "hotel-group",
    header: () => U.s.accommodation.toUpperCase(),
    title: () => U.s.hotels,
    icon: Icons.apartment_outlined,
    modules: <UAdminModule>[
      hotels(roles: roles),
      hotelRooms(roles: roles),
      reservations(roles: roles),
    ],
  );

  static UAdminModule dorms({List<TagUser>? roles}) => UAdminModule(id: "dorm-list", title: () => U.s.dorms, icon: Icons.bedroom_parent_rounded, page: () => const DormPage(), roles: roles);

  static UAdminModule dormRooms({List<TagUser>? roles}) => UAdminModule(id: "dorm-rooms", title: () => U.s.dormRooms, icon: Icons.meeting_room_rounded, page: () => const DormRoomPage(), roles: roles);

  static UAdminModule dormBeds({List<TagUser>? roles}) => UAdminModule(id: "dorm-beds", title: () => U.s.beds, icon: Icons.bed_rounded, page: () => const DormBedPage(), roles: roles);

  static UAdminGroup dormGroup({List<TagUser>? roles}) => UAdminGroup(
    id: "dorm-group",
    title: () => U.s.dorms,
    icon: Icons.bedroom_parent_outlined,
    modules: <UAdminModule>[
      dorms(roles: roles),
      dormRooms(roles: roles),
      dormBeds(roles: roles),
    ],
  );

  static UAdminModule contracts({List<TagUser>? roles}) => UAdminModule(id: "contracts", title: () => U.s.contracts, icon: Icons.description_rounded, page: () => const ContractPage(), roles: roles);

  static UAdminModule invoices({List<TagUser>? roles}) => UAdminModule(id: "invoices", title: () => U.s.invoices, icon: Icons.receipt_long_rounded, page: () => const InvoicePage(), roles: roles);

  static UAdminGroup leasingGroup({List<TagUser>? roles}) => UAdminGroup(
    id: "leasing-group",
    header: () => U.s.leasing.toUpperCase(),
    title: () => U.s.leasing,
    icon: Icons.assignment_outlined,
    modules: <UAdminModule>[
      contracts(roles: roles),
      invoices(roles: roles),
    ],
  );

  static UAdminModule users({List<TagUser>? roles}) => UAdminModule(
    id: "users",
    title: () => U.s.users,
    icon: Icons.person_rounded,
    page: () => UserPage(args: UAdminUsersPageArgs()),
    roles: roles,
  );

  static UAdminGroup usersGroup({List<TagUser>? roles}) => UAdminGroup(
    id: "users-group",
    header: () => U.s.users.toUpperCase(),
    title: () => U.s.users,
    icon: Icons.people_outline_rounded,
    modules: <UAdminModule>[users(roles: roles)],
  );

  static UAdminModule adminUsers({List<TagUser>? roles}) => UAdminModule(id: "admin-users", title: () => U.s.users, tabTitle: () => U.s.usersManagement, icon: Icons.manage_accounts_rounded, page: () => const AdminUsersPage(), roles: roles);

  static UAdminModule merchants({List<TagUser>? roles}) => UAdminModule(id: "merchants", title: () => U.s.merchants, tabTitle: () => U.s.merchantsManagement, icon: Icons.storefront_rounded, page: () => const MerchantsPage(), roles: roles);

  static UAdminModule terminals({List<TagUser>? roles}) => UAdminModule(id: "terminals", title: () => U.s.terminals, tabTitle: () => U.s.terminalsManagement, icon: Icons.point_of_sale_rounded, page: () => const TerminalsPage(), roles: roles);

  static UAdminGroup paymentsGroup({List<TagUser>? roles}) => UAdminGroup(
    id: "payments-group",
    header: () => U.s.payments.toUpperCase(),
    title: () => U.s.payments,
    icon: Icons.account_balance_wallet_outlined,
    modules: <UAdminModule>[
      adminUsers(roles: roles),
      merchants(roles: roles),
      terminals(roles: roles),
    ],
  );

  static UAdminModule wallet({List<TagUser>? roles}) => UAdminModule(id: "wallet", title: () => U.s.wallets, tabTitle: () => U.s.walletManagement, icon: Icons.account_balance_wallet_rounded, page: () => const WalletPage(), roles: roles);

  static UAdminModule transactions({List<TagUser>? roles}) => UAdminModule(id: "transactions", title: () => U.s.transactions, icon: Icons.swap_horiz_rounded, page: () => const TransactionsPage(), roles: roles);

  static UAdminModule accounting({List<TagUser>? roles}) => UAdminModule(id: "accounting", title: () => U.s.accounting, icon: Icons.bar_chart_rounded, page: () => const AccountingPage(), roles: roles);

  static UAdminGroup financeGroup({List<TagUser>? roles}) => UAdminGroup(
    id: "finance-group",
    header: () => U.s.finance.toUpperCase(),
    title: () => U.s.finance,
    icon: Icons.account_balance_outlined,
    modules: <UAdminModule>[
      wallet(roles: roles),
      transactions(roles: roles),
      accounting(roles: roles),
    ],
  );

  static UAdminModule blogs({List<TagUser>? roles}) => UAdminModule(id: "blogs", title: () => U.s.blogs, icon: Icons.article_rounded, page: () => const BlogPage(), roles: roles);

  static UAdminModule contents({List<TagUser>? roles}) => UAdminModule(id: "contents", title: () => U.s.content, icon: Icons.content_copy, selectedIcon: Icons.content_copy_outlined, page: () => const ContentsPage(), roles: roles);

  static UAdminSection contentSection({List<TagUser>? roles}) => UAdminSection(
    header: () => U.s.content.toUpperCase(),
    modules: <UAdminModule>[
      blogs(roles: roles),
      contents(roles: roles),
    ],
  );

  static UAdminModule settings({List<TagUser>? roles}) => UAdminModule(id: "settings", title: () => U.s.settings, icon: Icons.settings_rounded, page: () => const AdminSettingsPage(), roles: roles);

  static UAdminModule apiLogs({List<TagUser>? roles}) => UAdminModule(id: "api-logs", title: () => U.s.apiRequestLogs, icon: Icons.travel_explore_rounded, page: () => const ApiLogPage(), roles: roles);

  static UAdminSection systemSection({List<TagUser>? roles}) => UAdminSection(
    header: () => U.s.settings.toUpperCase(),
    modules: <UAdminModule>[
      settings(roles: roles),
      apiLogs(roles: roles),
    ],
  );
}
