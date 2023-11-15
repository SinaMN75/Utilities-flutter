part of '../data.dart';

class ProductDataSource {
  ProductDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> update({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> read({
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2",
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2/$id",
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/ProductV2/$id",
        action: (final Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  Future<void> filter({
    required final ProductFilterDto dto,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readReactions({
    required final String id,
    required final Function(GenericResponse<ReactionProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2/ReadReactions/$id",
        action: (final Response response) => onResponse(GenericResponse<ReactionProductReadDto>.fromJson(response.body, fromMap: ReactionProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> createReaction({
    required final ReactionCreateUpdateDto dto,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2/CreateReaction",
        body: dto,
        encodeBody: false,
        action: (final Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> filterReaction({
    required final ReactionFilterDto dto,
    required final Function(GenericResponse<ReactionProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        body: dto,
        url: "$baseUrl/ProductV2/FilterReaction",
        action: (final Response response) => onResponse(GenericResponse<ReactionProductReadDto>.fromJson(response.body, fromMap: ReactionProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
