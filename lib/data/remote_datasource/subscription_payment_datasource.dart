part of '../data.dart';

class SubscriptionPaymentDataSource {

  SubscriptionPaymentDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void create({
    required final SubscriptionPaymentCreateUpdateDto dto,
    required final Function(GenericResponse<SubscriptionPaymentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/SubscriptionPayment",
        apiKey: apiKey,
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<SubscriptionPaymentReadDto>.fromJson(response.body, fromMap: SubscriptionPaymentReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
