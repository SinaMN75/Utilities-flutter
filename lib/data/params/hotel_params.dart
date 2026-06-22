part of "../data.dart";

// ==================== DormBed ====================

class UDormBedCreateParams {
  final String? detail1;
  final String? detail2;
  final List<int> tags;
  final String? id;
  final String? creatorId;
  final String title;
  final bool isAvailable;
  final double deposit;
  final double monthlyRent;
  final String roomId;

  UDormBedCreateParams({
    required this.tags,
    required this.title,
    required this.isAvailable,
    required this.deposit,
    required this.monthlyRent,
    required this.roomId,
    this.detail1,
    this.detail2,
    this.id,
    this.creatorId,
  });

  factory UDormBedCreateParams.fromJson(String str) => UDormBedCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedCreateParams.fromMap(Map<String, dynamic> json) => UDormBedCreateParams(
    detail1: json["detail1"],
    detail2: json["detail2"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    creatorId: json["creatorId"],
    title: json["title"],
    isAvailable: json["isAvailable"],
    deposit: json["deposit"]?.toDouble(),
    monthlyRent: json["monthlyRent"]?.toDouble(),
    roomId: json["roomId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "detail1": detail1,
    "detail2": detail2,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "creatorId": creatorId,
    "title": title,
    "isAvailable": isAvailable,
    "deposit": deposit,
    "monthlyRent": monthlyRent,
    "roomId": roomId,
  };
}

class UDormBedUpdateParams {
  final String id;
  final String? detail1;
  final String? detail2;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? title;
  final bool? isAvailable;
  final double? deposit;
  final double? monthlyRent;
  final String? roomId;

  UDormBedUpdateParams({
    required this.id,
    this.detail1,
    this.detail2,
    this.addTags,
    this.removeTags,
    this.tags,
    this.title,
    this.isAvailable,
    this.deposit,
    this.monthlyRent,
    this.roomId,
  });

  factory UDormBedUpdateParams.fromJson(String str) => UDormBedUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedUpdateParams.fromMap(Map<String, dynamic> json) => UDormBedUpdateParams(
    id: json["id"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    title: json["title"],
    isAvailable: json["isAvailable"],
    deposit: json["deposit"]?.toDouble(),
    monthlyRent: json["monthlyRent"]?.toDouble(),
    roomId: json["roomId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "detail1": detail1,
    "detail2": detail2,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "title": title,
    "isAvailable": isAvailable,
    "deposit": deposit,
    "monthlyRent": monthlyRent,
    "roomId": roomId,
  };
}

class UDormBedReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? creatorId;
  final String? title;
  final String? roomId;
  final bool? isAvailable;
  final double? minDeposit;
  final double? maxDeposit;
  final double? minMonthlyRent;
  final double? maxMonthlyRent;
  final bool? orderByMonthlyRent;
  final bool? orderByMonthlyRentDesc;

  UDormBedReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.creatorId,
    this.title,
    this.roomId,
    this.isAvailable,
    this.minDeposit,
    this.maxDeposit,
    this.minMonthlyRent,
    this.maxMonthlyRent,
    this.orderByMonthlyRent,
    this.orderByMonthlyRentDesc,
  });

  factory UDormBedReadParams.fromJson(String str) => UDormBedReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedReadParams.fromMap(Map<String, dynamic> json) => UDormBedReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
    title: json["title"],
    roomId: json["roomId"],
    isAvailable: json["isAvailable"],
    minDeposit: json["minDeposit"]?.toDouble(),
    maxDeposit: json["maxDeposit"]?.toDouble(),
    minMonthlyRent: json["minMonthlyRent"]?.toDouble(),
    maxMonthlyRent: json["maxMonthlyRent"]?.toDouble(),
    orderByMonthlyRent: json["orderByMonthlyRent"],
    orderByMonthlyRentDesc: json["orderByMonthlyRentDesc"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
    "title": title,
    "roomId": roomId,
    "isAvailable": isAvailable,
    "minDeposit": minDeposit,
    "maxDeposit": maxDeposit,
    "minMonthlyRent": minMonthlyRent,
    "maxMonthlyRent": maxMonthlyRent,
    "orderByMonthlyRent": orderByMonthlyRent,
    "orderByMonthlyRentDesc": orderByMonthlyRentDesc,
  };
}

// ==================== Dorm ====================

class UDormCreateParams {
  final String? detail1;
  final String? detail2;
  final List<int> tags;
  final String? id;
  final String? creatorId;
  final String title;
  final String city;
  final String country;

