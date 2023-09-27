part of '../data.dart';

class ReportDataSource {
  ReportDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> create({
    required final ReportCreateUpdateDto dto,
    required final Function(GenericResponse<ReportReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Report",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(String) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Report?id=$id",
        action: (final Response response) => onResponse(response.statusCode.toString()),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ReportReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Report/$id",
        action: (final Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> filter({
    required final ReportFilterDto dto,
    required final Function(GenericResponse<ReportReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Report/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (final Response response) {},
      );
}
