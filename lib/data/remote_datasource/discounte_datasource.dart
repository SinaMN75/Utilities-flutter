part of '../data.dart';

class DiscountDataSource {
  final String baseUrl;

  DiscountDataSource({required this.baseUrl});

  Future<void> read({
    required final String code,
    required final Function(GenericResponse<DiscountReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Discount/$code",
        action: (Response response) => onResponse(GenericResponse<DiscountReadDto>.fromJson(response.body, fromMap: DiscountReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
