part of '../data.dart';

class TransactionDataSource {
  final String baseUrl;

  TransactionDataSource({required this.baseUrl});

  Future<void> create({
    required final TransactionCreateDto dto,
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        body: dto,
        url: "$baseUrl/Transaction",
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> update({
    required final TransactionUpdateDto dto,
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        body: dto,
        url: "$baseUrl/Transaction",
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Transaction/$id}",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> filter({
    required final TransactionFilterDto dto,
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        body: dto,
        url: "$baseUrl/Transaction/Filter",
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
