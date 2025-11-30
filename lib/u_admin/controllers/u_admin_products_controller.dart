part of "../u_admin.dart";

class UAdminProductController {
  List<UProductResponse> list = <UProductResponse>[];
  List<UProductResponse> filteredList = <UProductResponse>[];
  final Rx<PageState> state = PageState.initial.obs;

  RxInt pageNumber = 1.obs;
  RxInt totalPages = 1.obs;
  int pageSize = 20;

  List<TagProduct> selectedTags = <TagProduct>[];
  DateTime? fromCreatedAt;
  DateTime? toCreatedAt;
  bool orderByCreatedAt = false;
  bool orderByCreatedAtDesc = false;

  void init({List<TagProduct> tags = const <TagProduct>[]}) {
    selectedTags = tags;
    read();
  }

  Future<void> read({String? parentId}) async {
    state.loading();

    UCore.services.product.read(
      p: UProductReadParams(
        tags: selectedTags.numbers,
        fromCreatedAt: fromCreatedAt,
        toCreatedAt: toCreatedAt,
        orderByCreatedAt: orderByCreatedAt,
        orderByCreatedAtDesc: orderByCreatedAtDesc,
        pageNumber: pageNumber.value,
        pageSize: pageSize,
        showChildren: true,
        showCategories: true,
        showChildrenCount: true,
        parentId: parentId,
      ),
      onOk: (UResponse<List<UProductResponse>> response) {
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

  void delete(UProductResponse i) => UNavigator.confirm(
    title: UCore.s.delete,
    message: UCore.s.areYouSureYouWantToDelete,
    onConfirm: () {
          UCore.services.product.delete(
            p: UIdParams(id: i.id),
            onOk: (final UResponse<dynamic> r) {
              UNavigator.back();
              UNavigator.snackBar(message: r.message);
              read();
            },
            onError: (final UResponse<dynamic> r) {
              UNavigator.error(message: r.message);
              read();
            },
            onException: (String e) {},
          );
        },
      );

  void create({required UProductCreateParams p}) {
    state.loading();
    UCore.services.product.create(
      p: p,
      onOk: (UResponse<UProductResponse> r) {
        UNavigator.snackBar(message: UCore.s.submitted);
        read();
      },
      onError: (UResponse<dynamic> r) {
        UNavigator.error(message: r.message);
        read();
      },
      onException: (String r) {
        UNavigator.error(message: UCore.s.errorSubmittingForm);
        read();
      },
    );
  }

  void update({required UProductUpdateParams p}) {
    UCore.services.product.update(
      p: p,
      onOk: (UResponse<UProductResponse> r) {
        UNavigator.snackBar(message: UCore.s.submitted);
        read();
      },
      onError: (UResponse<dynamic> r) {
        UNavigator.error(message: r.message);
        read();
      },
      onException: (String r) {
        UNavigator.error(message: UCore.s.errorSubmittingForm);
        read();
      },
    );
  }
}
