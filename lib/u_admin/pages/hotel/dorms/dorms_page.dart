import "package:u/utilities.dart";

class DormPage extends StatefulWidget {
  const DormPage({super.key});

  @override
  State<DormPage> createState() => _DormPageState();
}

class _DormPageState extends State<DormPage> {
  final UAdminDormController c = UAdminDormController();

  @override
  void initState() {
    c.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(U.s.dorms),
      actions: <Widget>[
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
    if (c.state.isEmpty()) return Center(child: Text(U.s.noDormsFound));
    if (!c.state.isLoaded()) return const Center(child: CircularProgressIndicator());
    if (MediaQuery.sizeOf(context).width >= 800) {
      return UListView(
        header: URow(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            UTextBodyLarge(U.s.title, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.city, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.room, color: AppColors.white, textAlign: .center).expanded(),
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

  Widget _itemDesktop({required UDormResponse i, required int index}) {
    final UCountryCityInfo city = UCountries.infoByCode(i.cityCode);
    return URow(
      backgroundColor: index.isOdd ? AppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
      children: <Widget>[
        UTextBodyMedium(i.title, textAlign: .center).expanded(),
        UTextBodyMedium("${city.country?.nameFa ?? ""} - ${city.province?.nameFa ?? ""} - ${city.city?.nameFa ?? ""}", textAlign: .center).expanded(),
        UTextBodyMedium((i.rooms?.length ?? 0).toString(), textAlign: .center).expanded(),
        UTextBodyMedium(i.createdAt.toJalaliDate(), textAlign: .center).expanded(),
        _menu(i).expanded(),
      ],
    );
  }

  Widget _itemResponsive({required UDormResponse i, required int index}) {
    final UCountryCityInfo city = UCountries.infoByCode(i.cityCode);
    return UContainer(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
      radius: 8,
      child: ListTile(
        dense: true,
        leading: const Icon(Icons.bedroom_parent_rounded),
        title: UTextBodyMedium(i.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UTextBodyMedium("${city.country?.nameFa ?? ""} - ${city.province?.nameFa ?? ""} - ${city.city?.nameFa ?? ""}"),
            UTextBodySmall("${i.rooms?.length ?? 0} ${U.s.rooms} • ${i.createdAt.toJalaliDate()}"),
          ],
        ),
        trailing: _menu(i),
      ),
    );
  }

  Widget _menu(UDormResponse i) => PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        child: UIconTextHorizontal(leading: const Icon(Icons.meeting_room_outlined, size: 20), trailing: Text(U.s.room)),
        onTap: () => PageSwitcher.dormRooms(dorm: i),
      ),
      PopupMenuItem<String>(
        child: UIconTextHorizontal(leading: const Icon(Icons.bed_outlined, size: 20), trailing: Text(U.s.beds)),
        onTap: () => PageSwitcher.dormBeds(dorm: i),
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

  Future<void> _showEditDialog({UDormResponse? p}) async {
    final TextEditingController title = TextEditingController(text: p?.title);
    UProvince province = UCountries.iran().provinces.first;
    UCity? city = province.cities.firstOrNull;
    final TextEditingController detail = TextEditingController(text: p?.jsonData.detail1);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final List<UUserResponse> selectedAdmins = <UUserResponse>[];

    if (p != null && p.adminUserIds.isNotEmpty) {
      final List<UUserResponse?> fetched = await Future.wait(p.adminUserIds.map(HotelAdminSearchHelper.fetchUserById));
      selectedAdmins.addAll(fetched.whereType<UUserResponse>());
    }

    await UNavigator.dialog(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setDialogState) => AlertDialog(
          title: Text(p == null ? U.s.createDorm : U.s.editDorm),
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
                  UCountryProvincePicker(
                    onCountryChanged: (UCountry i) {},
                    onProvinceChanged: (UProvince i) => province = i,
                    onCityChanged: (UCity? i) => city = i,
                  ).pSymmetric(vertical: 6),
                  UTextField(
                    controller: detail,
                    labelText: U.s.description,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    lines: 3,
                  ).pSymmetric(vertical: 6),
                  const SizedBox(height: 12),
                  UTextFieldAutoCompleteAsync<UUserResponse>(
                    hintText: U.s.admins,
                    selectedItem: null,
                    labelBuilder: (UUserResponse u) => u.userName,
                    fetchData: HotelAdminSearchHelper.searchUsers,
                    onChanged: (UUserResponse? u) {
                      if (u == null) return;
                      if (selectedAdmins.any((UUserResponse x) => x.id == u.id)) return;
                      setDialogState(() => selectedAdmins.add(u));
                    },
                  ).pSymmetric(vertical: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: selectedAdmins
                        .map(
                          (UUserResponse u) => Chip(
                            label: Text(u.userName),
                            onDeleted: () => setDialogState(() => selectedAdmins.removeWhere((UUserResponse x) => x.id == u.id)),
                          ),
                        )
                        .toList(),
                  ).pSymmetric(vertical: 6),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        final List<String> adminUserIds = selectedAdmins.map((UUserResponse u) => u.id).toList();
                        if (p == null)
                          c.create(
                            p: UDormCreateParams(
                              tags: <int>[TagDorm.girls.number],
                              title: title.text,
                              cityCode: city?.code ?? province.code,
                              detail1: detail.text.nullIfEmpty(),
                              adminUserIds: adminUserIds,
                            ),
                          );
                        else
                          c.update(
                            p: UDormUpdateParams(
                              id: p.id,
                              title: title.text,
                              cityCode: city?.code ?? province.code,
                              detail1: detail.text.nullIfEmpty(),
                              adminUserIds: adminUserIds,
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
      ),
    );
  }
}
