part of '../data.dart';

class CommentDataSource {

  CommentDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;
  void create({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Comment",
        apiKey: apiKey,
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void filter({
    required final CommentFilterDto dto,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Comment/Filter",
        apiKey: apiKey,
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void toggleLike({
    required final String commentId,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Comment/ToggleLikeComment/$commentId",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void addReaction({
    required final String commentId,
    required final int reactionCode,
    required final VoidCallback onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Comment/AddReactionToComment/$commentId/$reactionCode",
        apiKey: apiKey,
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void update({
    required final String id,
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto> errorResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Comment?id=$id",
        apiKey: apiKey,
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Comment/$id",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void readByProductId({
    required final String id,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Comment/ReadByProductId/$id",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void readByUserId({
    required final String id,
    required final Function(GenericResponse<CommentReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Comment/ReadByUserId/$id",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, fromMap: CommentReadDto.fromMap)),
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
        url: "$baseUrl/Comment?id=$id",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
