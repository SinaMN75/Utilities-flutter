part of '../data.dart';

class GroupChatDataSource {
  GroupChatDataSource({required this.baseUrl});

  final String baseUrl;

  void readMyGroupChats({
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Chat/ReadMyGroupChats",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void readGroupById({
    required final String groupId,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatById/$groupId",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void filterGroupChat({
    required final GroupChatFilterDto filter,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/FilterGroupChat",
        body: filter,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void filterAllGroupChat({
    required final GroupChatFilterDto filter,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/FilterAllGroupChat",
        body: filter,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void createGroup({
    required final GroupChatCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChat",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void deleteGroup({
    required final String groupId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Chat/DeleteGroupChat/$groupId",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void updateGroup({
    required final GroupChatCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChat",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void exitFromGroup({
    required final String groupId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/ExitFromGroup/$groupId",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void readGroupMessages({
    required final String groupId,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final int pageSize = 100,
    final int pageNumber = 1,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatMessages/$groupId?pageSize=$pageSize&pageNumber=$pageNumber",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void createGroupChatMessage({
    required final GroupChatMessageCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChatMessage",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void updateMessage({
    required final GroupChatMessageCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChatMessage",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void deleteMessage({
    required final String chatId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Chat/DeleteGroupChatMessage/$chatId",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void seenGroupChatMessage({
    required final String id,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/SeenGroupChatMessage/$id",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );
}
