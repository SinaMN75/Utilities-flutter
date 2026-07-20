import "dart:js_interop";

import "package:web/web.dart" as web;

// Subscribes to browser window "message" events and returns a disposer that removes the listener.
void Function() listenWebMessage(void Function(String origin, Map<String, dynamic> data) onMessage) {
  void handle(web.Event event) {
    final web.MessageEvent e = event as web.MessageEvent;
    final Object? decoded = e.data.dartify();
    if (decoded is! Map) return;
    onMessage(e.origin, decoded.map((Object? k, Object? v) => MapEntry<String, dynamic>(k.toString(), v)));
  }

  final JSFunction listener = handle.toJS;
  web.window.addEventListener("message", listener);
  return () => web.window.removeEventListener("message", listener);
}
