part of '../data.dart';

class PaymentDataSource {
  PaymentDataSource({required this.baseUrl, required this.apiKey});

  final String baseUrl;
  final String apiKey;


  void payZibal({
    required final PaymentCreateDto createDto,
    required final Function(GenericResponse<PaymentZibalReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/payment/payZibal",
        apiKey: apiKey,
        body: createDto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<PaymentZibalReadDto>.fromJson(response.body, fromMap: PaymentZibalReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );


  void verifyZibal({
    required final PaymentVerifyCreateDto verifyDto,
    required final Function(GenericResponse<PaymentZibalReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/payment/verifyZibal/{outlet}/{id}",
        apiKey: apiKey,
        body: verifyDto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<PaymentZibalReadDto>.fromJson(response.body, fromMap: PaymentZibalReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  //
  //
  //
  // void payZibal({
  //   required final PaymentZibalCreateDto createDto,
  //   required final Function(GenericResponse) onResponse,
  //   required final Function(GenericResponse errorResponse) onError,
  //   final Function(dynamic error)? failure,
  // }) =>
  //     httpPost(
  //       url: "$baseUrl/payment/payZibal",
  //       apiKey: apiKey,
  //       body: createDto,
  //       action: (Response response) => onResponse(GenericResponse<PaymentZibalReadDto>.fromJson(response.body, fromMap: PaymentZibalReadDto.fromMap)),
  //       error: (Response response) => onError(GenericResponse.fromJson(response.body)),
  //       failure: failure,
  //     );

//
void increaseWalletBalance({
  required final String amount,
  required final Function(GenericResponse) onResponse,
  required final Function(GenericResponse errorResponse) onError,
  final Function(dynamic error)? failure,
}) =>
    httpGet(
      url: "$baseUrl/IncreaseWalletBalance/$amount",
      apiKey: apiKey,
      action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentZibalReadDto.fromMap)),
      error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      failure: failure,
    );
//
void payOrderZarinPal({
  required final String orderId,
  required final Function(GenericResponse) onResponse,
  required final Function(GenericResponse errorResponse) onError,
  final Function(dynamic error)? failure,
}) =>
    httpGet(
      url: "$baseUrl/PayOrderZarinPal/$orderId",
      apiKey: apiKey,
      action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentZibalReadDto.fromMap)),
      error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      failure: failure,
    );
//
// void paySubscriptionZarinPal({
//   required final String subscriptionId,
//   required final Function(GenericResponse) onResponse,
//   required final Function(GenericResponse errorResponse) onError,
//   final Function(dynamic error)? failure,
// }) =>
//     httpGet(
//       url: "$baseUrl/PaySubscriptionZarinPal/$subscriptionId",
// apiKey: apiKey,
//       action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
//       error: (Response response) => onError(GenericResponse.fromJson(response.body)),
//       failure: failure,
//     );
//
// void buyProduct({
//   required final String productId,
//   required final Function(GenericResponse response) onResponse,
//   required final Function(GenericResponse errorResponse) onError,
//   final Function(dynamic error)? failure,
// }) =>
//     httpGet(
//       url: "$baseUrl/Payment/BuyProduct/$productId",
// apiKey: apiKey,
//       action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
//       error: (Response response) => onError(GenericResponse.fromJson(response.body)),
//       failure: failure,
//     );
}
