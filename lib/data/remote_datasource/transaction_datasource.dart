part of '../data.dart';

class TransactionDataSource {
  final String baseUrl;

  TransactionDataSource({required this.baseUrl});

  void create({
    required final TransactionCreateDto dto,
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        body: dto,
        url: "$baseUrl/Transaction",
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void update({
    required final TransactionUpdateDto dto,
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPut(
        body: dto,
        url: "$baseUrl/Transaction",
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void delete({
    required final String id,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Transaction/$id}",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void filter({
    required final TransactionFilterDto dto,
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        body: dto,
        url: "$baseUrl/Transaction/Filter",
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void generateReport({
    required final TransactionFilterDto dto,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        body: dto,
        url: "$baseUrl/Transaction/GenerateReport",
        action: (Response response) => onResponse(GenericResponse<MediaReadDto>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
