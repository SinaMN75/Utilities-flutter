import 'package:flutter/services.dart';

class UClipboard {
  void set(final String text) async => await Clipboard.setData(ClipboardData(text: text));

  Future<String?> get() async {
    ClipboardData? data = await Clipboard.getData("");
    return data?.text;
  }
}
