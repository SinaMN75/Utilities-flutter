part of '../data.dart';

class TransactionCreateDto {
  final int? amount;
  final String? descriptions;
  final String? refId;
  final String? cardNumber;
  final List<int>? tags;
  final String? userId;
  final String? orderId;
  final String? subscriptionId;

  TransactionCreateDto({
    this.amount,
    this.descriptions,
    this.refId,
    this.cardNumber,
    this.tags,
    this.userId,
    this.orderId,
    this.subscriptionId,
  });

  factory TransactionCreateDto.fromJson(String str) => TransactionCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionCreateDto.fromMap(Map<String, dynamic> json) => TransactionCreateDto(
        amount: json["amount"],
        descriptions: json["descriptions"],
        refId: json["refId"],
        cardNumber: json["cardNumber"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
        userId: json["userId"],
        orderId: json["orderId"],
        subscriptionId: json["subscriptionId"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "descriptions": descriptions,
        "refId": refId,
        "cardNumber": cardNumber,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "userId": userId,
        "orderId": orderId,
        "subscriptionId": subscriptionId,
      };
}

class TransactionUpdateDto {
  final String? id;
  final int? amount;
  final String? descriptions;
  final String? refId;
  final String? cardNumber;
  final List<int>? tags;
  final String? userId;
  final String? orderId;
  final String? subscriptionId;

  TransactionUpdateDto({
    this.id,
    this.amount,
    this.descriptions,
    this.refId,
    this.cardNumber,
    this.tags,
    this.userId,
    this.orderId,
    this.subscriptionId,
  });

  factory TransactionUpdateDto.fromJson(String str) => TransactionUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionUpdateDto.fromMap(Map<String, dynamic> json) => TransactionUpdateDto(
        id: json["id"],
        amount: json["amount"],
        descriptions: json["descriptions"],
        refId: json["refId"],
        cardNumber: json["cardNumber"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
        userId: json["userId"],
        orderId: json["orderId"],
        subscriptionId: json["subscriptionId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "descriptions": descriptions,
        "refId": refId,
        "cardNumber": cardNumber,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "userId": userId,
        "orderId": orderId,
        "subscriptionId": subscriptionId,
      };
}

class TransactionFilterDto {
  final int? amount;
  final String? refId;
  final List<int>? tags;
  final String? userId;
  final String? orderId;

  TransactionFilterDto({
    this.amount,
    this.refId,
    this.tags,
    this.userId,
    this.orderId,
  });

  factory TransactionFilterDto.fromJson(String str) => TransactionFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionFilterDto.fromMap(Map<String, dynamic> json) => TransactionFilterDto(
        amount: json["amount"],
        refId: json["refId"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
        userId: json["userId"],
        orderId: json["orderId"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "refId": refId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "userId": userId,
        "orderId": orderId,
      };
}

class TransactionReadDto {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? amount;
  final String? descriptions;
  final String? refId;
  final String? cardNumber;
  final List<int>? tags;
  final UserReadDto? user;
  final String? userId;
  final OrderReadDto? order;
  final String? orderId;
  final SubscriptionPaymentReadDto? subscriptionPayment;
  final String? subscriptionId;

  TransactionReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.amount,
    this.descriptions,
    this.refId,
    this.cardNumber,
    this.tags,
    this.user,
    this.userId,
    this.order,
    this.orderId,
    this.subscriptionPayment,
    this.subscriptionId,
  });

  factory TransactionReadDto.fromJson(String str) => TransactionReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionReadDto.fromMap(Map<String, dynamic> json) => TransactionReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        amount: json["amount"],
        descriptions: json["descriptions"],
        refId: json["refId"],
        cardNumber: json["cardNumber"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        userId: json["userId"],
        order: json["order"] == null ? null : OrderReadDto.fromMap(json["order"]),
        orderId: json["orderId"],
        subscriptionPayment: json["subscriptionPayment"] == null ? null : SubscriptionPaymentReadDto.fromMap(json["subscriptionPayment"]),
        subscriptionId: json["subscriptionId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "amount": amount,
        "descriptions": descriptions,
        "refId": refId,
        "cardNumber": cardNumber,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "user": user?.toMap(),
        "userId": userId,
        "order": order?.toMap(),
        "orderId": orderId,
        "subscriptionPayment": subscriptionPayment?.toMap(),
        "subscriptionId": subscriptionId,
      };
}
