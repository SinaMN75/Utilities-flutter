part of '../data.dart';

class ProductDataSource {
  ProductDataSource({required this.baseUrl});

  final String baseUrl;

  void create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void update({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void read({
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/ProductV2",
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/ProductV2/$id",
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/ProductV2/$id",
        action: (final Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void filter({
    required final ProductFilterDto dto,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/ProductV2/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readReactions({
    required final String id,
    required final Function(GenericResponse<ReactionProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/ProductV2/ReadReactions/$id",
        action: (final Response response) => onResponse(GenericResponse<ReactionProductReadDto>.fromJson(response.body, fromMap: ReactionProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void createReaction({
    required final ReactionCreateUpdateDto dto,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/ProductV2/CreateReaction",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void filterReaction({
    required final ReactionFilterDto dto,
    required final Function(GenericResponse<ReactionProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        body: dto,
        url: "$baseUrl/ProductV2/FilterReaction",
        action: (final Response response) => onResponse(GenericResponse<ReactionProductReadDto>.fromJson(response.body, fromMap: ReactionProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
