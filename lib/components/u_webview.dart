import "dart:async";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:webview_all/webview_all.dart";

typedef OnUrlChanged = void Function(String url, Map<String, String> queryParameters);

/// All user-facing strings live here so this widget can be wired into the
/// project's existing multi-language / l10n system instead of hardcoding text.
///
/// NOTE: I don't have visibility into this project's l10n setup (e.g. whether
/// it's `context.l10n.xxx`, `S.of(context).xxx`, or `AppLocalizations.of(context).xxx`),
/// so I couldn't add the keys to your .arb files directly. Wire it up with a
/// one-line adapter next to wherever you call this widget, e.g.:
///
/// UFullWebViewLabels labelsFromL10n(BuildContext context) => UFullWebViewLabels(
///   urlBarHint: context.l10n.webViewEnterUrl,
///   goBack: context.l10n.webViewGoBack,
///   goForward: context.l10n.webViewGoForward,
///   refresh: context.l10n.webViewRefresh,
///   home: context.l10n.webViewHome,
///   share: context.l10n.webViewShare,
///   openInBrowser: context.l10n.webViewOpenInBrowser,
///   copyLink: context.l10n.webViewCopyLink,
///   linkCopied: context.l10n.webViewLinkCopied,
///   desktopMode: context.l10n.webViewDesktopMode,
///   zoomIn: context.l10n.webViewZoomIn,
///   zoomOut: context.l10n.webViewZoomOut,
///   loadFailed: context.l10n.webViewLoadFailed,
///   retry: context.l10n.webViewRetry,
///   blockedHost: context.l10n.webViewBlockedHost,
/// );
///
/// then pass `UFullWebView(..., labels: labelsFromL10n(context))`.
class UWebView {
  final String urlBarHint;
  final String goBack;
  final String goForward;
  final String refresh;
  final String home;
  final String share;
  final String openInBrowser;
  final String copyLink;
  final String linkCopied;
  final String desktopMode;
  final String zoomIn;
  final String zoomOut;
  final String loadFailed;
  final String retry;
  final String blockedHost;

  const UWebView({
    this.urlBarHint = "Enter URL",
    this.goBack = "Back",
    this.goForward = "Forward",
    this.refresh = "Refresh",
    this.home = "Home",
    this.share = "Share",
    this.openInBrowser = "Open in browser",
    this.copyLink = "Copy link",
    this.linkCopied = "Link copied",
    this.desktopMode = "Desktop site",
    this.zoomIn = "Zoom in",
    this.zoomOut = "Zoom out",
    this.loadFailed = "Failed to load page",
    this.retry = "Retry",
    this.blockedHost = "This link is blocked",
  });
}

/// Fully featured, cross-platform WebView page/widget built on top of
/// `webview_all` (Android, iOS, macOS, Windows, Linux, Web, OHOS all share the
/// same `WebViewController` / `WebViewWidget` API, unlike `webview_flutter`
/// which has no first-party Windows/Linux support).
///
/// Every capability is opt-in/opt-out through the constructor so a single
/// widget can serve a minimal "just show a page" use case as well as a full
/// in-app browser.
class UFullWebView extends StatefulWidget {
  // --- Core ---
  final String initialUrl;
  final Map<String, String>? initialHeaders;
  final Color? backgroundColor;
  final UWebView labels;

  // --- Callbacks ---
  final OnUrlChanged? onUrlChanged;
  final void Function(String url)? onPageStarted;
  final void Function(String url)? onPageFinished;
  final void Function(WebResourceError error)? onWebResourceError;
  final void Function(WebViewController controller)? onWebViewCreated;

  /// Return false to block navigation to a given url. Runs in addition to
  /// [restrictToAllowedHosts]/[allowedHosts] (both must allow the request).
  final bool Function(String url)? onNavigationRequest;

  // --- Top bar ---
  final bool showTopBar;
  final bool showUrlBar;
  final bool showBackButton;
  final bool showForwardButton;
  final bool showRefreshButton;
  final bool showHomeButton;
  final bool showProgressBar;

  // --- Overflow menu ---
  final bool showMoreMenu;
  final bool showShareAction;
  final bool showOpenInBrowserAction;
  final bool showCopyLinkAction;
  final bool showDesktopModeAction;
  final bool showZoomActions;

  /// Called instead of the built-in share sheet, e.g. to hand off to
  /// `ULaunch.shareText`. If null and [showShareAction] is true, falls back
  /// to `Share`-less clipboard copy with a toast.
  final void Function(String url)? onShareRequested;

  /// Called instead of the built-in "open in browser" handling, e.g. to hand
  /// off to `ULaunch.launchURL`. If null and [showOpenInBrowserAction] is
  /// true, this action is hidden (there's no safe cross-platform fallback
  /// without an external-launch package).
  final void Function(String url)? onOpenInBrowserRequested;

