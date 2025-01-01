import 'package:u/utilities.dart';

extension FileExtension on File {
  String toBase64() => base64Encode(readAsBytesSync());
}
