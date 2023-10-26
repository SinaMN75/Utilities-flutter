part of '../data.dart';

class OrderFilterDto {
  OrderFilterDto({
    this.id,
    this.showProducts,
    this.status,
    this.sendType,
    this.payType,
    this.startDate,
    this.tags,
    this.endDate,
    this.userId,
    this.productOwnerId,
    this.pageSize,
    this.pageNumber,
  });

  factory OrderFilterDto.fromJson(final String str) => OrderFilterDto.fromMap(json.decode(str));

  factory OrderFilterDto.fromMap(final dynamic json) => OrderFilterDto(
        id: json["id"],
        showProducts: json["showProducts"],
        status: json["status"],
        sendType: json["sendType"],
        payType: json["payType"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        userId: json["userId"],
        productOwnerId: json["productOwnerId"],
        pageSize: json["pageSize"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final x) => x)),
        pageNumber: json["pageNumber"],
      );
  final String? id;
  final bool? showProducts;
  final int? status;
  final int? sendType;
  final int? payType;
  final String? startDate;
  final String? endDate;
  List<int>? tags;
  final String? userId;
  final String? productOwnerId;
  final int? pageSize;
  final int? pageNumber;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "id": id,
        "showProducts": showProducts,
        "status": status,
        "sendType": sendType,
        "payType": payType,
        "startDate": startDate,
        "endDate": endDate,
        "userId": userId,
        "productOwnerId": productOwnerId,
        "pageSize": pageSize,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final x) => x)),
        "pageNumber": pageNumber,
      };
}

class OrderCreateUpdateDto {
  OrderCreateUpdateDto({
    this.id,
    this.description,
    this.discountCode,
    this.receivedDate,
    this.addressId,
    this.tags,
    this.status,
    this.payType,
    this.sendType,
    this.orderDetails,
  });

  factory OrderCreateUpdateDto.fromJson(final String str) => OrderCreateUpdateDto.fromMap(json.decode(str));

  factory OrderCreateUpdateDto.fromMap(final dynamic json) => OrderCreateUpdateDto(
        id: json["id"],
        description: json["description"],
        discountCode: json["discountCode"],
        receivedDate: json["receivedDate"],
        addressId: json["addressId"],
        status: json["status"],
        payType: json["payType"],
        sendType: json["sendType"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        orderDetails: json["orderDetails"] == null ? [] : List<OrderDetailCreateUpdateDto>.from(json["orderDetails"]!.map(OrderDetailCreateUpdateDto.fromMap)),
      );
  final String? id;
  final String? description;
  final String? discountCode;
  final String? receivedDate;
  final String? addressId;
  final int? status;
  final int? payType;
  final int? sendType;
  List<int>? tags;
  final List<OrderDetailCreateUpdateDto>? orderDetails;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "id": id,
        "description": description,
        "discountCode": discountCode,
        "receivedDate": receivedDate,
        "addressId": addressId,
        "status": status,
        "payType": payType,
        "sendType": sendType,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
        "orderDetails": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((final x) => x.toMap())),
      };
}

class OrderDetailCreateUpdateDto {
  OrderDetailCreateUpdateDto({
    this.productId,
    this.count,
  });

  factory OrderDetailCreateUpdateDto.fromJson(final String str) => OrderDetailCreateUpdateDto.fromMap(json.decode(str));

  factory OrderDetailCreateUpdateDto.fromMap(final dynamic json) => OrderDetailCreateUpdateDto(
        productId: json["productId"],
        count: json["count"],
      );
  final String? productId;
  final int? count;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "productId": productId,
        "count": count,
      };
}


class ReservationOrderCreateDto {
  String? productId;
  List<ReserveDto>? reserveDto;

  ReservationOrderCreateDto({
    this.productId,
    this.reserveDto,
  });

