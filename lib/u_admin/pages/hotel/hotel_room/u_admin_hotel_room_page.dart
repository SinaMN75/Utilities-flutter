import "package:u/utilities.dart";

class UAdminHotelRoomPage extends StatefulWidget {
  const UAdminHotelRoomPage({this.hotel, super.key});

  final UHotelResponse? hotel;

  @override
  State<UAdminHotelRoomPage> createState() => _HotelRoomPageState();
}

class _HotelRoomPageState extends State<UAdminHotelRoomPage> {
  final UAdminHotelRoomController c = UAdminHotelRoomController();

  @override
  void initState() {
    c.init(hotel: widget.hotel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(widget.hotel?.title == null ? U.s.hotelRooms : "${U.s.rooms} · ${widget.hotel?.title}"),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog),
        if (U.user.hasPermission(TagUser.permissionManageHotels)) IconButton(icon: const Icon(Icons.add), tooltip: U.s.create, onPressed: _showEditDialog),
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

  Widget _list() => Obx(() {
    if (c.state.isError()) return Center(child: Text(U.s.errorReadingData));
    if (c.state.isEmpty()) return Center(child: Text(U.s.noRoomsFound));
    if (!c.state.isLoaded()) return const Center(child: CircularProgressIndicator());
    if (MediaQuery.sizeOf(context).width >= 800)
      return UListView(
        header: URow(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            UTextBodyLarge(U.s.title, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.hotel, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.capacity, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.priceNight, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.status, color: UAdminAppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.operations, color: UAdminAppColors.white, textAlign: .center).expanded(),
          ],
        ),
        itemBuilder: (BuildContext context, int index) => _itemDesktop(i: c.list[index], index: index),
        itemCount: c.list.length,
      );
    return UListView(
      itemBuilder: (BuildContext context, int index) => _itemResponsive(i: c.list[index], index: index),
      itemCount: c.list.length,
    );
  });

