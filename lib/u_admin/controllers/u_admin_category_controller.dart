part of "../u_admin.dart";

class UAdminCategoryController {
  late TagCategory tag;

  final Rx<PageState> state = PageState.initial.obs;
  final RxList<UCategoryResponse> list = <UCategoryResponse>[].obs;

  void init() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    state.loading();
    UCore.services.category.read(
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
    UCore.services.category.create(
      p: p,
      onOk: (UResponse<UCategoryResponse> response) async {
        UNavigator.back();
        ULoading.dismiss();
        UNavigator.snackBar(message: UCore.s.created);
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
    UCore.services.category.update(
      p: p,
      onOk: (UResponse<UCategoryResponse> response) {
        UNavigator.back();
        ULoading.dismiss();
        UNavigator.snackBar(message: UCore.s.edited);
        loadCategories();
      },
      onError: (UResponse<dynamic> error) {
        ULoading.dismiss();
        UNavigator.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void delete(UCategoryResponse category) => UNavigator.confirm(
    title: UCore.s.delete,
    message: UCore.s.areYouSureYouWantToDelete,
    onConfirm: () {
      ULoading.show();
      UCore.services.category.delete(
        p: UIdParams(id: category.id),
        onOk: (UResponse<dynamic> response) {
          UNavigator.back();
          ULoading.dismiss();
          UNavigator.snackBar(message: UCore.s.deleted);
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
