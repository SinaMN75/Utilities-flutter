part of '../data.dart';

class ProductReadDto {
  ProductReadDto({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.code,
    this.subtitle,
    this.description,
    this.state,
    this.visitsCount,
    this.boosted,
    this.isSeen,
    this.stock,
    this.voteCount,
    this.discountPercent,
    this.enabled,
    this.discountPrice,
    this.price,
    this.currency,
    this.status,
    this.ageCategory,
    this.productState,
    this.expireDate,
    this.seenUsers,
    this.teams,
    this.parentId,
    this.userId,
    this.user,
    this.product,
    this.parent,
    required this.jsonDetail,
    this.media,
    this.comments,
    this.categories,
    this.productInsights,
    this.visitProducts,
    this.children,
    this.orders,
    required this.tags,
    this.successfulPurchase,
  });

  factory ProductReadDto.fromJson(final String str) => ProductReadDto.fromMap(json.decode(str));

  factory ProductReadDto.fromMap(final dynamic json) => ProductReadDto(
        id: json["id"],
        code: json["code"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        title: json["title"],
        visitsCount: json["visitsCount"],
        isSeen: json["isSeen"],
        subtitle: json["subtitle"],
        description: json["description"],
        state: json["state"],
        boosted: json["boosted"] == null ? null : DateTime.parse(json["boosted"]),
        stock: json["stock"],
        voteCount: json["voteCount"],
        discountPercent: json["discountPercent"],
        enabled: json["enabled"],
        discountPrice: json["discountPrice"],
        price: json["price"],
        currency: json["currency"],
        status: json["status"],
        ageCategory: json["ageCategory"],
        productState: json["productState"],
        expireDate: json["expireDate"] == null ? null : DateTime.parse(json["expireDate"]),
        seenUsers: json["seenUsers"],
        teams: json["teams"],
        parentId: json["parentId"],
        userId: json["userId"],
        tags: List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        parent: json["parent"] == null ? null : ProductReadDto.fromMap(json["parent"]),
        product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
        jsonDetail: ProductJsonDetail.fromMap(json["jsonDetail"]),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
        comments: json["comments"] == null ? <CommentReadDto>[] : List<CommentReadDto>.from(json["comments"].cast<Map<String, dynamic>>().map(CommentReadDto.fromMap)).toList(),
        children: json["children"] == null ? <ProductReadDto>[] : List<ProductReadDto>.from(json["children"].cast<Map<String, dynamic>>().map(ProductReadDto.fromMap)).toList(),
        categories: json["categories"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["categories"].cast<Map<String, dynamic>>().map(CategoryReadDto.fromMap)).toList(),
        productInsights: json["productInsights"] == null ? <ProductInsight>[] : List<ProductInsight>.from(json["productInsights"].cast<Map<String, dynamic>>().map(ProductInsight.fromMap)).toList(),
        orders: json["orders"] == null ? <OrderReadDto>[] : List<OrderReadDto>.from(json["orders"].cast<Map<String, dynamic>>().map(OrderReadDto.fromMap)).toList(),
        visitProducts: json["visitProducts"] == null ? <ProductInsight>[] : List<ProductInsight>.from(json["visitProducts"].cast<Map<String, dynamic>>().map(ProductInsight.fromMap)).toList(),
        successfulPurchase: json["successfulPurchase"],
      );
  String id;
  String? code;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? subtitle;
  String? description;
  String? state;
  DateTime? boosted;
  int? visitsCount;
  int? stock;
  int? voteCount;
  int? discountPercent;
  bool? enabled;
  bool? isSeen;
  int? discountPrice;
  int? price;
  int? currency;
  int? status;
  int? ageCategory;
  int? productState;
  DateTime? expireDate;
  String? seenUsers;
  String? teams;
  ProductReadDto? product;
  ProductReadDto? parent;
  String? parentId;
  String? userId;
  UserReadDto? user;
  ProductJsonDetail jsonDetail;
  List<CommentReadDto>? comments;
  List<MediaReadDto>? media;
  List<int> tags;
  List<ProductReadDto>? children;
  List<CategoryReadDto>? categories;
  List<OrderReadDto>? orders;
  List<ProductInsight>? productInsights;
  List<ProductInsight>? visitProducts;
  int? successfulPurchase;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "id": id,
        "code": code,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "visitsCount": visitsCount,
        "isSeen": isSeen,
        "state": state,
        "boosted": boosted?.toIso8601String(),
        "stock": stock,
        "voteCount": voteCount,
        "discountPercent": discountPercent,
        "enabled": enabled,
        "discountPrice": discountPrice,
        "price": price,
        "currency": currency,
        "status": status,
        "ageCategory": ageCategory,
        "productState": productState,
        "expireDate": expireDate?.toIso8601String(),
        "seenUsers": seenUsers,
        "teams": teams,
        "parentId": parentId,
        "userId": userId,
        "user": user?.toMap(),
        "jsonDetail": jsonDetail.toMap(),
        "product": product?.toMap(),
        "parent": parent?.toMap(),
        "tags": List<dynamic>.from(tags.map((final int x) => x)),
        "media": media == null ? [] : List<dynamic>.from(media!.map((final MediaReadDto x) => x.toMap())),
        "children": children == null ? [] : List<dynamic>.from(children!.map((final ProductReadDto x) => x.toMap())),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((final CategoryReadDto x) => x.toMap())),
        "comments": comments == null ? [] : List<CommentReadDto>.from(comments!.map((final CommentReadDto x) => x.toMap())),
        "orders": orders == null ? [] : List<OrderReadDto>.from(orders!.map((final OrderReadDto x) => x.toMap())),
        "productInsights": productInsights == null ? [] : List<dynamic>.from(productInsights!.map((final ProductInsight x) => x.toMap())),
        "visitProducts": visitProducts == null ? [] : List<dynamic>.from(visitProducts!.map((final ProductInsight x) => x.toMap())),
        "successfulPurchase": successfulPurchase,
      };
}

