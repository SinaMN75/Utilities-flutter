part of '../data.dart';

class FollowBookmarkDataSource {
  final String baseUrl;

  FollowBookmarkDataSource({required this.baseUrl});

  void readBookmarksByFolderName({
    required final Function(GenericResponse<BookmarkReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    required final String folderName,
    required final String userId,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/FollowBookmark/ReadBookmarksByFolderName?userId=$userId&folderName=$folderName",
        action: (final Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.body, fromMap: BookmarkReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void readBookmarks({
    required final Function(GenericResponse<BookmarkReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final String? userId,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: userId != null ? "$baseUrl/FollowBookmark/ReadBookmarks?userId=$userId" : "$baseUrl/FollowBookmark/ReadBookmarks",
        action: (final Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.body, fromMap: BookmarkReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void readFollowers({
    required final String userId,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowers/$userId",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse()),
        failure: failure,
      );

  void readFollowings({
    required final String userId,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowings/$userId",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse()),
        failure: failure,
      );

  void removeFollowing({
    required final ToggleFollow dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/FollowBookmark/RemoveFollowing",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<String>()),
        error: (final Response response) => onError(GenericResponse()),
        failure: failure,
      );

  void toggleBookmark({
    required final ToggleBookmark dto,
    required final Function(GenericResponse<BookmarkReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleBookmark",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.body, fromMap: BookmarkReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse()),
        failure: failure,
      );

  void toggleFollow({
    required final ToggleFollow dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleFolllow",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<String>()),
        error: (final Response response) => onError(GenericResponse()),
        failure: failure,
      );
}
