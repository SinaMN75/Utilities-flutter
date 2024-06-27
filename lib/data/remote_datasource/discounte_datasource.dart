part of '../data.dart';

class DiscountDataSource {
  final String baseUrl;

  DiscountDataSource({required this.baseUrl});

  void read({
    required final String code,
    required final Function(GenericResponse<DiscountReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Discount/$code",
        action: (http.Response response) => onResponse(GenericResponse<DiscountReadDto>.fromJson(response.body, fromMap: DiscountReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
