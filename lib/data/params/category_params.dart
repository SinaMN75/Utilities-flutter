part of "../data.dart";

class UCategoryCreateParams {
  UCategoryCreateParams({
    required this.title,
    required this.tags,
    this.id,
    this.subtitle,
    this.parentId,
    this.order,
    this.address,
    this.phoneNumber,
    this.code,
    this.location,
    this.type,
    this.link,
    this.relatedProducts,
  });

  factory UCategoryCreateParams.fromJson(String str) => UCategoryCreateParams.fromMap(json.decode(str));

  factory UCategoryCreateParams.fromMap(Map<String, dynamic> json) => UCategoryCreateParams(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    parentId: json["parentId"],
    order: json["order"],
    address: json["address"],
    phoneNumber: json["phoneNumber"],
    code: json["code"],
    location: json["location"],
    type: json["type"],
    link: json["link"],
    relatedProducts: json["relatedProducts"] == null ? null : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
  );
  final String? id;
  final String title;
  final String? subtitle;
  final List<int> tags;
  final String? parentId;
  final String? address;
  final String? phoneNumber;
  final String? code;
  final int? order;
  final String? location;
  final String? type;
  final String? link;
  final List<String>? relatedProducts;

  String toJson() => json.encode(toMap());

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
    "address": address,
    "phoneNumber": phoneNumber,
    "code": code,
    "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((String x) => x)),
  };
}

class UCategoryUpdateParams {
  UCategoryUpdateParams({
    required this.id,
    this.title,
    this.subtitle,
    this.link,
    this.location,
    this.address,
    this.phoneNumber,
    this.code,
    this.type,
    this.order,
    this.parentId,
    this.relatedProducts,
    this.addRelatedProducts,
    this.removeRelatedProducts,
    this.addTags,
    this.removeTags,
    this.tags,
    this.productDeposit,
    this.productRent,
  });

  factory UCategoryUpdateParams.fromJson(String str) => UCategoryUpdateParams.fromMap(json.decode(str));

  factory UCategoryUpdateParams.fromMap(Map<String, dynamic> json) => UCategoryUpdateParams(
    title: json["title"],
    subtitle: json["subtitle"],
    link: json["link"],
    location: json["location"],
    address: json["address"],
    phoneNumber: json["phoneNumber"],
    code: json["code"],
    type: json["type"],
    order: json["order"],
    productDeposit: json["productDeposit"],
    productRent: json["productRent"],
    parentId: json["parentId"],
    relatedProducts: json["relatedProducts"] == null ? null : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
    addRelatedProducts: json["addRelatedProducts"] == null ? null : List<String>.from(json["addRelatedProducts"].map((dynamic x) => x)),
    removeRelatedProducts: json["removeRelatedProducts"] == null ? null : List<String>.from(json["removeRelatedProducts"].map((dynamic x) => x)),
    id: json["id"],
    addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
  );
  final String? title;
  final String? subtitle;
  final String? link;
  final String? location;
  final String? address;
  final String? phoneNumber;
  final String? code;
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
  final double? productDeposit;
  final double? productRent;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "subtitle": subtitle,
    "link": link,
    "location": location,
    "type": type,
    "order": order,
    "phoneNumber": phoneNumber,
    "address": address,
    "code": code,
    "parentId": parentId,
    "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((String x) => x)),
    "addRelatedProducts": addRelatedProducts == null ? null : List<dynamic>.from(addRelatedProducts!.map((String x) => x)),
    "removeRelatedProducts": removeRelatedProducts == null ? null : List<dynamic>.from(removeRelatedProducts!.map((String x) => x)),
    "id": id,
    "productDeposit": productDeposit,
    "productRent": productRent,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((int x) => x)),
  };
}

class UCategoryReadParams {
  UCategoryReadParams({
    this.ids,
    this.pageSize,
    this.pageNumber,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.selectorArgs,
  });

  factory UCategoryReadParams.fromJson(String str) => UCategoryReadParams.fromMap(json.decode(str));

  factory UCategoryReadParams.fromMap(Map<String, dynamic> json) => UCategoryReadParams(
    ids: json["ids"] == null ? null : List<String>.from(json["ids"].map((dynamic x) => x)),
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    orderByUpdatedAt: json["orderByUpdatedAt"],
    orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"],
    selectorArgs: json["selectorArgs"] == null ? null : CategorySelectorArgs.fromMap(json["selectorArgs"]),
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
  );
  final List<String>? ids;
  final int? pageSize;
  final int? pageNumber;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final CategorySelectorArgs? selectorArgs;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "ids": ids == null ? null : List<dynamic>.from(ids!.map((String x) => x)),
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "orderByUpdatedAt": orderByUpdatedAt,
    "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
    "selectorArgs": selectorArgs?.toMap(),
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((int x) => x)),
  };
}