  // --- Page behavior ---
  final bool enableJavaScript;
  final bool enablePinchZoom;
  final bool enableJavaScriptDialogs;
  final String? userAgent;
  final String desktopUserAgent;

  /// If true, only requests whose host is in [allowedHosts] (or the host of
  /// [initialUrl] if the list is empty) are allowed to load.
  final bool restrictToAllowedHosts;
  final List<String> allowedHosts;

  /// Handles camera/microphone permission requests from web content. When
  /// null, requests are denied by default (safe default) unless
  /// [autoGrantMediaPermissions] is true.
  final Future<void> Function(WebViewPermissionRequest request)? onPermissionRequest;
  final bool autoGrantMediaPermissions;

  /// name -> handler for `addJavaScriptChannel`.
  final Map<String, void Function(String message)>? javaScriptChannels;

  final Widget Function(BuildContext context, String message, VoidCallback retry)? errorBuilder;
  final Widget? loadingIndicator;

  const UFullWebView({
    required this.initialUrl,
    super.key,
    this.initialHeaders,
    this.backgroundColor,
    this.labels = const UWebView(),
    this.onUrlChanged,
    this.onPageStarted,
    this.onPageFinished,
    this.onWebResourceError,
    this.onWebViewCreated,
    this.onNavigationRequest,
    this.showTopBar = true,
    this.showUrlBar = true,
    this.showBackButton = true,
    this.showForwardButton = true,
    this.showRefreshButton = true,
    this.showHomeButton = false,
    this.showProgressBar = true,
    this.showMoreMenu = true,
    this.showShareAction = true,
    this.showOpenInBrowserAction = true,
    this.showCopyLinkAction = true,
    this.showDesktopModeAction = true,
    this.showZoomActions = false,
    this.onShareRequested,
    this.onOpenInBrowserRequested,
    this.enableJavaScript = true,
    this.enablePinchZoom = true,
    this.enableJavaScriptDialogs = true,
    this.userAgent,
    this.desktopUserAgent =
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
        "(KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
    this.restrictToAllowedHosts = false,
    this.allowedHosts = const <String>[],
    this.onPermissionRequest,
    this.autoGrantMediaPermissions = false,
    this.javaScriptChannels,
    this.errorBuilder,
    this.loadingIndicator,
  });

  @override
  State<UFullWebView> createState() => UFullWebViewState();
}

class UFullWebViewState extends State<UFullWebView> {
  late final WebViewController controller;

  final ValueNotifier<String> currentUrl = ValueNotifier<String>("");
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<double> progress = ValueNotifier<double>(0);
  final ValueNotifier<bool> canGoBack = ValueNotifier<bool>(false);
  final ValueNotifier<bool> canGoForward = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isDesktopMode = ValueNotifier<bool>(false);
  final ValueNotifier<String?> loadError = ValueNotifier<String?>(null);
  final TextEditingController urlFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Permission handling: explicit callback wins, otherwise auto-grant only
    // if the caller opted in, otherwise deny by default.
    controller =
        WebViewController(
            onPermissionRequest:
                widget.onPermissionRequest ??
                (WebViewPermissionRequest request) async {
                  if (widget.autoGrantMediaPermissions) {
                    await request.grant();
                  } else {
                    await request.deny();
                  }
                },
          )
          ..setJavaScriptMode(widget.enableJavaScript ? JavaScriptMode.unrestricted : JavaScriptMode.disabled)
          ..enableZoom(widget.enablePinchZoom)
          ..setNavigationDelegate(_buildNavigationDelegate());

    if (widget.backgroundColor != null) {
      controller.setBackgroundColor(widget.backgroundColor!);
    }
    if (widget.userAgent != null) {
      controller.setUserAgent(widget.userAgent);
    }
    if (widget.enableJavaScriptDialogs) {
      _wireJavaScriptDialogs();
    }
    widget.javaScriptChannels?.forEach((String name, void Function(String) handler) {
      controller.addJavaScriptChannel(
        name,
        onMessageReceived: (JavaScriptMessage message) => handler(message.message),
      );
    });

