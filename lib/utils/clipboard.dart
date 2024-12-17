import 'package:flutter/services.dart';

abstract class UClipboard {
  void set(final String text) async => await Clipboard.setData(ClipboardData(text: text));

  Future<String?> get() async {
    final ClipboardData? data = await Clipboard.getData("");
    return data?.text;
  }
}
