import 'package:utilities_framework_flutter/utilities.dart';
import 'package:utilities_framework_flutter/utilities2.dart';

extension FileExtension on File {
  String toBase64() => base64Encode(readAsBytesSync());
}
