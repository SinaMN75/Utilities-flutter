import "package:u/utilities.dart";

class TerminalsPage extends StatefulWidget {
  const TerminalsPage({super.key, this.merchant});

  final UMerchantResponse? merchant;

  @override
  State<TerminalsPage> createState() => _TerminalsPageState();
}

class _TerminalsPageState extends State<TerminalsPage> {
  final UAdminTerminalController c = UAdminTerminalController();

  @override
  void initState() {
    c.init(merchant: widget.merchant);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(widget.merchant == null ? U.s.terminalsManagement : "${U.s.terminals} · ${widget.merchant?.title}"),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog),
        IconButton(icon: const Icon(Icons.add), tooltip: U.s.createTerminal, onPressed: _showCreateDialog),
        IconButton(icon: const Icon(Icons.grid_4x4), tooltip: U.s.bulkImportTerminals, onPressed: c.import),
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

  Widget _list() => UAdminListView<UTerminalResponse>(
    state: c.state,
    items: () => c.list,
    totalCount: () => c.totalCount,
    onRetry: c.read,
    emptyText: U.s.noTerminalsFound,
    desktopHeader: () => <Widget>[
      UTextBodyLarge(U.s.serial, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.simCardSerial, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.merchant, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.terminalId, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.createdAt, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.operations, color: AppColors.white, textAlign: .center).expanded(),
    ],
    desktopRow: (UTerminalResponse i, int index) => _itemDesktop(i: i, index: index),
    mobileRow: (UTerminalResponse i, int index) => _itemResponsive(i: i, index: index),
  );

