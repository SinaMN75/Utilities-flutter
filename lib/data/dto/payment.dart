part of '../data.dart';

class PaymentReadDto {
  PaymentReadDto({
    this.result,
    this.status,
    this.message,
  });

  final String? result;
  final int? status;
  final String? message;

  factory PaymentReadDto.fromJson(String str) => PaymentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory PaymentReadDto.fromMap(dynamic json) => PaymentReadDto(
        result: json["result"],
        status: json["status"],
        message: json["message"],
      );

  dynamic toMap() => {
        "result": result,
        "status": status,
        "message": message,
      };
}
