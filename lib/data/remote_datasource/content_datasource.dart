import 'package:get/get.dart';
import 'package:utilities/data/dto/content.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/utils/http_interceptor.dart';

class ContentDataSource {
  final String baseUrl;

  ContentDataSource({required this.baseUrl});

  Future<void> create({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Content",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> update({
    required final ContentCreateUpdateDto dto,
    required final Function(GenericResponse<ContentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Content",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> read({
    required final Function(GenericResponse<ContentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Content",
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ContentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Content/$id",
        action: (Response response) => onResponse(GenericResponse<ContentReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Content/$id",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );
}
