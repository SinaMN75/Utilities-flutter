part of '../data.dart';

class RegistrationDataSource {
  RegistrationDataSource({required this.baseUrl});

  final String baseUrl;

  void filter({
    required final RegistrationFilterDto dto,
    required final Function(GenericResponse<RegistrationReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Registration/Filter",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<RegistrationReadDto>.fromJson(response.body, fromMap: RegistrationReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void create({
    required final RegistrationCreateDto dto,
    required final Function(GenericResponse<RegistrationReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Registration",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<RegistrationReadDto>.fromJson(response.body, fromMap: RegistrationReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void update({
    required final RegistrationUpdateDto dto,
    required final Function(GenericResponse<RegistrationReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.put,
        url: "$baseUrl/Registration",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<RegistrationReadDto>.fromJson(response.body, fromMap: RegistrationReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse<RegistrationReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/Registration/$id",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<RegistrationReadDto>.fromJson(response.body, fromMap: RegistrationReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );
}
