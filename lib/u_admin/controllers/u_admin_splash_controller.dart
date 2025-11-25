part of "../u_admin.dart";

class UAdminSplashController {
  Future<void> init({
    required Function(UUserResponse, List<UCategoryResponse>, List<UProductResponse>) onFinish,
    required VoidCallback onError,
  }) async {
    if (ULocalStorage.getString(UConstants.token) == null) {
      onError();
    } else {
      UCore.services.user.readById(
        p: UIdParams(id: ULocalStorage.getString(UConstants.userId)!),
        onOk: (final UResponse<UUserResponse> user) {
          UCore.services.category.read(
            p: UCategoryReadParams(showChildren: true),
            onOk: (UResponse<List<UCategoryResponse>> categories) {
              UCore.services.product.read(
                p: UProductReadParams(),
                onOk: (UResponse<List<UProductResponse>> products) {
                  onFinish(user.result!, categories.result!, products.result!);
                },
                onError: (UResponse<dynamic> r) => onError,
                onException: (String r) => onError,
              );
            },
            onError: (UResponse<dynamic> r) => onError,
            onException: (String r) => onError,
          );
        },
        onError: (final UResponse<dynamic> r) => onError,
        onException: (String e) => onError,
      );
    }
  }
}