  UDormCreateParams({
    required this.tags,
    required this.title,
    required this.city,
    required this.country,
    this.detail1,
    this.detail2,
    this.id,
    this.creatorId,
  });

  factory UDormCreateParams.fromJson(String str) => UDormCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormCreateParams.fromMap(Map<String, dynamic> json) => UDormCreateParams(
    detail1: json["detail1"],
    detail2: json["detail2"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    creatorId: json["creatorId"],
    title: json["title"],
    city: json["city"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "detail1": detail1,
    "detail2": detail2,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "creatorId": creatorId,
    "title": title,
    "city": city,
    "country": country,
  };
}

class UDormUpdateParams {
  final String id;
  final String? detail1;
  final String? detail2;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? title;
  final String? city;
  final String? country;

  UDormUpdateParams({
    required this.id,
    this.detail1,
    this.detail2,
    this.addTags,
    this.removeTags,
    this.tags,
    this.title,
    this.city,
    this.country,
  });

  factory UDormUpdateParams.fromJson(String str) => UDormUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormUpdateParams.fromMap(Map<String, dynamic> json) => UDormUpdateParams(
    id: json["id"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    title: json["title"],
    city: json["city"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "detail1": detail1,
    "detail2": detail2,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "title": title,
    "city": city,
    "country": country,
  };
}

class UDormReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? creatorId;
  final String? title;
  final String? city;
  final String? country;

  UDormReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.creatorId,
    this.title,
    this.city,
    this.country,
  });

  factory UDormReadParams.fromJson(String str) => UDormReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormReadParams.fromMap(Map<String, dynamic> json) => UDormReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
    title: json["title"],
    city: json["city"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
    "title": title,
    "city": city,
    "country": country,
  };
}

// ==================== Hotel ====================

class UHotelCreateParams {
  final String? detail1;
  final String? detail2;
  final List<int> tags;
  final String? id;
  final String? creatorId;
  final String title;
  final String city;
  final String country;

  UHotelCreateParams({
    required this.tags,
    required this.title,
    required this.city,
    required this.country,
    this.detail1,
    this.detail2,
    this.id,
    this.creatorId,
  });

  factory UHotelCreateParams.fromJson(String str) => UHotelCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelCreateParams.fromMap(Map<String, dynamic> json) => UHotelCreateParams(
    detail1: json["detail1"],
    detail2: json["detail2"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    creatorId: json["creatorId"],
    title: json["title"],
    city: json["city"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "detail1": detail1,
    "detail2": detail2,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "creatorId": creatorId,
    "title": title,
    "city": city,
    "country": country,
  };
}

class UHotelUpdateParams {
  final String id;
  final String? detail1;
  final String? detail2;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? title;
  final String? city;
  final String? country;

  UHotelUpdateParams({
    required this.id,
    this.detail1,
    this.detail2,
    this.addTags,
    this.removeTags,
    this.tags,
    this.title,
    this.city,
    this.country,
  });

  factory UHotelUpdateParams.fromJson(String str) => UHotelUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelUpdateParams.fromMap(Map<String, dynamic> json) => UHotelUpdateParams(
    id: json["id"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    title: json["title"],
    city: json["city"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "detail1": detail1,
    "detail2": detail2,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "title": title,
    "city": city,
    "country": country,
  };
}

class UHotelReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? creatorId;
  final String? title;
  final String? city;
  final String? country;

  UHotelReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.creatorId,
    this.title,
    this.city,
    this.country,
  });

  factory UHotelReadParams.fromJson(String str) => UHotelReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelReadParams.fromMap(Map<String, dynamic> json) => UHotelReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
    title: json["title"],
    city: json["city"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
    "title": title,
    "city": city,
    "country": country,
  };
}

// ==================== HotelRoom ====================

class UHotelRoomCreateParams {
  final String? detail1;
  final String? detail2;
  final List<int> tags;
  final String? id;
  final String? creatorId;
  final String title;
  final int capacity;
  final double pricePerNight;
  final bool isAvailable;
  final String hotelId;

