part of '../data.dart';

class ReportDataSource {
  ReportDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void create({
    required final ReportCreateUpdateDto dto,
    required final Function(GenericResponse<ReportReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Report",
        apiKey: apiKey,
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(String) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Report?id=$id",
        apiKey: apiKey,
        action: (final Response response) => onResponse(response.statusCode.toString()),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<ReportReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Report/$id",
        apiKey: apiKey,
        action: (final Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void filter({
    required final ReportFilterDto dto,
    required final Function(GenericResponse<ReportReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Report/Filter",
        apiKey: apiKey,
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (final Response response) {},
      );
}
