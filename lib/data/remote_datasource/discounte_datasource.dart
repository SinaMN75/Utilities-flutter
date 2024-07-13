part of '../data.dart';

class DiscountDataSource {

  DiscountDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void read({
    required final String code,
    required final Function(GenericResponse<DiscountReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Discount/$code",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<DiscountReadDto>.fromJson(response.body, fromMap: DiscountReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
