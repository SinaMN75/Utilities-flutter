import 'package:flutter/material.dart';

class Global {
  static Color color = Colors.blueAccent;
  static PickerType pickerType = PickerType.date;
  static var disable;
  static var min;
  static var max;
}

enum PickerType {
  datetime,
  date,
  time,
  rangedate,
  month,
  year,
  day,
}

enum Currency {
  rial("100"),
  dolor("101"),
  lira("102"),
  euro("103"),
  btc("200");

  const Currency(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseMedia {
  chat("Chat"),
  profile("profile"),
  cover("cover"),
  post("post");

  const UseCaseMedia(this.title);

  @override
  String toString() => name;
  final String title;
}
