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
  bool? hasActiveContract;
  UCategoryResponse? category;
  UCategoryResponse? subCategory;
  TextEditingController controllerMinPrice = TextEditingController();
  TextEditingController controllerMaxPrice = TextEditingController();
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerTitle = TextEditingController();

  void init({List<TagProduct> tags = const <TagProduct>[]}) {
    selectedTags = tags;
    read();
  }

  Future<void> read({String? parentId}) async {
    state.loading();

    await U.services.product.read(
      p: UProductReadParams(
        tags: selectedTags.numbers,
        fromCreatedAt: fromCreatedAt,
        toCreatedAt: toCreatedAt,
        orderByCreatedAt: orderByCreatedAt,
        orderByCreatedAtDesc: orderByCreatedAtDesc,
        pageNumber: pageNumber.value,
        pageSize: pageSize,
        parentId: parentId,
        hasActiveContract: hasActiveContract,
        categories: <String>[?category?.id, ?subCategory?.id],
        minRent: controllerMinPrice.text.englishNumber().toDouble(),
        maxRent: controllerMaxPrice.text.englishNumber().toDouble(),
        title: controllerTitle.text,
        code: controllerCode.text,
        selectorArgs: const ProductSelectorArgs(category: CategorySelectorArgs(), contract: ContractSelectorArgs(product: ProductSelectorArgs())),
      ),
      onOk: (UResponse<List<UProductResponse>> response) {
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
    pageNumber(1);
    read();
  }

  void clearFilters() {
    pageNumber(1);
    selectedTags.clear();
    fromCreatedAt = null;
    toCreatedAt = null;
    read();
  }

  void delete(UProductResponse i) => UNavigator.confirm(
    title: U.s.delete,
    message: U.s.areYouSureYouWantToDelete,
    onConfirm: () {
      U.services.product.delete(
        p: UIdParams(id: i.id),
        onOk: (final UResponse<dynamic> r) {
          UNavigator.back();
          UToast.snackBar(message: r.message);
          read();
        },
        onError: (final UResponse<dynamic> r) {
          UNavigator.back();
          UToast.error(message: r.message);
          read();
        },
        onException: (String e) {
          UNavigator.back();
          UToast.error(message: e);
        },
      );
    },
  );

  void create({required UProductCreateParams p}) {
    state.loading();
    U.services.product.create(
      p: p,
      onOk: (UResponse<UProductResponse> r) {
        UToast.snackBar(message: U.s.submitted);
        read();
      },
      onError: (UResponse<dynamic> r) {
        UToast.error(message: r.message);
        read();
      },
      onException: (String r) {
        UToast.error(message: U.s.errorSubmittingForm);
        read();
      },
    );
  }

  void update({required UProductUpdateParams p}) {
    U.services.product.update(
      p: p,
      onOk: (UResponse<UProductResponse> r) {
        UToast.snackBar(message: U.s.submitted);
        read();
      },
      onError: (UResponse<dynamic> r) {
        UToast.error(message: r.message);
        read();
      },
      onException: (String r) {
        UToast.error(message: U.s.errorSubmittingForm);
        read();
      },
    );
  }
}
