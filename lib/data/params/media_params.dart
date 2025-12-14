part of "../data.dart";

class UMediaCreateParams {
  UMediaCreateParams({
    required this.file,
    required this.tags,
    this.userId,
    this.contentId,
    this.commentId,
    this.categoryId,
    this.productId,
    this.title,
    this.description,
  });

  final File file;
  final String? userId;
  final String? contentId;
  final String? commentId;
  final String? categoryId;
  final String? productId;
  final String? title;
  final String? description;
  final List<int>? tags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "contentId": contentId,
    "commentId": commentId,
    "categoryId": categoryId,
    "productId": productId,
    "title": title,
    "description": description,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((int x) => x)),
  };
}

class UMediaUpdateParams {
  UMediaUpdateParams({
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
  });

  factory UMediaUpdateParams.fromJson(String str) => UMediaUpdateParams.fromMap(json.decode(str));

  factory UMediaUpdateParams.fromMap(Map<String, dynamic> json) => UMediaUpdateParams(
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
  );

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

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((int x) => x)),
    "title": title,
    "description": description,
    "userId": userId,
    "contentId": contentId,
    "commentId": commentId,
    "categoryId": categoryId,
    "productId": productId,
  };
}

class UMediaReadParams {
  UMediaReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
  });

  factory UMediaReadParams.fromJson(String str) => UMediaReadParams.fromMap(json.decode(str));

  factory UMediaReadParams.fromMap(Map<String, dynamic> json) => UMediaReadParams(
    pageSize: json["pageSize"] ?? 0,
    pageNumber: json["pageNumber"] ?? 0,
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"] ?? false,
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"] ?? false,
    orderByUpdatedAt: json["orderByUpdatedAt"] ?? false,
    orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"] ?? false,
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
  );

  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "orderByUpdatedAt": orderByUpdatedAt,
    "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((int x) => x)),
  };
}
