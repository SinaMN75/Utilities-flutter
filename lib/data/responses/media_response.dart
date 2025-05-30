part of "../data.dart";

class MediaResponse {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final List<int>? tags;
  final MediaJsonData? jsonData;
  final String? path;

  MediaResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.tags,
    this.jsonData,
    this.path,
  });

  factory MediaResponse.fromJson(String str) => MediaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaResponse.fromMap(Map<String, dynamic> json) => MediaResponse(
    id: json["id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    jsonData: json["jsonData"] == null ? null : MediaJsonData.fromMap(json["jsonData"]),
    path: json["path"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "jsonData": jsonData?.toMap(),
    "path": path,
  };
}

class MediaJsonData {
  final String? title;
  final String? description;

  MediaJsonData({
    this.title,
    this.description,
  });

  factory MediaJsonData.fromJson(String str) => MediaJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaJsonData.fromMap(Map<String, dynamic> json) => MediaJsonData(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "description": description,
  };
}