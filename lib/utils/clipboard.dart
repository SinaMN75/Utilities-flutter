import 'package:flutter/services.dart';

abstract class UClipboard {
  static void set(final String text) async => await Clipboard.setData(ClipboardData(text: text));

  static Future<String?> getText() async {
    final ClipboardData? data = await Clipboard.getData("text/plain");
    return data?.text;
  }
}
