part of "u_admin.dart";

// ---------------------------------------------------------------------------
// Configurable per-row operations. Every list row's "operations" popup (edit,
// delete, and cross-page navigation) is composed from an app-supplied action
// list, so a project decides exactly what an admin can do/reach from each row.
// ---------------------------------------------------------------------------

// One row operation: a navigation or CRUD action shown in the row's popup menu.
class UAdminAction {
  UAdminAction({
    required this.id,
    required this.label,
    required this.icon,
    required this.onTap,
    this.roles,
    this.visible = true,
    this.destructive = false,
    this.color,
  });

  final String id;
  final String Function() label;
  final IconData icon;
  final VoidCallback onTap;
  final List<TagUser>? roles;

  // Data-driven visibility (e.g. only show "pay" on unpaid invoices).
  final bool visible;

  // Red styling for destructive actions like delete.
  final bool destructive;
  final Color? color;

  bool get allowed => visible && UAdmin.canAccess(roles);
}

// Callbacks a list page exposes so config actions can trigger its dialogs / controller.
class UAdminActionHandlers<T> {
  UAdminActionHandlers({this.onEdit, this.onDelete, this.onDetail, this.extras});

  final void Function(T item)? onEdit;
  final void Function(T item)? onDelete;
  final void Function(T item)? onDetail;

  // Entity-specific handlers keyed by name (e.g. "publish", "pay", "comments", "supportPassword").
  final Map<String, void Function(T item)>? extras;
}

// Passed to each entity's action builder: the row item plus convenience factories
// that wire common CRUD actions to the page's handlers.
class UAdminActionContext<T> {
  UAdminActionContext(this.item, this._handlers);

  final T item;
  final UAdminActionHandlers<T> _handlers;

  UAdminAction edit({List<TagUser>? roles}) => UAdminAction(id: "edit", label: () => U.s.edit, icon: Icons.edit, roles: roles, onTap: () => _handlers.onEdit?.call(item));

  UAdminAction delete({List<TagUser>? roles}) => UAdminAction(id: "delete", label: () => U.s.delete, icon: Icons.delete, destructive: true, roles: roles, onTap: () => _handlers.onDelete?.call(item));

  UAdminAction detail({String Function()? label, IconData icon = Icons.info_outline, List<TagUser>? roles}) => UAdminAction(id: "detail", label: label ?? () => U.s.viewDetails, icon: icon, roles: roles, onTap: () => _handlers.onDetail?.call(item));

  // A page-specific handler (publish, pay, ...). [key] must match a key in [UAdminActionHandlers.extras].
  UAdminAction extra(
    String key, {
    required String Function() label,
    required IconData icon,
    bool destructive = false,
    bool visible = true,
    Color? color,
    List<TagUser>? roles,
  }) => UAdminAction(id: key, label: label, icon: icon, destructive: destructive, visible: visible, color: color, roles: roles, onTap: () => _handlers.extras?[key]?.call(item));
}

typedef UAdminActionBuilder<T> = List<UAdminAction> Function(UAdminActionContext<T> ctx);

// The app's per-entity action registry. Opt-in: an entity with no builder shows no operations.
class UAdminActions {
  UAdminActions({
    UAdminActionBuilder<UUserResponse>? users,
    UAdminActionBuilder<UUserResponse>? adminUsers,
    UAdminActionBuilder<UMerchantResponse>? merchants,
    UAdminActionBuilder<UTerminalResponse>? terminals,
    UAdminActionBuilder<UHotelResponse>? hotels,
    UAdminActionBuilder<UHotelRoomResponse>? hotelRooms,
    UAdminActionBuilder<UHotelReservationResponse>? reservations,
    UAdminActionBuilder<UDormResponse>? dorms,
    UAdminActionBuilder<UDormRoomResponse>? dormRooms,
    UAdminActionBuilder<UDormBedResponse>? dormBeds,
    UAdminActionBuilder<UDormBedContractResponse>? contracts,
    UAdminActionBuilder<UDormBedInvoiceResponse>? invoices,
    UAdminActionBuilder<UBlogResponse>? blogs,
    UAdminActionBuilder<UContentResponse>? contents,
    UAdminActionBuilder<UTxnResponse>? transactions,
  }) : _builders = <String, Function>{
         if (users != null) "users": users,
         if (adminUsers != null) "adminUsers": adminUsers,
         if (merchants != null) "merchants": merchants,
         if (terminals != null) "terminals": terminals,
         if (hotels != null) "hotels": hotels,
         if (hotelRooms != null) "hotelRooms": hotelRooms,
         if (reservations != null) "reservations": reservations,
         if (dorms != null) "dorms": dorms,
         if (dormRooms != null) "dormRooms": dormRooms,
         if (dormBeds != null) "dormBeds": dormBeds,
         if (contracts != null) "contracts": contracts,
         if (invoices != null) "invoices": invoices,
         if (blogs != null) "blogs": blogs,
         if (contents != null) "contents": contents,
         if (transactions != null) "transactions": transactions,
       };

  final Map<String, Function> _builders;

  // Builds the (ungated) action list for [entity]/[item]; returns empty when unconfigured.
  List<UAdminAction> build<T>(String entity, T item, UAdminActionHandlers<T> handlers) {
    final Function? builder = _builders[entity];
    if (builder == null) return <UAdminAction>[];
    return (builder as UAdminActionBuilder<T>)(UAdminActionContext<T>(item, handlers));
  }
}

