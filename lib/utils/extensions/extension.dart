import 'dart:io';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:utilities/utilities.dart';
import 'package:utilities/utilities2.dart';

part 'align_extension.dart';
part 'date_extension.dart';
part 'file_extension.dart';
part 'iterable_extension.dart';
part 'number_extension.dart';
part 'shimmer_extension.dart';
part 'string_extension.dart';
part 'text_extension.dart';
part 'widget_extension.dart';

extension BoolExtensios on bool {
  bool toggle() => !this;
}
