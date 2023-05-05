import 'dart:io';

import 'package:utilities/utilities.dart';

extension FileExtension on File {
  String toBase64() => base64Encode(readAsBytesSync());
}
