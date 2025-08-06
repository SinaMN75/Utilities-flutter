part of "../data.dart";

class CategoryCreateParams {
  final String? id;
  final String title;
  final String? subtitle;
  final List<int> tags;
  final String? parentId;
  final int? order;
  final String? location;
  final String? type;
  final String? link;
  final List<String>? relatedProducts;
  final String? token;

  CategoryCreateParams({
    this.id,
    required this.title,
    this.subtitle,
    required this.tags,
    this.parentId,
    this.order,
    this.location,
    this.type,
    this.link,
    this.relatedProducts,
    this.token,
  });

  factory CategoryCreateParams.fromJson(String str) => CategoryCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryCreateParams.fromMap(Map<String, dynamic> json) => CategoryCreateParams(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        parentId: json["parentId"],
        order: json["order"],
        location: json["location"],
        type: json["type"],
        link: json["link"],
        relatedProducts: json["relatedProducts"] == null ? null : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "parentId": parentId,
        "order": order,
        "location": location,
        "type": type,
        "link": link,
        "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((String x) => x)),
        "token": token,
      };
}

class CategoryUpdateParams {
  final String? title;
  final String? subtitle;
  final String? link;
  final String? location;
  final String? type;
  final int? order;
  final String? parentId;
  final List<String>? relatedProducts;
  final List<String>? addRelatedProducts;
  final List<String>? removeRelatedProducts;
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? token;

  CategoryUpdateParams({
    this.title,
    this.subtitle,
    this.link,
    this.location,
    this.type,
    this.order,
    this.parentId,
    this.relatedProducts,
    this.addRelatedProducts,
    this.removeRelatedProducts,
    required this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    this.token,
  });

  factory CategoryUpdateParams.fromJson(String str) => CategoryUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryUpdateParams.fromMap(Map<String, dynamic> json) => CategoryUpdateParams(
        title: json["title"],
        subtitle: json["subtitle"],
        link: json["link"],
        location: json["location"],
        type: json["type"],
        order: json["order"],
        parentId: json["parentId"],
        relatedProducts: json["relatedProducts"] == null ? null : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
        addRelatedProducts: json["addRelatedProducts"] == null ? null : List<String>.from(json["addRelatedProducts"].map((dynamic x) => x)),
        removeRelatedProducts: json["removeRelatedProducts"] == null ? null : List<String>.from(json["removeRelatedProducts"].map((dynamic x) => x)),
        id: json["id"],
        addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
        removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
        tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "title": title,
        "subtitle": subtitle,
        "link": link,
        "location": location,
        "type": type,
        "order": order,
        "parentId": parentId,
        "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((String x) => x)),
        "addRelatedProducts": addRelatedProducts == null ? null : List<dynamic>.from(addRelatedProducts!.map((String x) => x)),
        "removeRelatedProducts": removeRelatedProducts == null ? null : List<dynamic>.from(removeRelatedProducts!.map((String x) => x)),
        "id": id,
        "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((int x) => x)),
        "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((int x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((int x) => x)),
        "token": token,
      };
}

class CategoryReadParams {
  final List<String>? ids;
  final bool? showMedia;
  final int? pageSize;
  final int? pageNumber;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final String? token;

  CategoryReadParams({
    this.ids,
    this.showMedia,
    this.pageSize,
    this.pageNumber,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.token,
  });

  factory CategoryReadParams.fromJson(String str) => CategoryReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryReadParams.fromMap(Map<String, dynamic> json) => CategoryReadParams(
        ids: json["ids"] == null ? null : List<String>.from(json["ids"].map((dynamic x) => x)),
        showMedia: json["showMedia"] ?? false,
        pageSize: json["pageSize"] ?? 100,
        pageNumber: json["pageNumber"] ?? 1,
        orderByCreatedAt: json["orderByCreatedAt"] ?? false,
        orderByCreatedAtDesc: json["orderByCreatedAtDesc"] ?? false,
        orderByUpdatedAt: json["orderByUpdatedAt"] ?? false,
        orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"] ?? false,
        tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "ids": ids == null ? null : List<dynamic>.from(ids!.map((String x) => x)),
        "showMedia": showMedia,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "orderByCreatedAt": orderByCreatedAt,
        "orderByCreatedAtDesc": orderByCreatedAtDesc,
        "orderByUpdatedAt": orderByUpdatedAt,
        "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((int x) => x)),
        "token": token,
      };
}