  Widget _statusChip(UTerminalResponse i) {
    final Color color = i.terminalId.isNotNullOrEmpty() ? AppColors.green : AppColors.grey;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
      child: UTextBodyMedium(i.terminalId ?? U.s.notAssigned, color: color, fontWeight: FontWeight.w600),
    );
  }

  Widget _itemDesktop({required UTerminalResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? AppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium(i.serial, textAlign: .center).expanded(),
      UTextBodyMedium(i.simCardSerial ?? "-", textAlign: .center).expanded(),
      UTextBodyMedium(i.merchant?.title ?? U.s.noMerchantSelected, textAlign: .center).expanded(),
      _statusChip(i).alignAtCenter().expanded(),
      UTextBodyMedium(i.createdAt.toJalaliDate(), textAlign: .center).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UTerminalResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.point_of_sale_rounded),
      title: UTextBodyMedium("${U.s.serial}: ${i.serial}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UTextBodyMedium(i.merchant?.title ?? U.s.noMerchantSelected),
          UTextBodySmall("${i.terminalId ?? "-"} • ${i.createdAt.toJalaliDate()}"),
          const SizedBox(height: 4),
          _statusChip(i),
        ],
      ),
      trailing: _menu(i),
    ),
  );

  // Operations are now composed by the app via UAdminConfig.actions (entity "terminals").
  Widget _menu(UTerminalResponse i) => UAdminOps.menu<UTerminalResponse>(
    context,
    entity: "terminals",
    item: i,
    handlers: UAdminActionHandlers<UTerminalResponse>(
      onEdit: _showEditDialog,
      onDelete: c.delete,
      extras: <String, void Function(UTerminalResponse)>{"supportPassword": c.supportPassword},
    ),
  );

  void _showFilterDialog() => UNavigator.dialog(
    AlertDialog(
      title: Text(U.s.filterTerminals),
      content: SizedBox(
        width: context.dialogWidth(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              UDropDownField<TagOrderBy?>(
                initialValue: c.tagOrderBy.value,
                onChanged: c.tagOrderBy.call,
                items: <DropdownMenuItem<TagOrderBy>>[
                  DropdownMenuItem<TagOrderBy>(value: TagOrderBy.createdAt, child: Text(TagOrderBy.createdAt.localizedTitle)),
                  DropdownMenuItem<TagOrderBy>(value: TagOrderBy.createdAtDescending, child: Text(TagOrderBy.createdAtDescending.localizedTitle)),
                ],
              ).pSymmetric(vertical: 6),
              UDropDownField<TagTerminal?>(
                initialValue: c.typeFilter.value,
                onChanged: c.typeFilter.call,
                items: <DropdownMenuItem<TagTerminal>>[
                  DropdownMenuItem<TagTerminal>(child: Text(TagTerminal.deskCashless.localizedTitle)),
                  DropdownMenuItem<TagTerminal>(value: TagTerminal.deskCashless, child: Text(TagTerminal.deskCashless.localizedTitle)),
                  DropdownMenuItem<TagTerminal>(value: TagTerminal.atm, child: Text(TagTerminal.atm.localizedTitle)),
                  DropdownMenuItem<TagTerminal>(value: TagTerminal.wallCashless, child: Text(TagTerminal.wallCashless.localizedTitle)),
                ],
              ).pSymmetric(vertical: 6),
              UTextField(controller: c.serialFilter, labelText: U.s.serial).pSymmetric(vertical: 6),
              if (widget.merchant == null) UTextField(controller: c.merchantIdFilter, labelText: U.s.merchantId).pSymmetric(vertical: 6),
              UTextField(controller: c.creatorIdFilter, labelText: U.s.creatorId).pSymmetric(vertical: 6),
              UTextFieldDatePicker(
                jalali: true,
                controller: c.fromCreatedController,
                labelText: U.s.fromDate,
                onChange: (DateTime d, Jalali j) {
                  c.fromCreatedController.text = j.formatCompactDate();
                  c.fromCreatedAt = d;
                },
              ).pSymmetric(vertical: 6),
              UTextFieldDatePicker(
                jalali: true,
                controller: c.toCreatedController,
                labelText: U.s.toDate,
                onChange: (DateTime d, Jalali j) {
                  c.toCreatedController.text = j.formatCompactDate();
                  c.toCreatedAt = d;
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

  void _showCreateDialog() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController serial = TextEditingController();
    final TextEditingController simCardNumber = TextEditingController();
    final TextEditingController simCardSerial = TextEditingController();
    final TextEditingController imei = TextEditingController();
    final TextEditingController terminalId = TextEditingController();
    final Rx<TagTerminal> type = TagTerminal.deskCashless.obs;

    UNavigator.dialog(
      AlertDialog(
        title: Text(U.s.createTerminal),
        content: SizedBox(
          width: context.dialogWidth(),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  UTextField(
                    controller: serial,
                    labelText: U.s.serial,
                    validator: UValidators.required(message: U.s.required),
                  ).pSymmetric(vertical: 6),
                  UTextField(controller: simCardNumber, labelText: U.s.simCardNumber, keyboardType: TextInputType.phone).pSymmetric(vertical: 6),
                  UTextField(controller: simCardSerial, labelText: U.s.simCardSerial).pSymmetric(vertical: 6),
                  UTextField(controller: imei, labelText: U.s.imei).pSymmetric(vertical: 6),
                  UDropDownField<TagTerminal?>(
                    initialValue: type.value,
                    onChanged: type.call,
                    items: <DropdownMenuItem<TagTerminal>>[
                      DropdownMenuItem<TagTerminal>(value: TagTerminal.deskCashless, child: Text(TagTerminal.deskCashless.localizedTitle)),
                      DropdownMenuItem<TagTerminal>(value: TagTerminal.atm, child: Text(TagTerminal.atm.localizedTitle)),
                      DropdownMenuItem<TagTerminal>(value: TagTerminal.wallCashless, child: Text(TagTerminal.wallCashless.localizedTitle)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        UNavigator.back();
                        c.create(
                          p: UTerminalCreateParams(
                            tags: <int>[type.value.number],
                            serial: serial.text.trim(),
                            simCardNumber: simCardNumber.text.nullIfEmpty(),
                            simCardSerial: simCardSerial.text.nullIfEmpty(),
                            imei: imei.text.nullIfEmpty(),
                            terminalId: terminalId.text.nullIfEmpty(),
                          ),
                        );
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

  void _showEditDialog(UTerminalResponse i) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController serial = TextEditingController(text: i.serial);
    final TextEditingController simCardNumber = TextEditingController(text: i.simCardNumber);
    final TextEditingController simCardSerial = TextEditingController(text: i.simCardSerial);
    final TextEditingController imei = TextEditingController(text: i.imei);
    final TextEditingController terminalId = TextEditingController(text: i.terminalId);

    UNavigator.dialog(
      AlertDialog(
        title: Text(U.s.editTerminal),
        content: SizedBox(
          width: context.dialogWidth(),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  UTextField(
                    controller: serial,
                    labelText: U.s.serial,
                    validator: UValidators.required(message: U.s.required),
                  ).pSymmetric(vertical: 6),
                  UTextField(controller: simCardNumber, labelText: U.s.simCardNumber, keyboardType: TextInputType.phone).pSymmetric(vertical: 6),
                  UTextField(controller: simCardSerial, labelText: U.s.simCardSerial).pSymmetric(vertical: 6),
                  UTextField(controller: imei, labelText: U.s.imei).pSymmetric(vertical: 6),
                  UTextField(controller: terminalId, labelText: U.s.terminalId).pSymmetric(vertical: 6),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        UNavigator.back();
                        c.update(
                          p: UTerminalUpdateParams(
                            id: i.id,
                            serial: serial.text.nullIfEmpty(),
                            simCardNumber: simCardNumber.text.nullIfEmpty(),
                            simCardSerial: simCardSerial.text.nullIfEmpty(),
                            imei: imei.text.nullIfEmpty(),
                            terminalId: terminalId.text.nullIfEmpty(),
                          ),
                        );
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
