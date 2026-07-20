// Off the web platform there is no browser window to receive postMessage events.
void Function() listenWebMessage(void Function(String origin, Map<String, dynamic> data) onMessage) => () {};
