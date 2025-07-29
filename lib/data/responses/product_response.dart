part of "../data.dart";

class ProductResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ProductJson jsonData;
  final List<int> tags;
  final String title;
  final String? code;
  final String? subtitle;
  final String? description;
  final String? slug;
  final String? type;
  final String? content;
  final double? latitude;
  final double? longitude;
  final int? stock;
  final double? price;
  final String? parentId;
  final ProductResponse? parent;
  final String userId;
  final UserResponse? user;
  final List<ProductResponse>? children;
  final List<MediaResponse>? media;
  final List<CategoryResponse>? categories;

  ProductResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    this.code,
    this.subtitle,
    this.description,
    this.slug,
    this.type,
    this.content,
    this.latitude,
    this.longitude,
    this.stock,
    this.price,
    this.parentId,
    this.parent,
    required this.userId,
    this.user,
    this.children,
    this.media,
    this.categories,
  });

  factory ProductResponse.fromJson(String str) => ProductResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromMap(Map<String, dynamic> json) => ProductResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    jsonData: ProductJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    title: json["title"],
    code: json["code"],
    subtitle: json["subtitle"],
    description: json["description"],
    slug: json["slug"],
    type: json["type"],
    content: json["content"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    stock: json["stock"],
    price: json["price"],
    parentId: json["parentId"],
    parent: json["parent"] == null ? null : ProductResponse.fromMap(json["parent"]),
    userId: json["userId"],
    user: json["user"] == null ? null : UserResponse.fromMap(json["user"]),
    children: json["children"] == null ? <ProductResponse>[] : List<ProductResponse>.from(json["children"].map((dynamic x) => ProductResponse.fromMap(x))),
    media: json["media"] == null ? <MediaResponse>[] : List<MediaResponse>.from(json["media"].map((dynamic x) => MediaResponse.fromMap(x))),
    categories: json["categories"] == null ? <CategoryResponse>[] : List<CategoryResponse>.from(json["categories"].map((dynamic x) => CategoryResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "title": title,
    "code": code,
    "subtitle": subtitle,
    "description": description,
    "slug": slug,
    "type": type,
    "content": content,
    "latitude": latitude,
    "longitude": longitude,
    "stock": stock,
    "price": price,
    "parentId": parentId,
    "parent": parent?.toMap(),
    "userId": userId,
    "user": user?.toMap(),
    "children": children == null ? null : List<dynamic>.from(children!.map((ProductResponse x) => x.toMap())),
    "media": media == null ? null : List<dynamic>.from(media!.map((MediaResponse x) => x.toMap())),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((CategoryResponse x) => x.toMap())),
  };
}

class ProductJson {
  final String? actionType;
  final String? actionTitle;
  final String? actionUri;
  final String? details;
  final List<VisitCount>? visitCounts;
  final List<String>? relatedProducts;

  ProductJson({
    this.actionType,
    this.actionTitle,
    this.actionUri,
    this.details,
    this.visitCounts,
    this.relatedProducts,
  });

  factory ProductJson.fromJson(String str) => ProductJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductJson.fromMap(Map<String, dynamic> json) => ProductJson(
    actionType: json["actionType"],
    actionTitle: json["actionTitle"],
    actionUri: json["actionUri"],
    details: json["details"],
    visitCounts: json["visitCounts"] == null ? <VisitCount>[] : List<VisitCount>.from(json["visitCounts"].map((dynamic x) => VisitCount.fromMap(x))),
    relatedProducts: json["relatedProducts"] == null ? <String>[] : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "actionType": actionType,
    "actionTitle": actionTitle,
    "actionUri": actionUri,
    "details": details,
    "visitCounts": visitCounts == null ? null : List<dynamic>.from(visitCounts!.map((VisitCount x) => x.toMap())),
    "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((String x) => x)),
  };
}

class VisitCount {
  final String userId;
  final int count;

  VisitCount({
    required this.userId,
    this.count = 1,
  });

  factory VisitCount.fromJson(String str) => VisitCount.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VisitCount.fromMap(Map<String, dynamic> json) => VisitCount(
    userId: json["userId"],
    count: json["count"] ?? 1,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "count": count,
  };
}