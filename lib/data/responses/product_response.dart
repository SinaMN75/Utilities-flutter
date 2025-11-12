part of "../data.dart";

class UProductResponse {
  UProductResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.point,
    required this.userId,
    required this.visitCount,
    this.code,
    this.subtitle,
    this.description,
    this.slug,
    this.type,
    this.content,
    this.latitude,
    this.longitude,
    this.stock,
    this.price1,
    this.price2,
    this.parentId,
    this.parent,
    this.user,
    this.children,
    this.media,
    this.categories,
    this.commentCount,
    this.isFollowing,
    this.childrenCount,
  });

  factory UProductResponse.fromJson(String str) => UProductResponse.fromMap(json.decode(str));

  factory UProductResponse.fromMap(Map<String, dynamic> json) => UProductResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: UProductJson.fromMap(json["jsonData"]),
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
        price1: json["price1"].toString().toDouble(),
        price2: json["price2"].toString().toDouble(),
        point: json["point"],
        parentId: json["parentId"],
        parent: json["parent"] == null ? null : UProductResponse.fromMap(json["parent"]),
        userId: json["userId"],
        commentCount: json["commentCount"],
        isFollowing: json["isFollowing"],
        visitCount: json["visitCount"],
        childrenCount: json["childrenCount"],
        user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
        children: json["children"] == null ? <UProductResponse>[] : List<UProductResponse>.from(json["children"].map((dynamic x) => UProductResponse.fromMap(x))),
        media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"].map((dynamic x) => UMediaResponse.fromMap(x))),
        categories: json["categories"] == null ? <UCategoryResponse>[] : List<UCategoryResponse>.from(json["categories"].map((dynamic x) => UCategoryResponse.fromMap(x))),
      );
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UProductJson jsonData;
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
  final double? price1;
  final double? price2;
  final int point;
  final String? parentId;
  final UProductResponse? parent;
  final String userId;
  final UUserResponse? user;
  final List<UProductResponse>? children;
  final List<UMediaResponse>? media;
  final List<UCategoryResponse>? categories;
  final int? commentCount;
  final bool? isFollowing;
  final int? visitCount;
  final int? childrenCount;

  String toJson() => json.encode(toMap());

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
        "point": point,
        "content": content,
        "latitude": latitude,
        "longitude": longitude,
        "stock": stock,
        "price1": price1,
        "price2": price2,
        "parentId": parentId,
        "parent": parent?.toMap(),
        "userId": userId,
        "commentCount": commentCount,
        "isFollowing": isFollowing,
        "visitCount": visitCount,
        "childrenCount": childrenCount,
        "user": user?.toMap(),
        "children": children == null ? null : List<dynamic>.from(children!.map((UProductResponse x) => x.toMap())),
        "media": media == null ? null : List<dynamic>.from(media!.map((UMediaResponse x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((UCategoryResponse x) => x.toMap())),
      };
}

class UProductJson {
  UProductJson({
    this.actionType,
    this.actionTitle,
    this.actionUri,
    this.details,
    this.visitCounts,
    this.pointCounts,
    this.relatedProducts,
    this.phoneNumber,
    this.address,
  });

  factory UProductJson.fromJson(String str) => UProductJson.fromMap(json.decode(str));

  factory UProductJson.fromMap(Map<String, dynamic> json) => UProductJson(
        actionType: json["actionType"],
        actionTitle: json["actionTitle"],
        actionUri: json["actionUri"],
        details: json["details"],
        visitCounts: json["visitCounts"] == null ? <UVisitCount>[] : List<UVisitCount>.from(json["visitCounts"].map((dynamic x) => UVisitCount.fromMap(x))),
        pointCounts: json["pointCounts"] == null ? <UPointCount>[] : List<UPointCount>.from(json["pointCounts"].map((dynamic x) => UPointCount.fromMap(x))),
        relatedProducts: json["relatedProducts"] == null ? <String>[] : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );
  final String? actionType;
  final String? actionTitle;
  final String? actionUri;
  final String? details;
  final List<UVisitCount>? visitCounts;
  final List<UPointCount>? pointCounts;
  final List<String>? relatedProducts;
  final String? phoneNumber;
  final String? address;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "actionType": actionType,
        "actionTitle": actionTitle,
        "actionUri": actionUri,
        "details": details,
        "visitCounts": visitCounts == null ? null : List<dynamic>.from(visitCounts!.map((UVisitCount x) => x.toMap())),
        "pointCounts": pointCounts == null ? null : List<dynamic>.from(pointCounts!.map((UPointCount x) => x.toMap())),
        "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((String x) => x)),
        "phoneNumber": phoneNumber,
        "address": address,
      };
}