  UHotelRoomCreateParams({
    required this.tags,
    required this.title,
    required this.capacity,
    required this.pricePerNight,
    required this.isAvailable,
    required this.hotelId,
    this.detail1,
    this.detail2,
    this.id,
    this.creatorId,
  });

  factory UHotelRoomCreateParams.fromJson(String str) => UHotelRoomCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelRoomCreateParams.fromMap(Map<String, dynamic> json) => UHotelRoomCreateParams(
    detail1: json["detail1"],
    detail2: json["detail2"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    creatorId: json["creatorId"],
    title: json["title"],
    capacity: json["capacity"],
    pricePerNight: json["pricePerNight"]?.toDouble(),
    isAvailable: json["isAvailable"],
    hotelId: json["hotelId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "detail1": detail1,
    "detail2": detail2,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "creatorId": creatorId,
    "title": title,
    "capacity": capacity,
    "pricePerNight": pricePerNight,
    "isAvailable": isAvailable,
    "hotelId": hotelId,
  };
}

class UHotelRoomUpdateParams {
  final String id;
  final String? detail1;
  final String? detail2;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? title;
  final int? capacity;
  final double? pricePerNight;
  final bool? isAvailable;
  final String? hotelId;

  UHotelRoomUpdateParams({
    required this.id,
    this.detail1,
    this.detail2,
    this.addTags,
    this.removeTags,
    this.tags,
    this.title,
    this.capacity,
    this.pricePerNight,
    this.isAvailable,
    this.hotelId,
  });

  factory UHotelRoomUpdateParams.fromJson(String str) => UHotelRoomUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelRoomUpdateParams.fromMap(Map<String, dynamic> json) => UHotelRoomUpdateParams(
    id: json["id"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    title: json["title"],
    capacity: json["capacity"],
    pricePerNight: json["pricePerNight"]?.toDouble(),
    isAvailable: json["isAvailable"],
    hotelId: json["hotelId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "detail1": detail1,
    "detail2": detail2,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "title": title,
    "capacity": capacity,
    "pricePerNight": pricePerNight,
    "isAvailable": isAvailable,
    "hotelId": hotelId,
  };
}

class UHotelRoomReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? creatorId;
  final String? title;
  final String? hotelId;
  final bool? isAvailable;
  final int? minCapacity;
  final int? maxCapacity;
  final double? minPrice;
  final double? maxPrice;
  final bool? orderByPrice;
  final bool? orderByPriceDesc;

  UHotelRoomReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.creatorId,
    this.title,
    this.hotelId,
    this.isAvailable,
    this.minCapacity,
    this.maxCapacity,
    this.minPrice,
    this.maxPrice,
    this.orderByPrice,
    this.orderByPriceDesc,
  });

  factory UHotelRoomReadParams.fromJson(String str) => UHotelRoomReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelRoomReadParams.fromMap(Map<String, dynamic> json) => UHotelRoomReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
    title: json["title"],
    hotelId: json["hotelId"],
    isAvailable: json["isAvailable"],
    minCapacity: json["minCapacity"],
    maxCapacity: json["maxCapacity"],
    minPrice: json["minPrice"]?.toDouble(),
    maxPrice: json["maxPrice"]?.toDouble(),
    orderByPrice: json["orderByPrice"],
    orderByPriceDesc: json["orderByPriceDesc"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
    "title": title,
    "hotelId": hotelId,
    "isAvailable": isAvailable,
    "minCapacity": minCapacity,
    "maxCapacity": maxCapacity,
    "minPrice": minPrice,
    "maxPrice": maxPrice,
    "orderByPrice": orderByPrice,
    "orderByPriceDesc": orderByPriceDesc,
  };
}

// ==================== DormRoom ====================

class UDormRoomCreateParams {
  final String? detail1;
  final String? detail2;
  final List<int> tags;
  final String? id;
  final String? creatorId;
  final String title;
  final String dormId;

  UDormRoomCreateParams({
    required this.tags,
    required this.title,
    required this.dormId,
    this.detail1,
    this.detail2,
    this.id,
    this.creatorId,
  });

