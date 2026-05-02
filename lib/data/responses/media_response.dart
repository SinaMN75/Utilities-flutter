part of "../data.dart";

extension MediaListExtension on Iterable<UMediaResponse> {
  UMediaResponse? firstByTag(TagMedia tag) => firstWhereOrNull((final UMediaResponse i) => i.tags.contains(tag.number));

  List<UMediaResponse> byTag(TagMedia tag) => where((final UMediaResponse i) => i.tags.contains(tag.number)).toList();
}

class UMediaResponse {
  UMediaResponse({
    required this.id,
    required this.jsonData,
    required this.tags,
    required this.url,
    this.userId,
    this.contentId,
    this.categoryId,
    this.commentId,
    this.productId,
  });

  factory UMediaResponse.fromJson(String str) => UMediaResponse.fromMap(json.decode(str));

  factory UMediaResponse.fromMap(Map<String, dynamic> json) => UMediaResponse(
    id: json["id"],
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    url: json["url"],
    userId: json["userId"],
    contentId: json["contentId"],
    categoryId: json["categoryId"],
    commentId: json["commentId"],
    productId: json["productId"],
  );
  final String id;
  final UBaseJson jsonData;
  final List<int> tags;
  final String? url;
  final String? userId;
  final String? contentId;
  final String? categoryId;
  final String? commentId;
  final String? productId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "path": url,
    "userId": userId,
    "contentId": contentId,
    "categoryId": categoryId,
    "commentId": commentId,
    "productId": productId,
  };
}
