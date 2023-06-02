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
    this.endDate,
    this.userId,
    this.productOwnerId,
    this.pageSize,
    this.pageNumber,
  });

  factory OrderFilterDto.fromJson(final String str) => OrderFilterDto.fromMap(json.decode(str));

  factory OrderFilterDto.fromMap(final Map<String, dynamic> json) => OrderFilterDto(
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
        pageNumber: json["pageNumber"],
      );
  final String? id;
  final bool? showProducts;
  final int? status;
  final int? sendType;
  final int? payType;
  final String? startDate;
  final String? endDate;
  final String? userId;
  final String? productOwnerId;
  final int? pageSize;
  final int? pageNumber;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
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
    this.status,
    this.payType,
    this.sendType,
    this.orderDetails,
  });

  factory OrderCreateUpdateDto.fromJson(String str) => OrderCreateUpdateDto.fromMap(json.decode(str));

  factory OrderCreateUpdateDto.fromMap(Map<String, dynamic> json) => OrderCreateUpdateDto(
        id: json["id"],
        description: json["description"],
        discountCode: json["discountCode"],
        receivedDate: json["receivedDate"],
        addressId: json["addressId"],
        status: json["status"],
        payType: json["payType"],
        sendType: json["sendType"],
        orderDetails: json["orderDetails"] == null ? [] : List<OrderDetail>.from(json["orderDetails"]!.map((x) => OrderDetail.fromMap(x))),
      );
  final String? id;
  final String? description;
  final String? discountCode;
  final String? receivedDate;
  final String? addressId;
  final int? status;
  final int? payType;
  final int? sendType;
  final List<OrderDetail>? orderDetails;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "discountCode": discountCode,
        "receivedDate": receivedDate,
        "addressId": addressId,
        "status": status,
        "payType": payType,
        "sendType": sendType,
        "orderDetails": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
      };
}

class OrderDetailCreateDto {
  OrderDetailCreateDto({
    this.orderId,
    this.productId,
    this.price,
    this.count,
    this.category,
  });

  factory OrderDetailCreateDto.fromJson(String str) => OrderDetailCreateDto.fromMap(json.decode(str));

  factory OrderDetailCreateDto.fromMap(Map<String, dynamic> json) => OrderDetailCreateDto(
        orderId: json["orderId"],
        productId: json["productId"],
        price: json["price"],
        count: json["count"],
        category: json["category"],
      );
  final String? orderId;
  final String? productId;
  final double? price;
  final int? count;
  final String? category;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "orderId": orderId,
        "productId": productId,
        "price": price,
        "count": count,
        "category": category,
      };
}

class OrderReadDto {
  OrderReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.discountCode,
    this.productUseCase,
    this.payNumber,
    this.status,
    this.totalPrice,
    this.discountPrice,
    this.discountPercent,
    this.sendPrice,
    this.sendType,
    this.payType,
    this.payDateTime,
    this.receivedDate,
    this.address,
    this.addressId,
    this.user,
    this.userId,
    this.productOwner,
    this.productOwnerId,
    this.orderDetails,
    this.state,
  });

  factory OrderReadDto.fromJson(final String str) => OrderReadDto.fromMap(json.decode(str));

  factory OrderReadDto.fromMap(final Map<String, dynamic> json) => OrderReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        description: json["description"],
        discountCode: json["discountCode"],
        productUseCase: json["productUseCase"],
        payNumber: json["payNumber"],
        status: json["status"],
        totalPrice: json["totalPrice"],
        discountPrice: json["discountPrice"],
        discountPercent: json["discountPercent"],
        sendPrice: json["sendPrice"],
        sendType: json["sendType"],
        payType: json["payType"],
        payDateTime: json["payDateTime"],
        receivedDate: json["receivedDate"],
        address: json["address"] == null ? null : AddressReadDto.fromMap(json["address"]),
        addressId: json["addressId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        userId: json["userId"],
        productOwner: json["productOwner"] == null ? null : UserReadDto.fromMap(json["productOwner"]),
        productOwnerId: json["productOwnerId"],
        orderDetails: json["orderDetails"] == null ? [] : List<OrderDetail>.from(json["orderDetails"]!.map((final x) => OrderDetail.fromMap(x))),
        state: json["state"],
      );
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? description;
  final String? discountCode;
  final String? productUseCase;
  final String? payNumber;
  final int? status;
  final double? totalPrice;
  final double? discountPrice;
  final double? discountPercent;
  final double? sendPrice;
  final int? sendType;
  final int? payType;
  final String? payDateTime;
  final String? receivedDate;
  final AddressReadDto? address;
  final String? addressId;
  final UserReadDto? user;
  final String? userId;
  final UserReadDto? productOwner;
  final String? productOwnerId;
  final List<OrderDetail>? orderDetails;
  final String? state;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "description": description,
        "discountCode": discountCode,
        "productUseCase": productUseCase,
        "payNumber": payNumber,
        "status": status,
        "totalPrice": totalPrice,
        "discountPrice": discountPrice,
        "discountPercent": discountPercent,
        "sendPrice": sendPrice,
        "sendType": sendType,
        "payType": payType,
        "payDateTime": payDateTime,
        "receivedDate": receivedDate,
        "address": address?.toMap(),
        "addressId": addressId,
        "user": user?.toMap(),
        "userId": userId,
        "productOwner": productOwner?.toMap(),
        "productOwnerId": productOwnerId,
        "orderDetails": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((final OrderDetail x) => x.toMap())),
        "state": state,
      };
}

class OrderDetail {
  OrderDetail({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.price,
    this.count,
    this.order,
    this.orderId,
    this.product,
    this.productId,
    this.category,
    this.categoryId,
  });

  factory OrderDetail.fromJson(final String str) => OrderDetail.fromMap(json.decode(str));

  factory OrderDetail.fromMap(final Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        price: json["price"],
        count: json["count"],
        order: json["order"],
        orderId: json["orderId"],
        product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
        productId: json["productId"],
        category: json["category"] == null ? null : CategoryReadDto.fromMap(json["category"]),
        categoryId: json["categoryId"],
      );
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final double? price;
  final int? count;
  final String? order;
  final String? orderId;
  final ProductReadDto? product;
  final String? productId;
  final CategoryReadDto? category;
  final String? categoryId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "price": price,
        "count": count,
        "order": order,
        "orderId": orderId,
        "product": product?.toMap(),
        "productId": productId,
        "category": category?.toMap(),
        "categoryId": categoryId,
      };
}
