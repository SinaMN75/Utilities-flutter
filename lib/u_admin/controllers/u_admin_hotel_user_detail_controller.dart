part of "../u_admin.dart";
// Business logic relocated from the u_admin app so it can be shared across projects.

/// Lifecycle status of a single contract relative to today.
enum ContractLifecycle { active, upcoming, expired }

/// Loads everything a single user is connected to on the property side:
/// their dorm-bed contracts (with bed -> room -> dorm and invoices) plus the
/// payments (wallets & merchants) embedded on the user record.
class UAdminHotelUserDetailController {
  UAdminHotelUserDetailController({required this.user});

  // The user being inspected; refreshed with relations once loaded.
  UUserResponse user;

  final Rx<PageState> state = PageState.initial.obs;
  final RxList<UDormBedContractResponse> contracts = <UDormBedContractResponse>[].obs;

  Future<void> init() async => read();

  Future<void> read() async {
    state.loading();
    // Pull wallets & merchants so the payments section has data to show.
    await UServices.user.readById(
      p: UIdParams(
        id: user.id,
        selectorArgs: const UserSelectorArgs(wallet: WalletSelectorArgs(), merchant: MerchantSelectorArgs()),
      ),
      onOk: (UResponse<UUserResponse> r) {
        if (r.result != null) user = r.result!;
      },
      onError: (UEmptyResponse r) {},
      onException: (String e) {},
    );
    // Pull the user's contracts with the full bed -> room -> dorm chain + invoices.
    await UServices.hotel.readDormBedContract(
      p: UDormBedContractReadParams(
        userId: user.id,
        pageNumber: 1,
        pageSize: 100,
        selectorArgs: const ContractSelectorArgs(
          bed: DormBedSelectorArgs(room: DormRoomSelectorArgs(dorm: DormSelectorArgs())),
          invoice: InvoiceSelectorArgs(),
        ),
      ),
      onOk: (UResponse<List<UDormBedContractResponse>> r) {
        contracts.value = r.result ?? <UDormBedContractResponse>[];
        state.loaded();
      },
      onError: (UResponse<dynamic> e) => state.error(),
      onException: (String e) => state.error(),
    );
  }

  // --- derived helpers ------------------------------------------------------

  List<UWalletResponse> get wallets => user.wallets ?? <UWalletResponse>[];

  List<UMerchantResponse> get merchants => user.merchants ?? <UMerchantResponse>[];

  double get totalWalletBalance => wallets.fold(0, (double sum, UWalletResponse w) => sum + w.balance);

  int get activeContractsCount => contracts.where((UDormBedContractResponse c) => lifecycleOf(c) == ContractLifecycle.active).length;

  /// Total unpaid amount (debt + penalty - paid) across every invoice.
  double get totalOutstanding => contracts.fold(0, (double sum, UDormBedContractResponse c) => sum + outstandingOf(c));

  /// Where the contract sits on the timeline right now.
  ContractLifecycle lifecycleOf(UDormBedContractResponse c) {
    final DateTime now = DateTime.now();
    if (now.isBefore(c.startDate)) return ContractLifecycle.upcoming;
    if (now.isAfter(c.endDate)) return ContractLifecycle.expired;
    return ContractLifecycle.active;
  }

  List<UDormBedInvoiceResponse> invoicesOf(UDormBedContractResponse c) => c.invoices ?? <UDormBedInvoiceResponse>[];

  int unpaidCountOf(UDormBedContractResponse c) => invoicesOf(c).where((UDormBedInvoiceResponse i) => i.paidDate == null).length;

  /// Sum of remaining debt across a contract's invoices (never negative).
  double outstandingOf(UDormBedContractResponse c) => invoicesOf(c).fold(0, (double sum, UDormBedInvoiceResponse i) {
    final double remaining = (i.debtAmount + i.penaltyAmount) - i.paidAmount;
    return sum + (remaining > 0 ? remaining : 0);
  });
}
