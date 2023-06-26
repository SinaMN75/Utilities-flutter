import 'package:flutter/material.dart';

export 'constants.dart';
export 'dio_interceptor.dart';
export 'enums.dart';
export 'extensions/extension.dart';
export 'file.dart';
export 'get.dart';
export 'launch.dart';
export 'local_storage.dart';
export 'share.dart';

void validateForm({required final GlobalKey<FormState> key, required final VoidCallback action}) {
  if (key.currentState!.validate()) action();
}
