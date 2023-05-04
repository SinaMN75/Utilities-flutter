import 'dart:convert';

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
  });

  final String? id;
  final String? userId;
  final double? amount;
  final String? descriptions;
  final int? statusId;
  final String? paymentId;
  final String? createdAt;
  final String? updatedAt;

  factory TransactionReadDto.fromJson(String str) => TransactionReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionReadDto.fromMap(Map<String, dynamic> json) => TransactionReadDto(
        id: json["id"],
        userId: json["userId"],
        amount: json["amount"],
        descriptions: json["descriptions"],
        statusId: json["statusId"],
        paymentId: json["paymentId"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
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
