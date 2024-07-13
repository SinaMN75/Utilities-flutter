part of '../data.dart';

class PaymentDataSource {

  PaymentDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void increaseWalletBalance({
    required final String amount,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/IncreaseWalletBalance/$amount",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void payOrderZarinPal({
    required final String orderId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/PayOrderZarinPal/$orderId",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void paySubscriptionZarinPal({
    required final String subscriptionId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/PaySubscriptionZarinPal/$subscriptionId",
  apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void buyProduct({
    required final String productId,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Payment/BuyProduct/$productId",
  apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