  factory UDormRoomCreateParams.fromJson(String str) => UDormRoomCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormRoomCreateParams.fromMap(Map<String, dynamic> json) => UDormRoomCreateParams(
    detail1: json["detail1"],
    detail2: json["detail2"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    creatorId: json["creatorId"],
    title: json["title"],
    dormId: json["dormId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "detail1": detail1,
    "detail2": detail2,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "creatorId": creatorId,
    "title": title,
    "dormId": dormId,
  };
}

class UDormRoomUpdateParams {
  final String id;
  final String? detail1;
  final String? detail2;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? title;
  final String? dormId;

  UDormRoomUpdateParams({
    required this.id,
    this.detail1,
    this.detail2,
    this.addTags,
    this.removeTags,
    this.tags,
    this.title,
    this.dormId,
  });

  factory UDormRoomUpdateParams.fromJson(String str) => UDormRoomUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormRoomUpdateParams.fromMap(Map<String, dynamic> json) => UDormRoomUpdateParams(
    id: json["id"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    title: json["title"],
    dormId: json["dormId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "detail1": detail1,
    "detail2": detail2,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "title": title,
    "dormId": dormId,
  };
}

class UDormRoomReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? creatorId;
  final String? title;
  final String? dormId;

  UDormRoomReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.creatorId,
    this.title,
    this.dormId,
  });

  factory UDormRoomReadParams.fromJson(String str) => UDormRoomReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormRoomReadParams.fromMap(Map<String, dynamic> json) => UDormRoomReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
    title: json["title"],
    dormId: json["dormId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
    "title": title,
    "dormId": dormId,
  };
}

class UDormBedContractCreateParams {
  final List<int> tags;
  final String? id;
  final DateTime startDate;
  final DateTime endDate;
  final String userId;
  final String bedId;
  final String? productId;
  final String? description;

  UDormBedContractCreateParams({
    required this.tags,
    required this.startDate,
    required this.endDate,
    required this.userId,
    required this.bedId,
    this.id,
    this.productId,
    this.description,
  });

  factory UDormBedContractCreateParams.fromJson(String str) => UDormBedContractCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedContractCreateParams.fromMap(Map<String, dynamic> json) => UDormBedContractCreateParams(
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    userId: json["userId"] as String,
    bedId: json["bedId"] as String,
    productId: json["productId"],
    description: json["description"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "userId": userId,
    "bedId": bedId,
    "productId": productId,
    "description": description,
  };
}

class UDormBedContractReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? userId;
  final String? creatorId;
  final String? productId;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? userName;
  final ContractSelectorArgs? selectorArgs;

  UDormBedContractReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.ids,
    this.userId,
    this.creatorId,
    this.productId,
    this.startDate,
    this.endDate,
    this.userName,
    this.selectorArgs,
  });

