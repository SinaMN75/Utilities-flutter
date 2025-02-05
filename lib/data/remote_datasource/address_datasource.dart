part of '../data.dart';

class AddressDataSource {
  AddressDataSource({required this.baseUrl});

  final String baseUrl;

  void filter({
    required final AddressFilterDto dto,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/address/Filter",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void create({
    required final AddressCreateUpdateDto dto,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/address",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void update({
    required final AddressCreateUpdateDto dto,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.put,
        url: "$baseUrl/address",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/address/$id",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );
}
