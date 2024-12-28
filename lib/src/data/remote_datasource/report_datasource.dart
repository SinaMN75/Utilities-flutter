part of '../data.dart';

class ReportDataSource {
  ReportDataSource({required this.baseUrl});

  final String baseUrl;

  void create({
    required final ReportCreateUpdateDto dto,
    required final Function(GenericResponse<ReportReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Report",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(String) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/Report?id=$id",
        action: (final Response response) => onResponse(response.statusCode.toString()),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<ReportReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Report/$id",
        action: (final Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void filter({
    required final ReportFilterDto dto,
    required final Function(GenericResponse<ReportReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Report/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.body, fromMap: ReportReadDto.fromMap)),
        error: (final Response response) {},
      );
}