class ProductJsonDetail {
  ProductJsonDetail({
    this.details,
    this.address,
    this.author,
    this.phoneNumber,
    this.link,
    this.website,
    this.email,
    this.unit,
    this.latitude,
    this.responseTime,
    this.onTimeDelivery,
    this.type1,
    this.type2,
    this.longitude,
    this.length,
    this.color,
    this.width,
    this.height,
    this.weight,
    this.minOrder,
    this.maxOrder,
    this.maxPrice,
    this.minPrice,
    this.shippingCost,
    this.shippingTime,
    this.startDate,
    this.endDate,
    this.keyValues,
    this.reservationTimes,
    this.visitCounts,
  });

  factory ProductJsonDetail.fromJson(final String str) => ProductJsonDetail.fromMap(json.decode(str));

  factory ProductJsonDetail.fromMap(final dynamic json) => ProductJsonDetail(
        details: json["details"],
        address: json["address"],
        author: json["author"],
        phoneNumber: json["phoneNumber"],
        link: json["link"],
        website: json["website"],
        email: json["email"],
        unit: json["unit"],
        latitude: json["latitude"],
        responseTime: json["responseTime"],
        onTimeDelivery: json["onTimeDelivery"],
        longitude: json["longitude"],
        length: json["length"],
        width: json["width"],
        type1: json["type1"],
        color: json["color"],
        type2: json["type2"],
        height: json["height"],
        weight: json["weight"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        maxPrice: json["maxPrice"],
        minPrice: json["minPrice"],
        shippingCost: json["shippingCost"],
        shippingTime: json["shippingTime"],
        visitCounts: json["visitCounts"] == null ? [] : List<VisitCount>.from(json["visitCounts"]!.map((x) => VisitCount.fromMap(x))),
        keyValues: json["keyValues"] == null ? [] : List<KeyValueViewModel>.from(json["keyValues"]!.map(KeyValueViewModel.fromMap)),
        reservationTimes:
            json["reservationTimes"] == null ? <ReservationTimes>[] : List<ReservationTimes>.from(json["reservationTimes"].cast<Map<String, dynamic>>().map(ReservationTimes.fromMap)).toList(),
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );
  String? details;
  String? address;
  String? author;
  String? phoneNumber;
  String? link;
  String? website;
  String? email;
  String? unit;
  String? type1;
  String? type2;
  String? color;
  double? latitude;
  int? responseTime;
  int? onTimeDelivery;
  double? longitude;
  int? length;
  double? width;
  double? height;
  int? weight;
  int? minOrder;
  int? maxOrder;
  int? maxPrice;
  int? minPrice;
  int? shippingCost;
  int? shippingTime;
  DateTime? startDate;
  DateTime? endDate;
  List<KeyValueViewModel>? keyValues;
  List<ReservationTimes>? reservationTimes;
  List<VisitCount>? visitCounts;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "details": details,
        "address": address,
        "author": author,
        "phoneNumber": phoneNumber,
        "link": link,
        "website": website,
        "email": email,
        "type1": type1,
        "type2": type2,
        "unit": unit,
        "latitude": latitude,
        "responseTime": responseTime,
        "onTimeDelivery": onTimeDelivery,
        "longitude": longitude,
        "length": length,
        "width": width,
        "height": height,
        "weight": weight,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "maxPrice": maxPrice,
        "minPrice": minPrice,
        "shippingCost": shippingCost,
        "shippingTime": shippingTime,
        "visitCounts": visitCounts == null ? [] : List<dynamic>.from(visitCounts!.map((x) => x.toMap())),
        "reservationTimes": reservationTimes == null ? [] : List<dynamic>.from(reservationTimes!.map((x) => x.toMap())),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
      };
}

