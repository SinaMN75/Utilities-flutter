part of "../u_admin.dart";

class UAdminCategoriesPageArgs {}

class UAdminCategoriesController extends UBaseController {
  late UAdminCategoriesPageArgs args;

  late TagCategory tag;

  final RxList<UCategoryResponse> list = <UCategoryResponse>[].obs;

  void init({required UAdminCategoriesPageArgs args}) {
    this.args = args;
    read();
  }

  Future<void> read() async {
    state.loading();
    await UServices.category.read(
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
      onError: (UEmptyResponse error) {
        state.error();
        UToast.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void create({required UCategoryCreateParams p}) {
    ULoading.show();
    UServices.category.create(
      p: p,
      onOk: (UResponse<String> response) async {
        UNavigator.back();
        ULoading.dismiss();
        UToast.snackBar(message: U.s.created);
        await read();
      },
      onError: (UEmptyResponse error) {
        ULoading.dismiss();
        UToast.error(message: error.message);
      },
      onException: (String e) {},
    );
  }

  void update({required UCategoryUpdateParams p}) {
    ULoading.show();
    UServices.category.update(
      p: p,
      onOk: (UEmptyResponse response) {
        UNavigator.back();
        ULoading.dismiss();
        UToast.snackBar(message: U.s.edited);
        read();
      },
      onError: (UEmptyResponse error) {
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
      UServices.category.delete(
        p: UIdParams(id: category.id),
        onOk: (UEmptyResponse response) {
          UNavigator.back();
          ULoading.dismiss();
          UToast.snackBar(message: U.s.deleted);
          read();
        },
        onError: (UEmptyResponse error) {
          UNavigator.back();
          ULoading.dismiss();
          UToast.error(message: error.message);
        },
        onException: (String e) {},
      );
    },
  );
}
