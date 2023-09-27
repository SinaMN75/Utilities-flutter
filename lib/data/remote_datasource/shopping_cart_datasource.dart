part of '../data.dart';

class ShoppingCartDataSource {
  final String baseUrl;

  ShoppingCartDataSource({required this.baseUrl});

  Future<void> create({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ShoppingCart",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> update({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/ShoppingCart",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> read({
    required final Function(GenericResponse<ShoppingCartReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ShoppingCart",
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ShoppingCartReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ShoppingCart/$id",
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> delete({
    required final String id,
    required final String itemId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/ShoppingCart/$id/$itemId",
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.body, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