class ProductCreateUpdateDto {
  ProductCreateUpdateDto({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.details,
    this.address,
    this.author,
    this.phoneNumber,
    this.link,
    this.website,
    this.color,
    this.email,
    this.type1,
    this.type2,
    this.unit,
    this.keyValue,
    this.state,
    this.latitude,
    this.longitude,
    this.price,
    this.count,
    this.length,
    this.width,
    this.height,
    this.weight,
    this.minOrder,
    this.maxOrder,
    this.maxPrice,
    this.minPrice,
    this.scorePlus,
    this.scoreMinus,
    this.discountPrice,
    this.responseTime,
    this.onTimeDelivery,
    this.discountPercent,
    this.commentsCount,
    this.stock,
    this.enabled,
    this.startDate,
    this.endDate,
    this.expireDate,
    this.status,
    this.currency,
    this.ageCategory,
    this.productState,
    this.shippingTime,
    this.shippingCost,
    this.boosted,
    this.parentId,
    this.keyValues,
    this.categories,
    this.teams,
    required this.tags,
    this.productInsight,
    this.children,
    this.reservationTimes,
  });

  String? id;
  String? title;
  String? subtitle;
  String? description;
  String? details;
  String? address;
  String? author;
  String? phoneNumber;
  String? link;
  String? website;
  String? color;
  String? email;
  String? type1;
  String? type2;
  String? unit;
  String? keyValue;
  String? state;
  double? latitude;
  double? longitude;
  int? price;
  int? length;
  double? width;
  double? height;
  int? weight;
  int? count;
  int? minOrder;
  int? maxOrder;
  int? maxPrice;
  int? minPrice;
  int? scorePlus;
  int? scoreMinus;
  int? discountPrice;
  int? responseTime;
  int? onTimeDelivery;
  int? discountPercent;
  int? commentsCount;
  int? stock;
  bool? enabled;
  String? startDate;
  String? endDate;
  String? expireDate;
  int? status;
  int? currency;
  int? ageCategory;
  int? productState;
  int? shippingTime;
  int? shippingCost;
  String? boosted;
  String? parentId;
  List<KeyValueViewModel>? keyValues;
  List<String>? categories;
  List<String>? teams;
  List<int>? tags;
  List<ProductCreateUpdateDto>? children;
  ProductInsight? productInsight;
  List<ReservationTimes>? reservationTimes;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "details": details,
        "address": address,
        "author": author,
        "phoneNumber": phoneNumber,
        "link": link,
        "count": count,
        "website": website,
        "email": email,
        "type1": type1,
        "type2": type2,
        "unit": unit,
        "color": color,
        "keyValue": keyValue,
        "state": state,
        "latitude": latitude,
        "longitude": longitude,
        "price": price,
        "length": length,
        "width": width,
        "height": height,
        "weight": weight,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "maxPrice": maxPrice,
        "minPrice": minPrice,
        "scorePlus": scorePlus,
        "scoreMinus": scoreMinus,
        "discountPrice": discountPrice,
        "responseTime": responseTime,
        "onTimeDelivery": onTimeDelivery,
        "discountPercent": discountPercent,
        "commentsCount": commentsCount,
        "stock": stock,
        "enabled": enabled,
        "startDate": startDate,
        "endDate": endDate,
        "expireDate": expireDate,
        "status": status,
        "currency": currency,
        "ageCategory": ageCategory,
        "productState": productState,
        "shippingTime": shippingTime,
        "shippingCost": shippingCost,
        "boosted": boosted,
        "parentId": parentId,
        "productInsight": productInsight?.toMap(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
        "keyValues": keyValues == null ? [] : List<dynamic>.from(keyValues!.map((final KeyValueViewModel x) => x.toMap())),
        "children": children == null ? [] : List<dynamic>.from(children!.map((final ProductCreateUpdateDto x) => x.toMap())),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.where((final String element) => element != '').map((final String x) => x)),
        "teams": teams == null ? [] : List<dynamic>.from(teams!.map((final String x) => x)),
        "reservationTimes": reservationTimes == null ? [] : List<dynamic>.from(reservationTimes!.map((x) => x.toMap())),
      };
}

