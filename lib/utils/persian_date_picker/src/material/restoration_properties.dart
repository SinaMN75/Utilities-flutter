import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:u/utils/shamsi_date/shamsi_date.dart';

import 'date.dart';

class RestorableJalali extends RestorableValue<Jalali> {
  RestorableJalali(Jalali defaultValue) : _defaultValue = defaultValue;

  final Jalali _defaultValue;

  @override
  Jalali createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(Jalali? oldValue) {
    assert(debugIsSerializableForRestoration(value.millisecondsSinceEpoch));
    notifyListeners();
  }

  @override
  Jalali fromPrimitives(Object? data) => Jalali.fromMillisecondsSinceEpoch(data! as int);

  @override
  Object? toPrimitives() => value.millisecondsSinceEpoch;
}

class RestorableJalaliN extends RestorableValue<Jalali?> {
  RestorableJalaliN(Jalali? defaultValue) : _defaultValue = defaultValue;

  final Jalali? _defaultValue;

  @override
  Jalali? createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(Jalali? oldValue) {
    assert(debugIsSerializableForRestoration(value?.millisecondsSinceEpoch));
    notifyListeners();
  }

  @override
  Jalali? fromPrimitives(Object? data) => data != null ? Jalali.fromMillisecondsSinceEpoch(data as int) : null;

  @override
  Object? toPrimitives() => value?.millisecondsSinceEpoch;
}
