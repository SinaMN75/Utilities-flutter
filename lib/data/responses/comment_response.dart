part of "../data.dart";

class CommentResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CommentJson jsonData;
  final List<int> tags;
  final double score;
  final String description;
  final String? parentId;
  final CommentResponse? parent;
  final UserResponse? user;
  final String userId;
  final UserResponse? targetUser;
  final String? targetUserId;
  final ProductResponse? product;
  final String? productId;
  final List<CommentResponse>? children;
  final List<MediaResponse>? media;

  CommentResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.score,
    required this.description,
    this.parentId,
    this.parent,
    this.user,
    required this.userId,
    this.targetUser,
    this.targetUserId,
    this.product,
    this.productId,
    this.children,
    this.media,
  });

  factory CommentResponse.fromJson(String str) => CommentResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentResponse.fromMap(Map<String, dynamic> json) => CommentResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: CommentJson.fromMap(json["jsonData"]),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        score: json["score"],
        description: json["description"],
        parentId: json["parentId"],
        parent: json["parent"] == null ? null : CommentResponse.fromMap(json["parent"]),
        user: json["user"] == null ? null : UserResponse.fromMap(json["user"]),
        userId: json["userId"],
        targetUser: json["targetUser"] == null ? null : UserResponse.fromMap(json["targetUser"]),
        targetUserId: json["targetUserId"],
        product: json["product"] == null ? null : ProductResponse.fromMap(json["product"]),
        productId: json["productId"],
        children: json["children"] == null ? <CommentResponse>[] : List<CommentResponse>.from(json["children"].map((dynamic x) => CommentResponse.fromMap(x))),
        media: json["media"] == null ? <MediaResponse>[] : List<MediaResponse>.from(json["media"].map((dynamic x) => MediaResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "jsonData": jsonData.toMap(),
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "score": score,
        "description": description,
        "parentId": parentId,
        "parent": parent?.toMap(),
        "user": user?.toMap(),
        "userId": userId,
        "targetUser": targetUser?.toMap(),
        "targetUserId": targetUserId,
        "product": product?.toMap(),
        "productId": productId,
        "children": children == null ? null : List<dynamic>.from(children!.map((CommentResponse x) => x.toMap())),
        "media": media == null ? null : List<dynamic>.from(media!.map((MediaResponse x) => x.toMap())),
      };
}

class CommentJson {
  final List<CommentReacts>? reacts;

  CommentJson({
    this.reacts,
  });

  factory CommentJson.fromJson(String str) => CommentJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentJson.fromMap(Map<String, dynamic> json) => CommentJson(
        reacts: json["reacts"] == null ? <CommentReacts>[] : List<CommentReacts>.from(json["reacts"].map((dynamic x) => CommentReacts.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "reacts": reacts == null ? null : List<dynamic>.from(reacts!.map((CommentReacts x) => x.toMap())),
      };
}

class CommentReacts {
  final int tag;
  final String userId;

  CommentReacts({
    required this.tag,
    required this.userId,
  });

  factory CommentReacts.fromJson(String str) => CommentReacts.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentReacts.fromMap(Map<String, dynamic> json) => CommentReacts(
        tag: json["tag"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "tag": tag,
        "userId": userId,
      };
}
