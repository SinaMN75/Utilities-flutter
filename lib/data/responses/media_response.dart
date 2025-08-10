part of "../data.dart";

extension MediaListExtension on Iterable<MediaResponse> {
  MediaResponse? firstByTag(TagMedia tag) => firstWhereOrNull((final MediaResponse i) => i.tags.contains(tag.number));

  List<MediaResponse> byTag(TagMedia tag) => where((final MediaResponse i) => i.tags.contains(tag.number)).toList();
}

class MediaResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final MediaJson jsonData;
  final List<int> tags;
  final String path;
  final String? userId;
  final String? contentId;
  final String? categoryId;
  final String? commentId;
  final String? productId;

  MediaResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.path,
    this.userId,
    this.contentId,
    this.categoryId,
    this.commentId,
    this.productId,
  });

  String get url => "https://localhost:7048/Media/$path";

  factory MediaResponse.fromJson(String str) => MediaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaResponse.fromMap(Map<String, dynamic> json) => MediaResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: MediaJson.fromMap(json["jsonData"]),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        path: json["path"],
        userId: json["userId"],
        contentId: json["contentId"],
        categoryId: json["categoryId"],
        commentId: json["commentId"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "jsonData": jsonData.toMap(),
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "path": path,
        "userId": userId,
        "contentId": contentId,
        "categoryId": categoryId,
        "commentId": commentId,
        "productId": productId,
      };
}

class MediaJson {
  final String? title;
  final String? description;

  MediaJson({
    this.title,
    this.description,
  });

  factory MediaJson.fromJson(String str) => MediaJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaJson.fromMap(Map<String, dynamic> json) => MediaJson(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "title": title,
        "description": description,
      };
}
