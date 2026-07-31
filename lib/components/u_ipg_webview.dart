import "package:u/utilities.dart";

abstract class UIpg {
  static Future<String?> link({required double amount, TagTxn? tag, String? invoiceId}) async {
    if (amount <= 0) {
      UToast.error(message: U.s.invalidAmount);
      return null;
    }
    ULoading.show();
    String? url;
    await UServices.ipg.pay(
      p: UIpgSaleParams(amount: amount, tag: tag, invoiceId: invoiceId),
      onOk: (UResponse<UIpgPayResponse> r) => url = r.result?.url,
      onError: (UEmptyResponse e) => UToast.error(message: e.message),
      onException: (String e) => UToast.error(message: e),
    );
    ULoading.dismiss();
    return url;
  }

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
        completer.complete(await UNavigator.push<bool>(UIpgWebViewPage2(url: data.url, trackingNumber: data.trackingNumber)) ?? false);
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

class UIpgWebViewController2 {
  UIpgWebViewController2(this.trackingNumber) {
    _poll = Timer.periodic(const Duration(seconds: 3), (Timer _) => _check());
  }

  final String trackingNumber;
  bool finished = false;
  Timer? _poll;

  // The backend is the single source of truth; we only ask it whether this payment is done yet.
  Future<void> _check() async {
    if (finished) return;
    await UServices.ipg.status(
      p: UIpgVerifyParams(trackingNumber: trackingNumber),
      onOk: (UResponse<UIpgVerifyResponse> r) {
        final UIpgVerifyResponse? data = r.result;
        if (data == null || finished) return;
        if (data.paid) {
          _finish(true);
        } else if (data.failed) {
          _finish(false);
        }
      },
    );
  }

  void _finish(bool paid) {
    if (finished) return;
    finished = true;
    _poll?.cancel();
    UToast.snackBar(message: paid ? U.s.paymentSuccessful : U.s.paymentFailed);
    UNavigator.back<bool>(paid);
  }

  void cancel() {
    if (finished) return;
    finished = true;
    _poll?.cancel();
    UNavigator.back<bool>(false);
  }

  void dispose() => _poll?.cancel();
}

class UIpgWebViewPage2 extends StatefulWidget {
  const UIpgWebViewPage2({required this.url, required this.trackingNumber, super.key});

  final String url;
  final String trackingNumber;

  @override
  State<UIpgWebViewPage2> createState() => _UIpgWebViewPage2State();
}

class _UIpgWebViewPage2State extends State<UIpgWebViewPage2> {
  late final UIpgWebViewController2 c;

  @override
  void initState() {
    c = UIpgWebViewController2(widget.trackingNumber);
    super.initState();
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    onPopInvokedWithResult: (bool didPop, Object? _) {
      if (!didPop && !c.finished) c.cancel();
    },
    child: UScaffold(
      appBar: AppBar(title: Text(U.s.payment)),
      body: UWebView(initialUrl: widget.url, showUrlBar: true),
    ),
  );
}
