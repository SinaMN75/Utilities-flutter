part of '../data.dart';

class SubscriptionPaymentDataSource {
  final String baseUrl;

  SubscriptionPaymentDataSource({required this.baseUrl});

  void create({
    required final SubscriptionPaymentCreateUpdateDto dto,
    required final Function(GenericResponse<SubscriptionPaymentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/SubscriptionPayment",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<SubscriptionPaymentReadDto>.fromJson(response.body, fromMap: SubscriptionPaymentReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