  Widget _itemDesktop({required UHotelRoomResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? UAdminAppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium(i.title, textAlign: .center).expanded(),
      UTextBodyMedium(i.hotel?.title ?? "-", textAlign: .center).expanded(),
      UTextBodyMedium(i.capacity.toString(), textAlign: .center).expanded(),
      UTextBodyMedium(i.pricePerNight.rial(), textAlign: .center).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UHotelRoomResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.meeting_room_rounded),
      title: UTextBodyMedium(i.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UTextBodyMedium("${i.hotel?.title ?? "-"} • ${U.s.capacity}: ${i.capacity}"),
          UTextBodyMedium(i.pricePerNight.rial()),
        ],
      ),
      trailing: _menu(i),
    ),
  );

  Widget _menu(UHotelRoomResponse i) => PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        child: UIconTextHorizontal(leading: const Icon(Icons.event_available_outlined, size: 20), trailing: Text(U.s.reservations)),
        onTap: () => UAdminPageSwitcher.reservations(room: i),
      ),
      if (U.user.hasPermission(TagUser.permissionManageHotels))
        PopupMenuItem<String>(
          child: UIconTextHorizontal(leading: const Icon(Icons.edit, size: 20), trailing: Text(U.s.edit)),
          onTap: () => _showEditDialog(p: i),
        ),
      if (U.user.hasPermission(TagUser.permissionDeleteHotels))
        PopupMenuItem<String>(
          child: UIconTextHorizontal(
            leading: Icon(Icons.delete, color: Theme.of(context).colorScheme.error, size: 20),
            trailing: Text(U.s.delete, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
          onTap: () => c.delete(i),
        ),
    ],
  );

  void _showFilterDialog() => UNavigator.dialog(
    AlertDialog(
      title: Text(U.s.filterRooms),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UTextField(controller: c.titleFilter, labelText: U.s.title).pSymmetric(vertical: 6),
            UTextField(controller: c.minPriceFilter, labelText: U.s.minPrice, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
            UTextField(controller: c.maxPriceFilter, labelText: U.s.maxPrice, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
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
  );

  void _showEditDialog({UHotelRoomResponse? p}) {
    final TextEditingController title = TextEditingController(text: p?.title);
    final TextEditingController capacity = TextEditingController(text: p?.capacity.toString());
    final TextEditingController price = TextEditingController(text: p?.pricePerNight.toInt().toString());
    final TextEditingController detail = TextEditingController(text: p?.jsonData.description ?? p?.jsonData.detail1);
    final TextEditingController roomNumber = TextEditingController(text: p?.roomNumber);
    final TextEditingController quantity = TextEditingController(text: (p?.quantity ?? 1).toString());
    final TextEditingController bedType = TextEditingController(text: p?.jsonData.bedType);
    final TextEditingController size = TextEditingController(text: p?.jsonData.sizeSquareMeters == null ? null : p!.jsonData.sizeSquareMeters!.toInt().toString());
    final TextEditingController floor = TextEditingController(text: p?.jsonData.floor?.toString());
    final TextEditingController amenities = TextEditingController(text: p?.jsonData.amenities.join(", "));
    bool isAvailable = p?.isAvailable ?? true;
    final Rxn<UHotelResponse> hotel = Rxn<UHotelResponse>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    UNavigator.dialog(
      AlertDialog(
        title: Text(p == null ? U.s.createRoom : U.s.editRoom),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setLocal) => Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  UTextField(
                    controller: title,
                    labelText: U.s.title,
                    validator: UValidators.required(message: ""),
                  ).pSymmetric(vertical: 6),
                  if (widget.hotel == null)
                    UTextFieldAutoCompleteAsync<UHotelResponse>(
                      labelBuilder: (UHotelResponse i) => i.title,
                      onChanged: hotel.call,
                      selectedItem: hotel.value,
                      fetchData: c.readHotels,
                      hintText: U.s.hotel,
                    ).pSymmetric(vertical: 6),
                  UTextField(
                    controller: capacity,
                    labelText: U.s.capacity,
                    keyboardType: TextInputType.number,
                    validator: UValidators.required(message: ""),
                  ).pSymmetric(vertical: 6),
                  UTextField(
                    controller: price,
                    labelText: U.s.priceNight,
                    keyboardType: TextInputType.number,
                    validator: UValidators.required(message: ""),
                    formatters: <TextInputFormatter>[UCurrencyInputFormatter()],
                  ).pSymmetric(vertical: 6),
                  UTextField(controller: detail, labelText: U.s.description, lines: 2).pSymmetric(vertical: 6),
                  UTextField(controller: roomNumber, labelText: U.s.roomNumber).pSymmetric(vertical: 6),
                  UTextField(controller: quantity, labelText: U.s.quantity, keyboardType: TextInputType.number).pSymmetric(vertical: 6),
                  UTextField(controller: bedType, labelText: U.s.bedType).pSymmetric(vertical: 6),
                  UTextField(controller: size, labelText: U.s.size, keyboardType: TextInputType.number).pSymmetric(vertical: 6),
                  UTextField(controller: floor, labelText: U.s.floor, keyboardType: TextInputType.number).pSymmetric(vertical: 6),
                  UTextField(controller: amenities, labelText: U.s.amenities, lines: 2).pSymmetric(vertical: 6),
                  SwitchListTile(contentPadding: EdgeInsets.zero, title: Text(U.s.available), value: isAvailable, onChanged: (bool v) => setLocal(() => isAvailable = v)),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        final String? hid = hotel.value?.id ?? widget.hotel?.id;
                        if (hid == null) {
                          UToast.error(message: U.s.pleaseSelectAHotel);
                          return;
                        }
                        if (p == null) {
                          c.create(
                            p: UHotelRoomCreateParams(
                              tags: <int>[TagRoom.single.number],
                              title: title.text,
                              capacity: capacity.numInt(),
                              pricePerNight: price.numDouble(),
                              hotelId: hid,
                              roomNumber: roomNumber.text.nullIfEmpty(),
                              quantity: quantity.text.isEmpty ? 1 : quantity.text.toInt(),
                              isAvailable: isAvailable,
                              description: detail.text.nullIfEmpty(),
                              bedType: bedType.text.nullIfEmpty(),
                              sizeSquareMeters: size.text.isEmpty ? null : size.numDouble(),
                              floor: floor.text.isEmpty ? null : floor.text.toInt(),
                              amenities: amenities.text.trim().isEmpty ? null : amenities.text.split(",").map((String e) => e.trim()).where((String e) => e.isNotEmpty).toList(),
                            ),
                          );
                        } else {
                          c.update(
                            p: UHotelRoomUpdateParams(
                              id: p.id,
                              title: title.text,
                              capacity: capacity.numInt(),
                              pricePerNight: price.numDouble(),
                              hotelId: hid,
                              roomNumber: roomNumber.text.nullIfEmpty(),
                              quantity: quantity.text.isEmpty ? null : quantity.text.toInt(),
                              isAvailable: isAvailable,
                              description: detail.text.nullIfEmpty(),
                              bedType: bedType.text.nullIfEmpty(),
                              sizeSquareMeters: size.text.isEmpty ? null : size.numDouble(),
                              floor: floor.text.isEmpty ? null : floor.text.toInt(),
                              amenities: amenities.text.trim().isEmpty ? null : amenities.text.split(",").map((String e) => e.trim()).where((String e) => e.isNotEmpty).toList(),
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
