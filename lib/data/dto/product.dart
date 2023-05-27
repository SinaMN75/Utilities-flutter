import 'package:utilities/utilities.dart';

extension ProductReadDtoExtension on ProductReadDto {
  ProductReadDto sample() => ProductReadDto(
        id: "id",
        userId: "userId",
        title: "title",
        subtitle: "subtitle",
        description: "description",
        productJsonDetail: ProductJsonDetail(
          details: "details",
          address: "address",
          author: "author",
          phoneNumber: "phoneNumber",
          link: "link",
          website: "website",
          email: "email",
          unit: "unit",
          latitude: 35,
          longitude: 55,
          minOrder: 10,
          maxOrder: 1000,
          startDate: DateTime.now(),
          endDate: DateTime.now(),
        ),
        type: "type",
        useCase: "useCase",
        enabled: true,
        visitsCount: 100,
        price: 10000,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        user: UserReadDto(),
        status: 1,
        media: <MediaReadDto>[MediaReadDto(url: Sample.loremPicsum)],
      );
}

class ProductReadDto {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? subtitle;
  String? description;
  String? useCase;
  String? type;
  String? state;
  DateTime? boosted;
  int? stock;
  int? voteCount;
  int? discountPercent;
  int? visitsCount;
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
  String? product;
  String? parentId;
  String? userId;
  UserReadDto? user;
  ProductJsonDetail? productJsonDetail;
  List<CommentReadDto>? comments;
  List<MediaReadDto>? media;
  List<FormReadDto>? forms;
  List<CategoryReadDto>? categories;
  List<ProductInsight>? productInsights;
  List<ProductInsight>? visitProducts;
  String? successfulPurchase;

  ProductReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.subtitle,
    this.description,
    this.useCase,
    this.type,
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
    this.currency,
    this.status,
    this.ageCategory,
    this.productState,
    this.expireDate,
    this.seenUsers,
    this.teams,
    this.product,
    this.parentId,
    this.userId,
    this.user,
    this.productJsonDetail,
    this.media,
    this.forms,
    this.comments,
    this.categories,
    this.productInsights,
    this.visitProducts,
    this.successfulPurchase,
  });

  factory ProductReadDto.fromJson(String str) => ProductReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductReadDto.fromMap(Map<String, dynamic> json) => ProductReadDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        title: json["title"],
        isSeen: json["isSeen"],
        subtitle: json["subtitle"],
        description: json["description"],
        useCase: json["useCase"],
        type: json["type"],
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
        product: json["product"],
        parentId: json["parentId"],
        userId: json["userId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        productJsonDetail: json["productJsonDetail"] == null ? null : ProductJsonDetail.fromMap(json["productJsonDetail"]),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
        comments: json["comments"] == null ? <CommentReadDto>[] : List<CommentReadDto>.from(json["comments"].cast<Map<String, dynamic>>().map(CommentReadDto.fromMap)).toList(),
        forms: json["forms"] == null ? <FormReadDto>[] : List<FormReadDto>.from(json["forms"].cast<Map<String, dynamic>>().map(FormReadDto.fromMap)).toList(),
        categories: json["categories"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["categories"].cast<Map<String, dynamic>>().map(CategoryReadDto.fromMap)).toList(),
        productInsights: json["productInsights"] == null ? <ProductInsight>[] : List<ProductInsight>.from(json["productInsights"].cast<Map<String, dynamic>>().map(ProductInsight.fromMap)).toList(),
        visitProducts: json["visitProducts"] == null ? <ProductInsight>[] : List<ProductInsight>.from(json["visitProducts"].cast<Map<String, dynamic>>().map(ProductInsight.fromMap)).toList(),
        successfulPurchase: json["successfulPurchase"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "useCase": useCase,
        "isSeen": isSeen,
        "type": type,
        "state": state,
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
        "product": product,
        "parentId": parentId,
        "userId": userId,
        "user": user?.toMap(),
        "productJsonDetail": productJsonDetail?.toMap(),
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toMap())),
        "forms": forms == null ? [] : List<dynamic>.from(forms!.map((x) => x.toMap())),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "comments": comments == null ? [] : List<CommentReadDto>.from(comments!.map((x) => x.toMap())),
        "productInsights": productInsights == null ? [] : List<dynamic>.from(productInsights!.map((x) => x.toMap())),
        "visitProducts": visitProducts == null ? [] : List<dynamic>.from(visitProducts!.map((x) => x.toMap())),
        "successfulPurchase": successfulPurchase,
      };
}