  factory UDormBedContractReadParams.fromJson(String str) => UDormBedContractReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedContractReadParams.fromMap(Map<String, dynamic> json) => UDormBedContractReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    orderByUpdatedAt: json["orderByUpdatedAt"],
    orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    userId: json["userId"],
    creatorId: json["creatorId"],
    productId: json["productId"],
    userName: json["userName"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    selectorArgs: json["selectorArgs"] == null ? null : ContractSelectorArgs.fromMap(json["selectorArgs"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "orderByUpdatedAt": orderByUpdatedAt,
    "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "userId": userId,
    "creatorId": creatorId,
    "productId": productId,
    "userName": userName,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "selectorArgs": selectorArgs?.toMap(),
  };
}

class UDormBedContractUpdateParams {
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? deposit;
  final double? rent;

  UDormBedContractUpdateParams({
    required this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    this.startDate,
    this.endDate,
    this.deposit,
    this.rent,
  });

  factory UDormBedContractUpdateParams.fromJson(String str) => UDormBedContractUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedContractUpdateParams.fromMap(Map<String, dynamic> json) => UDormBedContractUpdateParams(
    id: json["id"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    deposit: json["deposit"].toString().toDouble(),
    rent: json["rent"].toString().toDouble(),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "deposit": deposit,
    "rent": rent,
  };
}

class UDormBedInvoiceCreateParams {
  final List<int> tags;
  final String? id;
  final double debtAmount;
  final double creditorAmount;
  final double paidAmount;
  final double penaltyAmount;
  final String userId;
  final String contractId;
  final DateTime? paidDate;
  final DateTime dueDate;
  final String description;

  UDormBedInvoiceCreateParams({
    required this.tags,
    required this.debtAmount,
    required this.creditorAmount,
    required this.paidAmount,
    required this.penaltyAmount,
    required this.userId,
    required this.contractId,
    required this.dueDate,
    required this.description,
    this.id,
    this.paidDate,
  });

  factory UDormBedInvoiceCreateParams.fromJson(String str) => UDormBedInvoiceCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedInvoiceCreateParams.fromMap(Map<String, dynamic> json) => UDormBedInvoiceCreateParams(
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    debtAmount: json["debtAmount"].toString().toDouble(),
    creditorAmount: json["creditorAmount"].toString().toDouble(),
    paidAmount: json["paidAmount"].toString().toDouble(),
    penaltyAmount: json["penaltyAmount"].toString().toDouble(),
    userId: json["userId"],
    contractId: json["contractId"],
    paidDate: json["paidDate"] == null ? null : DateTime.parse(json["paidDate"]),
    dueDate: DateTime.parse(json["dueDate"]),
    description: json["description"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "debtAmount": debtAmount,
    "creditorAmount": creditorAmount,
    "paidAmount": paidAmount,
    "penaltyAmount": penaltyAmount,
    "userId": userId,
    "contractId": contractId,
    "paidDate": paidDate?.toIso8601String(),
    "dueDate": dueDate.toIso8601String(),
    "description": description,
  };
}

class UDormBedInvoiceReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? userId;
  final String? contractId;
  final InvoiceSelectorArgs? selectorArgs;

  UDormBedInvoiceReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.ids,
    this.userId,
    this.selectorArgs,
    this.contractId,
  });

  factory UDormBedInvoiceReadParams.fromJson(String str) => UDormBedInvoiceReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedInvoiceReadParams.fromMap(Map<String, dynamic> json) => UDormBedInvoiceReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    orderByUpdatedAt: json["orderByUpdatedAt"],
    orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    userId: json["userId"],
    contractId: json["contractId"],
    selectorArgs: json["selectorArgs"] == null ? null : InvoiceSelectorArgs.fromMap(json["selectorArgs"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "orderByUpdatedAt": orderByUpdatedAt,
    "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "userId": userId,
    "contractId": contractId,
    "selectorArgs": selectorArgs?.toMap(),
  };
}

class UDormBedInvoiceUpdateParams {
  final String? id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final double? debtAmount;
  final double? creditorAmount;
  final double? paidAmount;
  final double? penaltyAmount;
  final String? userId;
  final String? contractId;
  final DateTime? paidDate;
  final DateTime? dueDate;
  final String? description;

  UDormBedInvoiceUpdateParams({
    this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    this.debtAmount,
    this.creditorAmount,
    this.paidAmount,
    this.penaltyAmount,
    this.userId,
    this.contractId,
    this.paidDate,
    this.dueDate,
    this.description,
  });

  factory UDormBedInvoiceUpdateParams.fromJson(String str) => UDormBedInvoiceUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedInvoiceUpdateParams.fromMap(Map<String, dynamic> json) => UDormBedInvoiceUpdateParams(
    id: json["id"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    debtAmount: json["debtAmount"].toString().toDouble(),
    creditorAmount: json["creditorAmount"].toString().toDouble(),
    paidAmount: json["paidAmount"].toString().toDouble(),
    penaltyAmount: json["penaltyAmount"].toString().toDouble(),
    userId: json["userId"],
    contractId: json["contractId"],
    paidDate: json["paidDate"] == null ? null : DateTime.parse(json["paidDate"]),
    dueDate: json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
    description: json["description"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "debtAmount": debtAmount,
    "creditorAmount": creditorAmount,
    "paidAmount": paidAmount,
    "penaltyAmount": penaltyAmount,
    "userId": userId,
    "contractId": contractId,
    "paidDate": paidDate?.toIso8601String(),
    "dueDate": dueDate?.toIso8601String(),
    "description": description,
  };
}
