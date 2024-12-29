part of '../data.dart';

class ProductDataSource {
  ProductDataSource({required this.baseUrl});

  final String baseUrl;

  void create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void update({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.put,
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void read({
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/ProductV2",
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/ProductV2/$id",
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/ProductV2/$id",
        action: (final Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void filter({
    required final ProductFilterDto dto,
    required final Function(GenericResponse<ProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/ProductV2/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void createReaction({
    required final ReactionCreateUpdateDto dto,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/ProductV2/CreateReaction",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