class ProductFilterDto {
  ProductFilterDto({
    this.title,
    this.subtitle,
    this.description,
    this.state,
    this.startPriceRange,
    this.endPriceRange,
    this.isFollowing,
    this.isBookmarked,
    this.hasDiscount,
    this.showMedia,
    this.showForms,
    this.showFormFields,
    this.showCategories,
    this.showVisitProducts,
    this.showCreator,
    this.showCategoryMedia,
    this.showChildren,
    this.showChildrenParent,
    this.showPostOfPrivateUser,
    this.showComments,
    this.showWithChildren,
    this.orderByVotes,
    this.orderByVotesDescending,
    this.orderByAtoZ,
    this.orderByZtoA,
    this.orderByPriceAscending,
    this.orderByPriceDescending,
    this.orderByCreatedDate,
    this.orderByCreatedDateDescending,
    this.orderByAgeCategory,
    this.showCountOfComment,
    this.pageSize,
    this.pageNumber,
    this.currency,
    this.categories,
    this.tags,
    this.userIds,
    this.query,
    this.shuffle1,
    this.shuffle2,
    this.showExpired,
    this.boosted,
  });

  factory ProductFilterDto.fromJson(final String str) => ProductFilterDto.fromMap(json.decode(str));

  factory ProductFilterDto.fromMap(final Map<String, dynamic> json) => ProductFilterDto(
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        state: json["state"],
        startPriceRange: json["startPriceRange"],
        endPriceRange: json["endPriceRange"],
        isFollowing: json["isFollowing"],
        isBookmarked: json["isBookmarked"],
        hasDiscount: json["hasDiscount"],
        showMedia: json["showMedia"],
        showForms: json["showForms"],
        showFormFields: json["showFormFields"],
        showCategories: json["showCategories"],
        showVisitProducts: json["showVisitProducts"],
        showCreator: json["showCreator"],
        showCategoryMedia: json["showCategoryMedia"],
        showChildren: json["showChildren"],
        showChildrenParent: json["showChildrenParent"],
        showPostOfPrivateUser: json["showPostOfPrivateUser"],
        showComments: json["showComments"],
        showWithChildren: json["showWithChildren"],
        orderByVotes: json["orderByVotes"],
        orderByVotesDescending: json["orderByVotesDescending"],
        orderByAtoZ: json["orderByAtoZ"],
        orderByZtoA: json["orderByZtoA"],
        orderByPriceAscending: json["orderByPriceAscending"],
        orderByPriceDescending: json["orderByPriceDescending"],
        orderByCreatedDate: json["orderByCreatedDate"],
        orderByCreatedDateDescending: json["orderByCreatedDateDescending"],
        orderByAgeCategory: json["orderByAgeCategory"],
        showCountOfComment: json["showCountOfComment"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        currency: json["currency"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((final x) => x)),
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final x) => x)),
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((final x) => x)),
        query: json["query"],
        shuffle1: json["shuffle1"],
        shuffle2: json["shuffle2"],
        showExpired: json["showExpired"],
        boosted: json["boosted"],
      );

  String? title;
  String? subtitle;
  String? description;
  String? state;
  int? startPriceRange;
  int? endPriceRange;
  bool? isFollowing;
  bool? isBookmarked;
  bool? hasDiscount;
  bool? showMedia;
  bool? showForms;
  bool? showFormFields;
  bool? showCategories;
  bool? showVisitProducts;
  bool? showCreator;
  bool? showCategoryMedia;
  bool? showChildren;
  bool? showChildrenParent;
  bool? showPostOfPrivateUser;
  bool? showComments;
  bool? showWithChildren;
  bool? orderByVotes;
  bool? orderByVotesDescending;
  bool? orderByAtoZ;
  bool? orderByZtoA;
  bool? orderByPriceAscending;
  bool? orderByPriceDescending;
  bool? orderByCreatedDate;
  bool? orderByCreatedDateDescending;
  bool? orderByAgeCategory;
  bool? showCountOfComment;
  int? pageSize;
  int? pageNumber;
  int? currency;
  List<String>? categories;
  List<int>? tags;
  List<String>? userIds;
  String? query;
  bool? shuffle1;
  bool? shuffle2;
  bool? showExpired;
  bool? boosted;

  String toJson() => json.encode(removeNullEntries(toMap()));

  Map<String, dynamic> toMap() => {
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "state": state,
        "startPriceRange": startPriceRange,
        "endPriceRange": endPriceRange,
        "isFollowing": isFollowing,
        "isBookmarked": isBookmarked,
        "hasDiscount": hasDiscount,
        "showMedia": showMedia,
        "showForms": showForms,
        "showFormFields": showFormFields,
        "showCategories": showCategories,
        "showVisitProducts": showVisitProducts,
        "showCreator": showCreator,
        "showCategoryMedia": showCategoryMedia,
        "showChildren": showChildren,
        "showChildrenParent": showChildrenParent,
        "showPostOfPrivateUser": showPostOfPrivateUser,
        "showComments": showComments,
        "showWithChildren": showWithChildren,
        "orderByVotes": orderByVotes,
        "orderByVotesDescending": orderByVotesDescending,
        "orderByAtoZ": orderByAtoZ,
        "orderByZtoA": orderByZtoA,
        "orderByPriceAscending": orderByPriceAscending,
        "orderByPriceDescending": orderByPriceDescending,
        "orderByCreatedDate": orderByCreatedDate,
        "orderByCreatedDateDescending": orderByCreatedDateDescending,
        "orderByAgeCategory": orderByAgeCategory,
        "showCountOfComment": showCountOfComment,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "currency": currency,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((final String x) => x)),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
        "userIds": userIds == null ? [] : List<dynamic>.from(userIds!.map((final String x) => x)),
        "query": query,
        "shuffle1": shuffle1,
        "shuffle2": shuffle2,
        "showExpired": showExpired,
        "boosted": boosted,
      };
}

