part of "../data.dart";

class UProductCreateParams {
  UProductCreateParams({
    required this.title,
    required this.tags,
    this.code,
    this.subtitle,
    this.description,
    this.actionType,
    this.actionTitle,
    this.actionUri,
    this.slug,
    this.type,
    this.content,
    this.latitude,
    this.longitude,
    this.stock,
    this.price,
    this.details,
    this.categories,
    this.relatedProducts,
    this.parentId,
    this.userId,
    this.point,
    this.phoneNumber,
    this.address,
  });

  factory UProductCreateParams.fromJson(String str) => UProductCreateParams.fromMap(json.decode(str));

  factory UProductCreateParams.fromMap(Map<String, dynamic> json) => UProductCreateParams(
        title: json["title"],
        code: json["code"],
        subtitle: json["subtitle"],
        description: json["description"],
        actionType: json["actionType"],
        actionTitle: json["actionTitle"],
        actionUri: json["actionUri"],
        slug: json["slug"],
        type: json["type"],
        content: json["content"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        stock: json["stock"],
        price: json["price"],
        details: json["details"],
        point: json["point"],
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((dynamic x) => x)),
        relatedProducts: json["relatedProducts"] == null ? null : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
        parentId: json["parentId"],
        userId: json["userId"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );
  final String title;
  final String? code;
  final String? subtitle;
  final String? description;
  final String? actionType;
  final String? actionTitle;
  final String? actionUri;
  final String? slug;
  final String? type;
  final String? content;
  final double? latitude;
  final double? longitude;
  final int? stock;
  final double? price;
  final String? details;
  final List<int> tags;
  final List<String>? categories;
  final List<String>? relatedProducts;
  final String? parentId;
  final String? userId;
  final int? point;
  final String? phoneNumber;
  final String? address;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "title": title,
        "code": code,
        "subtitle": subtitle,
        "description": description,
        "actionType": actionType,
        "actionTitle": actionTitle,
        "actionUri": actionUri,
        "slug": slug,
        "type": type,
        "content": content,
        "latitude": latitude,
        "longitude": longitude,
        "stock": stock,
        "price": price,
        "details": details,
        "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((dynamic x) => x)),
        "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((dynamic x) => x)),
        "parentId": parentId,
        "userId": userId,
        "point": point,
        "phoneNumber": phoneNumber,
        "address": address,
      };
}

class UProductUpdateParams {
  UProductUpdateParams({
    required this.id,
    this.title,
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
    this.userId,
    this.actionType,
    this.actionTitle,
    this.actionUri,
    this.details,
    this.relatedProducts,
    this.addRelatedProducts,
    this.removeRelatedProducts,
    this.addCategories,
    this.removeCategories,
    this.addTags,
    this.removeTags,
    this.tags,
    this.point,
    this.phoneNumber,
    this.address,
  });

  factory UProductUpdateParams.fromJson(String str) => UProductUpdateParams.fromMap(json.decode(str));

  factory UProductUpdateParams.fromMap(Map<String, dynamic> json) => UProductUpdateParams(
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
        point: json["point"],
        parentId: json["parentId"],
        userId: json["userId"],
        actionType: json["actionType"],
        actionTitle: json["actionTitle"],
        actionUri: json["actionUri"],
        details: json["details"],
        relatedProducts: json["relatedProducts"] == null ? null : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
        addRelatedProducts: json["addRelatedProducts"] == null ? null : List<String>.from(json["addRelatedProducts"].map((dynamic x) => x)),
        removeRelatedProducts: json["removeRelatedProducts"] == null ? null : List<String>.from(json["removeRelatedProducts"].map((dynamic x) => x)),
        addCategories: json["addCategories"] == null ? null : List<String>.from(json["addCategories"].map((dynamic x) => x)),
        removeCategories: json["removeCategories"] == null ? null : List<String>.from(json["removeCategories"].map((dynamic x) => x)),
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
        removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
        tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
      );
  final String? title;
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
  final String? userId;
  final String? actionType;
  final String? actionTitle;
  final String? actionUri;
  final String? details;
  final List<String>? relatedProducts;
  final List<String>? addRelatedProducts;
  final List<String>? removeRelatedProducts;
  final List<String>? addCategories;
  final List<String>? removeCategories;
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final int? point;
  final String? phoneNumber;
  final String? address;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
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
        "userId": userId,
        "point": point,
        "actionType": actionType,
        "actionTitle": actionTitle,
        "actionUri": actionUri,
        "details": details,
        "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((dynamic x) => x)),
        "addRelatedProducts": addRelatedProducts == null ? null : List<dynamic>.from(addRelatedProducts!.map((dynamic x) => x)),
        "removeRelatedProducts": removeRelatedProducts == null ? null : List<dynamic>.from(removeRelatedProducts!.map((dynamic x) => x)),
        "addCategories": addCategories == null ? null : List<dynamic>.from(addCategories!.map((dynamic x) => x)),
        "removeCategories": removeCategories == null ? null : List<dynamic>.from(removeCategories!.map((dynamic x) => x)),
        "id": id,
        "phoneNumber": phoneNumber,
        "address": address,
        "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((dynamic x) => x)),
        "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((dynamic x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
      };
}

