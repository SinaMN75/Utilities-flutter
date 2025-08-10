part of "../data.dart";

extension ContentListExtension on Iterable<ContentResponse> {
  ContentResponse? firstByTag(TagContent tag) => firstWhereOrNull((final ContentResponse i) => i.tags.contains(tag.number));

  List<ContentResponse> byTag(TagContent tag) => where((final ContentResponse i) => i.tags.contains(tag.number)).toList();
}

class ContentResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ContentJson jsonData;
  final List<int> tags;
  final List<MediaResponse> media;

  ContentResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    this.media = const <MediaResponse>[],
  });

  factory ContentResponse.fromJson(String str) => ContentResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentResponse.fromMap(Map<String, dynamic> json) => ContentResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: ContentJson.fromMap(json["jsonData"]),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        media: json["media"] == null ? <MediaResponse>[] : List<MediaResponse>.from(json["media"].map((dynamic x) => MediaResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "jsonData": jsonData.toMap(),
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "media": List<dynamic>.from(media.map((MediaResponse x) => x.toMap())),
      };
}

class ContentJson {
  final String? title;
  final String? subTitle;
  final String? description;
  final String? instagram;

  ContentJson({
    this.title,
    this.subTitle,
    this.description,
    this.instagram,
  });

  factory ContentJson.fromJson(String str) => ContentJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentJson.fromMap(Map<String, dynamic> json) => ContentJson(
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        instagram: json["instagram"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "instagram": instagram,
      };
}
