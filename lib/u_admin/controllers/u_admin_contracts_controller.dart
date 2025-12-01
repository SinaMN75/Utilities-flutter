part of "../u_admin.dart";

class UAdminContractController {
  List<UContractResponse> list = <UContractResponse>[];
  List<UContractResponse> filteredList = <UContractResponse>[];
  final Rx<PageState> state = PageState.initial.obs;

  RxInt pageNumber = 1.obs;
  RxInt totalPages = 1.obs;
  int pageSize = 20;

  List<TagContract> selectedTags = <TagContract>[];
  DateTime? fromCreatedAt;
  DateTime? toCreatedAt;
  bool orderByCreatedAt = false;
  bool orderByCreatedAtDesc = false;

  void init({List<TagContract> tags = const <TagContract>[]}) {
    selectedTags = tags;
    read();
  }

  Future<void> read() async {
    state.loading();

    await UCore.services.contract.read(
      p: UContractReadParams(
        tags: selectedTags.numbers,
        fromCreatedAt: fromCreatedAt,
        toCreatedAt: toCreatedAt,
        orderByCreatedAt: orderByCreatedAt,
        orderByCreatedAtDesc: orderByCreatedAtDesc,
        pageNumber: pageNumber.value,
        pageSize: pageSize,
      ),
      onOk: (UResponse<List<UContractResponse>> response) {
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

  void delete(UContractResponse i) => UNavigator.confirm(
    title: UCore.s.delete,
    message: UCore.s.areYouSureYouWantToDelete,
    onConfirm: () {
          ULoading.show();
          UCore.services.contract.delete(
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

  void create({required UContractCreateParams p}) {
    UCore.services.contract.create(
      p: p,
      onOk: (UResponse<UContractResponse> r) {
        UNavigator.snackBar(message: UCore.s.submitted);
        ULoading.dismiss();
      },
      onError: (UResponse<dynamic> r) {
        UNavigator.error(message: r.message);
        ULoading.dismiss();
      },
      onException: (String r) {
        UNavigator.error(message: UCore.s.errorSubmittingForm);
        ULoading.dismiss();
      },
    );
  }

  void update({required UContractUpdateParams p}) {
    UCore.services.contract.update(
      p: p,
      onOk: (UResponse<UContractResponse> r) {
        UNavigator.back();
        UNavigator.snackBar(message: UCore.s.submitted);
        ULoading.dismiss();
        read();
      },
      onError: (UResponse<dynamic> r) {
        UNavigator.back();
        UNavigator.error(message: r.message);
        ULoading.dismiss();
      },
      onException: (String r) {
        UNavigator.back();
        UNavigator.error(message: UCore.s.errorSubmittingForm);
        ULoading.dismiss();
      },
    );
  }
}
