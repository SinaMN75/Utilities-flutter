import 'package:utilities/data/dto/order.dart';
import 'package:utilities/utilities.dart';

class ProductReadDto {
  ProductReadDto({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.subtitle,
    this.description,
    this.state,
    this.boosted,
    this.isSeen,
    this.stock,
    this.voteCount,
    this.discountPercent,
    this.visitsCount,
    this.enabled,
    this.discountPrice,
    this.price,
    this.score,
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
    this.jsonDetail,
    this.media,
    this.forms,
    this.comments,
    this.categories,
    this.productInsights,
    this.visitProducts,
    this.children,
    this.orders,
    this.tags,
    this.successfulPurchase,
  });

  factory ProductReadDto.fromJson(final String str) => ProductReadDto.fromMap(json.decode(str));

  factory ProductReadDto.fromMap(final dynamic json) => ProductReadDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        title: json["title"],
        isSeen: json["isSeen"],
        subtitle: json["subtitle"],
        description: json["description"],
        score: json["score"],
        state: json["state"],
        boosted: json["boosted"] == null ? null : DateTime.parse(json["boosted"]),
        stock: json["stock"],
        voteCount: json["voteCount"],
        discountPercent: json["discountPercent"],
        visitsCount: json["visitsCount"],
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
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        parent: json["parent"] == null ? null : ProductReadDto.fromMap(json["parent"]),
        product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
        jsonDetail: json["jsonDetail"] == null ? null : ProductJsonDetail.fromMap(json["jsonDetail"]),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
        comments: json["comments"] == null ? <CommentReadDto>[] : List<CommentReadDto>.from(json["comments"].cast<Map<String, dynamic>>().map(CommentReadDto.fromMap)).toList(),
        forms: json["forms"] == null ? <FormReadDto>[] : List<FormReadDto>.from(json["forms"].cast<Map<String, dynamic>>().map(FormReadDto.fromMap)).toList(),
        children: json["children"] == null ? <ProductReadDto>[] : List<ProductReadDto>.from(json["children"].cast<Map<String, dynamic>>().map(ProductReadDto.fromMap)).toList(),
        categories: json["categories"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["categories"].cast<Map<String, dynamic>>().map(CategoryReadDto.fromMap)).toList(),
        productInsights: json["productInsights"] == null ? <ProductInsight>[] : List<ProductInsight>.from(json["productInsights"].cast<Map<String, dynamic>>().map(ProductInsight.fromMap)).toList(),
        orders: json["orders"] == null ? <OrderReadDto>[] : List<OrderReadDto>.from(json["orders"].cast<Map<String, dynamic>>().map(OrderReadDto.fromMap)).toList(),
        visitProducts: json["visitProducts"] == null ? <ProductInsight>[] : List<ProductInsight>.from(json["visitProducts"].cast<Map<String, dynamic>>().map(ProductInsight.fromMap)).toList(),
        successfulPurchase: json["successfulPurchase"],
      );
  String id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? subtitle;
  String? description;
  String? state;
  DateTime? boosted;
  int? stock;
  int? voteCount;
  int? discountPercent;
  int? visitsCount;
  bool? enabled;
  bool? isSeen;
  double? score;
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
  ProductJsonDetail? jsonDetail;
  List<CommentReadDto>? comments;
  List<MediaReadDto>? media;
  List<FormReadDto>? forms;
  List<int>? tags;
  List<ProductReadDto>? children;
  List<CategoryReadDto>? categories;
  List<OrderReadDto>? orders;
  List<ProductInsight>? productInsights;
  List<ProductInsight>? visitProducts;
  int? successfulPurchase;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "isSeen": isSeen,
        "state": state,
        "score": score,
        "boosted": boosted?.toIso8601String(),
        "stock": stock,
        "voteCount": voteCount,
        "discountPercent": discountPercent,
        "visitsCount": visitsCount,
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
        "jsonDetail": jsonDetail?.toMap(),
        "product": product?.toMap(),
        "parent": parent?.toMap(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
        "media": media == null ? [] : List<dynamic>.from(media!.map((final MediaReadDto x) => x.toMap())),
        "forms": forms == null ? [] : List<dynamic>.from(forms!.map((final FormReadDto x) => x.toMap())),
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
        keyValues: json["keyValues"] == null ? [] : List<KeyValueViewModel>.from(json["keyValues"]!.map(KeyValueViewModel.fromMap)),
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

  String toJson() => json.encode(toMap());

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
    this.forms,
    this.teams,
    this.tags,
    this.productInsight,
  });

  final String? id;
  String? title;
  final String? subtitle;
  final String? description;
  final String? details;
  final String? address;
  final String? author;
  final String? phoneNumber;
  final String? link;
  final String? website;
  final String? color;
  final String? email;
  final String? type1;
  final String? type2;
  final String? unit;
  final String? keyValue;
  final String? state;
  final double? latitude;
  final double? longitude;
  int? price;
  final int? length;
  final double? width;
  final double? height;
  final int? weight;
  int? count;
  final int? minOrder;
  final int? maxOrder;
  final int? maxPrice;
  final int? minPrice;
  final int? scorePlus;
  final int? scoreMinus;
  int? discountPrice;
  final int? responseTime;
  final int? onTimeDelivery;
  final int? discountPercent;
  final int? commentsCount;
  int? stock;
  final bool? enabled;
  final String? startDate;
  final String? endDate;
  final String? expireDate;
  final int? status;
  final int? currency;
  final int? ageCategory;
  final int? productState;
  final int? shippingTime;
  final int? shippingCost;
  final String? boosted;
  final String? parentId;
  final List<KeyValueViewModel>? keyValues;
  final List<String>? categories;
  final List<String>? teams;
  final List<int>? tags;
  List<FormReadDto>? forms;
  final ProductInsight? productInsight;

  String toJson() => json.encode(toMap());

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
        "forms": forms == null ? [] : List<dynamic>.from(forms!.map((final FormReadDto x) => x.toMap())),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.where((final String element) => element != '').map((final String x) => x)),
        "teams": teams == null ? [] : List<dynamic>.from(teams!.map((final String x) => x)),
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
        showExpired: json["showExpired"],
        boosted: json["boosted"],
      );

  final String? title;
  final String? subtitle;
  final String? description;
  final String? state;
  final int? startPriceRange;
  final int? endPriceRange;
  final bool? isFollowing;
  final bool? isBookmarked;
  final bool? hasDiscount;
  final bool? showMedia;
  final bool? showForms;
  final bool? showFormFields;
  final bool? showCategories;
  final bool? showVisitProducts;
  final bool? showCreator;
  final bool? showCategoryMedia;
  final bool? showChildren;
  final bool? showChildrenParent;
  final bool? showPostOfPrivateUser;
  final bool? showComments;
  final bool? orderByVotes;
  final bool? orderByVotesDescending;
  final bool? orderByAtoZ;
  final bool? orderByZtoA;
  final bool? orderByPriceAscending;
  final bool? orderByPriceDescending;
  final bool? orderByCreatedDate;
  final bool? orderByCreatedDateDescending;
  final bool? orderByAgeCategory;
  final bool? showCountOfComment;
  final int? pageSize;
  final int? pageNumber;
  final int? currency;
  final List<String>? categories;
  final List<int>? tags;
  final List<String>? userIds;
  final String? query;
  final bool? showExpired;
  final bool? boosted;

  String toJson() => json.encode(toMap());

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

  String toJson() => json.encode(toMap());

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

  String toJson() => json.encode(toMap());

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