class ProductInsight {
  ProductInsight({
    this.reaction,
    this.userId,
  });

  factory ProductInsight.fromJson(final String str) => ProductInsight.fromMap(json.decode(str));

  factory ProductInsight.fromMap(final dynamic json) => ProductInsight(
        reaction: json["reaction"],
        userId: json["userId"],
      );

  final int? reaction;
  final String? userId;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
        "reaction": reaction,
        "userId": userId,
      };
}

class ProductInsightDto {
  ProductInsightDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.reaction,
    this.user,
    this.userId,
    this.productEntity,
    this.productId,
  });

  factory ProductInsightDto.fromJson(final String str) => ProductInsightDto.fromMap(json.decode(str));

  factory ProductInsightDto.fromMap(final dynamic json) => ProductInsightDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
        reaction: json["reaction"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        userId: json["userId"],
        productEntity: json["productEntity"],
        productId: json["productId"],
      );

  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final int? reaction;
  final UserReadDto? user;
  final String? userId;
  final String? productEntity;
  final String? productId;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt?.toIso8601String(),
        "reaction": reaction,
        "user": user?.toMap(),
        "userId": userId,
        "productEntity": productEntity,
        "productId": productId,
      };
}

class ReservationTimes {
  String? reserveId;
  DateTime? dateFrom;
  DateTime? dateTo;
  int? price;
  int? priceForAnyExtra;
  int? maxMemberAllowed;
  int? maxExtraMemberAllowed;
  String? reservedByUserId;
  String? reservedByUserName;

