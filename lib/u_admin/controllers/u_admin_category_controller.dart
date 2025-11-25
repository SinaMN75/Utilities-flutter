part of "../u_admin.dart";

class UAdminCategoryController {
  final UServices uServices;

  UAdminCategoryController({required this.uServices});

  late TagCategory tag;

  final Rx<PageState> state = PageState.initial.obs;
  final RxList<UCategoryResponse> list = <UCategoryResponse>[].obs;


  void init() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    state.loading();
    uServices.category.read(
      p: UCategoryReadParams(
        tags: <int>[tag.number],
        showChildren: true,
      ),
      onOk: (UResponse<List<UCategoryResponse>> response) {
        list.clear();
        list.addAll(response.result ?? <UCategoryResponse>[]);
        state.loaded();
      },
      onError: (UResponse<dynamic> error) {
        state.error();
        UNavigator.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void create({required UCategoryCreateParams p}) {
    ULoading.show();
    uServices.category.create(
      p: p,
      onOk: (UResponse<UCategoryResponse> response) async {
        UNavigator.back();
        ULoading.dismiss();
        UNavigator.snackBar(message: "Category Created");
        await loadCategories();
      },
      onError: (UResponse<dynamic> error) {
        ULoading.dismiss();
        UNavigator.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void update({required UCategoryUpdateParams p}) {
    ULoading.show();
    uServices.category.update(
      p: p,
      onOk: (UResponse<UCategoryResponse> response) {
        UNavigator.back();
        ULoading.dismiss();
        UNavigator.snackBar(message: "Category Edited");
        loadCategories();
      },
      onError: (UResponse<dynamic> error) {
        ULoading.dismiss();
        UNavigator.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void delete(UCategoryResponse category) =>
      UNavigator.confirm(
        title: "Delete",
        message: "Are You Sure You Want To Delete This Category?",
        onConfirm: () {
          ULoading.show();
          uServices.category.delete(
            p: UIdParams(id: category.id),
            onOk: (UResponse<dynamic> response) {
              UNavigator.back();
              ULoading.dismiss();
              UNavigator.snackBar(message: "Category Deleted");
              loadCategories();
            },
            onError: (UResponse<dynamic> error) {
              UNavigator.back();
              ULoading.dismiss();
              UNavigator.error(message: error.message);
            },
            onException: (String e) {},
          );
        },
      );
}
