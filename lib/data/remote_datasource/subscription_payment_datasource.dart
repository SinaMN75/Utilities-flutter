import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/subscription.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class SubscriptionPaymentDataSource {
  final String baseUrl;

  SubscriptionPaymentDataSource({required this.baseUrl});


  Future<void> create({
    required final SubscriptionPaymentCreateUpdateDto dto,
    required final Function(GenericResponse<SubscriptionPaymentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/SubscriptionPayment",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<SubscriptionPaymentReadDto>.fromJson(response.data, fromMap: SubscriptionPaymentReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );



}
