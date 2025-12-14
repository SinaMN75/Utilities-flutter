part of "../data.dart";

extension MediaListExtension on Iterable<UMediaResponse> {
  UMediaResponse? firstByTag(TagMedia tag) => firstWhereOrNull((final UMediaResponse i) => i.tags.contains(tag.number));

  List<UMediaResponse> byTag(TagMedia tag) => where((final UMediaResponse i) => i.tags.contains(tag.number)).toList();
}

class UMediaResponse {
  UMediaResponse({
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

  factory UMediaResponse.fromJson(String str) => UMediaResponse.fromMap(json.decode(str));

  factory UMediaResponse.fromMap(Map<String, dynamic> json) => UMediaResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    jsonData: UMediaJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    path: json["path"],
    userId: json["userId"],
    contentId: json["contentId"],
    categoryId: json["categoryId"],
    commentId: json["commentId"],
    productId: json["productId"],
  );
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UMediaJson jsonData;
  final List<int> tags;
  final String path;
  final String? userId;
  final String? contentId;
  final String? categoryId;
  final String? commentId;
  final String? productId;

  String get url => "https://localhost:7048/Media/$path";

  String toJson() => json.encode(toMap());

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

class UMediaJson {
  UMediaJson({
    this.title,
    this.description,
  });

  factory UMediaJson.fromJson(String str) => UMediaJson.fromMap(json.decode(str));

  factory UMediaJson.fromMap(Map<String, dynamic> json) => UMediaJson(
    title: json["title"],
    description: json["description"],
  );
  final String? title;
  final String? description;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "description": description,
  };
}
