import "package:u/utils/u_web_message_stub.dart" if (dart.library.html) "u_web_message_web.dart" as impl;

typedef UWebMessageHandler = void Function(String origin, Map<String, dynamic> data);

abstract class UWebMessage {
  // Listens for window.postMessage events on web (no-op on other platforms). Returns a disposer to stop listening.
  static void Function() listen(UWebMessageHandler onMessage) => impl.listenWebMessage(onMessage);
}
