part of '../data.dart';

class AddressDataSource {
  AddressDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void filter({
    required final AddressFilterDto dto,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/address/Filter",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void create({
    required final AddressCreateUpdateDto dto,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/address",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void update({
    required final AddressCreateUpdateDto dto,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/address",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse<AddressReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/address/$id",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.body, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );
}
