import "package:u/utilities.dart";

typedef OnUrlChanged = void Function(String url, Map<String, String> queryParameters);

class UlWebView extends StatefulWidget {
  final String initialUrl;
  final OnUrlChanged? onUrlChanged;
  final void Function(String url)? onPageStarted;
  final void Function(String url)? onPageFinished;

  final bool Function(String url)? onNavigationRequest;
  final bool showUrlBar;

  const UlWebView({
    required this.initialUrl,
    super.key,
    this.onUrlChanged,
    this.onPageStarted,
    this.onPageFinished,
    this.onNavigationRequest,
    this.showUrlBar = true,
  });

  @override
  State<UlWebView> createState() => UlWebViewState();
}

// Public State class so a GlobalKey<FullWebViewState> can drive the controller externally
class UlWebViewState extends State<UlWebView> {
  late final WebViewController _controller;

  // Reactive state shown in the URL bar and exposed to parents
  final ValueNotifier<String> currentUrl = ValueNotifier<String>("");
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<double> progress = ValueNotifier<double>(0);
  final ValueNotifier<bool> canGoBack = ValueNotifier<bool>(false);
  final ValueNotifier<bool> canGoForward = ValueNotifier<bool>(false);
  final TextEditingController _urlFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int p) => progress.value = p / 100.0,
          onPageStarted: (String url) {
            isLoading.value = true;
            _publishUrl(url);
            widget.onPageStarted?.call(url);
          },
          onPageFinished: (String url) async {
            isLoading.value = false;
            _publishUrl(url);
            await _refreshNavState();
            widget.onPageFinished?.call(url);
          },
          onUrlChange: (UrlChange change) {
            if (change.url != null) _publishUrl(change.url!);
          },
          onNavigationRequest: (NavigationRequest request) {
            final bool allowed = widget.onNavigationRequest?.call(request.url) ?? true;
            return allowed ? NavigationDecision.navigate : NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  void _publishUrl(String url) {
    currentUrl.value = url;
    _urlFieldController.text = url;
    final Uri? uri = Uri.tryParse(url);
    widget.onUrlChanged?.call(url, uri?.queryParameters ?? const <String, String>{});
  }

  Future<void> _refreshNavState() async {
    canGoBack.value = await _controller.canGoBack();
    canGoForward.value = await _controller.canGoForward();
  }

  Future<void> loadUrl(String url) => _controller.loadRequest(Uri.parse(url));

  Future<void> reload() => _controller.reload();

  Future<void> goBack() => _controller.goBack();

  Future<void> goForward() => _controller.goForward();

  Future<String?> get url => _controller.currentUrl();

  Future<Map<String, String>> get queryParameters async {
    final String? u = await _controller.currentUrl();
    return Uri.tryParse(u ?? "")?.queryParameters ?? const <String, String>{};
  }

  WebViewController get controller => _controller;

  void _submitUrlField() {
    String text = _urlFieldController.text.trim();
    if (text.isEmpty) return;
    if (!text.contains("://")) text = "https://$text";
    _controller.loadRequest(Uri.parse(text));
  }

  @override
  void dispose() {
    currentUrl.dispose();
    isLoading.dispose();
    progress.dispose();
    canGoBack.dispose();
    canGoForward.dispose();
    _urlFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      if (widget.showUrlBar) _buildUrlBar(),
      ValueListenableBuilder<bool>(
        valueListenable: isLoading,
        builder: (_, bool loading, __) => loading
            ? ValueListenableBuilder<double>(
                valueListenable: progress,
                builder: (_, double p, __) => LinearProgressIndicator(value: p == 0 ? null : p),
              )
            : const SizedBox.shrink(),
      ),
      Expanded(child: WebViewWidget(controller: _controller)),
    ],
  );

  Widget _buildUrlBar() => Material(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Row(
        children: <Widget>[
          ValueListenableBuilder<bool>(
            valueListenable: canGoBack,
            builder: (_, bool can, _) => IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: can ? () => _controller.goBack() : null,
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: canGoForward,
            builder: (_, bool can, __) => IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: can ? () => _controller.goForward() : null,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
          Expanded(
            child: TextField(
              controller: _urlFieldController,
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.go,
              onSubmitted: (_) => _submitUrlField(),
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                hintText: "Enter URL",
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
