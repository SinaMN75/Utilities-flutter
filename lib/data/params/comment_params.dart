part of "../data.dart";

class UCommentCreateParams {
  UCommentCreateParams({
    required this.description,
    required this.score,
    required this.tags,
    this.reaction,
    this.parentId,
    this.productId,
    this.userId,
    this.creatorId,
  });

  factory UCommentCreateParams.fromJson(String str) => UCommentCreateParams.fromMap(json.decode(str));

  factory UCommentCreateParams.fromMap(Map<String, dynamic> json) => UCommentCreateParams(
    description: json["description"],
    score: json["score"] ?? 0,
    reaction: json["reaction"],
    parentId: json["parentId"],
    productId: json["productId"],
    userId: json["userId"],
    creatorId: json["creatorId"],
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
  );
  final String description;
  final double score;
  final int? reaction;
  final String? parentId;
  final String? productId;
  final String? userId;
  final String? creatorId;
  final List<int> tags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "description": description,
    "score": score,
    "reaction": reaction,
    "parentId": parentId,
    "productId": productId,
    "userId": userId,
    "creatorId": creatorId,
    "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
  };
}

class UCommentUpdateParams {
  UCommentUpdateParams({
    required this.id,
    this.description,
    this.score,
    this.addTags,
    this.removeTags,
    this.tags,
  });

  factory UCommentUpdateParams.fromJson(String str) => UCommentUpdateParams.fromMap(json.decode(str));

  factory UCommentUpdateParams.fromMap(Map<String, dynamic> json) => UCommentUpdateParams(
    description: json["description"],
    score: json["score"],
    id: json["id"],
    addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
  );
  final String? description;
  final double? score;
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "description": description,
    "score": score,
    "id": id,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((dynamic x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((dynamic x) => x)),
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
  };
}

class UCommentReadParams {
  UCommentReadParams({
    this.creatorId,
    this.productId,
    this.userId,
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.selectorArgs,
  });

  factory UCommentReadParams.fromJson(String str) => UCommentReadParams.fromMap(json.decode(str));

  factory UCommentReadParams.fromMap(Map<String, dynamic> json) => UCommentReadParams(
    creatorId: json["creatorId"],
    productId: json["productId"],
    userId: json["userId"],
    pageSize: json["pageSize"] ?? 0,
    pageNumber: json["pageNumber"] ?? 0,
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"] ?? false,
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"] ?? false,
    orderByUpdatedAt: json["orderByUpdatedAt"] ?? false,
    orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"] ?? false,
    selectorArgs: json["selectorArgs"] == null ? null : CommentSelectorArgs.fromMap(json["selectorArgs"]),
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
  );
  final String? creatorId;
  final String? productId;
  final String? userId;
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final CommentSelectorArgs? selectorArgs;
  final List<int>? tags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creatorId": creatorId,
    "productId": productId,
    "userId": userId,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "orderByUpdatedAt": orderByUpdatedAt,
    "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
    "selectorArgs": selectorArgs?.toMap(),
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
  };
}
