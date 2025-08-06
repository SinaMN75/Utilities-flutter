part of "../data.dart";

class MediaUpdateParams {
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final String? title;
  final String? description;
  final String? userId;
  final String? contentId;
  final String? commentId;
  final String? categoryId;
  final String? productId;
  final String? token;

  MediaUpdateParams({
    required this.id,
    this.addTags,
    this.removeTags,
    this.title,
    this.description,
    this.userId,
    this.contentId,
    this.commentId,
    this.categoryId,
    this.productId,
    this.token,
  });

  factory MediaUpdateParams.fromJson(String str) => MediaUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaUpdateParams.fromMap(Map<String, dynamic> json) => MediaUpdateParams(
        id: json["id"],
        addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
        removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
        title: json["title"],
        description: json["description"],
        userId: json["userId"],
        contentId: json["contentId"],
        commentId: json["commentId"],
        categoryId: json["categoryId"],
        productId: json["productId"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((dynamic x) => x)),
        "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((dynamic x) => x)),
        "title": title,
        "description": description,
        "userId": userId,
        "contentId": contentId,
        "commentId": commentId,
        "categoryId": categoryId,
        "productId": productId,
        "token": token,
      };
}
