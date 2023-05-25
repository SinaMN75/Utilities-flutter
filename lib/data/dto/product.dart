import 'package:utilities/data/dto/report.dart';
import 'package:utilities/utilities.dart';

extension ProductReadDtoExtension on ProductReadDto {
  ProductReadDto sample() => ProductReadDto(
        id: "id",
        userId: "userId",
        title: "title",
        subtitle: "subtitle",
        description: "description",
        details: "details",
        address: "address",
        author: "author",
        phoneNumber: "phoneNumber",
        link: "link",
        website: "website",
        email: "email",
        type: "type",
        unit: "unit",
        useCase: "useCase",
        isForSale: true,
        enabled: true,
        latitude: 35,
        longitude: 55,
        visitsCount: 100,
        minOrder: 10,
        maxOrder: 1000,
        price: 10000,
        score: 10,
        startDate: DateTime.now().toString(),
        endDate: DateTime.now().toString(),
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
        deletedAt: null,
        user: UserReadDto(),
        status: 1,
        media: <MediaReadDto>[MediaReadDto(link: Sample.loremPicsum)],
      );
}

class ProductReadDto {

  ProductReadDto({
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
    this.state,
    this.stateTr1,
    this.stateTr2,
    this.type,
    this.unit,
    this.useCase,
    this.isForSale,
    this.isSeen,
    this.expireDate,
    this.enabled,
    this.latitude,
    this.longitude,
    this.visitsCount,
    this.minOrder,
    this.maxOrder,
    this.discountPrice,
    this.discountPercent,
    this.price,
    this.score,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.status,
    this.seenUsers,
    this.currency,
    this.media,
    this.categories,
    this.forms,
    this.comments,
    this.teams,
    this.reports,
    this.voteCount,
    this.productInsights,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
    this.value6,
  });
  factory ProductReadDto.fromJson(final String str) => ProductReadDto.fromMap(json.decode(str));

  factory ProductReadDto.fromMap(final Map<String, dynamic> json) => ProductReadDto(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        details: json["details"],
        address: json["address"],
        author: json["author"],
        phoneNumber: json["phoneNumber"],
        link: json["link"],
        website: json["website"],
        value1: json["value1"],
        value2: json["value2"],
        value3: json["value3"],
        value4: json["value4"],
        value5: json["value5"],
        value6: json["value6"],
        email: json["email"],
        state: json["state"],
        discountPrice: json["discountPrice"],
        discountPercent: json["discountPercent"],
        stateTr1: json["stateTr1"],
        stateTr2: json["stateTr2"],
        type: json["type"],
        unit: json["unit"],
        useCase: json["useCase"],
        isForSale: json["isForSale"],
        isSeen: json["isSeen"],
        expireDate: json["expireDate"],
        enabled: json["enabled"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        visitsCount: json["visitsCount"],
        minOrder: json["minOrder"],
        maxOrder: json["maxOrder"],
        price: json["price"],
        score: json["score"],
        voteCount: json["voteCount"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        status: json["status"],
        seenUsers: json["seenUsers"],
        currency: json["currency"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
        categories: json["categories"] == null ? null : List<CategoryReadDto>.from(json["categories"].cast<Map<String, dynamic>>().map(CategoryReadDto.fromMap)).toList(),
        forms: json["forms"] == null ? null : List<FormReadDto>.from(json["forms"].cast<Map<String, dynamic>>().map(FormReadDto.fromMap)).toList(),
        comments: json["comments"] == null ? null : List<CommentReadDto>.from(json["comments"].cast<Map<String, dynamic>>().map(CommentReadDto.fromMap)).toList(),
        teams: json["teams"],
        reports: json["reports"] == null ? null : List<Report>.from(json["reports"].cast<Map<String, dynamic>>().map(Report.fromMap)).toList(),
        productInsights: json["productInsights"] == null ? [] : List<ProductInsightDto>.from(json["productInsights"]!.map(ProductInsightDto.fromMap)).toList(),
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
  final String? seenUsers;
  final String? state;
  final String? stateTr1;
  final String? stateTr2;
  final String? type;
  final String? unit;
  final String? useCase;
  final bool? isForSale;
  final bool? isSeen;
  final String? expireDate;
  final bool? enabled;
  final double? latitude;
  final double? longitude;
  final int? discountPercent;
  final int? discountPrice;
  final int? visitsCount;
  final double? minOrder;
  final double? maxOrder;
  final double? price;
  final double? score;
  final double? voteCount;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? status;
  final int? currency;
  final String? value1;
  final String? value2;
  final String? value3;
  final String? value4;
  final String? value5;
  final String? value6;
  UserReadDto? user;
  final List<MediaReadDto>? media;
  final List<CategoryReadDto>? categories;
  final List<FormReadDto>? forms;
  final List<ProductInsightDto>? productInsights;
  final List<CommentReadDto>? comments;
  final String? teams;
  final List<Report>? reports;

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
        "phoneNumber": phoneNumber,
        "link": link,
        "website": website,
        "email": email,
        "state": state,
        "stateTr1": stateTr1,
        "stateTr2": stateTr2,
        "type": type,
        "unit": unit,
        "seenUsers": seenUsers,
        "useCase": useCase,
        "isForSale": isForSale,
        "isSeen": isSeen,
        "discountPrice": discountPrice,
        "discountPercent": discountPercent,
        "expireDate": expireDate,
        "enabled": enabled,
        "latitude": latitude,
        "longitude": longitude,
        "visitsCount": visitsCount,
        "minOrder": minOrder,
        "maxOrder": maxOrder,
        "price": price,
        "score": score,
        "startDate": startDate,
        "endDate": endDate,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "value1": value1,
        "value2": value2,
        "value3": value3,
        "value4": value4,
        "value5": value5,
        "value6": value6,
        "status": status,
        "currency": currency,
        "voteCount": voteCount,
        "user": user == null ? null : user!.toMap(),
        "media": media == null ? null : List<dynamic>.from(media!.map((final MediaReadDto x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((final CategoryReadDto x) => x.toMap())),
        "forms": forms == null ? null : List<dynamic>.from(forms!.map((final FormReadDto x) => x.toMap())),
        "comments": comments == null ? null : List<dynamic>.from(comments!.map((final CommentReadDto x) => x.toMap())),
        "teams": teams,
        "reports": reports == null ? null : List<dynamic>.from(reports!.map((final Report x) => x.toMap())),
      };
}

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
    this.stateTr1,
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
        stateTr1: json["stateTr1"],
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
  final String? stateTr1;
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
        "stateTr1": stateTr1,
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
    this.stateTr1,
    this.stateTr2,
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
        stateTr1: json["stateTr1"],
        stateTr2: json["stateTr2"],
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
  final String? stateTr1;
  final String? stateTr2;
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
        "stateTr1": stateTr1,
        "stateTr2": stateTr2,
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
