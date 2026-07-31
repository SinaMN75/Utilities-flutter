part of "payment_flow.dart";

class UIpgWebViewController {
  UIpgWebViewController() {
    if (kIsWeb) _webMessageDispose = UWebMessage.listen(_onWebMessage);
  }

  bool finished = false;
  void Function()? _webMessageDispose;

  bool _isCallback(Uri uri) => uri.path.toLowerCase().contains("/ipg/verify") && uri.queryParameters.containsKey("status");

  void onPageFinished(String url) {
    if (finished) return;
    final Uri? uri = Uri.tryParse(url);
    if (uri == null || !_isCallback(uri)) return;
    _finish(uri.queryParameters["status"] == "0");
  }

  // On web the iframe url is cross-origin and unreadable, so the Verify page posts its result to the app window instead.
  void _onWebMessage(String origin, Map<String, dynamic> data) {
    if (finished || data["source"] != "avahamrah_ipg") return;
    _finish("${data["status"]}" == "0");
  }

  void _finish(bool paid) {
    finished = true;
    UToast.snackBar(message: paid ? U.s.paymentSuccessful : U.s.paymentFailed);
    UNavigator.back<bool>(paid);
  }

  void confirmCancel() {
    UNavigator.back();
    if (finished) return;
    finished = true;
    UNavigator.back<bool>(false);
  }

  void dispose() => _webMessageDispose?.call();
}
