part of "payment_flow.dart";

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