  factory ReservationOrderCreateDto.fromJson(String str) => ReservationOrderCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservationOrderCreateDto.fromMap(Map<String, dynamic> json) => ReservationOrderCreateDto(
    productId: json["productId"],
    reserveDto: json["reserveDto"] == null ? [] : List<ReserveDto>.from(json["reserveDto"]!.map((x) => ReserveDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "productId": productId,
    "reserveDto": reserveDto == null ? [] : List<dynamic>.from(reserveDto!.map((x) => x.toMap())),
  };
}

class ReserveDto {
  DateTime? dateFrom;
  DateTime? dateTo;
  DateTime? timeFrom;
  DateTime? timeTo;
  String? userId;
  String? userName;
  int? memberCount;
  int? extraMemberCount;
  int? price;
  int? priceForAnyExtra;

  ReserveDto({
    this.dateFrom,
    this.dateTo,
    this.timeFrom,
    this.timeTo,
    this.userId,
    this.userName,
    this.memberCount,
    this.extraMemberCount,
    this.price,
    this.priceForAnyExtra,
  });

  factory ReserveDto.fromJson(String str) => ReserveDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReserveDto.fromMap(Map<String, dynamic> json) => ReserveDto(
    dateFrom: json["dateFrom"] == null ? null : DateTime.parse(json["dateFrom"]),
    dateTo: json["dateTo"] == null ? null : DateTime.parse(json["dateTo"]),
    timeFrom: json["timeFrom"] == null ? null : DateTime.parse(json["timeFrom"]),
    timeTo: json["timeTo"] == null ? null : DateTime.parse(json["timeTo"]),
    userId: json["userId"],
    userName: json["userName"],
    memberCount: json["memberCount"],
    extraMemberCount: json["extraMemberCount"],
    price: json["price"],
    priceForAnyExtra: json["priceForAnyExtra"],
  );

  Map<String, dynamic> toMap() => {
    "dateFrom": dateFrom?.toIso8601String(),
    "dateTo": dateTo?.toIso8601String(),
    "timeFrom": timeFrom?.toIso8601String(),
    "timeTo": timeTo?.toIso8601String(),
    "userId": userId,
    "userName": userName,
    "memberCount": memberCount,
    "extraMemberCount": extraMemberCount,
    "price": price,
    "priceForAnyExtra": priceForAnyExtra,
  };
}


class OrderReadDto {
  int? orderType;
  int? totalPrice;
  UserReadDto? user;
  String? userId;
  List<int>? tags;
  List<OrderDetail>? orderDetails;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  AddressReadDto? address;
  String? addressId;
  int? sendPrice;
  UserReadDto? productOwner;
  String? productOwnerId;

  OrderReadDto({
    this.orderType,
    this.totalPrice,
    this.user,
    this.userId,
    this.tags,
    this.orderDetails,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.addressId,
    this.sendPrice,
    this.productOwner,
    this.productOwnerId,
  });

  factory OrderReadDto.fromJson(final String str) => OrderReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory OrderReadDto.fromMap(final dynamic json) => OrderReadDto(
        orderType: json["orderType"],
        totalPrice: json["totalPrice"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        userId: json["userId"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final x) => x)),
        orderDetails: json["orderDetails"] == null ? [] : List<OrderDetail>.from(json["orderDetails"]!.map(OrderDetail.fromMap)),
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        address: json["address"] == null ? null : AddressReadDto.fromMap(json["address"]),
        addressId: json["addressId"],
        sendPrice: json["sendPrice"],
        productOwner: json["productOwner"] == null ? null : UserReadDto.fromMap(json["productOwner"]),
        productOwnerId: json["productOwnerId"],
      );

  Map<String, dynamic> toMap() => {
        "orderType": orderType,
        "totalPrice": totalPrice,
        "user": user?.toMap(),
        "userId": userId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final x) => x)),
        "orderDetails": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((final x) => x.toMap())),
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "address": address?.toMap(),
        "addressId": addressId,
        "sendPrice": sendPrice,
        "productOwner": productOwner?.toMap(),
        "productOwnerId": productOwnerId,
      };
}

class OrderDetail {
  int? unitPrice;
  int? count;
  OrderReadDto? order;
  String? orderId;
  String? productId;
  ProductReadDto? product;
  int? price;
  int? finalPrice;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  OrderDetail({
    this.unitPrice,
    this.count,
    this.order,
    this.orderId,
    this.productId,
    this.product,
    this.finalPrice,
    this.price,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderDetail.fromJson(final String str) => OrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory OrderDetail.fromMap(final dynamic json) => OrderDetail(
        unitPrice: json["unitPrice"],
        count: json["count"],
        order: json["order"] == null ? null : OrderReadDto.fromMap(json["order"]),
        product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
        orderId: json["orderId"],
        productId: json["productId"],
        finalPrice: json["finalPrice"],
        id: json["id"],
        price: json["price"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "unitPrice": unitPrice,
        "count": count,
        "order": order?.toMap(),
        "product": product?.toMap(),
        "orderId": orderId,
        "productId": productId,
        "finalPrice": finalPrice,
        "id": id,
        "price": price,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
