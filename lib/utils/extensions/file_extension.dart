part of '../utils.dart';

extension FileExtension on File {
  String toBase64() => base64Encode(readAsBytesSync());
}
