part of "../data.dart";

class CategoryResponse {
  final String id;
  final String? createdAt;
  final String? updatedAt;
  final List<int> tags;
  final CategoryJsonData jsonData;
  final String title;
  final List<String>? children;
  final List<MediaResponse>? media;

  CategoryResponse({
    required this.id,
    required this.tags,
    required this.jsonData,
    required this.title,
    this.createdAt,
    this.updatedAt,
    this.children,
    this.media,
  });

  factory CategoryResponse.fromJson(String str) => CategoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryResponse.fromMap(Map<String, dynamic> json) => CategoryResponse(
    id: json["id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    tags: List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    jsonData: CategoryJsonData.fromMap(json["jsonData"]),
    title: json["title"],
    children: json["children"] == null ? <String>[] : List<String>.from(json["children"]!.map((final dynamic x) => x)),
    media: json["media"] == null ? <MediaResponse>[] : List<MediaResponse>.from(json["media"]!.map((final dynamic x) => MediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "jsonData": jsonData.toMap(),
    "title": title,
    "children": children == null ? <dynamic>[] : List<dynamic>.from(children!.map((String x) => x)),
    "media": media == null ? <dynamic>[] : List<dynamic>.from(media!.map((MediaResponse x) => x.toMap())),
  };
}

class CategoryJsonData {
  final String? subtitle;

  CategoryJsonData({
    this.subtitle,
  });

  factory CategoryJsonData.fromJson(String str) => CategoryJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryJsonData.fromMap(Map<String, dynamic> json) => CategoryJsonData(
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "subtitle": subtitle,
  };
}