import "package:u/utilities.dart";

class UAdminContractPage extends StatefulWidget {
  const UAdminContractPage({this.bed, this.user, super.key});

  final UDormBedResponse? bed;

  final UUserResponse? user;

  @override
  State<UAdminContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<UAdminContractPage> {
  final UAdminContractController c = UAdminContractController();

  static const List<TagDormBedContract> _types = <TagDormBedContract>[TagDormBedContract.daily, TagDormBedContract.weekly, TagDormBedContract.monthly, TagDormBedContract.yearly];

  TagDormBedContract? _typeOf(UDormBedContractResponse i) {
    for (final TagDormBedContract t in _types) if (i.tags.contains(t.number)) return t;
    return null;
  }

  @override
  void initState() {
    c.init(bed: widget.bed, user: widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(
        widget.bed != null
            ? "${U.s.contracts} · ${widget.bed!.title}"
            : widget.user != null
            ? "${U.s.contracts} · ${widget.user!.displayName}"
            : U.s.contracts,
      ),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog),
        if (U.user.hasPermission(TagUser.permissionManageContracts)) IconButton(icon: const Icon(Icons.add), tooltip: U.s.createContract, onPressed: _showEditDialog),
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

  String _statusLabel(UAdminContractStatusFilter f) {
    switch (f) {
      case UAdminContractStatusFilter.all:
        return U.s.all;
      case UAdminContractStatusFilter.active:
        return U.s.active;
      case UAdminContractStatusFilter.upcoming:
        return U.s.upcoming;
      case UAdminContractStatusFilter.expired:
        return U.s.expired;
      case UAdminContractStatusFilter.expiringSoon:
        return U.s.expiringSoon;
    }
  }

  Widget _list() => Obx(() {
    if (c.state.isError()) return Center(child: Text(U.s.errorReadingData));
    if (c.state.isEmpty()) return Center(child: Text(U.s.noContractFound));
    if (!c.state.isLoaded()) return const Center(child: CircularProgressIndicator());
    if (MediaQuery.sizeOf(context).width >= 900) {
      return UListView(
        header: URow(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            UTextBodyLarge(U.s.tenant, color: UAdminTheme.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.bed, color: UAdminTheme.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.startDate, color: UAdminTheme.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.endDate, color: UAdminTheme.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.rent, color: UAdminTheme.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.status, color: UAdminTheme.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.operations, color: UAdminTheme.white, textAlign: .center).expanded(),
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

  Widget _statusChip(UDormBedContractResponse i) {
    final DateTime now = DateTime.now();
    final bool active = !i.startDate.isAfter(now) && !i.endDate.isBefore(now);
    final Color color = active ? UAdminTheme.green : UAdminTheme.red;
    return UContainer(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      radius: 20,
      color: color.withValues(alpha: 0.15),
      child: UTextBodySmall(active ? U.s.active : U.s.expired, color: color),
    );
  }

  String _bedLabel(UDormBedContractResponse i) => i.bed?.title ?? widget.bed?.title ?? "-";

  String _tenantLabel(UDormBedContractResponse i) => i.user?.displayName ?? "-";

  Widget _itemDesktop({required UDormBedContractResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? UAdminTheme.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium(_tenantLabel(i), textAlign: .center).expanded(),
      UTextBodyMedium(_bedLabel(i), textAlign: .center).expanded(),
      UTextBodyMedium(i.startDate.toJalaliDate(), textAlign: .center).expanded(),
      UTextBodyMedium(i.endDate.toJalaliDate(), textAlign: .center).expanded(),
      UTextBodyMedium(i.rent.rial(), textAlign: .center).expanded(),
      Center(child: _statusChip(i)).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UDormBedContractResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.description_rounded),
      title: UTextBodyMedium(_tenantLabel(i)),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[UTextBodyMedium("${U.s.bed}: ${_bedLabel(i)}"), UTextBodySmall("${i.startDate.toJalaliDate()} → ${i.endDate.toJalaliDate()}"), UTextBodySmall("${U.s.rent}: ${i.rent.rial()} • ${i.invoices?.length ?? 0} ${U.s.invoices}"), _statusChip(i)]),
      trailing: _menu(i),
    ),
  );

  Widget _menu(UDormBedContractResponse i) => PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      if (i.user != null)
        PopupMenuItem<String>(
          child: UIconTextHorizontal(leading: const Icon(Icons.person_outline, size: 20), trailing: Text(U.s.tenant)),
          onTap: () => UAdminPageSwitcher.hotelUserDetail(user: i.user!),
        ),
      PopupMenuItem<String>(
        child: UIconTextHorizontal(leading: const Icon(Icons.receipt_long_outlined, size: 20), trailing: Text(U.s.viewInvoices)),
        onTap: () => UAdminPageSwitcher.invoices(contract: i),
      ),
      if (i.bed?.room != null)
        PopupMenuItem<String>(
          child: UIconTextHorizontal(leading: const Icon(Icons.bed_outlined, size: 20), trailing: Text(U.s.bed)),
          onTap: () => UAdminPageSwitcher.dormBeds(room: i.bed!.room),
        ),
      if (i.bed?.room?.dorm != null)
        PopupMenuItem<String>(
          child: UIconTextHorizontal(leading: const Icon(Icons.bedroom_parent_outlined, size: 20), trailing: Text(U.s.dorm)),
          onTap: () => UAdminPageSwitcher.dormRooms(dorm: i.bed!.room!.dorm),
        ),
      if (U.user.hasPermission(TagUser.permissionManageContracts))
        PopupMenuItem<String>(
          child: UIconTextHorizontal(leading: const Icon(Icons.edit, size: 20), trailing: Text(U.s.edit)),
          onTap: () => _showEditDialog(p: i),
        ),
      if (U.user.hasPermission(TagUser.permissionDeleteContracts))
        PopupMenuItem<String>(
          child: UIconTextHorizontal(
            leading: Icon(Icons.delete, color: Theme.of(context).colorScheme.error, size: 20),
            trailing: Text(U.s.delete, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
          onTap: () => c.delete(i),
        ),
    ],
  );

  void _showFilterDialog() {
    final TextEditingController startCtrl = TextEditingController(text: c.startDateFilter?.toJalaliDate());
    final TextEditingController endCtrl = TextEditingController(text: c.endDateFilter?.toJalaliDate());

    UNavigator.dialog(
      AlertDialog(
        title: Text(U.s.filterContracts),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setLocal) => Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                UTextField(controller: c.tenantFilter, labelText: U.s.tenant).pSymmetric(vertical: 6),
                UTextFieldAutoCompleteAsync<UDormResponse>(
                  labelBuilder: (UDormResponse i) => i.title,
                  onChanged: (UDormResponse? i) => setLocal(() {
                    c.dormFilter = i;
                    c.bedFilter = null;
                  }),
                  selectedItem: c.dormFilter,
                  fetchData: c.readDorms,
                  hintText: U.s.dorm,
                ).pSymmetric(vertical: 6),
                UTextFieldAutoCompleteAsync<UDormBedResponse>(
                  labelBuilder: (UDormBedResponse i) => i.room?.dorm == null ? i.title : "${i.room!.dorm!.title} · ${i.title}",
                  onChanged: (UDormBedResponse? i) => setLocal(() => c.bedFilter = i),
                  selectedItem: c.bedFilter,
                  fetchData: c.readBeds,
                  hintText: U.s.bed,
                ).pSymmetric(vertical: 6),
                DropdownButtonFormField<int?>(
                  isExpanded: true,
                  initialValue: c.typeFilter,
                  decoration: InputDecoration(labelText: U.s.contractType, border: const OutlineInputBorder()),
                  items: <DropdownMenuItem<int?>>[
                    DropdownMenuItem<int?>(child: Text(U.s.all)),
                    ..._types.map((TagDormBedContract t) => DropdownMenuItem<int?>(value: t.number, child: Text(c.isFa ? t.titleFa : t.titleEn))),
                  ],
                  onChanged: (int? v) => setLocal(() => c.typeFilter = v),
                ).pSymmetric(vertical: 6),
                DropdownButtonFormField<UAdminContractStatusFilter>(
                  isExpanded: true,
                  initialValue: c.statusFilter,
                  decoration: InputDecoration(labelText: U.s.status, border: const OutlineInputBorder()),
                  items: UAdminContractStatusFilter.values.map((UAdminContractStatusFilter f) => DropdownMenuItem<UAdminContractStatusFilter>(value: f, child: Text(_statusLabel(f)))).toList(),
                  onChanged: (UAdminContractStatusFilter? v) => setLocal(() => c.statusFilter = v ?? UAdminContractStatusFilter.all),
                ).pSymmetric(vertical: 6),
                UTextFieldDatePicker(
                  controller: startCtrl,
                  labelText: U.s.startDate,
                  jalali: true,
                  initialDate: c.startDateFilter,
                  onChange: (DateTime d, Jalali j) {
                    c.startDateFilter = d;
                    startCtrl.text = d.toJalaliDate();
                  },
                ).pSymmetric(vertical: 6),
                UTextFieldDatePicker(
                  controller: endCtrl,
                  labelText: U.s.endDate,
                  jalali: true,
                  initialDate: c.endDateFilter,
                  onChange: (DateTime d, Jalali j) {
                    c.endDateFilter = d;
                    endCtrl.text = d.toJalaliDate();
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

  void _showEditDialog({UDormBedContractResponse? p}) {
    final bool isEdit = p != null;
    final TextEditingController deposit = TextEditingController(text: p?.deposit.toInt().toString());
    final TextEditingController rent = TextEditingController(text: p?.rent.toInt().toString());
    final TextEditingController penalty = TextEditingController();
    final TextEditingController description = TextEditingController(text: p?.jsonData.description);
    final TextEditingController startCtrl = TextEditingController(text: p == null ? null : p.startDate.toJalaliDate());
    final TextEditingController endCtrl = TextEditingController(text: p == null ? null : p.endDate.toJalaliDate());

    final Rxn<UDormBedResponse> bed = Rxn<UDormBedResponse>();
    final Rxn<UUserResponse> user = Rxn<UUserResponse>();
    DateTime? startDate = p?.startDate;
    DateTime? endDate = p?.endDate;
    TagDormBedContract type = _typeOf(p ?? _empty()) ?? TagDormBedContract.monthly;
    bool singleInvoice = p?.tags.contains(TagDormBedContract.singleInvoice.number) ?? false;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    UNavigator.dialog(
      AlertDialog(
        title: Text(isEdit ? U.s.editContract : U.s.createContract),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setLocal) => Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!isEdit && widget.bed == null)
                    UTextFieldAutoCompleteAsync<UDormBedResponse>(
                      labelBuilder: (UDormBedResponse i) => "${i.title} · ${i.monthlyRent.rial()}",
                      onChanged: bed.call,
                      selectedItem: bed.value,
                      fetchData: c.readBeds,
                      hintText: U.s.bed,
                    ).pSymmetric(vertical: 6),
                  if (!isEdit)
                    UTextFieldAutoCompleteAsync<UUserResponse>(
                      labelBuilder: (UUserResponse i) => i.phoneNumber == null ? i.displayName : "${i.displayName} · ${i.phoneNumber}",
                      onChanged: user.call,
                      selectedItem: user.value,
                      fetchData: c.readUsers,
                      hintText: U.s.tenant,
                    ).pSymmetric(vertical: 6),
                  DropdownButtonFormField<int>(
                    isExpanded: true,
                    initialValue: type.number,
                    decoration: InputDecoration(labelText: U.s.contractType, border: const OutlineInputBorder()),
                    items: _types.map((TagDormBedContract t) => DropdownMenuItem<int>(value: t.number, child: Text(c.isFa ? t.titleFa : t.titleEn))).toList(),
                    onChanged: (int? v) => setLocal(() => type = _types.firstWhere((TagDormBedContract t) => t.number == v)),
                  ).pSymmetric(vertical: 6),
                  UTextFieldDatePicker(
                    controller: startCtrl,
                    labelText: U.s.startDate,
                    jalali: true,
                    initialDate: startDate,
                    validator: UValidators.required(message: ""),
                    onChange: (DateTime d, Jalali j) {
                      startDate = d;
                      startCtrl.text = d.toJalaliDate();
                    },
                  ).pSymmetric(vertical: 6),
                  UTextFieldDatePicker(
                    controller: endCtrl,
                    labelText: U.s.endDate,
                    jalali: true,
                    initialDate: endDate,
                    validator: UValidators.required(message: ""),
                    onChange: (DateTime d, Jalali j) {
                      endDate = d;
                      endCtrl.text = d.toJalaliDate();
                    },
                  ).pSymmetric(vertical: 6),
                  UTextField(controller: deposit, labelText: U.s.deposit, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
                  UTextField(controller: rent, labelText: U.s.rent, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
                  if (!isEdit) ...<Widget>[UTextField(controller: penalty, labelText: U.s.dailyPenalty, keyboardType: TextInputType.number).pSymmetric(vertical: 6), SwitchListTile(contentPadding: EdgeInsets.zero, title: Text(U.s.singleInvoice), value: singleInvoice, onChanged: (bool v) => setLocal(() => singleInvoice = v))],
                  UTextField(controller: description, labelText: U.s.description, lines: 2).pSymmetric(vertical: 6),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        if (startDate == null || endDate == null) {
                          UToast.error(message: U.s.errorSubmittingForm);
                          return;
                        }
                        if (isEdit) {
                          final List<int> tags = <int>[type.number, if (singleInvoice) TagDormBedContract.singleInvoice.number];
                          c.update(
                            p: UDormBedContractUpdateParams(id: p.id, tags: tags, startDate: startDate, endDate: endDate, deposit: deposit.text.isEmpty ? null : deposit.numDouble(), rent: rent.text.isEmpty ? null : rent.numDouble()),
                          );
                        } else {
                          final String? bid = bed.value?.id ?? widget.bed?.id;
                          if (bid == null) {
                            UToast.error(message: U.s.selectABed);
                            return;
                          }
                          if (user.value?.id == null) {
                            UToast.error(message: U.s.selectAUser);
                            return;
                          }
                          c.create(
                            p: UDormBedContractCreateParams(
                              tags: <int>[type.number, if (singleInvoice) TagDormBedContract.singleInvoice.number],
                              startDate: startDate!,
                              endDate: endDate!,
                              userId: user.value!.id,
                              bedId: bid,
                              deposit: deposit.text.isEmpty ? null : deposit.numDouble(),
                              rent: rent.text.isEmpty ? null : rent.numDouble(),
                              penaltyPrecentEveryDate: penalty.text.isEmpty ? null : penalty.text.toInt(),
                              description: description.text.nullIfEmpty(),
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

  UDormBedContractResponse _empty() => UDormBedContractResponse(isActive: false, id: "", createdAt: DateTime.now(), updatedAt: DateTime.now(), jsonData: UContractJsonData(), tags: <int>[], startDate: DateTime.now(), endDate: DateTime.now(), deposit: 0, rent: 0, userId: "", bedId: "", adminUserIds: <String>[]);
}
