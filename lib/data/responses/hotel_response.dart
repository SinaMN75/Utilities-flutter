part of "../data.dart";

class UDormBedResponse {
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final bool isAvailable;
  final double deposit;
  final double monthlyRent;
  final String roomId;
  final UDormRoomResponse? room;
  final List<UMediaResponse>? media;

  UDormBedResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.isAvailable,
    required this.deposit,
    required this.monthlyRent,
    required this.roomId,
    this.creator,
    this.creatorId,
    this.room,
    this.media,
  });

  factory UDormBedResponse.fromJson(String str) => UDormBedResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedResponse.fromMap(Map<String, dynamic> json) => UDormBedResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    isAvailable: json["isAvailable"] as bool,
    deposit: (json["deposit"] as num).toDouble(),
    monthlyRent: (json["monthlyRent"] as num).toDouble(),
    roomId: json["roomId"] as String,
    room: json["room"] == null ? null : UDormRoomResponse.fromMap(json["room"]),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "isAvailable": isAvailable,
    "deposit": deposit,
    "monthlyRent": monthlyRent,
    "roomId": roomId,
    "room": room?.toMap(),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}

class UDormResponse {
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final String city;
  final String country;
  final List<UDormRoomResponse>? rooms;
  final List<UMediaResponse>? media;

  UDormResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.city,
    required this.country,
    this.creator,
    this.creatorId,
    this.rooms,
    this.media,
  });

  factory UDormResponse.fromJson(String str) => UDormResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormResponse.fromMap(Map<String, dynamic> json) => UDormResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    city: json["city"] as String,
    country: json["country"] as String,
    rooms: json["rooms"] == null ? <UDormRoomResponse>[] : List<UDormRoomResponse>.from(json["rooms"]!.map((dynamic x) => UDormRoomResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "city": city,
    "country": country,
    "rooms": rooms == null ? <UDormRoomResponse>[] : List<UDormRoomResponse>.from(rooms!.map((UDormRoomResponse x) => x.toMap())),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}

class UHotelResponse {
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final String city;
  final String country;
  final List<UHotelRoomResponse>? rooms;
  final List<UMediaResponse>? media;

  UHotelResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.city,
    required this.country,
    this.creator,
    this.creatorId,
    this.rooms,
    this.media,
  });

  factory UHotelResponse.fromJson(String str) => UHotelResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelResponse.fromMap(Map<String, dynamic> json) => UHotelResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    city: json["city"] as String,
    country: json["country"] as String,
    rooms: json["rooms"] == null ? <UHotelRoomResponse>[] : List<UHotelRoomResponse>.from(json["rooms"]!.map((dynamic x) => UHotelRoomResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "city": city,
    "country": country,
    "rooms": rooms == null ? <UHotelRoomResponse>[] : List<UHotelRoomResponse>.from(rooms!.map((UHotelRoomResponse x) => x.toMap())),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}

class UHotelRoomResponse {
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final int capacity;
  final double pricePerNight;
  final bool isAvailable;
  final String hotelId;
  final UHotelResponse? hotel;
  final List<UMediaResponse>? media;

  UHotelRoomResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.capacity,
    required this.pricePerNight,
    required this.isAvailable,
    required this.hotelId,
    this.creator,
    this.creatorId,
    this.hotel,
    this.media,
  });

  factory UHotelRoomResponse.fromJson(String str) => UHotelRoomResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelRoomResponse.fromMap(Map<String, dynamic> json) => UHotelRoomResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    capacity: json["capacity"] as int,
    pricePerNight: (json["pricePerNight"] as num).toDouble(),
    isAvailable: json["isAvailable"] as bool,
    hotelId: json["hotelId"] as String,
    hotel: json["hotel"] == null ? null : UHotelResponse.fromMap(json["hotel"]),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "capacity": capacity,
    "pricePerNight": pricePerNight,
    "isAvailable": isAvailable,
    "hotelId": hotelId,
    "hotel": hotel?.toMap(),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}

class UDormRoomResponse {
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final String dormId;
  final UDormResponse? dorm;
  final List<UDormBedResponse>? beds;
  final List<UMediaResponse>? media;

  UDormRoomResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.dormId,
    this.creator,
    this.creatorId,
    this.dorm,
    this.beds,
    this.media,
  });

  factory UDormRoomResponse.fromJson(String str) => UDormRoomResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormRoomResponse.fromMap(Map<String, dynamic> json) => UDormRoomResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    dormId: json["dormId"] as String,
    dorm: json["dorm"] == null ? null : UDormResponse.fromMap(json["dorm"]),
    beds: json["beds"] == null ? <UDormBedResponse>[] : List<UDormBedResponse>.from(json["beds"]!.map((dynamic x) => UDormBedResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "dormId": dormId,
    "dorm": dorm?.toMap(),
    "beds": beds == null ? <UDormBedResponse>[] : List<UDormBedResponse>.from(beds!.map((UDormBedResponse x) => x.toMap())),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}

class UDormBedContractResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final UContractJsonData jsonData;
  final List<int> tags;
  final DateTime startDate;
  final DateTime endDate;
  final double deposit;
  final double rent;
  final UUserResponse? user;
  final String userId;
  final String bedId;
  final UDormBedResponse? bed;
  final UUserResponse? creator;
  final String? creatorId;
  final UProductResponse? product;
  final String? productId;
  final List<UDormBedInvoiceResponse>? invoices;

  UDormBedContractResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.startDate,
    required this.endDate,
    required this.deposit,
    required this.rent,
    required this.userId,
    required this.bedId,
    this.deletedAt,
    this.user,
    this.bed,
    this.creator,
    this.creatorId,
    this.product,
    this.productId,
    this.invoices,
  });

  factory UDormBedContractResponse.fromJson(String str) => UDormBedContractResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedContractResponse.fromMap(Map<String, dynamic> json) => UDormBedContractResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
    jsonData: UContractJsonData.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    deposit: (json["deposit"] as num).toDouble(),
    rent: (json["rent"] as num).toDouble(),
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
    userId: json["userId"] as String,
    bedId: json["bedId"] as String,
    bed: json["bed"] == null ? null : UDormBedResponse.fromMap(json["bed"]),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    product: json["product"] == null ? null : UProductResponse.fromMap(json["product"]),
    productId: json["productId"],
    invoices: json["invoices"] == null ? <UDormBedInvoiceResponse>[] : List<UDormBedInvoiceResponse>.from(json["invoices"]!.map((dynamic x) => UDormBedInvoiceResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt?.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "deposit": deposit,
    "rent": rent,
    "user": user?.toMap(),
    "userId": userId,
    "bedId": bedId,
    "bed": bed?.toMap(),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "product": product?.toMap(),
    "productId": productId,
    "invoices": invoices == null ? <dynamic>[] : List<dynamic>.from(invoices!.map((UDormBedInvoiceResponse x) => x.toMap())),
  };
}

class UContractJsonData {
  final String? description;

  UContractJsonData({
    this.description,
  });

  factory UContractJsonData.fromJson(String str) => UContractJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UContractJsonData.fromMap(Map<String, dynamic> json) => UContractJsonData(
    description: json["description"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "description": description,
  };
}

class UDormBedInvoiceResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final UDormBedInvoiceJson jsonData;
  final List<int> tags;
  final double debtAmount;
  final double creditorAmount;
  final double paidAmount;
  final double penaltyAmount;
  final DateTime? paidDate;
  final DateTime dueDate;
  final DateTime? nextInvoiceIssueDate;
  final String? trackingNumber;
  final UUserResponse? user;
  final String? userId;
  final UDormBedContractResponse? contract;
  final String? contractId;

  UDormBedInvoiceResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.dueDate,
    required this.debtAmount,
    required this.creditorAmount,
    required this.paidAmount,
    required this.penaltyAmount,
    this.deletedAt,
    this.paidDate,
    this.nextInvoiceIssueDate,
    this.trackingNumber,
    this.user,
    this.userId,
    this.contract,
    this.contractId,
  });

  factory UDormBedInvoiceResponse.fromJson(String str) => UDormBedInvoiceResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedInvoiceResponse.fromMap(Map<String, dynamic> json) => UDormBedInvoiceResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
    jsonData: UDormBedInvoiceJson.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    debtAmount: (json["debtAmount"] as num).toDouble(),
    creditorAmount: (json["creditorAmount"] as num).toDouble(),
    paidAmount: (json["paidAmount"] as num).toDouble(),
    penaltyAmount: (json["penaltyAmount"] as num).toDouble(),
    paidDate: json["paidDate"] == null ? null : DateTime.parse(json["paidDate"]),
    dueDate: DateTime.parse(json["dueDate"]),
    nextInvoiceIssueDate: json["nextInvoiceIssueDate"] == null ? null : DateTime.parse(json["nextInvoiceIssueDate"]),
    trackingNumber: json["trackingNumber"],
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
    userId: json["userId"],
    contract: json["contract"] == null ? null : UDormBedContractResponse.fromMap(json["contract"]),
    contractId: json["contractId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt?.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "debtAmount": debtAmount,
    "creditorAmount": creditorAmount,
    "paidAmount": paidAmount,
    "penaltyAmount": penaltyAmount,
    "paidDate": paidDate?.toIso8601String(),
    "dueDate": dueDate.toIso8601String(),
    "nextInvoiceIssueDate": nextInvoiceIssueDate?.toIso8601String(),
    "trackingNumber": trackingNumber,
    "user": user?.toMap(),
    "userId": userId,
    "contract": contract?.toMap(),
    "contractId": contractId,
  };
}

class UDormBedInvoiceJson {
  final String? description;
  final int? penaltyPrecentEveryDate;

  UDormBedInvoiceJson({
    this.description,
    this.penaltyPrecentEveryDate,
  });

  factory UDormBedInvoiceJson.fromJson(String str) => UDormBedInvoiceJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedInvoiceJson.fromMap(Map<String, dynamic> json) => UDormBedInvoiceJson(
    description: json["description"],
    penaltyPrecentEveryDate: json["penaltyPrecentEveryDate"] == null ? null : (json["penaltyPrecentEveryDate"] as num).toInt(),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "description": description,
    "penaltyPrecentEveryDate": penaltyPrecentEveryDate,
  };
}
