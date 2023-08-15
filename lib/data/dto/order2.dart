// import 'dart:convert';
//
// import 'package:utilities/data/dto/dto.dart';

// class OrderReadDto {
//   int? orderType;
//   int? totalPrice;
//   UserReadDto? user;
//   String? userId;
//   List<int>? tags;
//   List<OrderDetail>? orderDetails;
//   String? id;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   AddressReadDto? address;
//   String? addressId;
//   int? sendPrice;
//   UserReadDto? productOwner;
//   String? productOwnerId;
//
//   OrderReadDto({
//     this.orderType,
//     this.totalPrice,
//     this.user,
//     this.userId,
//     this.tags,
//     this.orderDetails,
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//     this.address,
//     this.addressId,
//     this.sendPrice,
//     this.productOwner,
//     this.productOwnerId,
//   });
//
//   factory OrderReadDto.fromJson(String str) => OrderReadDto.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory OrderReadDto.fromMap(Map<String, dynamic> json) => OrderReadDto(
//     orderType: json["orderType"],
//     totalPrice: json["totalPrice"],
//     user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
//     userId: json["userId"],
//     tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
//     orderDetails: json["orderDetails"] == null ? [] : List<OrderDetail>.from(json["orderDetails"]!.map((x) => OrderDetail.fromMap(x))),
//     id: json["id"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     address: json["address"] == null ? null : AddressReadDto.fromMap(json["address"]),
//     addressId: json["addressId"],
//     sendPrice: json["sendPrice"],
//     productOwner: json["productOwner"] == null ? null : UserReadDto.fromMap(json["productOwner"]),
//     productOwnerId: json["productOwnerId"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "orderType": orderType,
//     "totalPrice": totalPrice,
//     "user": user?.toMap(),
//     "userId": userId,
//     "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
//     "orderDetails": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
//     "id": id,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "address": address?.toMap(),
//     "addressId": addressId,
//     "sendPrice": sendPrice,
//     "productOwner": productOwner?.toMap(),
//     "productOwnerId": productOwnerId,
//   };
// }
// class OrderDetail {
//   int? unitPrice;
//   int? count;
//   Order? order;
//   String? orderId;
//   String? productId;
//   int? finalPrice;
//   String? id;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   OrderDetail({
//     this.unitPrice,
//     this.count,
//     this.order,
//     this.orderId,
//     this.productId,
//     this.finalPrice,
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
//     unitPrice: json["unitPrice"],
//     count: json["count"],
//     order: json["order"] == null ? null : Order.fromMap(json["order"]),
//     orderId: json["orderId"],
//     productId: json["productId"],
//     finalPrice: json["finalPrice"],
//     id: json["id"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "unitPrice": unitPrice,
//     "count": count,
//     "order": order?.toMap(),
//     "orderId": orderId,
//     "productId": productId,
//     "finalPrice": finalPrice,
//     "id": id,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//   };
// }
// class Order {
//   int? orderType;
//   int? totalPrice;
//   int? sendPrice;
//   UserReadDto? user;
//   String? userId;
//   UserReadDto? productOwner;
//   String? productOwnerId;
//   List<int>? tags;
//   List<OrderDetail>? orderDetails;
//   String? id;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   Order({
//     this.orderType,
//     this.totalPrice,
//     this.sendPrice,
//     this.user,
//     this.userId,
//     this.productOwner,
//     this.productOwnerId,
//     this.tags,
//     this.orderDetails,
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Order.fromJson(String str) => Order.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Order.fromMap(Map<String, dynamic> json) => Order(
//     orderType: json["orderType"],
//     totalPrice: json["totalPrice"],
//     sendPrice: json["sendPrice"],
//     user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
//     userId: json["userId"],
//     productOwner: json["productOwner"] == null ? null : UserReadDto.fromMap(json["productOwner"]),
//     productOwnerId: json["productOwnerId"],
//     tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
//     orderDetails: json["orderDetails"] == null ? [] : List<OrderDetail>.from(json["orderDetails"]!.map((x) => OrderDetail.fromMap(x))),
//     id: json["id"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "orderType": orderType,
//     "totalPrice": totalPrice,
//     "sendPrice": sendPrice,
//     "user": user?.toMap(),
//     "userId": userId,
//     "productOwner": productOwner?.toMap(),
//     "productOwnerId": productOwnerId,
//     "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
//     "orderDetails": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
//     "id": id,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//   };
// }
//

// class OrderReadDto {
//   OrderReadDto({
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//     this.description,
//     this.discountCode,
//     this.productUseCase,
//     this.payNumber,
//     this.status,
//     this.totalPrice,
//     this.discountPrice,
//     this.discountPercent,
//     this.sendPrice,
//     this.sendType,
//     this.payType,
//     this.payDateTime,
//     this.receivedDate,
//     this.address,
//     this.addressId,
//     this.user,
//     this.userId,
//     this.productOwner,
//     this.productOwnerId,
//     this.orderDetails,
//     this.state,
//   });
//
//   factory OrderReadDto.fromJson(final String str) => OrderReadDto.fromMap(json.decode(str));
//
//   factory OrderReadDto.fromMap(final dynamic json) => OrderReadDto(
//         id: json["id"],
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//         description: json["description"],
//         discountCode: json["discountCode"],
//         productUseCase: json["productUseCase"],
//         payNumber: json["payNumber"],
//         status: json["status"],
//         totalPrice: json["totalPrice"],
//         discountPrice: json["discountPrice"],
//         discountPercent: json["discountPercent"],
//         sendPrice: json["sendPrice"],
//         sendType: json["sendType"],
//         payType: json["payType"],
//         payDateTime: json["payDateTime"],
//         receivedDate: json["receivedDate"],
//         address: json["address"] == null ? null : AddressReadDto.fromMap(json["address"]),
//         addressId: json["addressId"],
//         user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
//         userId: json["userId"],
//         productOwner: json["productOwner"] == null ? null : UserReadDto.fromMap(json["productOwner"]),
//         productOwnerId: json["productOwnerId"],
//         orderDetails: json["orderDetails"] == null ? [] : List<OrderDetail>.from(json["orderDetails"]!.map(OrderDetail.fromMap)),
//         state: json["state"],
//       );
//   final String? id;
//   final String? createdAt;
//   final String? updatedAt;
//   final String? description;
//   final String? discountCode;
//   final String? productUseCase;
//   final String? payNumber;
//   final int? status;
//   final int? totalPrice;
//   final int? discountPrice;
//   final int? discountPercent;
//   final int? sendPrice;
//   final int? sendType;
//   final int? payType;
//   final String? payDateTime;
//   final String? receivedDate;
//   final AddressReadDto? address;
//   final String? addressId;
//   final UserReadDto? user;
//   final String? userId;
//   final UserReadDto? productOwner;
//   final String? productOwnerId;
//   final List<OrderDetail>? orderDetails;
//   final String? state;
//
//   String toJson() => json.encode(toMap());
//
//   dynamic toMap() => {
//         "id": id,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "description": description,
//         "discountCode": discountCode,
//         "productUseCase": productUseCase,
//         "payNumber": payNumber,
//         "status": status,
//         "totalPrice": totalPrice,
//         "discountPrice": discountPrice,
//         "discountPercent": discountPercent,
//         "sendPrice": sendPrice,
//         "sendType": sendType,
//         "payType": payType,
//         "payDateTime": payDateTime,
//         "receivedDate": receivedDate,
//         "address": address?.toMap(),
//         "addressId": addressId,
//         "user": user?.toMap(),
//         "userId": userId,
//         "productOwner": productOwner?.toMap(),
//         "productOwnerId": productOwnerId,
//         "orderDetails": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((final OrderDetail x) => x.toMap())),
//         "state": state,
//       };
// }
//
// class OrderDetail {
//   OrderDetail({
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//     this.price,
//     this.unitPrice,
//     this.count,
//     this.order,
//     this.orderId,
//     this.product,
//     this.productId,
//     this.category,
//     this.categoryId,
//   });
//
//   factory OrderDetail.fromJson(final String str) => OrderDetail.fromMap(json.decode(str));
//
//   factory OrderDetail.fromMap(final dynamic json) => OrderDetail(
//         id: json["id"],
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//         price: json["price"],
//         unitPrice: json["unitPrice"],
//         count: json["count"],
//         order: json["order"],
//         orderId: json["orderId"],
//         product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
//         productId: json["productId"],
//         category: json["category"] == null ? null : CategoryReadDto.fromMap(json["category"]),
//         categoryId: json["categoryId"],
//       );
//   final String? id;
//   final String? createdAt;
//   final String? updatedAt;
//   int? price;
//   int? unitPrice;
//   int? count;
//   final String? order;
//   final String? orderId;
//   final ProductReadDto? product;
//   final String? productId;
//   final CategoryReadDto? category;
//   final String? categoryId;
//
//   String toJson() => json.encode(toMap());
//
//   dynamic toMap() => {
//         "id": id,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "price": price,
//         "count": count,
//         "order": order,
//         "orderId": orderId,
//         "unitPrice": unitPrice,
//         "product": product?.toMap(),
//         "productId": productId,
//         "category": category?.toMap(),
//         "categoryId": categoryId,
//       };
// }
