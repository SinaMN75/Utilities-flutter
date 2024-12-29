part of '../data.dart';

class CommentDataSource {
  final String baseUrl;

  CommentDataSource({required this.baseUrl});

  void create({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Comment",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void filter({
    required final CommentFilterDto dto,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Comment/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void toggleLike({
    required final String commentId,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Comment/ToggleLikeComment/$commentId",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void addReaction({
    required final String commentId,
    required final int reactionCode,
    required final VoidCallback onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Comment/AddReactionToComment/$commentId/$reactionCode",
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void update({
    required final String id,
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto> errorResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.put,
        url: "$baseUrl/Comment?id=$id",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Comment/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readByProductId({
    required final String id,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Comment/ReadByProductId/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readByUserId({
    required final String id,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Comment/ReadByUserId/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/Comment?id=$id",
        action: (Response response) => onResponse(GenericResponse.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
