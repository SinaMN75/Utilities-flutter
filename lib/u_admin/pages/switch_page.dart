import "package:u/utilities.dart";

abstract class PageSwitcher {
  static void financialOpsDashboard() => U.addOrSwitchTab("${U.s.financialOpsDashboard} ⚡", const FinancialOpsDashboardPage());

  static void propertyDashboard() => U.addOrSwitchTab("${U.s.propertyDashboard} ⚡", const HotelDashboardPage());

  static void contents() => U.addOrSwitchTab(U.s.content, const ContentsPage());

  static void blogs() => U.addOrSwitchTab(U.s.blogs, const BlogPage());

  static void users({required UAdminUsersPageArgs args}) => U.addOrSwitchTab(U.s.users, UserPage(args: args));

  static void hotelUserDetail({required UUserResponse user}) => U.addOrSwitchTab("${user.firstName ?? ""} ${user.lastName ?? ""}".trim().nullIfEmpty() ?? user.userName, HotelUserDetailPage(user: user));

  static void adminUsers() => U.addOrSwitchTab(U.s.usersManagement, const AdminUsersPage());

  static void adminUserDetail({required UUserResponse user}) => U.addOrSwitchTab("${user.firstName ?? ""} ${user.lastName ?? ""}".trim().nullIfEmpty() ?? user.userName, AdminUserDetailPage(user: user));

  static void merchants({UUserResponse? user}) => U.addOrSwitchTab(
    user == null ? U.s.merchantsManagement : "${U.s.merchants} · ${user.displayName}",
    MerchantsPage(user: user),
  );

  static void terminals({UMerchantResponse? merchant}) => U.addOrSwitchTab(merchant == null ? U.s.terminalsManagement : "${U.s.terminals} · ${merchant.title}", TerminalsPage(merchant: merchant));

  static void hotels() => U.addOrSwitchTab(U.s.hotels, const HotelPage());

  static void hotelRooms({UHotelResponse? hotel}) => U.addOrSwitchTab(hotel == null ? U.s.hotelRooms : "${U.s.rooms} · ${hotel.title}", HotelRoomPage(hotel: hotel));

  static void reservations({UHotelResponse? hotel, UHotelRoomResponse? room}) => U.addOrSwitchTab(
    room != null
        ? "${U.s.reservations} · ${room.title}"
        : hotel != null
        ? "${U.s.reservations} · ${hotel.title}"
        : U.s.reservations,
    ReservationPage(hotel: hotel, room: room),
  );

  static void dormList() => U.addOrSwitchTab(U.s.dorms, const DormPage());

  static void dormRooms({UDormResponse? dorm}) => U.addOrSwitchTab(dorm == null ? U.s.dormRooms : "${U.s.rooms} · ${dorm.title}", DormRoomPage(dorm: dorm));

  static void dormBeds({UDormRoomResponse? room, UDormResponse? dorm}) => U.addOrSwitchTab(
    room != null
        ? "${U.s.beds} · ${room.title}"
        : dorm != null
        ? "${U.s.beds} · ${dorm.title}"
        : U.s.dormBeds,
    DormBedPage(room: room, dorm: dorm),
  );

  static void contracts({UDormBedResponse? bed, UUserResponse? user}) => U.addOrSwitchTab(
    bed != null
        ? "${U.s.contracts} · ${bed.title}"
        : user != null
        ? "${U.s.contracts} · ${user.displayName}"
        : U.s.contracts,
    ContractPage(bed: bed, user: user),
  );

  static void invoices({UDormBedContractResponse? contract}) => U.addOrSwitchTab(contract == null ? U.s.invoices : "${U.s.invoices} · ${contract.user?.displayName ?? ""}", InvoicePage(contract: contract));

  static void wallet() => U.addOrSwitchTab(U.s.walletManagement, const WalletPage());

  static void transactions() => U.addOrSwitchTab(U.s.transactions, const TransactionsPage());

  static void accounting() => U.addOrSwitchTab(U.s.accounting, const AccountingPage());

  static void settings() => U.addOrSwitchTab(U.s.settings, const AdminSettingsPage());

  // New DB-backed API request log explorer (ApiLogService: Search/Detail/Stats).
  static void apiLogs() => U.addOrSwitchTab(U.s.apiRequestLogs, const ApiLogPage());

  static Future<void> userCreateUpdate({UUserResponse? user}) => UserCreateUpdateDialog.show(user: user);
}
