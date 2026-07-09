import "package:u/utilities.dart";

class AdminUsersPage extends StatefulWidget {
  const AdminUsersPage({super.key, this.actions});

  // Optional per-row operations override; defaults to the page's built-in set.
  final UAdminActionBuilder<UUserResponse>? actions;

  @override
  State<AdminUsersPage> createState() => _AdminUsersPageState();
}

class _AdminUsersPageState extends State<AdminUsersPage> {
  final UAdminPaymentUsersController c = UAdminPaymentUsersController();

  @override
  void initState() {
    c.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UScaffold(
    appBar: AppBar(
      title: Text(U.s.usersManagement),
      actions: <Widget>[IconButton(icon: const Icon(Icons.filter_alt), tooltip: U.s.filter, onPressed: _showFilterDialog)],
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
          ).pAll(16),
        ),
      ],
    ),
  );

  Widget _list() => UAdminListView<UUserResponse>(
    state: c.state,
    items: () => c.list,
    totalCount: () => c.totalCount,
    onRetry: c.read,
    emptyText: U.s.noUserFound,
    desktopHeader: () => <Widget>[
      UTextBodyLarge(U.s.name, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.username, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.phoneNumber, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.nationalCode, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.verificationStatus, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.joinedDate, color: AppColors.white, textAlign: .center).expanded(),
      UTextBodyLarge(U.s.operations, color: AppColors.white, textAlign: .center).expanded(),
    ],
    desktopRow: (UUserResponse i, int index) => _itemDesktop(i: i, index: index),
    mobileRow: (UUserResponse i, int index) => _itemResponsive(i: i, index: index),
  );

  Widget _statusChip(UUserResponse i) {
    final bool verified = i.tags.containsAny(<int>[TagUser.nationalCardFrontVerified.number, TagUser.nationalCardBackVerified.number, TagUser.birthCertificateFirstVerified.number, TagUser.eSignatureVerified.number, TagUser.visualAuthenticationVerified.number]);
    final bool awaiting = i.tags.containsAny(<int>[TagUser.nationalCardFrontAwaitingVerification.number, TagUser.nationalCardBackAwaitingVerification.number, TagUser.birthCertificateFirstAwaitingVerification.number, TagUser.eSignatureAwaitingVerification.number, TagUser.visualAuthenticationAwaitingVerification.number]);
    final Color color = verified
        ? AppColors.green
        : awaiting
        ? AppColors.orange
        : AppColors.grey;
    final String label = verified
        ? U.s.verified
        : awaiting
        ? U.s.pendingVerification
        : U.s.notUploaded;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
      child: UTextBodySmall(label, color: color, fontWeight: FontWeight.w600),
    );
  }

  Widget _itemDesktop({required UUserResponse i, required int index}) => URow(
    backgroundColor: index.isOdd ? AppColors.transparent : Theme.of(context).colorScheme.primary.withValues(alpha: 0.16),
    children: <Widget>[
      UTextBodyMedium("${i.firstName ?? ""} ${i.lastName ?? ""}".trim(), textAlign: .center).expanded(),
      UTextBodyMedium(i.userName, textAlign: .center).expanded(),
      UTextBodyMedium(i.phoneNumber ?? "-", textAlign: .center, textDirection: TextDirection.ltr).expanded(),
      UTextBodyMedium(i.nationalCode ?? "-", textAlign: .center).expanded(),
      _statusChip(i).alignAtCenter().expanded(),
      UTextBodyMedium(i.createdAt.toJalaliDate(), textAlign: .center).expanded(),
      _menu(i).expanded(),
    ],
  );

  Widget _itemResponsive({required UUserResponse i, required int index}) => UContainer(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4),
    color: index.isOdd ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
    radius: 8,
    child: ListTile(
      dense: true,
      leading: const Icon(Icons.person_rounded),
      title: UTextBodyMedium("${i.firstName ?? ""} ${i.lastName ?? ""} (${i.userName})".trim()),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[UTextBodyMedium(i.phoneNumber ?? "-"), UTextBodySmall("${i.nationalCode ?? "-"} • ${i.createdAt.toJalaliDate()}"), const SizedBox(height: 4), _statusChip(i)]),
      trailing: _menu(i),
      onTap: () => PageSwitcher.adminUserDetail(user: i),
    ),
  );

  // Built-in operations (incl. navigate to a user's merchants / contracts); overridable via AdminUsersPage(actions: ...).
  Widget _menu(UUserResponse i) => UAdminOps.menu<UUserResponse>(
    context,
    item: i,
    actions: widget.actions,
    handlers: UAdminActionHandlers<UUserResponse>(onDelete: c.delete),
    fallback: (UAdminActionContext<UUserResponse> ctx) => <UAdminAction>[
      UAdminLinks.adminUserDetail(ctx.item),
      UAdminLinks.userMerchants(ctx.item),
      UAdminLinks.userContracts(ctx.item),
      ctx.delete(roles: <TagUser>[TagUser.permissionDeleteUsers]),
    ],
  );

  void _showFilterDialog() => UNavigator.dialog(
    AlertDialog(
      title: Text(U.s.filterUsers),
      content: SizedBox(
        width: context.dialogWidth(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Obx(
                () => UDropDownField<TagUser?>(
                  initialValue: c.verificationStatus.value,
                  onChanged: c.verificationStatus.call,
                  items: <DropdownMenuItem<TagUser?>>[
                    DropdownMenuItem<TagUser>(value: TagUser.verified, child: Text(TagUser.verified.localizedTitle)),
                    DropdownMenuItem<TagUser>(value: TagUser.awaitingVerification, child: Text(TagUser.awaitingVerification.localizedTitle)),
                    const DropdownMenuItem<TagUser?>(child: Text("---")),
                  ],
                ),
              ).pSymmetric(vertical: 6),
              UTextField(controller: c.firstNameFilterController, labelText: U.s.firstName).pSymmetric(vertical: 6),
              UTextField(controller: c.lastNameFilterController, labelText: U.s.lastName).pSymmetric(vertical: 6),
              UTextField(controller: c.userNameFilterController, labelText: U.s.username).pSymmetric(vertical: 6),
              UTextField(controller: c.phoneNumberFilterController, labelText: U.s.phoneNumber, keyboardType: TextInputType.phone).pSymmetric(vertical: 6),
              UTextField(controller: c.nationalCodeFilterController, labelText: U.s.nationalCode).pSymmetric(vertical: 6),
              UTextField(controller: c.emailFilterController, labelText: U.s.email, keyboardType: TextInputType.emailAddress).pSymmetric(vertical: 6),
              UTextField(controller: c.landLineFilterController, labelText: U.s.landline).pSymmetric(vertical: 6),
              UTextField(controller: c.bioFilterController, labelText: U.s.bio).pSymmetric(vertical: 6),
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
              UTextFieldDatePicker(
                jalali: true,
                controller: c.fromBirthController,
                labelText: U.s.fromBirthDate,
                onChange: (DateTime d, Jalali j) {
                  c.fromBirthController.text = j.formatCompactDate();
                  c.fromBirthDate = d;
                },
              ).pSymmetric(vertical: 6),
              UTextFieldDatePicker(
                jalali: true,
                controller: c.toBirthController,
                labelText: U.s.toBirthDate,
                onChange: (DateTime d, Jalali j) {
                  c.toBirthController.text = j.formatCompactDate();
                  c.toBirthDate = d;
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
