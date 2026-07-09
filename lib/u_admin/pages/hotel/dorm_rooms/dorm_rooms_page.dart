import "package:u/utilities.dart";

class DormRoomPage extends StatefulWidget {
  // Take the full dorm object instead of id/title pair.
  const DormRoomPage({this.dorm, super.key});

  /// When provided, the page only shows rooms for this dorm and pre-selects it
  /// in the create dialog.
  final UDormResponse? dorm;

  @override
  State<DormRoomPage> createState() => _DormRoomPageState();
}

class _DormRoomPageState extends State<DormRoomPage> {
  final UAdminDormRoomController c = UAdminDormRoomController();

  @override
  void initState() {
    // Pass the full dorm object to the controller.
    c.init(dorm: widget.dorm);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(widget.dorm?.title == null ? U.s.dormRooms : "${U.s.rooms} · ${widget.dorm?.title}"),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog),
        if (U.user.hasPermission(TagUser.permissionManageDorms))
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: U.s.create,
            onPressed: _showEditDialog,
          ),
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
    if (MediaQuery.sizeOf(context).width >= 800) {
      return UListView(
        header: URow(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            UTextBodyLarge(U.s.title, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.dorm, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.beds, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.created, color: AppColors.white, textAlign: .center).expanded(),
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

  Widget _itemDesktop({required UDormRoomResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? AppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium(i.title, textAlign: .center).expanded(),
      UTextBodyMedium(i.dorm?.title ?? "-", textAlign: .center).expanded(),
      UTextBodyMedium((i.beds?.length ?? 0).toString(), textAlign: .center).expanded(),
      UTextBodyMedium(i.createdAt.toJalaliDate(), textAlign: .center).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UDormRoomResponse i, required int index}) => UContainer(
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
          UTextBodyMedium("${i.dorm?.title ?? "-"} • ${i.beds?.length ?? 0} ${U.s.beds}"),
          UTextBodySmall(i.createdAt.toJalaliDate()),
        ],
      ),
      trailing: _menu(i),
    ),
  );

  Widget _menu(UDormRoomResponse i) => PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        child: UIconTextHorizontal(leading: const Icon(Icons.bed_outlined, size: 20), trailing: Text(U.s.beds)),
        onTap: () => PageSwitcher.dormBeds(room: i),
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
      title: Text(U.s.filterRooms),
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

  void _showEditDialog({UDormRoomResponse? p}) {
    final TextEditingController title = TextEditingController(text: p?.title);
    final TextEditingController detail = TextEditingController(text: p?.jsonData.detail1);
    final Rxn<UDormResponse> dorm = Rxn<UDormResponse>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    UNavigator.dialog(
      AlertDialog(
        title: Text(p == null ? U.s.createRoom : U.s.editRoom),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                UTextField(
                  controller: title,
                  labelText: U.s.title,
                  validator: UValidators.required(message: ""),
                ).pSymmetric(vertical: 6),
                if (widget.dorm == null)
                  UTextFieldAutoCompleteAsync<UDormResponse>(
                    labelBuilder: (UDormResponse i) => i.title,
                    onChanged: dorm.call,
                    selectedItem: dorm.value,
                    fetchData: c.readDorms,
                    hintText: U.s.dorm,
                  ).pSymmetric(vertical: 6),
                UTextField(controller: detail, labelText: U.s.description).pSymmetric(vertical: 6),
                const SizedBox(height: 20),
                UButtonSubmitCancel(
                  onSubmit: () => UValidators.validateForm(
                    key: formKey,
                    action: () {
                      final String? did = dorm.value?.id ?? widget.dorm?.id;
                      if (did == null) {
                        UToast.error(message: U.s.pleaseSelectADorm);
                        return;
                      }
                      if (p == null)
                        c.create(
                          p: UDormRoomCreateParams(
                            tags: <int>[TagDormRoom.dorm.number],
                            title: title.text,
                            dormId: did,
                            detail1: detail.text.nullIfEmpty(),
                          ),
                        );
                      else
                        c.update(
                          p: UDormRoomUpdateParams(
                            id: p.id,
                            title: title.text,
                            dormId: did,
                            detail1: detail.text.nullIfEmpty(),
                          ),
                        );
                      UNavigator.back();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
