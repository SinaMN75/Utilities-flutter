part of '../data.dart';

class PromoteDataSource {
  PromoteDataSource({required this.baseUrl});

  final String baseUrl;

  void readById({
    required final String id,
    required final Function(GenericResponse<PromoteReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/promotion/$id",
        action: (final http.Response response) => onResponse(GenericResponse<PromoteReadDto>.fromJson(response.body, fromMap: PromoteReadDto.fromMap)),
        error: (final http.Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void create({
    required final PromoteCreateUpdateDto dto,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/promotion",
        body: dto,
        action: (final http.Response response) => onResponse(GenericResponse.fromJson(response.body)),
        error: (final http.Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );
}
