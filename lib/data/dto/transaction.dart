part of '../data.dart';

class TransactionReadDto {
  TransactionReadDto({
    this.id,
    this.userId,
    this.amount,
    this.descriptions,
    this.statusId,
    this.paymentId,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.order,
    this.orderId,
  });

  final String? id;
  final String? userId;
  final int? amount;
  final String? descriptions;
  final int? statusId;
  final String? paymentId;
  final String? createdAt;
  final String? updatedAt;
  final UserReadDto? user;
  final OrderReadDto? order;
  final String? orderId;

  factory TransactionReadDto.fromJson(String str) => TransactionReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory TransactionReadDto.fromMap(dynamic json) => TransactionReadDto(
        id: json["id"],
        userId: json["userId"],
        amount: json["amount"],
        descriptions: json["descriptions"],
        statusId: json["statusId"],
        paymentId: json["paymentId"],
        createdAt: json["createdAt"],
        orderId: json["orderId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        order: json["order"] == null ? null : OrderReadDto.fromMap(json["order"]),
      );

  dynamic toMap() => {
        "id": id,
        "userId": userId,
        "amount": amount,
        "descriptions": descriptions,
        "statusId": statusId,
        "paymentId": paymentId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class TransactionFilterDto {
  final int? amount;
  final String? authority;
  final String? gatewayName;
  final String? paymentId;
  final String? shebaNumber;
  final int? refId;
  final int? statusId;
  final int? transactionType;
  final String? userId;
  final String? orderId;

  TransactionFilterDto({
    this.amount,
    this.authority,
    this.gatewayName,
    this.paymentId,
    this.shebaNumber,
    this.refId,
    this.statusId,
    this.transactionType,
    this.userId,
    this.orderId,
  });

  factory TransactionFilterDto.fromJson(String str) => TransactionFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionFilterDto.fromMap(Map<String, dynamic> json) => TransactionFilterDto(
        amount: json["amount"],
        authority: json["authority"],
        gatewayName: json["gatewayName"],
        paymentId: json["paymentId"],
        shebaNumber: json["shebaNumber"],
        refId: json["refId"],
        statusId: json["statusId"],
        transactionType: json["transactionType"],
        userId: json["userId"],
        orderId: json["orderId"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "authority": authority,
        "gatewayName": gatewayName,
        "paymentId": paymentId,
        "shebaNumber": shebaNumber,
        "refId": refId,
        "statusId": statusId,
        "transactionType": transactionType,
        "userId": userId,
        "orderId": orderId,
      };
}
