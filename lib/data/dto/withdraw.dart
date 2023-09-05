import 'dart:convert';

import 'package:utilities/data/dto/dto.dart';
class WithdrawReadDto {
  WithdrawReadDto({
    this.id,
    this.shebaNumber,
    this.amount,
    this.withdrawState,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory WithdrawReadDto.fromJson(final String str) => WithdrawReadDto.fromMap(json.decode(str));

  factory WithdrawReadDto.fromMap(final dynamic json) => WithdrawReadDto(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    shebaNumber: json["shebaNumber"],
    amount: json["amount"],
    withdrawState: json["withdrawState"],
    user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
  );

  String toJson() => json.encode(toMap());

  dynamic toMap() => <String, dynamic>{
    "id": id,
    "shebaNumber": shebaNumber,
    "amount": amount,
    "withdrawState": withdrawState,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "user": user?.toMap(),
  };

  final String? id;
  final String? shebaNumber;
  final int? withdrawState;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? amount;
  final UserReadDto? user;
}
class WithdrawCreateUpdateDto {
  WithdrawCreateUpdateDto({
    this.shebaNumber,
    this.amount,
  });

  factory WithdrawCreateUpdateDto.fromJson(final String str) => WithdrawCreateUpdateDto.fromMap(json.decode(str));

  factory WithdrawCreateUpdateDto.fromMap(final dynamic json) => WithdrawCreateUpdateDto(
        shebaNumber: json["shebaNumber"],
        amount: json["amount"],
      );

  String toJson() => json.encode(toMap());

  dynamic toMap() => <String, dynamic>{
        "shebaNumber": shebaNumber,
        "amount": amount,
      };

  final String? shebaNumber;
  final int? amount;
}
