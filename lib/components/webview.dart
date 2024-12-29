import 'package:utilities_framework_flutter/utilities.dart';

class UWebView extends StatelessWidget {
  const UWebView({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) => WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(url)),
      );
}
