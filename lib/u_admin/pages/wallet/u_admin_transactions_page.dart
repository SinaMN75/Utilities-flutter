import "package:u/utilities.dart";

class UAdminTransactionsPage extends StatefulWidget {
  const UAdminTransactionsPage({super.key});

  @override
  State<UAdminTransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<UAdminTransactionsPage> {
  final UAdminTransactionsController c = UAdminTransactionsController();

  @override
  void initState() {
    c.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(U.s.transactions),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog),
        IconButton(icon: const Icon(Icons.add), tooltip: U.s.createTransaction, onPressed: _showCreateDialog),
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

  Widget _list() => UAdminListView<UTxnResponse>(
    state: c.state,
    items: () => c.list,
    totalCount: () => c.totalCount,
    onRetry: c.read,
    emptyText: U.s.noTransactionsFound,
    desktopHeader: () => <Widget>[
      UTextBodyLarge(U.s.amount, color: UAdminAppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.trackingNumber, color: UAdminAppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.status, color: UAdminAppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.user, color: UAdminAppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.created, color: UAdminAppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.operations, color: UAdminAppColors.white, textAlign: .center).expanded(),
    ],
    desktopRow: (UTxnResponse i, int index) => _itemDesktop(i: i, index: index),
    mobileRow: (UTxnResponse i, int index) => _itemResponsive(i: i, index: index),
  );

  String _statusName(UTxnResponse i) => i.tags.isEmpty ? "-" : (TagTxn.values.fromNumber(i.tags.first)?.localizedTitle ?? "-");

  Widget _itemDesktop({required UTxnResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? UAdminAppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium(i.amount.rial(), textAlign: .center).expanded(),
      UTextBodyMedium(i.trackingNumber ?? "-", textAlign: .center).expanded(),
      UTextBodyMedium(_statusName(i), textAlign: .center).expanded(),
      UTextBodyMedium(i.user?.displayName ?? "-", textAlign: .center).expanded(),
      UTextBodyMedium(i.createdAt.toJalaliDate(), textAlign: .center).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UTxnResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.receipt_long_rounded),
      title: UTextBodyMedium(i.amount.rial()),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[UTextBodySmall("${_statusName(i)} • ${i.trackingNumber ?? "-"}"), UTextBodySmall("${i.user?.displayName ?? "-"} • ${i.createdAt.toJalaliDate()}")]),
      trailing: _menu(i),
    ),
  );

  Widget _menu(UTxnResponse i) => PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        child: UIconTextHorizontal(leading: const Icon(Icons.edit, size: 20), trailing: Text(U.s.edit)),
        onTap: () => _showEditDialog(i),
      ),
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
      title: Text(U.s.filterTransactions),
      content: SizedBox(
        width: context.dialogWidth(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              UDropDownField<TagTxn?>(
                initialValue: c.statusFilter,
                onChanged: (TagTxn? v) => c.statusFilter = v,
                items: <DropdownMenuItem<TagTxn?>>[
                  DropdownMenuItem<TagTxn?>(child: Text(U.s.all)),
                  ...TagTxn.values.map((TagTxn t) => DropdownMenuItem<TagTxn?>(value: t, child: Text(t.localizedTitle))),
                ],
              ),
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
    final TextEditingController amount = TextEditingController();
    final TextEditingController tracking = TextEditingController();
    final Rx<TagTxn> tag = TagTxn.pending.obs;
    UNavigator.dialog(
      AlertDialog(
        title: Text(U.s.createTransaction),
        content: SizedBox(
          width: context.dialogWidth(),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  UTextField(
                    controller: amount,
                    labelText: U.s.amount,
                    keyboardType: TextInputType.number,
                    validator: UValidators.required(message: U.s.required),
                  ).pSymmetric(vertical: 6),
                  UTextField(
                    controller: tracking,
                    labelText: U.s.trackingNumber,
                    validator: UValidators.required(message: U.s.required),
                  ).pSymmetric(vertical: 6),
                  UDropDownField<TagTxn?>(
                    initialValue: tag.value,
                    onChanged: (TagTxn? v) => tag.value = v ?? tag.value,
                    items: TagTxn.values.map((TagTxn t) => DropdownMenuItem<TagTxn?>(value: t, child: Text(t.localizedTitle))).toList(),
                  ),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        UNavigator.back();
                        c.create(amount: amount.text.trim().toDouble(), trackingNumber: tracking.text.trim(), tag: tag.value.number);
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

  void _showEditDialog(UTxnResponse i) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController amount = TextEditingController(text: i.amount.toInt().toString());
    final TextEditingController tracking = TextEditingController(text: i.trackingNumber);
    final Rx<TagTxn> tag = (TagTxn.values.fromNumber(i.tags.isEmpty ? TagTxn.pending.number : i.tags.first) ?? TagTxn.pending).obs;
    UNavigator.dialog(
      AlertDialog(
        title: Text(U.s.editTransaction),
        content: SizedBox(
          width: context.dialogWidth(),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  UTextField(controller: amount, labelText: U.s.amount, keyboardType: TextInputType.number).pSymmetric(vertical: 6),
                  UTextField(controller: tracking, labelText: U.s.trackingNumber).pSymmetric(vertical: 6),
                  UDropDownField<TagTxn?>(
                    initialValue: tag.value,
                    onChanged: (TagTxn? v) => tag.value = v ?? tag.value,
                    items: TagTxn.values.map((TagTxn t) => DropdownMenuItem<TagTxn?>(value: t, child: Text(t.localizedTitle))).toList(),
                  ),
                  const SizedBox(height: 20),
                  UButtonSubmitCancel(
                    onSubmit: () => UValidators.validateForm(
                      key: formKey,
                      action: () {
                        UNavigator.back();
                        c.update(id: i.id, amount: amount.text.nullIfEmpty() == null ? null : amount.text.trim().toDouble(), trackingNumber: tracking.text.nullIfEmpty(), tags: <int>[tag.value.number]);
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
