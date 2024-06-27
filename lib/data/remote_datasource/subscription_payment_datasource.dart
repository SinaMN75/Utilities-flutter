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
        action: (http.Response response) => onResponse(GenericResponse<SubscriptionPaymentReadDto>.fromJson(response.body, fromMap: SubscriptionPaymentReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
