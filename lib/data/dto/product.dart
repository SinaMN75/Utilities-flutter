part of '../data.dart';

extension ProductReadDtoListExtension on Iterable<ProductReadDto> {
  List<ProductReadDto> whereByTag(final TagProduct tag) => where(
        (final ProductReadDto i) => i.tags.contains(tag.number),
      ).toList();
}

extension OptionalProductReadDtoListExtension on Iterable<ProductReadDto>? {
  List<ProductReadDto> whereByTag(final TagProduct tag) => (this ?? <ProductReadDto>[])
      .where(
        (final ProductReadDto i) => i.tags.contains(tag.number),
      )
      .toList();
}

class ProductReadDto {
  ProductReadDto({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.code,
    this.subtitle,
    this.description,
    this.country,
    this.city,
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
    this.price1,
    this.price2,
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
    this.latitude,
    this.longitude,
    this.categories,
    this.children,
    this.orders,
    required this.tags,
    this.successfulPurchase,
    this.reactions,
    this.startDate,
    this.endDate,
  });

  factory ProductReadDto.fromJson(final String str) => ProductReadDto.fromMap(json.decode(str));

  factory ProductReadDto.fromMap(final dynamic json) => ProductReadDto(
        id: json["id"],
        code: json["code"],
        price1: json["price1"],
        price2: json["price2"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        title: json["title"],
        country: json["country"],
        city: json["city"],
        state: json["state"],
        visitsCount: json["visitsCount"],
        isSeen: json["isSeen"],
        subtitle: json["subtitle"],
        description: json["description"],
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
        latitude: json["latitude"].toString().toDouble(),
        longitude: json["longitude"].toString().toDouble(),
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
        orders: json["orders"] == null ? <OrderReadDto>[] : List<OrderReadDto>.from(json["orders"].cast<Map<String, dynamic>>().map(OrderReadDto.fromMap)).toList(),
        reactions: json["reactions"] == null ? <ReactionReadDto>[] : List<ReactionReadDto>.from(json["reactions"].cast<Map<String, dynamic>>().map(ReactionReadDto.fromMap)).toList(),
        successfulPurchase: json["successfulPurchase"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );
  String id;
  String? code;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? subtitle;
  String? region;
  String? description;
  DateTime? boosted;
  String? state;
  String? country;
  String? city;
  int? visitsCount;
  int? stock;
  int? voteCount;
  int? discountPercent;
  int? price1;
  int? price2;
  bool? enabled;
  bool? isSeen;
  int? discountPrice;
  int? price;
  int? currency;
  int? status;
  int? ageCategory;
  int? productState;
  double? latitude;
  double? longitude;
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
  int? successfulPurchase;
  List<ReactionReadDto>? reactions;
  DateTime? startDate;
  DateTime? endDate;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "id": id,
        "code": code,
        "region": region,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "visitsCount": visitsCount,
        "price1": price1,
        "price2": price2,
        "isSeen": isSeen,
        "latitude": latitude,
        "country": country,
        "city": city,
        "state": state,
        "longitude": longitude,
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
        "successfulPurchase": successfulPurchase,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
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
    this.responseTime,
    this.onTimeDelivery,
    this.type1,
    this.type2,
    this.paymentRefId,
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
    this.maximumMembers,
    this.clubName,
    this.policies,
    this.startDate,
    this.endDate,
    this.keyValues,
    this.reservationTimes,
    this.visitCounts,
    this.seats,
  });

  factory ProductJsonDetail.fromJson(final String str) => ProductJsonDetail.fromMap(json.decode(str));

  factory ProductJsonDetail.fromMap(final dynamic json) => ProductJsonDetail(
        details: json["details"],
        address: json["address"],
        author: json["author"],
        paymentRefId: json["paymentRefId"],
        phoneNumber: json["phoneNumber"],
        link: json["link"],
        website: json["website"],
        email: json["email"],
        unit: json["unit"],
        responseTime: json["responseTime"],
        onTimeDelivery: json["onTimeDelivery"],
        length: json["length"],
        width: json["width"],
        type1: json["type1"],
        color: json["color"],
        clubName: json["clubName"],
        maximumMembers: json["maximumMembers"],
        policies: json["policies"] == null ? [] : List<String>.from(json["policies"]!.map((x) => x)),
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
        reservationTimes: json["reservationTimes"] == null ? <ReservationTimes>[] : List<ReservationTimes>.from(json["reservationTimes"].cast<Map<String, dynamic>>().map(ReservationTimes.fromMap)).toList(),
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        seats: json["seats"] == null ? [] : List<Seat>.from(json["seats"]!.map((x) => Seat.fromMap(x))),
      );
  String? details;
  String? address;
  String? author;
  String? phoneNumber;
  String? paymentRefId;
  String? link;
  String? website;
  String? email;
  String? clubName;
  int? maximumMembers;
  List<String>? policies;
  String? unit;
  String? type1;
  String? type2;
  String? color;
  int? responseTime;
  int? onTimeDelivery;
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
  final List<Seat>? seats;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "details": details,
        "address": address,
        "author": author,
        "phoneNumber": phoneNumber,
        "link": link,
        "paymentRefId": paymentRefId,
        "website": website,
        "email": email,
        "type1": type1,
        "type2": type2,
        "unit": unit,
        "policies": policies,
        "clubName": clubName,
        "maximumMembers": maximumMembers,
        "responseTime": responseTime,
        "onTimeDelivery": onTimeDelivery,
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
        "seats": seats == null ? [] : List<dynamic>.from(seats!.map((x) => x.toMap())),
      };
}

