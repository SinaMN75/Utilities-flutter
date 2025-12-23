part of "../u_admin.dart";

class UAdminContractsPageArgs {
  final String? productId;
  final String? userId;

  UAdminContractsPageArgs({
    this.productId,
    this.userId,
  });
}

class UAdminContractsController extends UAdminBaseController {
  late UAdminContractsPageArgs args;

  List<UContractResponse> list = <UContractResponse>[];
  List<UContractResponse> filteredList = <UContractResponse>[];
  Rxn<UUserResponse>? selectedUser = Rxn<UUserResponse>();

  String? userId;
  String? productId;

  void init({required final UAdminContractsPageArgs args}) {
    this.args = args;
    userId = args.userId;
    productId = args.productId;
    read();
  }

  Future<void> read() async {
    state.loading();

    await U.services.contract.read(
      p: UContractReadParams(
        pageNumber: pageNumber.value,
        pageSize: pageSize,
        fromCreatedAt: fromCreatedAt,
        toCreatedAt: toCreatedAt,
        orderByCreatedAt: orderByCreatedAt,
        orderByCreatedAtDesc: orderByCreatedAtDesc,
        startDate: startDate,
        endDate: endDate,
        productId: productId,
        userId: userId,
        selectorArgs: const ContractSelectorArgs(
          user: UserSelectorArgs(),
          invoice: InvoiceSelectorArgs(),
        ),
      ),
      onOk: (UResponse<List<UContractResponse>> response) {
        list = response.result!;
        totalPages((response.totalCount / pageSize).toInt() + 1);
        state.loaded();
      },
      onError: (UResponse<dynamic> error) {
        state.error();
        UToast.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void applyFilters() {
    read();
  }

  void clearFilters() {
    fromCreatedAt = null;
    toCreatedAt = null;
    read();
  }

  void delete(UContractResponse i) => UNavigator.confirm(
    title: U.s.delete,
    message: U.s.areYouSureYouWantToDelete,
    onConfirm: () {
      ULoading.show();
      U.services.contract.delete(
        p: UIdParams(id: i.id),
        onOk: (final UResponse<dynamic> r) {
          UNavigator.back();
          UToast.snackBar(message: r.message);
          ULoading.dismiss();
        },
        onError: (final UResponse<dynamic> r) {
          UToast.error(message: r.message);
          ULoading.dismiss();
        },
        onException: (String e) {},
      );
    },
  );

  void create({required UContractCreateParams p}) {
    U.services.contract.create(
      p: p,
      onOk: (UResponse<UContractResponse> r) {
        UToast.snackBar(message: U.s.submitted);
        ULoading.dismiss();
      },
      onError: (UResponse<dynamic> r) {
        UToast.error(message: r.message);
        ULoading.dismiss();
      },
      onException: (String r) {
        UToast.error(message: U.s.errorSubmittingForm);
        ULoading.dismiss();
      },
    );
  }

  void update({required UContractUpdateParams p}) {
    U.services.contract.update(
      p: p,
      onOk: (UResponse<UContractResponse> r) {
        UNavigator.back();
        UToast.snackBar(message: U.s.submitted);
        ULoading.dismiss();
        read();
      },
      onError: (UResponse<dynamic> r) {
        UNavigator.back();
        UToast.error(message: r.message);
        ULoading.dismiss();
      },
      onException: (String r) {
        UNavigator.back();
        UToast.error(message: U.s.errorSubmittingForm);
        ULoading.dismiss();
      },
    );
  }
}
