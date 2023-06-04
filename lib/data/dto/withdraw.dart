import 'dart:convert';

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
