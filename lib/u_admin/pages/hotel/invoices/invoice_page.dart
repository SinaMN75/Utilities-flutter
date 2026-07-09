import "package:u/utilities.dart";

class InvoicePage extends StatefulWidget {
  const InvoicePage({this.contract, super.key});

  final UDormBedContractResponse? contract;

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final UAdminInvoiceController c = UAdminInvoiceController();

  static const List<TagDormBedInvoice> _types = <TagDormBedInvoice>[TagDormBedInvoice.deposit, TagDormBedInvoice.rent];

  String _typeLabel(UDormBedInvoiceResponse i) {
    for (final TagDormBedInvoice t in _types) {
      if (i.tags.contains(t.number)) return t.localizedTitle;
    }
    return "-";
  }

  @override
  void initState() {
    c.init(contract: widget.contract);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(widget.contract == null ? U.s.invoices : "${U.s.invoices} · ${widget.contract?.user?.displayName ?? ""}"),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog),
        if (widget.contract != null && U.user.hasPermission(TagUser.permissionManageInvoices)) IconButton(icon: const Icon(Icons.add), tooltip: U.s.createInvoice, onPressed: _showEditDialog),
      ],
    ),
    body: Column(
      children: <Widget>[
        if (widget.contract != null) Obx(() => c.state.isLoaded() ? _summary() : const SizedBox.shrink()),
        _statusFilter(),
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

  Widget _summary() => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: Row(children: <Widget>[_summaryCard(U.s.totalDebt, c.totalDebt, AppColors.blueGrey), _summaryCard(U.s.totalPaid, c.totalPaid, AppColors.green), _summaryCard(U.s.totalRemaining, c.totalRemaining, AppColors.orange), _summaryCard(U.s.totalPenalty, c.totalPenalty, AppColors.red)]),
  );

  Widget _summaryCard(String label, double value, Color color) => UContainer(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    radius: 12,
    color: color.withValues(alpha: 0.11),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        UTextBodySmall(label, color: color),
        const SizedBox(height: 4),
        UTextBodyMedium(value.rial(), color: color),
      ],
    ),
  );

  Widget _statusFilter() => Obx(() {
    c.pageNumber.value;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(children: <Widget>[_chip(U.s.all, InvoiceStatusFilter.all), _chip(U.s.paid, InvoiceStatusFilter.paid), _chip(U.s.unpaid, InvoiceStatusFilter.unpaid), _chip(U.s.overdue, InvoiceStatusFilter.overdue)]),
    );
  });

  Widget _chip(String label, InvoiceStatusFilter value) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: ChoiceChip(label: Text(label), selected: c.statusFilter == value, onSelected: (_) => c.setStatus(value)),
  );

  Widget _list() => Obx(() {
    if (c.state.isError()) return Center(child: Text(U.s.errorReadingData));
    if (c.state.isEmpty()) return Center(child: Text(U.s.noInvoiceFound));
    if (!c.state.isLoaded()) return const Center(child: CircularProgressIndicator());
    if (MediaQuery.sizeOf(context).width >= 900) {
      return UListView(
        header: URow(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            UTextBodyLarge(U.s.tenant, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.invoiceType, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.dueDate, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.debtAmount, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.paidAmount, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.penalty, color: AppColors.white, textAlign: .center).expanded(),
            UTextBodyLarge(U.s.paymentStatus, color: AppColors.white, textAlign: .center).expanded(),
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

  Widget _statusChip(UDormBedInvoiceResponse i) {
    final Color color = i.isPaid
        ? AppColors.green
        : i.isOverdue
        ? AppColors.red
        : AppColors.orange;
    final String label = i.isPaid
        ? U.s.paid
        : i.isOverdue
        ? U.s.overdue
        : U.s.unpaid;
    return UContainer(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      radius: 20,
      color: color.withValues(alpha: 0.15),
      child: UTextBodySmall(label, color: color),
    );
  }

  String _tenantLabel(UDormBedInvoiceResponse i) => i.contract?.user?.displayName ?? widget.contract?.user?.displayName ?? "-";

  Widget _itemDesktop({required UDormBedInvoiceResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? AppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium(_tenantLabel(i), textAlign: .center).expanded(),
      UTextBodyMedium(_typeLabel(i), textAlign: .center).expanded(),
      UTextBodyMedium(i.dueDate.toJalaliDate(), textAlign: .center).expanded(),
      UTextBodyMedium(i.debtAmount.rial(), textAlign: .center).expanded(),
      UTextBodyMedium(i.paidAmount.rial(), textAlign: .center).expanded(),
      UTextBodyMedium(i.penaltyAmount.rial(), textAlign: .center).expanded(),
      Center(child: _statusChip(i)).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UDormBedInvoiceResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.receipt_long_rounded),
      title: UTextBodyMedium("${_typeLabel(i)} • ${i.debtAmount.rial()}"),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[UTextBodyMedium(_tenantLabel(i)), UTextBodySmall("${U.s.dueDate}: ${i.dueDate.toJalaliDate()}"), UTextBodySmall("${U.s.paidAmount}: ${i.paidAmount.rial()} • ${U.s.penalty}: ${i.penaltyAmount.rial()}"), _statusChip(i)]),
      trailing: _menu(i),
    ),
  );

  Widget _menu(UDormBedInvoiceResponse i) => PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      if (!i.isPaid && U.user.hasPermission(TagUser.permissionPayInvoices))
        PopupMenuItem<String>(
          child: UIconTextHorizontal(
            leading: Icon(Icons.payments_rounded, color: AppColors.green.shade700, size: 20),
            trailing: Text(U.s.markAsPaid, style: TextStyle(color: AppColors.green.shade700)),
          ),
          onTap: () => c.pay(i),
        ),
      if (U.user.hasPermission(TagUser.permissionManageInvoices))
        PopupMenuItem<String>(
          child: UIconTextHorizontal(leading: const Icon(Icons.edit, size: 20), trailing: Text(U.s.edit)),
          onTap: () => _showEditDialog(p: i),
        ),
      if (U.user.hasPermission(TagUser.permissionDeleteInvoices))
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
      title: Text(U.s.filter),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UTextFieldDatePicker(
              jalali: true,
              controller: c.minDueDateController,
              labelText: U.s.dueDate,
              onChange: (DateTime d, Jalali j) {
                c.minDueDate = d;
                c.minDueDateController.text = d.toJalaliDate();
              },
            ).pSymmetric(vertical: 6),
            UTextFieldDatePicker(
              jalali: true,
              controller: c.maxDueDateController,
              labelText: U.s.dueDate,
              onChange: (DateTime d, Jalali j) {
                c.maxDueDate = d;
                c.maxDueDateController.text = d.toJalaliDate();
              },
            ).pSymmetric(vertical: 6),
            UTextField(controller: c.minDebtController, labelText: U.s.minPrice, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
            UTextField(controller: c.maxDebtController, labelText: U.s.maxPrice, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
            const SizedBox(height: 20),
            UButtonSubmitCancel(
              submitTitle: U.s.filter,
              cancelTitle: U.s.clearFilters,
              onSubmit: () {
                c.applyExtraFilters();
                UNavigator.back();
              },
              onCancel: () {
                c.clearExtraFilters();
                UNavigator.back();
              },
            ),
          ],
        ),
      ),
    ),
  );

  void _showEditDialog({UDormBedInvoiceResponse? p}) {
    final bool isEdit = p != null;
    final TextEditingController debt = TextEditingController(text: p?.debtAmount.toInt().toString());
    final TextEditingController creditor = TextEditingController(text: p?.creditorAmount.toInt().toString());
    final TextEditingController paid = TextEditingController(text: p?.paidAmount.toInt().toString());
    final TextEditingController penalty = TextEditingController(text: p?.penaltyAmount.toInt().toString());
    final TextEditingController dueCtrl = TextEditingController(text: p == null ? null : p.dueDate.toJalaliDate());
    final TextEditingController description = TextEditingController(text: p?.jsonData.description);

    final Rxn<UDormBedContractResponse> contract = Rxn<UDormBedContractResponse>();
    DateTime? dueDate = p?.dueDate;
    TagDormBedInvoice type = _types.firstWhere((TagDormBedInvoice t) => p?.tags.contains(t.number) ?? false, orElse: () => TagDormBedInvoice.rent);

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    UNavigator.dialog(
      AlertDialog(
        title: Text(isEdit ? U.s.editInvoice : U.s.createInvoice),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setLocal) => Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!isEdit && widget.contract == null)
                    UTextFieldAutoCompleteAsync<UDormBedContractResponse>(
                      labelBuilder: (UDormBedContractResponse i) => "${i.user?.displayName ?? "-"} · ${i.bed?.title ?? ""} · ${i.startDate.toJalaliDate()}",
                      onChanged: contract.call,
                      selectedItem: contract.value,
                      fetchData: c.readContracts,
                      hintText: U.s.contract,
                    ).pSymmetric(vertical: 6),
                  DropdownButtonFormField<int>(
                    isExpanded: true,
                    initialValue: type.number,
                    decoration: InputDecoration(labelText: U.s.invoiceType, border: const OutlineInputBorder()),
                    items: _types.map((TagDormBedInvoice t) => DropdownMenuItem<int>(value: t.number, child: Text(t.localizedTitle))).toList(),
                    onChanged: (int? v) => setLocal(() => type = _types.firstWhere((TagDormBedInvoice t) => t.number == v)),
                  ).pSymmetric(vertical: 6),
                  UTextField(
                    controller: debt,
                    labelText: U.s.debtAmount,
                    keyboardType: TextInputType.number,
                    validator: UValidators.required(message: ""),
                    formatters: <TextInputFormatter>[UCurrencyInputFormatter()],
                  ).pSymmetric(vertical: 6),
                  UTextField(controller: creditor, labelText: U.s.creditor, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
                  UTextField(controller: paid, labelText: U.s.paidAmount, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
                  UTextField(controller: penalty, labelText: U.s.penaltyAmount, keyboardType: TextInputType.number, formatters: <TextInputFormatter>[UCurrencyInputFormatter()]).pSymmetric(vertical: 6),
                  UTextFieldDatePicker(
                    controller: dueCtrl,
                    labelText: U.s.dueDate,
                    jalali: true,
                    initialDate: dueDate,
                    validator: UValidators.required(message: ""),
                    onChange: (DateTime d, Jalali j) {
                      dueDate = d;
                      dueCtrl.text = d.toJalaliDate();
                    },
                  ).pSymmetric(vertical: 6),
                  UTextField(controller: description, labelText: U.s.description, lines: 2).pSymmetric(vertical: 6),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        if (dueDate == null) {
                          UToast.error(message: U.s.errorSubmittingForm);
                          return;
                        }
                        if (isEdit) {
                          c.update(
                            p: UDormBedInvoiceUpdateParams(
                              id: p.id,
                              tags: <int>[type.number],
                              debtAmount: debt.text.isEmpty ? null : debt.numDouble(),
                              creditorAmount: creditor.text.isEmpty ? null : creditor.numDouble(),
                              paidAmount: paid.text.isEmpty ? null : paid.numDouble(),
                              penaltyAmount: penalty.text.isEmpty ? null : penalty.numDouble(),
                              dueDate: dueDate,
                              description: description.text.nullIfEmpty(),
                            ),
                          );
                        } else {
                          final String? cid = contract.value?.id ?? widget.contract?.id;
                          if (cid == null) {
                            UToast.error(message: U.s.errorSubmittingForm);
                            return;
                          }
                          final String userId = contract.value?.user?.id ?? widget.contract?.user?.id ?? "";
                          c.create(
                            p: UDormBedInvoiceCreateParams(
                              tags: <int>[TagDormBedInvoice.notPaid.number, type.number],
                              debtAmount: debt.text.isEmpty ? 0 : debt.numDouble(),
                              creditorAmount: creditor.text.isEmpty ? 0 : creditor.numDouble(),
                              paidAmount: paid.text.isEmpty ? 0 : paid.numDouble(),
                              penaltyAmount: penalty.text.isEmpty ? 0 : penalty.numDouble(),
                              userId: userId,
                              contractId: cid,
                              dueDate: dueDate!,
                              description: description.text.trim(),
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
