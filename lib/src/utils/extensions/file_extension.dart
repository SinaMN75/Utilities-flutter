import 'dart:io';

import 'package:utilities_framework_flutter/utilities.dart';

extension FileExtension on File {
  String toBase64() => base64Encode(readAsBytesSync());
}
