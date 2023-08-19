import 'dart:convert';

import 'package:utilities/data/dto/dto.dart';

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

  String toJson() => json.encode(toMap());

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
        orderDetails: json["orderDetails"] == null ? [] : List<OrderDetailCreateDto>.from(json["orderDetails"]!.map(OrderDetailCreateDto.fromMap)),
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
  final List<OrderDetailCreateDto>? orderDetails;

  String toJson() => json.encode(toMap());

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

class OrderDetailCreateDto {
  OrderDetailCreateDto({
    this.orderId,
    this.orderDetailId,
    this.productId,
    this.count,
    this.category,
    this.categoryId,
    this.price,
  });

  factory OrderDetailCreateDto.fromJson(final String str) => OrderDetailCreateDto.fromMap(json.decode(str));

  factory OrderDetailCreateDto.fromMap(final dynamic json) => OrderDetailCreateDto(
        orderId: json["orderId"],
        productId: json["productId"],
        price: json["price"],
        count: json["count"],
        category: json["category"],
        categoryId: json["categoryId"],
        orderDetailId: json["orderDetailId"],
      );
  final String? orderId;
  final String? productId;
  final int? price;
  final int? count;
  final String? category;
  final String? categoryId;
  final String? orderDetailId;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "orderId": orderId,
        "productId": productId,
        "price": price,
        "count": count,
        "category": category,
        "categoryId": categoryId,
        "orderDetailId": orderDetailId,
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

  String toJson() => json.encode(toMap());

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

  String toJson() => json.encode(toMap());

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
