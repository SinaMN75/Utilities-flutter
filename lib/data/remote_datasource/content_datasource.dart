part of '../data.dart';

class ContentDataSource {
  final String baseUrl;

  ContentDataSource({required this.baseUrl});

  void create({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Content",
        body: dto,
        action: (http.Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void update({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Content",
        body: dto,
        action: (http.Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void read({
    required final Function(GenericResponse<ContentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Content",
        action: (http.Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<ContentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Content/$id",
        action: (http.Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Content/$id",
        action: (http.Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );
}
