import 'package:flutter/foundation.dart';
import 'package:utilities/utilities.dart';

class FileData {
  FileData({this.path, this.bytes});

  final String? path;
  final Uint8List? bytes;
}

class MediaViewModel {
  MediaViewModel({required this.link, this.type = TypeMedia.image, this.deepLink});

  final TypeMedia type;
  final String link;
  final String? deepLink;
}

class KeyValueViewModel {
  KeyValueViewModel(this.key, this.value, {this.id});

  factory KeyValueViewModel.fromJson(final String str) => KeyValueViewModel.fromMap(json.decode(str));

  factory KeyValueViewModel.fromMap(final dynamic json) => KeyValueViewModel(json["key"], json["value"], id: json["id"]);

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{"id": id, "key": key, "value": value};

  String? id;
  String key;
  String value;
}
