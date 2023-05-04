import 'package:utilities/utilities.dart';

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

  String toJson() => json.encode(toMap());

  factory PaymentReadDto.fromMap(Map<String, dynamic> json) => PaymentReadDto(
        result: json["result"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "result": result,
        "status": status,
        "message": message,
      };
}
