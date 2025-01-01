import 'package:u/utilities.dart';

enum TypeMedia { image, svg, video, pdf, voice, link }

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

class MediaJsonDetail {
  MediaJsonDetail({
    this.link,
    this.title,
    this.description,
    this.size,
    this.time,
    this.artist,
    this.album,
    this.isPrivate,
    this.link1,
    this.link2,
    this.link3,
  });

  factory MediaJsonDetail.fromJson(final String str) => MediaJsonDetail.fromMap(json.decode(str));

  factory MediaJsonDetail.fromMap(final dynamic json) => MediaJsonDetail(
        link: json["link"],
        link1: json["link1"],
        link2: json["link2"],
        link3: json["link3"],
        title: json["title"],
        description: json["description"],
        size: json["size"],
        time: json["time"],
        artist: json["artist"],
        album: json["album"],
        isPrivate: json["isPrivate"],
      );
  String? link;
  String? title;
  String? description;
  String? size;
  String? time;
  String? artist;
  String? album;
  String? link1;
  String? link2;
  String? link3;
  int? isPrivate;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "link": link,
        "link1": link1,
        "link2": link2,
        "link3": link3,
        "title": title,
        "description": description,
        "size": size,
        "time": time,
        "artist": artist,
        "album": album,
        "isPrivate": isPrivate,
      };
}