class ProductCreateUpdateDto {
  ProductCreateUpdateDto({
    this.seats,
    this.id,
    this.title,
    this.price1,
    this.price2,
    this.subtitle,
    this.description,
    this.country,
    this.city,
    this.state,
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
    this.maximumMembers,
    this.clubName,
    this.policies,
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
    this.paymentRefId,
    required this.tags,
    this.children,
    this.reservationTimes,
  });

  String? id;
  String? title;
  String? subtitle;
  String? description;
  String? paymentRefId;
  String? details;
  String? address;
  String? author;
  String? phoneNumber;
  String? link;
  String? website;
  int? price1;
  int? price2;
  String? color;
  String? email;
  String? country;
  String? city;
  String? state;
  String? type1;
  String? type2;
  String? unit;
  String? keyValue;
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
  String? clubName;
  int? maximumMembers;
  List<String>? policies;
  List<KeyValueViewModel>? keyValues;
  List<String>? categories;
  List<String>? teams;
  List<int>? tags;
  List<ProductCreateUpdateDto>? children;
  List<ReservationTimes>? reservationTimes;
  List<Seat>? seats;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "seats": seats == null ? null : List<dynamic>.from(seats!.map((x) => x.toMap())),
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "details": details,
        "address": address,
        "paymentRefId": paymentRefId,
        "country": country,
        "city": city,
        "state": state,
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
        "policies": policies == null ? null : List<dynamic>.from(policies!.map((x) => x)),
        "clubName": clubName,
        "maximumMembers": maximumMembers,
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
        "price1": price1,
        "price2": price2,
        "parentId": parentId,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((final int x) => x)),
        "keyValues": keyValues == null ? null : List<dynamic>.from(keyValues!.map((final KeyValueViewModel x) => x.toMap())),
        "children": children == null ? null : List<dynamic>.from(children!.map((final ProductCreateUpdateDto x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.where((final String element) => element != '').map((final String x) => x)),
        "teams": teams == null ? null : List<dynamic>.from(teams!.map((final String x) => x)),
        "reservationTimes": reservationTimes == null ? null : List<dynamic>.from(reservationTimes!.map((x) => x.toMap())),
      };
}

class ProductFilterDto extends BaseFilterDto {
  ProductFilterDto({
    this.title,
    this.subtitle,
    this.country,
    this.city,
    this.state,
    this.description,
    this.stateRegion,
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
    this.currency,
    this.categories,
    this.tags,
    this.userIds,
    this.query,
    this.shuffle1,
    this.shuffle2,
    this.showExpired,
    this.boosted,
    this.startDate,
    this.endDate,
    super.fromDate,
    super.pageSize,
    super.pageNumber,
  });

  String? title;
  String? stateRegion;
  String? subtitle;
  String? description;
  String? country;
  String? city;
  String? state;
  String? startDate;
  String? endDate;
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
  int? currency;
  List<String>? categories;
  List<int>? tags;
  List<String>? userIds;
  String? query;
  bool? shuffle1;
  bool? shuffle2;
  bool? showExpired;
  bool? boosted;

  @override
  @override
  @override
  @override
  @override
  @override
  @override
  @override
  String toJson() => json.encode(removeNullEntries(toMap()));

  @override
  @override
  @override
  @override
  @override
  @override
  @override
  @override
  Map<String, dynamic> toMap() => {
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "startDate": startDate,
        "endDate": endDate,
        "stateRegion": stateRegion,
        "country": country,
        "city": city,
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
        "fromDate": fromDate,
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

  String toJson() => json.encode(removeNullEntries(toMap()));

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

  String toJson() => json.encode(removeNullEntries(toMap()));

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

  String toJson() => json.encode(removeNullEntries(toMap()));

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

class ReactionReadDto {
  final int? reaction;
  final String? userId;

  ReactionReadDto({
    this.reaction,
    this.userId,
  });

  factory ReactionReadDto.fromJson(String str) => ReactionReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ReactionReadDto.fromMap(Map<String, dynamic> json) => ReactionReadDto(
        reaction: json["reaction"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "reaction": reaction,
        "userId": userId,
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

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ReactionCreateUpdateDto.fromMap(Map<String, dynamic> json) => ReactionCreateUpdateDto(
        reaction: json["reaction"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "reaction": reaction,
        "productId": productId,
      };
}

class Seat {
  String? chairId;
  String? title;
  String? subtitle;
  String? description;
  String? date;
  String? sans;
  String? salon;
  int? row;
  int? column;
  int? price;
  int? gender;
  String? reservedByUserId;
  String? reservedByUserName;
  int? tag;
  UserReadDto? user;

  Seat({
    this.chairId,
    this.title,
    this.subtitle,
    this.description,
    this.date,
    this.sans,
    this.salon,
    this.row,
    this.column,
    this.price,
    this.gender,
    this.reservedByUserId,
    this.reservedByUserName,
    this.tag,
    this.user,
  });

  factory Seat.fromJson(String str) => Seat.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory Seat.fromMap(Map<String, dynamic> json) => Seat(
        chairId: json["chairId"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        date: json["date"],
        sans: json["sans"],
        salon: json["salon"],
        row: json["row"],
        column: json["column"],
        price: json["price"],
        gender: json["gender"],
        reservedByUserId: json["reservedByUserId"],
        reservedByUserName: json["reservedByUserName"],
        tag: json["tag"],
      );

  Map<String, dynamic> toMap() => {
        "chairId": chairId,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "date": date,
        "sans": sans,
        "salon": salon,
        "row": row,
        "column": column,
        "price": price,
        "gender": gender,
        "reservedByUserId": reservedByUserId,
        "reservedByUserName": reservedByUserName,
        "tag": tag,
      };
}
