part of "../data.dart";

abstract class UIpgFlow {
  static Future<bool> topUp(int amount) async {
    if (amount <= 0) {
      UToast.error(message: U.s.invalidAmount);
      return false;
    }
    final Completer<bool> completer = Completer<bool>();
    ULoading.show();

    await UServices.ipg.pay(
      p: UIpgSaleParams(amount: amount.toDouble()),
      onOk: (UResponse<UIpgPayResponse> r) async {
        ULoading.dismiss();
        final UIpgPayResponse? data = r.result;
        if (data == null || data.url.isEmpty) {
          UToast.error(message: r.message);
          completer.complete(false);
          return;
        }
        final bool paid = await UNavigator.push<bool>(UIpgWebViewPage(url: data.url)) ?? false;
        completer.complete(paid);
      },
      onError: (UEmptyResponse response) {
        ULoading.dismiss();
        UToast.error(message: response.message);
        completer.complete(false);
      },
      onException: (String response) {
        ULoading.dismiss();
        UToast.error(message: response);
        completer.complete(false);
      },
    );
    return completer.future;
  }
}
