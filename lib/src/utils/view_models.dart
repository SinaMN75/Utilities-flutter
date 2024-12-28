import 'package:utilities_framework_flutter/utilities.dart';

class FileData {
  FileData({
    this.path,
    this.bytes,
    this.extension,
    this.url,
    this.id,
    this.order,
    this.jsonDetail,
    this.tags,
    this.parentId,
    this.children,
  });

  final String? path;
  final String? extension;
  final Uint8List? bytes;
  final String? url;
  String? id;
  String? parentId;
  int? order;
  MediaJsonDetail? jsonDetail;
  List<int>? tags;
  List<FileData>? children;
}

class MediaViewModel {
  MediaViewModel({required this.link, this.type = TypeMedia.image, this.deepLink});

  final TypeMedia type;
  final String link;
  final String? deepLink;
}

class KeyValueViewModel {
  KeyValueViewModel(
    this.key,
    this.value, {
    this.id,
    this.description,
  });

  factory KeyValueViewModel.fromJson(final String str) => KeyValueViewModel.fromMap(json.decode(str));

  factory KeyValueViewModel.fromMap(final dynamic json) => KeyValueViewModel(
        json["key"],
        json["value"],
        id: json["id"],
        description: json["description"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "key": key,
        "value": value,
        "description": description,
      };

  String? id;
  String key;
  String value;
  String? description;
}
