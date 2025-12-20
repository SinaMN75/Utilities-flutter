part of "../u_admin.dart";

class UAdminLoginController {
  Rx<PageState> state = PageState.initial.obs;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController controllerUserName = TextEditingController(
    text: kDebugMode ? "sinamn75@gmail.com" : "",
  );
  final TextEditingController controllerPassword = TextEditingController(
    text: kDebugMode ? "123456789" : "",
  );

  void init() {}

  void login({required Function(UUserResponse) onFinish}) => UValidators.validateForm(
    key: formKey,
    action: () {
      ULoading.show();
      U.services.auth.loginWithEmailPassword(
        p: ULoginWithEmailPasswordParams(
          email: controllerUserName.text,
          password: controllerPassword.text.englishNumber(),
        ),
        onOk: (final UResponse<ULoginResponse> r) {
          ULocalStorage.set(UConstants.token, r.result!.token);
          ULocalStorage.set(UConstants.userId, r.result!.user.id);
          ULoading.dismiss();
          onFinish(r.result!.user);
        },
        onError: (final UResponse<dynamic> r) {
          ULoading.dismiss();
          UToast.error(message: r.message);
        },
        onException: (String e) => ULoading.dismiss(),
      );
    },
  );
}