// Renders a row's "operations" popup from the configured actions (role + visibility gated).
abstract class UAdminOps {
  static Widget menu<T>(BuildContext context, {required String entity, required T item, required UAdminActionHandlers<T> handlers}) {
    final List<UAdminAction> shown = (UAdmin.config.actions?.build<T>(entity, item, handlers) ?? <UAdminAction>[]).where((UAdminAction a) => a.allowed).toList();
    if (shown.isEmpty) return const SizedBox.shrink();
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => shown.map((UAdminAction a) {
        final Color? color = a.destructive ? Theme.of(context).colorScheme.error : a.color;
        return PopupMenuItem<String>(
          onTap: a.onTap,
          child: UIconTextHorizontal(
            leading: Icon(a.icon, size: 20, color: color),
            trailing: Text(a.label(), style: color == null ? null : TextStyle(color: color)),
          ),
        );
      }).toList(),
    );
  }
}

// ---------------------------------------------------------------------------
// Navigation catalog: ready-made cross-page links used inside action builders so
// an admin can jump between related records ("navigate everywhere from everywhere").
// ---------------------------------------------------------------------------

abstract class UAdminLinks {
  // ---- from a user ----
  static UAdminAction adminUserDetail(UUserResponse u, {List<TagUser>? roles}) => UAdminAction(
    id: "user-detail",
    label: () => U.s.viewDetails,
    icon: Icons.visibility_outlined,
    roles: roles,
    onTap: () => PageSwitcher.adminUserDetail(user: u),
  );

  static UAdminAction hotelUserDetail(UUserResponse u, {List<TagUser>? roles}) => UAdminAction(
    id: "user-detail",
    label: () => U.s.details,
    icon: Icons.badge_outlined,
    roles: roles,
    onTap: () => PageSwitcher.hotelUserDetail(user: u),
  );

  static UAdminAction userMerchants(UUserResponse u, {List<TagUser>? roles}) => UAdminAction(
    id: "user-merchants",
    label: () => U.s.merchants,
    icon: Icons.storefront_outlined,
    roles: roles,
    onTap: () => PageSwitcher.merchants(user: u),
  );

  static UAdminAction userContracts(UUserResponse u, {List<TagUser>? roles}) => UAdminAction(
    id: "user-contracts",
    label: () => U.s.contracts,
    icon: Icons.description_outlined,
    roles: roles,
    onTap: () => PageSwitcher.contracts(user: u),
  );

  // ---- from a merchant ----
  static UAdminAction merchantTerminals(UMerchantResponse m, {List<TagUser>? roles}) => UAdminAction(
    id: "merchant-terminals",
    label: () => U.s.viewTerminals,
    icon: Icons.point_of_sale_outlined,
    roles: roles,
    onTap: () => PageSwitcher.terminals(merchant: m),
  );

  // ---- from a hotel / room ----
  static UAdminAction hotelRooms(UHotelResponse h, {List<TagUser>? roles}) => UAdminAction(
    id: "hotel-rooms",
    label: () => U.s.rooms,
    icon: Icons.meeting_room_outlined,
    roles: roles,
    onTap: () => PageSwitcher.hotelRooms(hotel: h),
  );

  static UAdminAction hotelReservations(UHotelResponse h, {List<TagUser>? roles}) => UAdminAction(
    id: "hotel-reservations",
    label: () => U.s.reservations,
    icon: Icons.event_available_outlined,
    roles: roles,
    onTap: () => PageSwitcher.reservations(hotel: h),
  );

  static UAdminAction roomReservations(UHotelRoomResponse r, {List<TagUser>? roles}) => UAdminAction(
    id: "room-reservations",
    label: () => U.s.reservations,
    icon: Icons.event_available_outlined,
    roles: roles,
    onTap: () => PageSwitcher.reservations(room: r),
  );

  // ---- from a dorm / room / bed ----
  static UAdminAction dormRooms(UDormResponse d, {List<TagUser>? roles}) => UAdminAction(
    id: "dorm-rooms",
    label: () => U.s.room,
    icon: Icons.meeting_room_outlined,
    roles: roles,
    onTap: () => PageSwitcher.dormRooms(dorm: d),
  );

  static UAdminAction dormBeds(UDormResponse d, {List<TagUser>? roles}) => UAdminAction(
    id: "dorm-beds",
    label: () => U.s.beds,
    icon: Icons.bed_outlined,
    roles: roles,
    onTap: () => PageSwitcher.dormBeds(dorm: d),
  );

  static UAdminAction roomBeds(UDormRoomResponse r, {List<TagUser>? roles}) => UAdminAction(
    id: "room-beds",
    label: () => U.s.beds,
    icon: Icons.bed_outlined,
    roles: roles,
    onTap: () => PageSwitcher.dormBeds(room: r),
  );

  static UAdminAction bedContracts(UDormBedResponse b, {List<TagUser>? roles}) => UAdminAction(
    id: "bed-contracts",
    label: () => U.s.contracts,
    icon: Icons.description_outlined,
    roles: roles,
    onTap: () => PageSwitcher.contracts(bed: b),
  );

  // ---- from a contract ----
  static UAdminAction contractInvoices(UDormBedContractResponse c, {List<TagUser>? roles}) => UAdminAction(
    id: "contract-invoices",
    label: () => U.s.viewInvoices,
    icon: Icons.receipt_long_outlined,
    roles: roles,
    onTap: () => PageSwitcher.invoices(contract: c),
  );

  static UAdminAction contractTenant(UUserResponse u, {List<TagUser>? roles}) => UAdminAction(
    id: "contract-tenant",
    label: () => U.s.tenant,
    icon: Icons.person_outline,
    roles: roles,
    onTap: () => PageSwitcher.hotelUserDetail(user: u),
  );
}
