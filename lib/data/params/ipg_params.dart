part of "../data.dart";

// Request body for starting an IPG charge; apiKey/token are attached by the service, server derives the user.
class UIpgSaleParams {
  final double amount;

  UIpgSaleParams({required this.amount});

  Map<String, dynamic> toMap() => <String, dynamic>{
    "amount": amount,
  };

  factory UIpgSaleParams.fromMap(Map<String, dynamic> json) => UIpgSaleParams(
    amount: (json["amount"] as num).toDouble(),
  );

  String toJson() => json.encode(toMap());

  factory UIpgSaleParams.fromJson(String str) => UIpgSaleParams.fromMap(json.decode(str));
}

// Request body for polling/confirming the result of a started IPG charge.
class UIpgVerifyParams {
  final String trackingNumber;

  UIpgVerifyParams({required this.trackingNumber});

  Map<String, dynamic> toMap() => <String, dynamic>{
    "trackingNumber": trackingNumber,
  };

  factory UIpgVerifyParams.fromMap(Map<String, dynamic> json) => UIpgVerifyParams(
    trackingNumber: json["trackingNumber"],
  );

  String toJson() => json.encode(toMap());

  factory UIpgVerifyParams.fromJson(String str) => UIpgVerifyParams.fromMap(json.decode(str));
}
