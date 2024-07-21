part of '../data.dart';

class PaymentCreateDto {
  String? action;
  String? emailAddress;
  String? outlet;
  String? currency;
  String? redirectUrl;
  int? amount;
  bool? skipConfirmationPage;

  PaymentCreateDto({
    this.action,
    this.emailAddress,
    this.outlet,
    this.currency,
    this.redirectUrl,
    this.amount,
    this.skipConfirmationPage,
  });

  factory PaymentCreateDto.fromJson(String str) => PaymentCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentCreateDto.fromMap(Map<String, dynamic> json) => PaymentCreateDto(
        action: json["action"],
        emailAddress: json["emailAddress"],
        outlet: json["outlet"],
        currency: json["currency"],
        redirectUrl: json["redirectUrl"],
        amount: json["amount"],
        skipConfirmationPage: json["skipConfirmationPage"],
      );

  Map<String, dynamic> toMap() => {
        "action": action,
        "emailAddress": emailAddress,
        "outlet": outlet,
        "currency": currency,
        "redirectUrl": redirectUrl,
        "amount": amount,
        "skipConfirmationPage": skipConfirmationPage,
      };
}

class PaymentZibalReadDto {
  String? message;
  String? paymentLink;
  int? result;
  int? trackId;


  PaymentZibalReadDto({
    this.message,
    this.paymentLink,
    this.result,
    this.trackId,
  });

  factory PaymentZibalReadDto.fromJson(String str) => PaymentZibalReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentZibalReadDto.fromMap(Map<String, dynamic> json) => PaymentZibalReadDto(
    message: json["message"],
    paymentLink: json["paymentLink"],
    result: json["result"],
    trackId: json["trackId"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "paymentLink": paymentLink,
        "result": result,
        "trackId": trackId,
      };
}

class PaymentVerifyCreateDto {
  String? outlet;
  String? id;

  PaymentVerifyCreateDto({
    this.outlet,
    this.id,
  });

  factory PaymentVerifyCreateDto.fromJson(String str) => PaymentVerifyCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentVerifyCreateDto.fromMap(Map<String, dynamic> json) => PaymentVerifyCreateDto(
    outlet: json["outlet"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "outlet": outlet,
    "id": id,
  };
}

class PaymentVerifyReadDto {
  String? message;
  int? result;
  String? paidAt;
  int? amount;
  int? status;
  String? description;

  PaymentVerifyReadDto({
    this.message,
    this.result,
    this.paidAt,
    this.amount,
    this.status,
    this.description,
  });

  factory PaymentVerifyReadDto.fromRawJson(String str) => PaymentVerifyReadDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentVerifyReadDto.fromJson(Map<String, dynamic> json) => PaymentVerifyReadDto(
    message: json["message"],
    result: json["result"],
    paidAt: json["paidAt"],
    amount: json["amount"],
    status: json["status"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result,
    "paidAt": paidAt,
    "amount": amount,
    "status": status,
    "description": description,
  };
}


// class PaymentReadDto {
//
//   PaymentReadDto({
//     this.result,
//     this.status,
//     this.message,
//   });
//
//   final String? result;
//   final int? status;
//   final String? message;
//
//   factory PaymentReadDto.fromJson(String str) => PaymentReadDto.fromMap(json.decode(str));
//
//   String toJson() => json.encode(removeNullEntries(toMap()));
//
//   factory PaymentReadDto.fromMap(dynamic json) => PaymentReadDto(
//         result: json["result"],
//         status: json["status"],
//         message: json["message"],
//       );
//
//   dynamic toMap() => {
//         "result": result,
//         "status": status,
//         "message": message,
//       };
// }

