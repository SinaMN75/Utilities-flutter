part of "../u_admin.dart";

class CategoriesPageArgs {}

class UAdminCategoriesController extends UAdminBaseController {
  late CategoriesPageArgs args;

  late TagCategory tag;

  final RxList<UCategoryResponse> list = <UCategoryResponse>[].obs;

  void init({required CategoriesPageArgs args}) {
    this.args = args;
    read();
  }

  Future<void> read() async {
    state.loading();
    await U.services.category.read(
      p: UCategoryReadParams(
        tags: <int>[tag.number],
        selectorArgs: const CategorySelectorArgs(
          children: CategorySelectorArgs(),
          childrenDebt: 2,
        ),
      ),
      onOk: (UResponse<List<UCategoryResponse>> response) {
        list.clear();
        list.addAll(response.result ?? <UCategoryResponse>[]);
        state.loaded();
      },
      onError: (UResponse<dynamic> error) {
        state.error();
        UToast.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void create({required UCategoryCreateParams p}) {
    ULoading.show();
    U.services.category.create(
      p: p,
      onOk: (UResponse<UCategoryResponse> response) async {
        UNavigator.back();
        ULoading.dismiss();
        UToast.snackBar(message: U.s.created);
        await read();
      },
      onError: (UResponse<dynamic> error) {
        ULoading.dismiss();
        UToast.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void update({required UCategoryUpdateParams p}) {
    ULoading.show();
    U.services.category.update(
      p: p,
      onOk: (UResponse<UCategoryResponse> response) {
        UNavigator.back();
        ULoading.dismiss();
        UToast.snackBar(message: U.s.edited);
        read();
      },
      onError: (UResponse<dynamic> error) {
        ULoading.dismiss();
        UToast.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void delete(UCategoryResponse category) => UNavigator.confirm(
    title: U.s.delete,
    message: U.s.areYouSureYouWantToDelete,
    onConfirm: () {
      ULoading.show();
      U.services.category.delete(
        p: UIdParams(id: category.id),
        onOk: (UResponse<dynamic> response) {
          UNavigator.back();
          ULoading.dismiss();
          UToast.snackBar(message: U.s.deleted);
          read();
        },
        onError: (UResponse<dynamic> error) {
          UNavigator.back();
          ULoading.dismiss();
          UToast.error(message: error.message);
        },
        onException: (String e) {},
      );
    },
  );
}
