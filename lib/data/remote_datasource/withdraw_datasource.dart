part of '../data.dart';

class WithdrawDataSource {
  WithdrawDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> create({
    required final WithdrawCreateDto dto,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/withdraw",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<dynamic>.fromJson(response.body)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  Future<void> filter({
    required final WithdrawFilterDto dto,
    required final Function(GenericResponse<WithdrawReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/withdraw/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<WithdrawReadDto>.fromJson(response.body, fromMap: WithdrawReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> update({
    required final WithdrawUpdateDto dto,
    required final Function(GenericResponse<WithdrawReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/withdraw",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<WithdrawReadDto>.fromJson(response.body, fromMap: WithdrawReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
