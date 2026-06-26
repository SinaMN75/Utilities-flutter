part of "../data.dart";

// Request body for starting an IPG charge; apiKey/token are attached by the service, server derives the user.
class UIpgPayParams {
  final double amount;

  UIpgPayParams({required this.amount});

  Map<String, dynamic> toMap() => <String, dynamic>{
    "amount": amount,
  };
}

// Request body for polling/confirming the result of a started IPG charge.
class UIpgVerifyParams {
  final String trackingNumber;

  UIpgVerifyParams({required this.trackingNumber});

  Map<String, dynamic> toMap() => <String, dynamic>{
    "trackingNumber": trackingNumber,
  };
}
