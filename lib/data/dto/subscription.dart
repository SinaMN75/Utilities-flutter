import 'package:utilities/utilities.dart';

import 'dart:convert';

class SubscriptionPaymentReadDto {
  int? subscriptionType;
  int? tag;
  int? amount;
  String? description;
  UserReadDto? user;
  String? userId;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubscriptionPaymentReadDto({
    this.subscriptionType,
    this.tag,
    this.amount,
    this.description,
    this.user,
    this.userId,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory SubscriptionPaymentReadDto.fromJson(String str) => SubscriptionPaymentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubscriptionPaymentReadDto.fromMap(Map<String, dynamic> json) => SubscriptionPaymentReadDto(
        subscriptionType: json["subscriptionType"],
        tag: json["tag"],
        amount: json["amount"],
        description: json["description"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        userId: json["userId"],
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "subscriptionType": subscriptionType,
        "tag": tag,
        "amount": amount,
        "description": description,
        "user": user?.toMap(),
        "userId": userId,
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class SubscriptionPaymentCreateUpdateDto {
  SubscriptionPaymentCreateUpdateDto({
    this.id,
    this.subscriptionType,
    this.tag,
    this.userId,
    this.amount,
    this.description,
  });

  factory SubscriptionPaymentCreateUpdateDto.fromJson(final String str) => SubscriptionPaymentCreateUpdateDto.fromMap(json.decode(str));

  factory SubscriptionPaymentCreateUpdateDto.fromMap(final dynamic json) => SubscriptionPaymentCreateUpdateDto(
        id: json["id"],
        subscriptionType: json["subscriptionType"],
        tag: json["tag"],
        userId: json["userId"],
        amount: json["amount"],
        description: json["description"],
      );
  final String? id;
  final int? subscriptionType;
  final String? tag;
  final String? userId;
  final int? amount;
  final String? description;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "id": id,
        "subscriptionType": subscriptionType,
        "tag": tag,
        "userId": userId,
        "amount": amount,
        "description": description,
      };
}
