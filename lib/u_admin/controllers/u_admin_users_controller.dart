part of "../u_admin.dart";

class UAdminUsersController extends UAdminBaseController {
  RxList<UUserResponse> list = <UUserResponse>[].obs;

  TagUser? selectedTag;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
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
        firstName: firstNameController.valueOrNull(),
        lastName: lastNameController.valueOrNull(),
        userName: userNameController.valueOrNull(),
        phoneNumber: phoneNumberController.valueOrNull(),
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
        UToast.error(message: error.message);
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
    firstNameController.clear();
    lastNameController.clear();
    selectedTag = null;
    fromCreatedAt = null;
    toCreatedAt = null;
    read();
  }

  void delete(UUserResponse user) => UNavigator.confirm(
    title: U.s.deleteUser,
    message: U.s.areYouSureToDeleteThisUser,
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
          UToast.snackBar(message: U.s.userCreatedSuccessfully);
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
