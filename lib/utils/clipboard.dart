import 'package:flutter/services.dart';

abstract class UClipboard {
  static Future<void> set(final String text) async => Clipboard.setData(ClipboardData(text: text));

  static Future<String?> getText() async {
    final ClipboardData? data = await Clipboard.getData("text/plain");
    return data?.text;
  }
}
