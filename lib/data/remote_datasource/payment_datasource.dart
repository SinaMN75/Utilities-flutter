part of '../data.dart';

class PaymentDataSource {
  final String baseUrl;

  PaymentDataSource({required this.baseUrl});

  void increaseWalletBalance({
    required final String amount,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/IncreaseWalletBalance/$amount",
        action: (http.Response response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
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
        action: (http.Response response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
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
        action: (http.Response response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void payNg({
    required final PayNgCreateDto dto,
    required final Function(GenericResponse<PayNgReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpPost(
        body: dto,
        url: "$baseUrl/payment/payNg",
        action: (http.Response response) => onResponse(GenericResponse<PayNgReadDto>.fromJson(response.body, fromMap: PayNgReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void verifyNg({
    required final String outlet,
    required final String id,
    required final Function(GenericResponse<VerifyNgReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpPost(
        url: "$baseUrl/payment/verifyNG/$outlet/$id",
        action: (http.Response response) => onResponse(GenericResponse<VerifyNgReadDto>.fromJson(response.body, fromMap: VerifyNgReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
