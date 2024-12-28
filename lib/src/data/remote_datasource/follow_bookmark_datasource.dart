part of '../data.dart';

class FollowBookmarkDataSource {
  final String baseUrl;

  FollowBookmarkDataSource({required this.baseUrl});

  void readBookmarksByFolderName({
    required final Function(GenericResponse<BookmarkReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    required final String folderName,
    required final String userId,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/FollowBookmark/ReadBookmarksByFolderName?userId=$userId&folderName=$folderName",
        action: (final Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.body, fromMap: BookmarkReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readBookmarks({
    required final Function(GenericResponse<BookmarkReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final String? userId,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: userId != null ? "$baseUrl/FollowBookmark/ReadBookmarks?userId=$userId" : "$baseUrl/FollowBookmark/ReadBookmarks",
        action: (final Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.body, fromMap: BookmarkReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readFollowers({
    required final String userId,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/FollowBookmark/ReadFollowers/$userId",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse()),
      );

  void readFollowings({
    required final String userId,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/FollowBookmark/ReadFollowings/$userId",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse()),
      );

  void removeFollowing({
    required final ToggleFollow dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/FollowBookmark/RemoveFollowing",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<String>()),
        error: (final Response response) => onError(GenericResponse()),
      );

  void toggleBookmark({
    required final ToggleBookmark dto,
    required final Function(GenericResponse<BookmarkReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/FollowBookmark/ToggleBookmark",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.body, fromMap: BookmarkReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse()),
      );

  void toggleFollow({
    required final ToggleFollow dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/FollowBookmark/ToggleFolllow",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<String>()),
        error: (final Response response) => onError(GenericResponse()),
      );
}
