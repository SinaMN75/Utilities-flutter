part of "../u_admin.dart";

class UAdminInvoiceController {
  final UServices uServices;

  UAdminInvoiceController({required this.uServices});

  List<UInvoiceResponse> list = <UInvoiceResponse>[];
  List<UInvoiceResponse> filteredList = <UInvoiceResponse>[];
  final Rx<PageState> state = PageState.initial.obs;

  RxInt pageNumber = 1.obs;
  RxInt totalPages = 1.obs;
  int pageSize = 20;

  List<TagInvoice> selectedTags = <TagInvoice>[];
  DateTime? fromCreatedAt;
  DateTime? toCreatedAt;
  bool orderByCreatedAt = false;
  bool orderByCreatedAtDesc = false;

  void init({List<TagInvoice> tags = const <TagInvoice>[]}) {
    selectedTags = tags;
    read();
  }

  Future<void> read({String? parentId}) async {
    state.loading();

    uServices.invoice.read(
      p: UInvoiceReadParams(
        tags: selectedTags.numbers,
        fromCreatedAt: fromCreatedAt,
        toCreatedAt: toCreatedAt,
        orderByCreatedAt: orderByCreatedAt,
        orderByCreatedAtDesc: orderByCreatedAtDesc,
        pageNumber: pageNumber.value,
        pageSize: pageSize,
      ),
      onOk: (UResponse<List<UInvoiceResponse>> response) {
        list = response.result!;
        totalPages((response.totalCount / pageSize).toInt() + 1);
        state.loaded();
      },
      onError: (UResponse<dynamic> error) {
        state.error();
        UNavigator.error(message: error.message);
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

  void delete(UInvoiceResponse i) => UNavigator.confirm(
        title: "Delete",
        message: "Are You Sure You Want To Delete This Invoice?",
        onConfirm: () {
          ULoading.show();
          uServices.invoice.delete(
            p: UIdParams(id: i.id),
            onOk: (final UResponse<dynamic> r) {
              UNavigator.back();
              UNavigator.snackBar(message: r.message);
              ULoading.dismiss();
            },
            onError: (final UResponse<dynamic> r) {
              UNavigator.error(message: r.message);
              ULoading.dismiss();
            },
            onException: (String e) {},
          );
        },
      );

  void create({required UInvoiceCreateParams p}) {
    uServices.invoice.create(
      p: p,
      onOk: (UResponse<UInvoiceResponse> r) {
        UNavigator.snackBar(message: "Submitted");
        ULoading.dismiss();
      },
      onError: (UResponse<dynamic> r) {
        UNavigator.error(message: r.message);
        ULoading.dismiss();
      },
      onException: (String r) {
        UNavigator.error(message: "Error Submitting Form");
        ULoading.dismiss();
      },
    );
  }

  void update({required UInvoiceUpdateParams p}) {
    uServices.invoice.update(
      p: p,
      onOk: (UResponse<UInvoiceResponse> r) {
        UNavigator.snackBar(message: "Submitted");
        ULoading.dismiss();
      },
      onError: (UResponse<dynamic> r) {
        UNavigator.error(message: r.message);
        ULoading.dismiss();
      },
      onException: (String r) {
        UNavigator.error(message: "Error Submitting Form");
        ULoading.dismiss();
      },
    );
  }
}
