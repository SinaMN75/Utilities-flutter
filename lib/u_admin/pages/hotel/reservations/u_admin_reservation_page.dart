import "package:u/utilities.dart";

class UAdminReservationPage extends StatefulWidget {
  const UAdminReservationPage({this.hotel, this.room, super.key});

  final UHotelResponse? hotel;
  final UHotelRoomResponse? room;

  @override
  State<UAdminReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<UAdminReservationPage> {
  final UAdminReservationController c = UAdminReservationController();

  @override
  void initState() {
    c.init(hotel: widget.hotel, room: widget.room);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(
        widget.room != null
            ? "${U.s.reservations} · ${widget.room!.title}"
            : widget.hotel != null
            ? "${U.s.reservations} · ${widget.hotel!.title}"
            : U.s.reservations,
      ),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog),
        if (U.user.hasPermission(TagUser.permissionManageReservations)) IconButton(icon: const Icon(Icons.add), tooltip: U.s.createReservation, onPressed: _showEditDialog),
      ],
    ),
    body: Column(
      children: <Widget>[
        _list().expanded(),
        Obx(
          () => UNumberPagination(
            currentPage: c.pageNumber.value,
            totalPages: c.totalPages.value,
            onPageChanged: (int page) {
              c.pageNumber(page);
              c.read();
            },
          ).pOnly(bottom: 16, top: 8),
        ),
      ],
    ),
  );

  String _statusFilterLabel(UAdminReservationStatusFilter f) {
    switch (f) {
      case UAdminReservationStatusFilter.all:
        return U.s.all;
      case UAdminReservationStatusFilter.pending:
        return U.s.pending;
      case UAdminReservationStatusFilter.confirmed:
        return U.s.confirmed;
      case UAdminReservationStatusFilter.checkedIn:
        return U.s.checkedIn;
      case UAdminReservationStatusFilter.checkedOut:
        return U.s.checkedOut;
      case UAdminReservationStatusFilter.cancelled:
        return U.s.cancelled;
    }
  }

  Color _statusColor(TagHotelReservation? s) {
    switch (s) {
      case TagHotelReservation.confirmed:
      case TagHotelReservation.checkedIn:
        return UAdminAppColors.green;
      case TagHotelReservation.cancelled:
      case TagHotelReservation.noShow:
        return UAdminAppColors.red;
      case TagHotelReservation.checkedOut:
        return UAdminAppColors.blue;
      case TagHotelReservation.pending:
      case null:
        return UAdminAppColors.orange;
    }
  }

  Widget _statusChip(UHotelReservationResponse i) {
    final TagHotelReservation? s = i.status;
    final Color color = _statusColor(s);
    return UContainer(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      radius: 20,
      color: color.withValues(alpha: 0.15),
      child: UTextBodySmall(s == null ? "-" : (c.isFa ? s.titleFa : s.titleEn), color: color),
    );
  }

  Widget _list() => Obx(() {
    if (c.state.isError()) return Center(child: Text(U.s.errorReadingData));
    if (c.state.isEmpty()) return Center(child: Text(U.s.noReservationsFound));
    if (!c.state.isLoaded()) return const Center(child: CircularProgressIndicator());
    if (MediaQuery.sizeOf(context).width >= 900) {
      return UListView(
        header: URow(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            UTextBodyLarge(U.s.guest, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.rooms, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.checkInDate, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.checkOutDate, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.totalPrice, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.status, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.operations, color: UAdminAppColors.white, textAlign: .center).expanded(),
          ],
        ),
        itemBuilder: (BuildContext context, int index) => _itemDesktop(i: c.list[index], index: index),
        itemCount: c.list.length,
      );
    }
    return UListView(
      itemBuilder: (BuildContext context, int index) => _itemResponsive(i: c.list[index], index: index),
      itemCount: c.list.length,
    );
  });

  String _guestLabel(UHotelReservationResponse i) => i.user?.displayName ?? i.jsonData.guestName ?? "-";

  String _roomLabel(UHotelReservationResponse i) => i.room?.title ?? widget.room?.title ?? "-";

  Widget _itemDesktop({required UHotelReservationResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? UAdminAppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium(_guestLabel(i), textAlign: .center).expanded(),
      UTextBodyMedium(_roomLabel(i), textAlign: .center).expanded(),
      UTextBodyMedium(i.checkInDate.toJalaliDate(), textAlign: .center).expanded(),
      UTextBodyMedium(i.checkOutDate.toJalaliDate(), textAlign: .center).expanded(),
      UTextBodyMedium(i.totalPrice.rial(), textAlign: .center).expanded(),
      Center(child: _statusChip(i)).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UHotelReservationResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.event_available_rounded),
      title: UTextBodyMedium(_guestLabel(i)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UTextBodyMedium("${U.s.rooms}: ${_roomLabel(i)}"),
          UTextBodySmall("${i.checkInDate.toJalaliDate()} → ${i.checkOutDate.toJalaliDate()} • ${i.jsonData.nightCount ?? 0} ${U.s.nights}"),
          UTextBodySmall("${U.s.totalPrice}: ${i.totalPrice.rial()} • ${U.s.guests}: ${i.guestCount}"),
          _statusChip(i),
        ],
      ),
      trailing: _menu(i),
    ),
  );

  Widget _menu(UHotelReservationResponse i) {
    final TagHotelReservation? s = i.status;
    final UHotelInvoiceResponse? unpaid = c.unpaidInvoiceOf(i);
    final bool canManage = U.user.hasPermission(TagUser.permissionManageReservations);
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        if (i.user != null)
          PopupMenuItem<String>(
            child: UIconTextHorizontal(leading: const Icon(Icons.person_outline, size: 20), trailing: Text(U.s.guest)),
            onTap: () => UAdminPageSwitcher.hotelUserDetail(user: i.user!),
          ),
        if (canManage && s == TagHotelReservation.pending)
          PopupMenuItem<String>(
            child: UIconTextHorizontal(leading: const Icon(Icons.check_circle_outline, size: 20), trailing: Text(U.s.confirm)),
            onTap: () => c.confirm(i),
          ),
        if (canManage && s == TagHotelReservation.confirmed)
          PopupMenuItem<String>(
            child: UIconTextHorizontal(leading: const Icon(Icons.login_rounded, size: 20), trailing: Text(U.s.checkIn)),
            onTap: () => c.checkIn(i),
          ),
        if (canManage && s == TagHotelReservation.checkedIn)
          PopupMenuItem<String>(
            child: UIconTextHorizontal(leading: const Icon(Icons.logout_rounded, size: 20), trailing: Text(U.s.checkOut)),
            onTap: () => c.checkOut(i),
          ),
        if (canManage && (s == TagHotelReservation.pending || s == TagHotelReservation.confirmed))
          PopupMenuItem<String>(
            child: UIconTextHorizontal(leading: const Icon(Icons.cancel_outlined, size: 20), trailing: Text(U.s.cancel)),
            onTap: () => c.cancel(i),
          ),
        if (U.user.hasPermission(TagUser.permissionPayInvoices) && unpaid != null)
          PopupMenuItem<String>(
            child: UIconTextHorizontal(leading: const Icon(Icons.payments_outlined, size: 20), trailing: Text("${U.s.pay} · ${unpaid.netDue.rial()}")),
            onTap: () => c.payInvoice(unpaid),
          ),
        if (canManage)
          PopupMenuItem<String>(
            child: UIconTextHorizontal(leading: const Icon(Icons.edit, size: 20), trailing: Text(U.s.edit)),
            onTap: () => _showEditDialog(p: i),
          ),
        if (U.user.hasPermission(TagUser.permissionDeleteReservations))
          PopupMenuItem<String>(
            child: UIconTextHorizontal(
              leading: Icon(Icons.delete, color: Theme.of(context).colorScheme.error, size: 20),
              trailing: Text(U.s.delete, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ),
            onTap: () => c.delete(i),
          ),
      ],
    );
  }

  void _showFilterDialog() {
    final TextEditingController checkInCtrl = TextEditingController(text: c.checkInFilter?.toJalaliDate());
    final TextEditingController checkOutCtrl = TextEditingController(text: c.checkOutFilter?.toJalaliDate());

    UNavigator.dialog(
      AlertDialog(
        title: Text(U.s.filterReservations),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setLocal) => Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                UTextField(controller: c.guestFilter, labelText: U.s.guest).pSymmetric(vertical: 6),
                if (widget.hotel == null && widget.room == null)
                  UTextFieldAutoCompleteAsync<UHotelResponse>(
                    labelBuilder: (UHotelResponse i) => i.title,
                    onChanged: (UHotelResponse? i) => setLocal(() => c.hotelFilter = i),
                    selectedItem: c.hotelFilter,
                    fetchData: c.readHotels,
                    hintText: U.s.hotel,
                  ).pSymmetric(vertical: 6),
                DropdownButtonFormField<UAdminReservationStatusFilter>(
                  isExpanded: true,
                  initialValue: c.statusFilter,
                  decoration: InputDecoration(labelText: U.s.status, border: const OutlineInputBorder()),
                  items: UAdminReservationStatusFilter.values.map((UAdminReservationStatusFilter f) => DropdownMenuItem<UAdminReservationStatusFilter>(value: f, child: Text(_statusFilterLabel(f)))).toList(),
                  onChanged: (UAdminReservationStatusFilter? v) => setLocal(() => c.statusFilter = v ?? UAdminReservationStatusFilter.all),
                ).pSymmetric(vertical: 6),
                UTextFieldDatePicker(
                  controller: checkInCtrl,
                  labelText: U.s.checkInDate,
                  jalali: true,
                  initialDate: c.checkInFilter,
                  onChange: (DateTime d, Jalali j) {
                    c.checkInFilter = d;
                    checkInCtrl.text = d.toJalaliDate();
                  },
                ).pSymmetric(vertical: 6),
                UTextFieldDatePicker(
                  controller: checkOutCtrl,
                  labelText: U.s.checkOutDate,
                  jalali: true,
                  initialDate: c.checkOutFilter,
                  onChange: (DateTime d, Jalali j) {
                    c.checkOutFilter = d;
                    checkOutCtrl.text = d.toJalaliDate();
                  },
                ).pSymmetric(vertical: 6),
                const SizedBox(height: 20),
                UButtonSubmitCancel(
                  submitTitle: U.s.filter,
                  cancelTitle: U.s.clearFilters,
                  onSubmit: () {
                    c.applyFilters();
                    UNavigator.back();
                  },
                  onCancel: () {
                    c.clearFilters();
                    UNavigator.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditDialog({UHotelReservationResponse? p}) {
    final bool isEdit = p != null;
    final TextEditingController guestCount = TextEditingController(text: (p?.guestCount ?? 1).toString());
    final TextEditingController totalPrice = TextEditingController(text: p?.totalPrice.toInt().toString());
    final TextEditingController penalty = TextEditingController();
    final TextEditingController guestName = TextEditingController(text: p?.jsonData.guestName);
    final TextEditingController guestPhone = TextEditingController(text: p?.jsonData.guestPhone);
    final TextEditingController notes = TextEditingController(text: p?.jsonData.notes);
    final TextEditingController checkInCtrl = TextEditingController(text: p == null ? null : p.checkInDate.toJalaliDate());
    final TextEditingController checkOutCtrl = TextEditingController(text: p == null ? null : p.checkOutDate.toJalaliDate());

    final Rxn<UHotelRoomResponse> room = Rxn<UHotelRoomResponse>();
    final Rxn<UUserResponse> user = Rxn<UUserResponse>();
    DateTime? checkIn = p?.checkInDate;
    DateTime? checkOut = p?.checkOutDate;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    UNavigator.dialog(
      AlertDialog(
        title: Text(isEdit ? U.s.editReservation : U.s.createReservation),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setLocal) => Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!isEdit && widget.room == null)
                    UTextFieldAutoCompleteAsync<UHotelRoomResponse>(
                      labelBuilder: (UHotelRoomResponse i) => "${i.title} · ${i.pricePerNight.rial()}",
                      onChanged: room.call,
                      selectedItem: room.value,
                      fetchData: c.readRooms,
                      hintText: U.s.rooms,
                    ).pSymmetric(vertical: 6),
                  if (!isEdit)
                    UTextFieldAutoCompleteAsync<UUserResponse>(
                      labelBuilder: (UUserResponse i) => i.phoneNumber == null ? i.displayName : "${i.displayName} · ${i.phoneNumber}",
                      onChanged: user.call,
                      selectedItem: user.value,
                      fetchData: c.readUsers,
                      hintText: U.s.guest,
                    ).pSymmetric(vertical: 6),
                  UTextFieldDatePicker(
                    controller: checkInCtrl,
                    labelText: U.s.checkInDate,
                    jalali: true,
                    initialDate: checkIn,
                    validator: UValidators.required(message: ""),
                    onChange: (DateTime d, Jalali j) {
                      checkIn = d;
                      checkInCtrl.text = d.toJalaliDate();
                    },
                  ).pSymmetric(vertical: 6),
                  UTextFieldDatePicker(
                    controller: checkOutCtrl,
                    labelText: U.s.checkOutDate,
                    jalali: true,
                    initialDate: checkOut,
                    validator: UValidators.required(message: ""),
                    onChange: (DateTime d, Jalali j) {
                      checkOut = d;
                      checkOutCtrl.text = d.toJalaliDate();
                    },
                  ).pSymmetric(vertical: 6),
                  UTextField(
                    controller: guestCount,
                    labelText: U.s.guestCount,
                    keyboardType: TextInputType.number,
                    validator: UValidators.required(message: ""),
                  ).pSymmetric(vertical: 6),
                  UTextField(controller: totalPrice, labelText: U.s.totalPrice, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
                  UTextField(controller: guestName, labelText: U.s.guestName).pSymmetric(vertical: 6),
                  UTextField(controller: guestPhone, labelText: U.s.guestPhone, keyboardType: TextInputType.phone).pSymmetric(vertical: 6),
                  if (!isEdit) UTextField(controller: penalty, labelText: U.s.dailyPenalty, keyboardType: TextInputType.number).pSymmetric(vertical: 6),
                  UTextField(controller: notes, labelText: U.s.notes, lines: 2).pSymmetric(vertical: 6),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        if (checkIn == null || checkOut == null) {
                          UToast.error(message: U.s.errorSubmittingForm);
                          return;
                        }
                        if (isEdit) {
                          c.update(
                            p: UHotelReservationUpdateParams(
                              id: p.id,
                              checkInDate: checkIn,
                              checkOutDate: checkOut,
                              guestCount: guestCount.text.isEmpty ? null : guestCount.numInt(),
                              totalPrice: totalPrice.text.isEmpty ? null : totalPrice.numDouble(),
                              guestName: guestName.text.nullIfEmpty(),
                              guestPhone: guestPhone.text.nullIfEmpty(),
                              notes: notes.text.nullIfEmpty(),
                            ),
                          );
                        } else {
                          final String? rid = room.value?.id ?? widget.room?.id;
                          if (rid == null) {
                            UToast.error(message: U.s.selectARoom);
                            return;
                          }
                          if (user.value?.id == null) {
                            UToast.error(message: U.s.selectAUser);
                            return;
                          }
                          c.create(
                            p: UHotelReservationCreateParams(
                              tags: <int>[TagHotelReservation.pending.number],
                              checkInDate: checkIn!,
                              checkOutDate: checkOut!,
                              guestCount: guestCount.text.isEmpty ? 1 : guestCount.numInt(),
                              userId: user.value!.id,
                              roomId: rid,
                              totalPrice: totalPrice.text.isEmpty ? null : totalPrice.numDouble(),
                              guestName: guestName.text.nullIfEmpty(),
                              guestPhone: guestPhone.text.nullIfEmpty(),
                              notes: notes.text.nullIfEmpty(),
                              penaltyPrecentEveryDate: penalty.text.isEmpty ? null : penalty.text.toInt(),
                            ),
                          );
                        }
                        UNavigator.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
