import 'package:flutter/material.dart';
export 'constants.dart';
export 'extensions/align_extension.dart';
export 'extensions/date_extension.dart';
export 'extensions/extension.dart';
export 'extensions/file_extension.dart';
export 'extensions/iterable_extension.dart';
export 'extensions/number_extension.dart';
export 'extensions/shimmer_extension.dart';
export 'extensions/string_extension.dart';
export 'extensions/text_extension.dart';
export 'extensions/widget_extension.dart';
export 'file.dart';
export 'enums.dart';
export 'get.dart';
export 'dio_interceptor.dart';
export 'launch.dart';
export 'local_storage.dart';
export 'share.dart';


void validateForm({required final GlobalKey<FormState> key, required final VoidCallback action}) {
  if (key.currentState!.validate()) action();
}