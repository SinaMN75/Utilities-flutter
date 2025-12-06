part of "../u_admin.dart";

class UAdminUsersController {
  RxList<UUserResponse> list = <UUserResponse>[].obs;
  final Rx<PageState> state = PageState.initial.obs;

  RxInt pageNumber = 1.obs;
  RxInt totalPages = 1.obs;
  int pageSize = 20;

  TagUser? selectedTag;
  DateTime? fromCreatedAt;
  DateTime? toCreatedAt;
  bool orderByCreatedAt = false;
  bool orderByCreatedAtDesc = false;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController fromCreatedAtController = TextEditingController();
  final TextEditingController toCreatedAtController = TextEditingController();

  void init() {
    read();
  }

  Future<void> read() async {
    state.loading();

    await U.services.user.read(
      p: UUserReadParams(
        userName: userNameController.text.isEmpty ? null : userNameController.text,
        phoneNumber: phoneNumberController.text.isEmpty ? null : phoneNumberController.text,
        tags: selectedTag != null ? <int>[selectedTag!.number] : null,
        fromCreatedAt: fromCreatedAt,
        toCreatedAt: toCreatedAt,
        orderByCreatedAt: orderByCreatedAt,
        orderByCreatedAtDesc: orderByCreatedAtDesc,
        pageNumber: pageNumber.value,
        pageSize: pageSize,
      ),
      onOk: (UResponse<List<UUserResponse>> response) {
        list(response.result);
        totalPages((response.totalCount / pageSize).toInt() + 1);
        state.loaded();
      },
      onError: (UResponse<dynamic> error) {
        state.error();
        Get.snackbar("خطا", error.message);
      },
      onException: (String e) {},
    );
  }

  void applyFilters() {
    read();
  }

  void clearFilters() {
    userNameController.clear();
    phoneNumberController.clear();
    selectedTag = null;
    fromCreatedAt = null;
    toCreatedAt = null;
    read();
  }

  void delete(UUserResponse user) => UNavigator.confirm(
    title: "حذف کاربر",
    message: "آیا از حذف این کاربر اطمینان دارید؟",
    onConfirm: () {
      ULoading.show();
      U.services.user.delete(
        p: UIdParams(id: user.id),
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

  void create({
    required final GlobalKey<FormState> formKey,
    required final UUserCreateParams p,
  }) => UValidators.validateForm(
    key: formKey,
    action: () {
      ULoading.show();
      U.services.user.create(
        p: p,
        onOk: (final UResponse<UUserResponse> r) {
          list.insert(0, r.result!);
          ULoading.dismiss();
          Get.back();
          UToast.snackBar(message: "User created successfully");
        },
        onError: (final UResponse<dynamic> r) {
          ULoading.dismiss();
          UToast.snackBar(message: r.message);
        },
        onException: (String e) {
          ULoading.dismiss();
          UToast.snackBar(message: e);
        },
      );
    },
  );

  void update({
    required final GlobalKey<FormState> formKey,
    required final UUserUpdateParams p,
  }) => UValidators.validateForm(
    key: formKey,
    action: () {
      ULoading.show();
      U.services.user.update(
        p: p,
        onOk: (final UResponse<UUserResponse> r) {
          read();
          ULoading.dismiss();
          Get.back();
          UToast.snackBar(message: "User created successfully");
        },
        onError: (final UResponse<dynamic> r) {
          ULoading.dismiss();
          UToast.snackBar(message: r.message);
        },
        onException: (String e) {
          ULoading.dismiss();
          UToast.snackBar(message: e);
        },
      );
    },
  );
}
