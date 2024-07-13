part of '../data.dart';

class TransactionDataSource {

  TransactionDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void create({
    required final TransactionCreateDto dto,
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        body: dto,
        url: "$baseUrl/Transaction",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void update({
    required final TransactionUpdateDto dto,
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        body: dto,
        url: "$baseUrl/Transaction",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void delete({
    required final String id,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Transaction/$id}",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void filter({
    required final TransactionFilterDto dto,
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        body: dto,
        url: "$baseUrl/Transaction/Filter",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.body, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void generateReport({
    required final TransactionFilterDto dto,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        body: dto,
        url: "$baseUrl/Transaction/GenerateReport",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<MediaReadDto>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
