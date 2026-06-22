part of "../u_admin.dart";

class UAdminInvoicesPageArgs {
  final String? contractId;
  final String? userId;

  UAdminInvoicesPageArgs({
    this.contractId,
    this.userId,
  });
}

class UAdminInvoicesController extends UAdminBaseController {
  late UAdminInvoicesPageArgs args;
  List<UDormBedInvoiceResponse> list = <UDormBedInvoiceResponse>[];

  List<TagDormBedInvoice> selectedTags = <TagDormBedInvoice>[];
  String? userId;
  String? contractId;

  void init({required final UAdminInvoicesPageArgs args}) {
    this.args = args;
    userId = args.userId;
    contractId = args.contractId;
    read();
  }

  Future<void> read({String? parentId}) async {
    state.loading();

    await UServices.hotel.readDormBedInvoice(
      p: UDormBedInvoiceReadParams(
        tags: selectedTags.numbers,
        fromCreatedAt: fromCreatedAt,
        toCreatedAt: toCreatedAt,
        orderByCreatedAt: orderByCreatedAt,
        orderByCreatedAtDesc: orderByCreatedAtDesc,
        pageNumber: pageNumber.value,
        pageSize: pageSize,
        userId: userId,
        contractId: contractId,
        selectorArgs: const InvoiceSelectorArgs(
          contract: ContractSelectorArgs(user: UserSelectorArgs(), product: ProductSelectorArgs()),
        ),
      ),
      onOk: (UResponse<List<UDormBedInvoiceResponse>> response) {
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
    selectedTags.clear();
    fromCreatedAt = null;
    toCreatedAt = null;
    read();
  }

  void delete(UDormBedInvoiceResponse i) => UNavigator.confirm(
    title: U.s.delete,
    message: U.s.areYouSureYouWantToDelete,
    onConfirm: () {
      ULoading.show();
      UServices.hotel.deleteDormBedInvoice(
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

  void create({required UDormBedInvoiceCreateParams p}) {
    UServices.hotel.createDormBedInvoice(
      p: p,
      onOk: (UResponse<UDormBedInvoiceResponse> r) {
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

  void update({required UDormBedInvoiceUpdateParams p}) {
    UServices.hotel.updateDormBedInvoice(
      p: p,
      onOk: (UResponse<UDormBedInvoiceResponse> r) {
        UToast.snackBar(message: "Submitted");
        ULoading.dismiss();
      },
      onError: (UResponse<dynamic> r) {
        UToast.error(message: r.message);
        ULoading.dismiss();
      },
      onException: (String r) {
        UToast.error(message: "Error Submitting Form");
        ULoading.dismiss();
      },
    );
  }
}
