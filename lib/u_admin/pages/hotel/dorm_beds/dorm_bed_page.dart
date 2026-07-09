import "package:u/utilities.dart";

class DormBedPage extends StatefulWidget {
  const DormBedPage({this.room, this.dorm, super.key});

  final UDormRoomResponse? room;
  final UDormResponse? dorm;

  @override
  State<DormBedPage> createState() => _DormBedPageState();
}

class _DormBedPageState extends State<DormBedPage> {
  final UAdminDormBedController c = UAdminDormBedController();

  @override
  void initState() {
    c.init(room: widget.room, dorm: widget.dorm);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(
        widget.room != null
            ? "${U.s.beds} · ${widget.room!.title}"
            : widget.dorm != null
            ? "${U.s.beds} · ${widget.dorm!.title}"
            : U.s.dormBeds,
      ),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog),
        if (U.user.hasPermission(TagUser.permissionManageDorms)) IconButton(icon: const Icon(Icons.add), tooltip: U.s.create, onPressed: _showEditDialog),
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
    if (c.state.isEmpty()) return Center(child: Text(U.s.noBedsFound));
    if (!c.state.isLoaded()) return const Center(child: CircularProgressIndicator());
    if (MediaQuery.sizeOf(context).width >= 800) {
      return UListView(
        header: URow(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            UTextBodyLarge(U.s.title, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.deposit, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.rent, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.occupancy, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.operations, color: AppColors.white, textAlign: .center).expanded(),
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

  Widget _itemDesktop({required UDormBedResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? AppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium(i.title, textAlign: .center).expanded(),
      UTextBodyMedium(i.deposit.rial(), textAlign: .center).expanded(),
      UTextBodyMedium(i.monthlyRent.rial(), textAlign: .center).expanded(),
      UTextBodyMedium((i.contracts?.where((UDormBedContractResponse i) => i.isActive).isEmpty ?? true) ? U.s.free : U.s.occupied, textAlign: .center).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UDormBedResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.bed_rounded),
      title: UTextBodyMedium(i.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UTextBodyMedium("${U.s.deposit}: ${i.deposit.rial()}"),
          UTextBodyMedium("${U.s.rent}: ${i.monthlyRent.rial()}"),
        ],
      ),
      trailing: _menu(i),
    ),
  );

  Widget _menu(UDormBedResponse i) => PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        child: UIconTextHorizontal(leading: const Icon(Icons.description_outlined, size: 20), trailing: Text(U.s.contracts)),
        onTap: () => PageSwitcher.contracts(bed: i),
      ),
      if (U.user.hasPermission(TagUser.permissionManageDorms))
        PopupMenuItem<String>(
          child: UIconTextHorizontal(leading: const Icon(Icons.edit, size: 20), trailing: Text(U.s.edit)),
          onTap: () => _showEditDialog(p: i),
        ),
      if (U.user.hasPermission(TagUser.permissionDeleteDorms))
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
      title: Text(U.s.filterBeds),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UTextField(controller: c.titleFilter, labelText: U.s.title).pSymmetric(vertical: 6),
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

  void _showEditDialog({UDormBedResponse? p}) {
    final TextEditingController title = TextEditingController(text: p?.title);
    final TextEditingController deposit = TextEditingController(text: p?.deposit.toInt().toString());
    final TextEditingController rent = TextEditingController(text: p?.monthlyRent.toInt().toString());
    final TextEditingController detail = TextEditingController(text: p?.jsonData.detail1);
    final Rxn<UDormRoomResponse> room = Rxn<UDormRoomResponse>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    UNavigator.dialog(
      AlertDialog(
        title: Text(p == null ? U.s.createBed : U.s.editBed),
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
                  if (widget.room == null)
                    UTextFieldAutoCompleteAsync<UDormRoomResponse>(
                      labelBuilder: (UDormRoomResponse i) => i.dorm == null ? i.title : "${i.dorm!.title} · ${i.title}",
                      onChanged: room.call,
                      selectedItem: room.value,
                      fetchData: c.readRooms,
                      hintText: U.s.room,
                    ).pSymmetric(vertical: 6),
                  UTextField(
                    controller: deposit,
                    labelText: U.s.deposit,
                    keyboardType: TextInputType.number,
                    validator: UValidators.required(message: ""),
                    formatters: <TextInputFormatter>[UCurrencyInputFormatter()],
                  ).pSymmetric(vertical: 6),
                  UTextField(
                    controller: rent,
                    labelText: U.s.rent,
                    keyboardType: TextInputType.number,
                    validator: UValidators.required(message: ""),
                    formatters: <TextInputFormatter>[UCurrencyInputFormatter()],
                  ).pSymmetric(vertical: 6),
                  UTextField(controller: detail, labelText: U.s.description, lines: 2).pSymmetric(vertical: 6),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        final String? rid = room.value?.id ?? widget.room?.id;
                        if (rid == null) {
                          UToast.error(message: U.s.pleaseSelectARoom);
                          return;
                        }
                        if (p == null) {
                          c.create(
                            p: UDormBedCreateParams(
                              tags: <int>[TagDormBed.single.number],
                              title: title.text,
                              deposit: deposit.numDouble(),
                              monthlyRent: rent.numDouble(),
                              roomId: rid,
                              detail1: detail.text.nullIfEmpty(),
                            ),
                          );
                        } else {
                          c.update(
                            p: UDormBedUpdateParams(
                              id: p.id,
                              title: title.text,
                              deposit: deposit.numDouble(),
                              monthlyRent: rent.numDouble(),
                              roomId: rid,
                              detail1: detail.text.nullIfEmpty(),
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