    widget.onWebViewCreated?.call(controller);
    _load(widget.initialUrl, headers: widget.initialHeaders);
  }

  NavigationDelegate _buildNavigationDelegate() => NavigationDelegate(
    onProgress: (int p) => progress.value = p / 100.0,
    onPageStarted: (String url) {
      isLoading.value = true;
      loadError.value = null;
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
    onWebResourceError: (WebResourceError error) {
      isLoading.value = false;
      // Only surface main-frame failures as a full error page.
      loadError.value = error.description.isNotEmpty ? error.description : widget.labels.loadFailed;
      widget.onWebResourceError?.call(error);
    },
    onNavigationRequest: (NavigationRequest request) {
      if (!_isHostAllowed(request.url)) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(content: Text(widget.labels.blockedHost)),
        );
        return NavigationDecision.prevent;
      }
      final bool allowed = widget.onNavigationRequest?.call(request.url) ?? true;
      return allowed ? NavigationDecision.navigate : NavigationDecision.prevent;
    },
  );

  void _wireJavaScriptDialogs() {
    controller.setOnJavaScriptAlertDialog((JavaScriptAlertDialogRequest request) async {
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          content: Text(request.message),
          actions: <Widget>[
            TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text("OK")),
          ],
        ),
      );
    });

    controller.setOnJavaScriptConfirmDialog((JavaScriptConfirmDialogRequest request) async {
      if (!mounted) return false;
      final bool? result = await showDialog<bool>(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          content: Text(request.message),
          actions: <Widget>[
            TextButton(onPressed: () => Navigator.of(dialogContext).pop(false), child: const Text("Cancel")),
            TextButton(onPressed: () => Navigator.of(dialogContext).pop(true), child: const Text("OK")),
          ],
        ),
      );
      return result ?? false;
    });

    controller.setOnJavaScriptTextInputDialog((JavaScriptTextInputDialogRequest request) async {
      // The plugin's callback type is `Future<String>` (non-nullable), so a
      // cancelled/unmounted prompt must still return a String rather than null.
      if (!mounted) return request.defaultText ?? "";
      final TextEditingController inputController = TextEditingController(text: request.defaultText);
      final String? result = await showDialog<String>(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(request.message),
              TextField(controller: inputController, autofocus: true),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(request.defaultText),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(inputController.text),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      inputController.dispose();
      return result ?? request.defaultText ?? "";
    });
  }

  bool _isHostAllowed(String url) {
    if (!widget.restrictToAllowedHosts) return true;
    final String? host = Uri.tryParse(url)?.host;
    if (host == null || host.isEmpty) return false;
    final List<String> hosts = widget.allowedHosts.isNotEmpty ? widget.allowedHosts : <String>[Uri.tryParse(widget.initialUrl)?.host ?? ""];
    return hosts.any((String allowed) => host == allowed || host.endsWith(".$allowed"));
  }

  Future<void> _load(String url, {Map<String, String>? headers}) => controller.loadRequest(
    Uri.parse(url),
    headers: headers ?? const <String, String>{},
  );

  void _publishUrl(String url) {
    currentUrl.value = url;
    urlFieldController.text = url;
    final Uri? uri = Uri.tryParse(url);
    widget.onUrlChanged?.call(url, uri?.queryParameters ?? const <String, String>{});
  }

  Future<void> _refreshNavState() async {
    canGoBack.value = await controller.canGoBack();
    canGoForward.value = await controller.canGoForward();
  }

  // --- Public controls, usable via a GlobalKey<UFullWebViewState> ---

  Future<void> loadUrl(String url) => _load(url);

  Future<void> reload() => controller.reload();

  Future<void> goBack() => controller.goBack();

  Future<void> goForward() => controller.goForward();

  Future<void> goHome() => _load(widget.initialUrl, headers: widget.initialHeaders);

  Future<void> toggleDesktopMode() async {
    isDesktopMode.value = !isDesktopMode.value;
    await controller.setUserAgent(isDesktopMode.value ? widget.desktopUserAgent : widget.userAgent);
    await controller.reload();
  }

  Future<void> zoomIn() => controller.runJavaScript(
    "document.body.style.zoom = (parseFloat(document.body.style.zoom || 1) + 0.1).toString();",
  );

  Future<void> zoomOut() => controller.runJavaScript(
    "document.body.style.zoom = Math.max(0.5, parseFloat(document.body.style.zoom || 1) - 0.1).toString();",
  );

  void _submitUrlField() {
    String text = urlFieldController.text.trim();
    if (text.isEmpty) return;
    if (!text.contains("://")) text = "https://$text";
    loadUrl(text);
  }

  void _copyLink() {
    Clipboard.setData(ClipboardData(text: currentUrl.value));
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(content: Text(widget.labels.linkCopied)),
    );
  }

  void _share() {
    if (widget.onShareRequested != null) {
      widget.onShareRequested!(currentUrl.value);
    } else {
      _copyLink();
    }
  }

  void _openInBrowser() {
    widget.onOpenInBrowserRequested?.call(currentUrl.value);
  }

  @override
  void dispose() {
    currentUrl.dispose();
    isLoading.dispose();
    progress.dispose();
    canGoBack.dispose();
    canGoForward.dispose();
    isDesktopMode.dispose();
    loadError.dispose();
    urlFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      if (widget.showTopBar) _buildTopBar(context),
      if (widget.showProgressBar) _buildProgressBar(),
      Expanded(
        child: Stack(
          children: <Widget>[
            WebViewWidget(controller: controller),
            ValueListenableBuilder<String?>(
              valueListenable: loadError,
              builder: (BuildContext context, String? error, _) {
                if (error == null) return const SizedBox.shrink();
                return widget.errorBuilder?.call(context, error, reload) ?? _buildDefaultError(error);
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isLoading,
              builder: (BuildContext context, bool loading, _) {
                if (!loading || widget.loadingIndicator == null) return const SizedBox.shrink();
                return widget.loadingIndicator!;
              },
            ),
          ],
        ),
      ),
    ],
  );

  Widget _buildDefaultError(String message) => ColoredBox(
    color: Theme.of(context).colorScheme.surface,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.error_outline, size: 40, color: Theme.of(context).colorScheme.error),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(message, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: reload, child: Text(widget.labels.retry)),
        ],
      ),
    ),
  );

  Widget _buildProgressBar() => ValueListenableBuilder<bool>(
    valueListenable: isLoading,
    builder: (BuildContext context, bool loading, _) => loading
        ? ValueListenableBuilder<double>(
            valueListenable: progress,
            builder: (BuildContext context, double p, _) => LinearProgressIndicator(value: p <= 0 ? null : p, minHeight: 2),
          )
        : const SizedBox(height: 2),
  );

  Widget _buildTopBar(BuildContext context) => Material(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Row(
        children: <Widget>[
          if (widget.showBackButton)
            ValueListenableBuilder<bool>(
              valueListenable: canGoBack,
              builder: (BuildContext context, bool can, _) => IconButton(
                tooltip: widget.labels.goBack,
                icon: const Icon(Icons.arrow_back),
                onPressed: can ? goBack : null,
              ),
            ),
          if (widget.showForwardButton)
            ValueListenableBuilder<bool>(
              valueListenable: canGoForward,
              builder: (BuildContext context, bool can, _) => IconButton(
                tooltip: widget.labels.goForward,
                icon: const Icon(Icons.arrow_forward),
                onPressed: can ? goForward : null,
              ),
            ),
          if (widget.showRefreshButton)
            IconButton(
              tooltip: widget.labels.refresh,
              icon: const Icon(Icons.refresh),
              onPressed: reload,
            ),
          if (widget.showHomeButton)
            IconButton(
              tooltip: widget.labels.home,
              icon: const Icon(Icons.home_outlined),
              onPressed: goHome,
            ),
          if (widget.showUrlBar)
            Expanded(
              child: TextField(
                controller: urlFieldController,
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.go,
                onSubmitted: (_) => _submitUrlField(),
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  hintText: widget.labels.urlBarHint,
                ),
              ),
            )
          else
            const Spacer(),
          if (widget.showMoreMenu) _buildMoreMenu(context),
        ],
      ),
    ),
  );

  Widget _buildMoreMenu(BuildContext context) => PopupMenuButton<_MenuAction>(
    onSelected: (_MenuAction action) {
      switch (action) {
        case _MenuAction.share:
          _share();
        case _MenuAction.openInBrowser:
          _openInBrowser();
        case _MenuAction.copyLink:
          _copyLink();
        case _MenuAction.desktopMode:
          toggleDesktopMode();
        case _MenuAction.zoomIn:
          zoomIn();
        case _MenuAction.zoomOut:
          zoomOut();
      }
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<_MenuAction>>[
      if (widget.showShareAction) PopupMenuItem<_MenuAction>(value: _MenuAction.share, child: Text(widget.labels.share)),
      if (widget.showOpenInBrowserAction && widget.onOpenInBrowserRequested != null)
        PopupMenuItem<_MenuAction>(
          value: _MenuAction.openInBrowser,
          child: Text(widget.labels.openInBrowser),
        ),
      if (widget.showCopyLinkAction) PopupMenuItem<_MenuAction>(value: _MenuAction.copyLink, child: Text(widget.labels.copyLink)),
      if (widget.showDesktopModeAction)
        PopupMenuItem<_MenuAction>(
          value: _MenuAction.desktopMode,
          child: ValueListenableBuilder<bool>(
            valueListenable: isDesktopMode,
            builder: (BuildContext context, bool desktop, _) => Row(
              children: <Widget>[
                Expanded(child: Text(widget.labels.desktopMode)),
                Checkbox(value: desktop, onChanged: (_) => toggleDesktopMode()),
              ],
            ),
          ),
        ),
      if (widget.showZoomActions) ...<PopupMenuEntry<_MenuAction>>[
        PopupMenuItem<_MenuAction>(value: _MenuAction.zoomIn, child: Text(widget.labels.zoomIn)),
        PopupMenuItem<_MenuAction>(value: _MenuAction.zoomOut, child: Text(widget.labels.zoomOut)),
      ],
    ],
  );
}

enum _MenuAction { share, openInBrowser, copyLink, desktopMode, zoomIn, zoomOut }
