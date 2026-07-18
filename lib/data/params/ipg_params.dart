part of "../data.dart";

// Request body for starting an IPG charge; apiKey/token are attached by the service, server derives the user.
class UIpgPayParams {
  final double amount;

  // Web only: the gateway callback redirects back here instead of rendering its result page. Must be allow-listed server side.
  final String? returnUrl;

  UIpgPayParams({required this.amount, this.returnUrl});

  Map<String, dynamic> toMap() => <String, dynamic>{
    "amount": amount,
    if (returnUrl != null) "returnUrl": returnUrl,
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
