part of "../u_admin.dart";

class UAdminSplashController {
  Future<void> init({
    required VoidCallback onFinish,
    required VoidCallback onError,
  }) async {
    if (ULocalStorage.getString(UConstants.token) == null) {
      onError();
    } else {
      U.services.user.readById(
        p: UIdParams(id: ULocalStorage.getString(UConstants.userId)!),
        onOk: (final UResponse<UUserResponse> user) {
          U.user = user.result!;
          onFinish();
        },
        onError: (final UResponse<dynamic> r) => onError,
        onException: (String e) => onError,
      );
    }
  }
}
