part of '../data.dart';

class CommentDataSource {
  final String baseUrl;

  CommentDataSource({required this.baseUrl});

  Future<void> create({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Comment",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> filter({
    required final CommentFilterDto dto,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Comment/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> toggleLike({
    required final String commentId,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Comment/ToggleLikeComment/$commentId",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> addReaction({
    required final String commentId,
    required final int reactionCode,
    required final VoidCallback onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Comment/AddReactionToComment/$commentId/$reactionCode",
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> update({
    required final String id,
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto> errorResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Comment?id=$id",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Comment/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readByProductId({
    required final String id,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Comment/ReadByProductId/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
  Future<void> readByUserId({
    required final String id,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Comment/ReadByUserId/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
  Future<void> delete({
    required final String id,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Comment?id=$id",
        action: (Response response) => onResponse(GenericResponse.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
