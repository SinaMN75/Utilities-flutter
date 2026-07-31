import "package:u/utilities.dart";

// Opens the IPG gateway for a payment and resolves true only when it succeeds. tag/invoiceId ride in additionalData
// server-side; omit them for a normal wallet top-up. Settlement (wallet + invoice) happens 100% in the backend callback.
abstract class UIpg {
  static Future<bool> pay({required double amount, TagTxn? tag, String? invoiceId}) async {
    if (amount <= 0) {
      UToast.error(message: U.s.invalidAmount);
      return false;
    }
    final Completer<bool> completer = Completer<bool>();
    ULoading.show();
    await UServices.ipg.pay(
      p: UIpgSaleParams(amount: amount, tag: tag, invoiceId: invoiceId),
      onOk: (UResponse<UIpgPayResponse> r) async {
        ULoading.dismiss();
        final UIpgPayResponse? data = r.result;
        if (data == null || data.url.isEmpty) {
          UToast.error(message: r.message);
          completer.complete(false);
          return;
        }
        completer.complete(await UNavigator.push<bool>(UIpgWebViewPage(url: data.url)) ?? false);
      },
      onError: (UEmptyResponse e) {
        ULoading.dismiss();
        UToast.error(message: e.message);
        completer.complete(false);
      },
      onException: (String e) {
        ULoading.dismiss();
        UToast.error(message: e);
        completer.complete(false);
      },
    );
    return completer.future;
  }
}

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

class UIpgWebViewPage extends StatefulWidget {
  const UIpgWebViewPage({required this.url, super.key});

  final String url;

  @override
  State<UIpgWebViewPage> createState() => _UIpgWebViewPageState();
}

class _UIpgWebViewPageState extends State<UIpgWebViewPage> {
  final UIpgWebViewController c = UIpgWebViewController();

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    onPopInvokedWithResult: (bool didPop, Object? _) {
      if (!didPop && !c.finished) c.confirmCancel();
    },
    child: UScaffold(
      appBar: AppBar(title: Text(U.s.payment)),
      body: UWebView(initialUrl: widget.url, showUrlBar: true, onPageFinished: c.onPageFinished),
    ),
  );
}
