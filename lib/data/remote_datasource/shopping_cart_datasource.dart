part of '../data.dart';

class ShoppingCartDataSource {

  ShoppingCartDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void create({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/ShoppingCart",
        apiKey: apiKey,
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void update({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/ShoppingCart",
        apiKey: apiKey,
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void read({
    required final Function(GenericResponse<ShoppingCartReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/ShoppingCart",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<ShoppingCartReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/ShoppingCart/$id",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void delete({
    required final String id,
    required final String itemId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/ShoppingCart/$id/$itemId",
  apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
