part of '../data.dart';

class PaymentDataSource {
  final String baseUrl;

  PaymentDataSource({required this.baseUrl});

  void increaseWalletBalance({
    required final String amount,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/IncreaseWalletBalance/$amount",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void payOrderZarinPal({
    required final String orderId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/PayOrderZarinPal/$orderId",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void paySubscriptionZarinPal({
    required final String subscriptionId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/PaySubscriptionZarinPal/$subscriptionId",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void payNg({
    required final PayNgCreateDto dto,
    required final Function(GenericResponse<PayNgReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        body: dto,
        url: "$baseUrl/payment/payNg",
        action: (Response response) => onResponse(GenericResponse<PayNgReadDto>.fromJson(response.body, fromMap: PayNgReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void verifyNg({
    required final String outlet,
    required final String id,
    required final Function(GenericResponse<VerifyNgReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/payment/verifyNG/$outlet/$id",
        action: (Response response) => onResponse(GenericResponse<VerifyNgReadDto>.fromJson(response.body, fromMap: VerifyNgReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );


  void getAvreenIpgToken({
    required final GetAvreenIpgDto dto,
    required final Function(GetAvreenIpgResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "https://oa.avreenco.com:8080/api/ipg/site/getToken",
        action: (Response response) => onResponse(GetAvreenIpgResponse.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
