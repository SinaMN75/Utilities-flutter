import "package:web/web.dart" as web;

// True when the page runs inside an iframe or a native WebView user-agent.
bool embedDetectFromDom() => _isInIframe() || _isWebViewUserAgent();

bool _isInIframe() {
  try {
    return web.window.self != web.window.top;
  } catch (_) {
    // Cross-origin access to window.top throws, which itself means we are framed.
    return true;
  }
}

bool _isWebViewUserAgent() {
  final String ua = web.window.navigator.userAgent.toLowerCase();
  final bool androidWebView = ua.contains("; wv") || ua.contains(" wv)");
  final bool iosWebView = ua.contains("applewebkit") && !ua.contains("safari") && (ua.contains("mobile") || ua.contains("iphone") || ua.contains("ipad"));
  return androidWebView || iosWebView;
}