  ReservationTimes({
    this.reserveId,
    this.dateFrom,
    this.dateTo,
    this.price,
    this.priceForAnyExtra,
    this.maxMemberAllowed,
    this.maxExtraMemberAllowed,
    this.reservedByUserId,
    this.reservedByUserName,
  });

  factory ReservationTimes.fromJson(String str) => ReservationTimes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservationTimes.fromMap(Map<String, dynamic> json) => ReservationTimes(
        dateFrom: json["dateFrom"] == null ? null : DateTime.parse(json["dateFrom"]),
        dateTo: json["dateTo"] == null ? null : DateTime.parse(json["dateTo"]),
        reserveId: json["reserveId"],
        price: json["price"],
        priceForAnyExtra: json["priceForAnyExtra"],
        maxMemberAllowed: json["maxMemberAllowed"],
        maxExtraMemberAllowed: json["maxExtraMemberAllowed"],
        reservedByUserId: json["reservedByUserId"],
        reservedByUserName: json["reservedByUserName"],
      );

  Map<String, dynamic> toMap() => {
        "dateFrom": dateFrom?.toIso8601String(),
        "dateTo": dateTo?.toIso8601String(),
        "reserveId": reserveId,
        "price": price,
        "priceForAnyExtra": priceForAnyExtra,
        "maxMemberAllowed": maxMemberAllowed,
        "maxExtraMemberAllowed": maxExtraMemberAllowed,
        "reservedByUserId": reservedByUserId,
        "reservedByUserName": reservedByUserName,
      };
}

class Time {
  DateTime? timeFrom;
  DateTime? timeTo;
  String? reservedByUserId;
  String? reservedByUserName;

  Time({
    this.timeFrom,
    this.timeTo,
    this.reservedByUserId,
    this.reservedByUserName,
  });

  factory Time.fromJson(String str) => Time.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Time.fromMap(Map<String, dynamic> json) => Time(
        timeFrom: json["timeFrom"] == null ? null : DateTime.parse(json["timeFrom"]),
        timeTo: json["timeTo"] == null ? null : DateTime.parse(json["timeTo"]),
        reservedByUserId: json["reservedByUserId"],
        reservedByUserName: json["reservedByUserName"],
      );

  Map<String, dynamic> toMap() => {
        "timeFrom": timeFrom?.toIso8601String(),
        "timeTo": timeTo?.toIso8601String(),
        "reservedByUserId": reservedByUserId,
        "reservedByUserName": reservedByUserName,
      };
}

class VisitCount {
  final String? visitId;
  final String? userId;
  final int count;

  VisitCount({
    this.visitId,
    this.userId,
    this.count = 0,
  });

  factory VisitCount.fromJson(String str) => VisitCount.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VisitCount.fromMap(Map<String, dynamic> json) => VisitCount(
        visitId: json["visitId"],
        userId: json["userId"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "visitId": visitId,
        "userId": userId,
        "count": count,
      };
}

class ReactionCreateUpdateDto {
  final int? reaction;
  final String? productId;

  ReactionCreateUpdateDto({
    this.reaction,
    this.productId,
  });

  factory ReactionCreateUpdateDto.fromJson(String str) => ReactionCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReactionCreateUpdateDto.fromMap(Map<String, dynamic> json) => ReactionCreateUpdateDto(
        reaction: json["reaction"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "reaction": reaction,
        "productId": productId,
      };
}
