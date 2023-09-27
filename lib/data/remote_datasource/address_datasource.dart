part of '../data.dart';

class AddressDataSource {
  AddressDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> filter({
    required final AddressFilterDto dto,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/address/Filter",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  Future<void> create({
    required final AddressCreateUpdateDto dto,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/address",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  Future<void> update({
    required final AddressCreateUpdateDto dto,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/address",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/address/$id",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );
}
