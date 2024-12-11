import 'package:utilities/utilities.dart';
import 'package:utilities/utilities2.dart';

extension FileExtension on File {
  String toBase64() => base64Encode(readAsBytesSync());
}