class ProductJsonDetail {
  String? details;
  String? address;
  String? author;
  String? phoneNumber;
  String? link;
  String? website;
  String? email;
  String? unit;
  int? latitude;
  int? responseTime;
  int? onTimeDelivery;
  int? longitude;
  int? length;
  int? width;
  int? height;
  int? weight;
  int? minOrder;
  int? maxOrder;
  int? maxPrice;
  int? minPrice;
  int? shippingCost;
  int? shippingTime;
  DateTime? startDate;
  DateTime? endDate;

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
    this.longitude,
    this.length,
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
  });

  factory ProductJsonDetail.fromJson(String str) => ProductJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductJsonDetail.fromMap(Map<String, dynamic> json) => ProductJsonDetail(
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
        height: json["height"],
        weight: json["weight"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        maxPrice: json["maxPrice"],
        minPrice: json["minPrice"],
        shippingCost: json["shippingCost"],
        shippingTime: json["shippingTime"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toMap() => {
        "details": details,
        "address": address,
        "author": author,
        "phoneNumber": phoneNumber,
        "link": link,
        "website": website,
        "email": email,
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

///***********************************

class ProductCreateUpdateDto {
  ProductCreateUpdateDto({
    this.id,
    this.userId,
    this.title,
    this.subtitle,
    this.description,
    this.details,
    this.address,
    this.author,
    this.phoneNumber,
    this.link,
    this.website,
    this.email,
    this.type,
    this.unit,
    this.useCase,
    this.isForSale,
    this.enabled,
    this.isBookmarked,
    this.latitude,
    this.longitude,
    this.visitsCount,
    this.minOrder,
    this.maxOrder,
    this.price,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.discountPercent,
    this.discountPrice,
    this.expireDate,
    this.user,
    this.status,
    this.currency,
    this.locations,
    this.media,
    this.keyValue1,
    this.keyValue2,
    this.categories,
    this.forms,
    this.comments,
    this.teams,
    this.state,
    this.productInsight,
  });

  factory ProductCreateUpdateDto.fromJson(final String str) => ProductCreateUpdateDto.fromMap(json.decode(str));

  factory ProductCreateUpdateDto.fromMap(final Map<String, dynamic> json) => ProductCreateUpdateDto(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        details: json["details"],
        address: json["address"],
        author: json["author"],
        state: json["state"],
        phoneNumber: json["phoneNumber"],
        link: json["link"],
        website: json["website"],
        email: json["email"],
        type: json["type"],
        unit: json["unit"],
        useCase: json["useCase"],
        isForSale: json["isForSale"],
        keyValue1: json["keyValue1"],
        keyValue2: json["keyValue2"],
        enabled: json["enabled"],
        isBookmarked: json["isBookmarked"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        discountPercent: json["discountPercent"],
        discountPrice: json["discountPrice"],
        visitsCount: json["visitsCount"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        price: json["price"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        expireDate: json["expireDate"],
        status: json["status"],
        currency: json["currency"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        productInsight: json["productInsight"] == null ? null : ProductInsight.fromMap(json["productInsight"]),
        locations: json["locations"] == null ? null : List<int>.from(json["locations"].cast<Map<String, dynamic>>().map((final dynamic x) => x)),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].cast<Map<String, dynamic>>().map((final dynamic x) => x)),
        forms: json["forms"] == null ? null : List<FormReadDto>.from(json["forms"].cast<Map<String, dynamic>>().map(FormReadDto.fromMap)).toList(),
        comments: json["comments"] == null ? null : List<CommentReadDto>.from(json["comments"].cast<Map<String, dynamic>>().map(CommentReadDto.fromMap)).toList(),
        teams: json["teams"] == null ? null : List<String>.from(json["teams"].cast<Map<String, dynamic>>().map((final dynamic x) => x)),
      );

  final String? id;
  final String? userId;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? details;
  final String? address;
  final String? author;
  final String? phoneNumber;
  final String? link;
  final String? website;
  final String? email;
  final String? type;
  final String? unit;
  final String? useCase;
  final String? state;
  final String? keyValue1;
  final String? keyValue2;
  final bool? isForSale;
  final bool? enabled;
  final bool? isBookmarked;
  final double? latitude;
  final double? longitude;
  final int? visitsCount;
  final double? minOrder;
  final double? maxOrder;
  final int? discountPercent;
  final int? discountPrice;
  final double? price;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? expireDate;
  final int? status;
  final int? currency;
  final UserReadDto? user;
  final ProductInsight? productInsight;
  final List<int>? locations;
  final List<MediaReadDto>? media;
  final List<String>? categories;
  final List<FormReadDto>? forms;
  final List<CommentReadDto>? comments;
  final List<String>? teams;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "userId": userId,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "details": details,
        "address": address,
        "author": author,
        "state": state,
        "phoneNumber": phoneNumber,
        "link": link,
        "website": website,
        "email": email,
        "type": type,
        "unit": unit,
        "useCase": useCase,
        "isForSale": isForSale,
        "enabled": enabled,
        "isBookmarked": isBookmarked,
        "latitude": latitude,
        "longitude": longitude,
        "discountPercent": discountPercent,
        "discountPrice": discountPrice,
        "visitsCount": visitsCount,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "price": price,
        "keyValue1": keyValue1,
        "keyValue2": keyValue1,
        "startDate": startDate,
        "endDate": endDate,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "expireDate": expireDate,
        "status": status,
        "currency": currency,
        "user": user == null ? null : user!.toMap(),
        "productInsight": productInsight?.toMap(),
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((final int x) => x)),
        "media": media == null ? null : List<dynamic>.from(media!.map((final MediaReadDto x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((final String x) => x)),
        "forms": forms == null ? null : List<dynamic>.from(forms!.map((final FormReadDto x) => x.toMap())),
        "comments": comments == null ? null : List<dynamic>.from(comments!.map((final CommentReadDto x) => x.toMap())),
        "teams": teams == null ? null : List<dynamic>.from(teams!.map((final String x) => x)),
      };
}

class ProductFilterDto {
  ProductFilterDto({
    this.title,
    this.subTitle,
    this.description,
    this.details,
    this.link,
    this.website,
    this.address,
    this.author,
    this.phoneNumber,
    this.email,
    this.type,
    this.startPriceRange,
    this.endPriceRange,
    this.enabled,
    this.isForSale,
    this.isBookmarked,
    this.visitsCount,
    this.length,
    this.width,
    this.height,
    this.weight,
    this.minOrder,
    this.maxOrder,
    this.unit,
    this.status,
    this.currency,
    this.startDate,
    this.endDate,
    this.locations,
    this.filterOrder,
    this.pageSize,
    this.pageNumber,
    this.useCase,
    this.teams,
    this.minimal,
    this.isFollowing,
    this.showCreator,
    this.showCategories,
    this.showUserCategories,
    this.showCategoryMedia,
    this.showMedia,
    this.showTeams,
    this.showExpired,
    this.userId,
    this.state,
    this.orderByVotes,
    this.orderByVotesDecending,
    this.orderByAtoZ,
    this.orderByZtoA,
    this.orderByPriceAccending,
    this.orderByPriceDecending,
    this.orderByCreatedDate,
    this.orderByCreaedDateDecending,
    this.showVotes,
    this.subtitle,
    this.keyValues1,
    this.keyValues2,
    this.maxPrice,
    this.minPrice,
    this.responseTime,
    this.onTimeDelivery,
    this.hasDiscount,
    this.discountPercent,
    this.discountPrice,
    this.showForms,
    this.showFormFields,
    this.showCategoriesFormFields,
    this.showVoteFields,
    this.showVisitProducts,
    this.showReports,
    this.showComments,
    this.showOrders,
    this.minValue,
    this.maxValue,
    this.hasComment,
    this.hasOrder,
    this.categories,
    this.userIds,
    this.isMyBoughtList,
    this.categoriesAnd,
    this.query,
  });

  factory ProductFilterDto.fromJson(final String str) => ProductFilterDto.fromMap(json.decode(str));

  factory ProductFilterDto.fromMap(final Map<String, dynamic> json) => ProductFilterDto(
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        details: json["details"],
        link: json["link"],
        state: json["state"],
        website: json["website"],
        address: json["address"],
        author: json["author"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        type: json["type"],
        userId: json["userId"],
        discountPercent: json["discountPercent"],
        discountPrice: json["discountPrice"],
        startPriceRange: json["startPriceRange"],
        endPriceRange: json["endPriceRange"],
        enabled: json["enabled"],
        isForSale: json["isForSale"],
        isBookmarked: json["isBookmarked"],
        minimal: json["minimal"],
        isFollowing: json["isFollowing"],
        visitsCount: json["visitsCount"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        weight: json["weight"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        unit: json["unit"],
        status: json["status"],
        currency: json["currency"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        filterOrder: json["filterOrder"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        useCase: json["useCase"],
        showCreator: json["showCreator"],
        showTeams: json["showTeams"],
        showVotes: json["showVotes"],
        showExpired: json["showExpired"],
        showCategoryMedia: json["showCategoryMedia"],
        showUserCategories: json["showUserCategories"],
        showCategories: json["showCategories"],
        isMyBoughtList: json["isMyBoughtList"],
        showMedia: json["showMedia"],
        orderByVotes: json["orderByVotes"],
        orderByVotesDecending: json["orderByVotesDecending"],
        orderByAtoZ: json["orderByAtoZ"],
        orderByZtoA: json["orderByZtoA"],
        orderByPriceAccending: json["orderByPriceAccending"],
        orderByPriceDecending: json["orderByPriceDecending"],
        orderByCreatedDate: json["orderByCreatedDate"],
        orderByCreaedDateDecending: json["orderByCreaedDateDecending"],
        locations: json["locations"],
        teams: json["teams"] == null ? null : List<UserReadDto>.from(json["teams"].cast<Map<String, dynamic>>().map(UserReadDto.fromMap)).toList(),
        subtitle: json["subtitle"],
        keyValues1: json["keyValues1"],
        keyValues2: json["keyValues2"],
        maxPrice: json["maxPrice"],
        minPrice: json["minPrice"],
        responseTime: json["responseTime"],
        onTimeDelivery: json["onTimeDelivery"],
        hasDiscount: json["hasDiscount"],
        showForms: json["showForms"],
        showFormFields: json["showFormFields"],
        showCategoriesFormFields: json["showCategoriesFormFields"],
        showVoteFields: json["showVoteFields"],
        showVisitProducts: json["showVisitProducts"],
        showReports: json["showReports"],
        showComments: json["showComments"],
        showOrders: json["showOrders"],
        minValue: json["minValue"],
        maxValue: json["maxValue"],
        hasComment: json["hasComment"],
        hasOrder: json["hasOrder"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((final dynamic x) => x)),
        categoriesAnd: json["categoriesAnd"] == null ? [] : List<String>.from(json["categoriesAnd"]!.map((final dynamic x) => x)),
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((final dynamic x) => x)),
        query: json["query"],
      );

  final String? title;
  final String? subTitle;
  final String? description;
  final String? details;
  final String? link;
  final String? website;
  final String? address;
  final String? author;
  final String? phoneNumber;
  final String? email;
  final String? type;
  final String? userId;
  final double? startPriceRange;
  final double? endPriceRange;
  final int? discountPercent;
  final int? discountPrice;
  final bool? enabled;
  final bool? isForSale;
  final bool? isBookmarked;
  final bool? minimal;
  final bool? isFollowing;
  final bool? showCreator;
  final bool? showTeams;
  final bool? showCategories;
  final bool? showMedia;
  final bool? showVotes;
  final bool? showExpired;
  final bool? showCategoryMedia;
  final bool? showUserCategories;
  final bool? isMyBoughtList;
  final int? visitsCount;
  final double? length;
  final double? width;
  final double? height;
  final double? weight;
  final double? minOrder;
  final double? maxOrder;
  final String? unit;
  final int? status;
  final int? currency;
  final String? startDate;
  final String? endDate;
  final int? filterOrder;
  final int? pageSize;
  final int? pageNumber;
  final String? useCase;
  final String? state;
  final bool? orderByVotesDecending;
  final bool? orderByVotes;
  final bool? orderByAtoZ;
  final bool? orderByZtoA;
  final bool? orderByPriceAccending;
  final bool? orderByPriceDecending;
  final bool? orderByCreatedDate;
  final bool? orderByCreaedDateDecending;
  final List<int>? locations;
  final List<UserReadDto>? teams;
  final String? subtitle;
  final String? keyValues1;
  final String? keyValues2;
  final int? maxPrice;
  final int? minPrice;
  final int? responseTime;
  final int? onTimeDelivery;
  final bool? hasDiscount;
  final bool? showForms;
  final bool? showFormFields;
  final bool? showCategoriesFormFields;
  final bool? showVoteFields;
  final bool? showVisitProducts;
  final bool? showReports;
  final bool? showComments;
  final bool? showOrders;
  final int? minValue;
  final int? maxValue;
  final bool? hasComment;
  final bool? hasOrder;
  final List<String>? categories;
  final List<String>? categoriesAnd;
  final List<String>? userIds;
  final String? query;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "details": details,
        "link": link,
        "website": website,
        "address": address,
        "author": author,
        "phoneNumber": phoneNumber,
        "email": email,
        "state": state,
        "type": type,
        "userId": userId,
        "startPriceRange": startPriceRange,
        "endPriceRange": endPriceRange,
        "enabled": enabled,
        "isForSale": isForSale,
        "isBookmarked": isBookmarked,
        "minimal": minimal,
        "isFollowing": isFollowing,
        "visitsCount": visitsCount,
        "length": length,
        "width": width,
        "height": height,
        "weight": weight,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "unit": unit,
        "status": status,
        "currency": currency,
        "startDate": startDate,
        "endDate": endDate,
        "filterOrder": filterOrder,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "useCase": useCase,
        "showCreator": showCreator,
        "showTeams": showTeams,
        "showVotes": showVotes,
        "showExpired": showExpired,
        "showCategoryMedia": showCategoryMedia,
        "showUserCategories": showUserCategories,
        "showCategories": showCategories,
        "showMedia": showMedia,
        "isMyBoughtList": isMyBoughtList,
        "orderByVotes": orderByVotes,
        "orderByVotesDecending": orderByVotesDecending,
        "orderByAtoZ": orderByAtoZ,
        "orderByZtoA": orderByZtoA,
        "orderByPriceAccending": orderByPriceAccending,
        "orderByPriceDecending": orderByPriceDecending,
        "orderByCreatedDate": orderByCreatedDate,
        "orderByCreaedDateDecending": orderByCreaedDateDecending,
        "locations": locations,
        "teams": teams == null ? null : List<dynamic>.from(teams!.map((final UserReadDto x) => x.toMap())),
        "subtitle": subtitle,
        "keyValues1": keyValues1,
        "keyValues2": keyValues2,
        "maxPrice": maxPrice,
        "minPrice": minPrice,
        "responseTime": responseTime,
        "onTimeDelivery": onTimeDelivery,
        "hasDiscount": hasDiscount,
        "discountPrice": discountPrice,
        "discountPercent": discountPercent,
        "showForms": showForms,
        "showFormFields": showFormFields,
        "showCategoriesFormFields": showCategoriesFormFields,
        "showVoteFields": showVoteFields,
        "showVisitProducts": showVisitProducts,
        "showReports": showReports,
        "showComments": showComments,
        "showOrders": showOrders,
        "minValue": minValue,
        "maxValue": maxValue,
        "hasComment": hasComment,
        "hasOrder": hasOrder,
        "categoriesAnd": categoriesAnd == null ? [] : List<dynamic>.from(categoriesAnd!.map((final String x) => x)),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((final String x) => x)),
        "userIds": userIds == null ? [] : List<dynamic>.from(userIds!.map((final String x) => x)),
        "query": query,
      };
}

class ProductInsight {
  ProductInsight({
    this.reaction,
    this.userId,
  });

  factory ProductInsight.fromJson(final String str) => ProductInsight.fromMap(json.decode(str));

  factory ProductInsight.fromMap(final Map<String, dynamic> json) => ProductInsight(
        reaction: json["reaction"],
        userId: json["userId"],
      );

  final int? reaction;
  final String? userId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
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

  factory ProductInsightDto.fromMap(final Map<String, dynamic> json) => ProductInsightDto(
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

  Map<String, dynamic> toMap() => <String, dynamic>{
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
