import 'package:dio/dio.dart';
import 'package:utilities/data/dto/follow_bookmark.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class FollowBookmarkDataSource {
  final String baseUrl;

  FollowBookmarkDataSource({required this.baseUrl});

  Future<void> readBookmarksByFolderName({
    required final Function(GenericResponse<BookmarkReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    required final String folderName,
    required final String userId,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/FollowBookmark/ReadBookmarksByFolderName?userId=$userId&folderName=$folderName",
        action: (Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.data, fromMap: BookmarkReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readBookmarks({
    required final Function(GenericResponse<BookmarkReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final String? userId,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: userId != null ? "$baseUrl/FollowBookmark/ReadBookmarks?userId=$userId" : "$baseUrl/FollowBookmark/ReadBookmarks",
        action: (Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.data, fromMap: BookmarkReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readFollowers({
    required final String userId,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowers/$userId",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse()),
        failure: failure,
      );

  Future<void> readFollowings({
    required final String userId,
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ReadFollowings/$userId",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse()),
        failure: failure,
      );

  Future<void> removeFollowing({
    required final ToggleFollow dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/RemoveFollowing",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>()),
        error: (Response response) => onError(GenericResponse()),
        failure: failure,
      );

  Future<void> toggleBookmark({
    required final ToggleBookmark dto,
    required final Function(GenericResponse<BookmarkReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleBookmark",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<BookmarkReadDto>.fromJson(response.data, fromMap: BookmarkReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse()),
        failure: failure,
      );

  Future<void> toggleFollow({
    required final ToggleFollow dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/FollowBookmark/ToggleFolllow",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>()),
        error: (Response response) => onError(GenericResponse()),
        failure: failure,
      );
}
