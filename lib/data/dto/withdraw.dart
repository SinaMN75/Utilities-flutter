part of '../data.dart';

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

  String toJson() => json.encode(removeNullEntries(toMap()));

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

class WithdrawCreateDto {
  WithdrawCreateDto({
    required this.shebaNumber,
    required this.amount,
  });

  factory WithdrawCreateDto.fromJson(final String str) => WithdrawCreateDto.fromMap(json.decode(str));

  factory WithdrawCreateDto.fromMap(final dynamic json) => WithdrawCreateDto(
        shebaNumber: json["shebaNumber"],
        amount: json["amount"],
      );

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
        "shebaNumber": shebaNumber,
        "amount": amount,
      };

  final String shebaNumber;
  final int amount;
}

class WithdrawUpdateDto {
  WithdrawUpdateDto({
    required this.id,
    this.adminMessage,
    this.state,
  });

  factory WithdrawUpdateDto.fromJson(final String str) => WithdrawUpdateDto.fromMap(json.decode(str));

  factory WithdrawUpdateDto.fromMap(final dynamic json) => WithdrawUpdateDto(
        id: json["id"],
        adminMessage: json["adminMessage"],
        state: json["state"],
      );

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
        "id": id,
        "adminMessage": adminMessage,
        "state": state,
      };

  final String id;
  final int? state;
  final String? adminMessage;
}

class WithdrawFilterDto {
  WithdrawFilterDto({
    this.withdrawState,
    this.userId,
    this.showUser,
  });

  factory WithdrawFilterDto.fromJson(final String str) => WithdrawFilterDto.fromMap(json.decode(str));

  factory WithdrawFilterDto.fromMap(final dynamic json) => WithdrawFilterDto(
        userId: json["userId"],
        showUser: json["showUser"],
      );

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
        "withdrawState": withdrawState,
        "userId": userId,
        "showUser": showUser,
      };

  final int? withdrawState;
  final String? userId;
  final bool? showUser;
}
