part of "../data.dart";

class UCommentResponse {
  UCommentResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.score,
    required this.description,
    required this.userId,
    this.parentId,
    this.parent,
    this.user,
    this.creator,
    this.creatorId,
    this.product,
    this.productId,
    this.children,
    this.media,
  });

  factory UCommentResponse.fromJson(String str) => UCommentResponse.fromMap(json.decode(str));

  factory UCommentResponse.fromMap(Map<String, dynamic> json) => UCommentResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: UCommentJson.fromMap(json["jsonData"]),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        score: json["score"],
        description: json["description"],
        parentId: json["parentId"],
        parent: json["parent"] == null ? null : UCommentResponse.fromMap(json["parent"]),
        user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
        userId: json["userId"],
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    product: json["product"] == null ? null : UProductResponse.fromMap(json["product"]),
        productId: json["productId"],
        children: json["children"] == null ? <UCommentResponse>[] : List<UCommentResponse>.from(json["children"].map((dynamic x) => UCommentResponse.fromMap(x))),
        media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"].map((dynamic x) => UMediaResponse.fromMap(x))),
      );
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UCommentJson jsonData;
  final List<int> tags;
  final double score;
  final String description;
  final String? parentId;
  final UCommentResponse? parent;
  final UUserResponse? user;
  final String userId;
  final UUserResponse? creator;
  final String? creatorId;
  final UProductResponse? product;
  final String? productId;
  final List<UCommentResponse>? children;
  final List<UMediaResponse>? media;

  String toJson() => json.encode(toMap());

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
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "product": product?.toMap(),
        "productId": productId,
        "children": children == null ? null : List<dynamic>.from(children!.map((UCommentResponse x) => x.toMap())),
        "media": media == null ? null : List<dynamic>.from(media!.map((UMediaResponse x) => x.toMap())),
      };
}

class UCommentJson {
  UCommentJson({
    this.reacts,
  });

  factory UCommentJson.fromJson(String str) => UCommentJson.fromMap(json.decode(str));

  factory UCommentJson.fromMap(Map<String, dynamic> json) => UCommentJson(
        reacts: json["reacts"] == null ? <UCommentReacts>[] : List<UCommentReacts>.from(json["reacts"].map((dynamic x) => UCommentReacts.fromMap(x))),
      );
  final List<UCommentReacts>? reacts;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "reacts": reacts == null ? null : List<dynamic>.from(reacts!.map((UCommentReacts x) => x.toMap())),
      };
}

class UCommentReacts {
  UCommentReacts({
    required this.tag,
    required this.userId,
  });

  factory UCommentReacts.fromJson(String str) => UCommentReacts.fromMap(json.decode(str));

  factory UCommentReacts.fromMap(Map<String, dynamic> json) => UCommentReacts(
        tag: json["tag"],
        userId: json["userId"],
      );
  final int tag;
  final String userId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "tag": tag,
        "userId": userId,
      };
}