class UProductReadParams {
  UProductReadParams({
    this.query,
    this.title,
    this.code,
    this.parentId,
    this.userId,
    this.minStock,
    this.maxStock,
    this.minPrice,
    this.maxPrice,
    this.showCategories,
    this.showCategoriesMedia,
    this.showMedia,
    this.showUser,
    this.showUserMedia,
    this.showUserCategory,
    this.showChildren,
    this.showChildrenDepth,
    this.ids,
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.showCommentCount,
    this.showIsFollowing,
    this.showChildrenCount,
  });

  factory UProductReadParams.fromJson(String str) => UProductReadParams.fromMap(json.decode(str));

  factory UProductReadParams.fromMap(Map<String, dynamic> json) => UProductReadParams(
        query: json["query"],
        title: json["title"],
        code: json["code"],
        parentId: json["parentId"],
        userId: json["userId"],
        minStock: json["minStock"],
        maxStock: json["maxStock"],
        minPrice: json["minPrice"],
        maxPrice: json["maxPrice"],
        showCategories: json["showCategories"] ?? false,
        showCategoriesMedia: json["showCategoriesMedia"] ?? false,
        showMedia: json["showMedia"] ?? false,
        showUser: json["showUser"] ?? false,
        showUserMedia: json["showUserMedia"] ?? false,
        showUserCategory: json["showUserCategory"] ?? false,
        showChildren: json["showChildren"] ?? false,
        showChildrenDepth: json["showChildrenDepth"] ?? false,
        ids: json["ids"] == null ? null : List<String>.from(json["ids"].map((dynamic x) => x)),
        pageSize: json["pageSize"] ?? 0,
        pageNumber: json["pageNumber"] ?? 0,
        fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
        toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
        orderByCreatedAt: json["orderByCreatedAt"] ?? false,
        orderByCreatedAtDesc: json["orderByCreatedAtDesc"] ?? false,
        orderByUpdatedAt: json["orderByUpdatedAt"] ?? false,
        orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"] ?? false,
        showCommentCount: json["showCommentCount"] ?? false,
        showIsFollowing: json["showIsFollowing"] ?? false,
        showChildrenCount: json["showChildrenCount"] ?? false,
        tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
      );
  final String? query;
  final String? title;
  final String? code;
  final String? parentId;
  final String? userId;
  final int? minStock;
  final int? maxStock;
  final double? minPrice;
  final double? maxPrice;
  final bool? showCategories;
  final bool? showCategoriesMedia;
  final bool? showMedia;
  final bool? showUser;
  final bool? showUserMedia;
  final bool? showUserCategory;
  final bool? showChildren;
  final bool? showChildrenDepth;
  final List<String>? ids;
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final bool? showCommentCount;
  final bool? showIsFollowing;
  final bool? showChildrenCount;
  final List<int>? tags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "query": query,
        "title": title,
        "code": code,
        "parentId": parentId,
        "userId": userId,
        "minStock": minStock,
        "maxStock": maxStock,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "showCategories": showCategories,
        "showCategoriesMedia": showCategoriesMedia,
        "showMedia": showMedia,
        "showUser": showUser,
        "showUserMedia": showUserMedia,
        "showUserCategory": showUserCategory,
        "showChildren": showChildren,
        "showChildrenDepth": showChildrenDepth,
        "ids": ids == null ? null : List<dynamic>.from(ids!.map((dynamic x) => x)),
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromCreatedAt": fromCreatedAt?.toIso8601String(),
        "toCreatedAt": toCreatedAt?.toIso8601String(),
        "orderByCreatedAt": orderByCreatedAt,
        "orderByCreatedAtDesc": orderByCreatedAtDesc,
        "orderByUpdatedAt": orderByUpdatedAt,
        "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
        "showIsFollowing": showIsFollowing,
        "showChildrenCount": showChildrenCount,
        "showCommentCount": showCommentCount,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
      };
}
