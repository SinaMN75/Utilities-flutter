part of '../data.dart';

class GroupChatDataSource {
  GroupChatDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void readMyGroupChats({
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Chat/ReadMyGroupChats",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void readGroupById({
    required final String groupId,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatById/$groupId",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void filterGroupChat({
    required final GroupChatFilterDto filter,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/FilterGroupChat",
        apiKey: apiKey,
        body: filter,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void filterAllGroupChat({
    required final GroupChatFilterDto filter,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/FilterAllGroupChat",
        apiKey: apiKey,
        body: filter,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void createGroup({
    required final GroupChatCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChat",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void deleteGroup({
    required final String groupId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Chat/DeleteGroupChat/$groupId",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void updateGroup({
    required final GroupChatCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChat",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void exitFromGroup({
    required final String groupId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/ExitFromGroup/$groupId",
        apiKey: apiKey,
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
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatMessages/$groupId?pageSize=$pageSize&pageNumber=$pageNumber",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void filterGroupChatMessages({
    required final GroupChatMessageFilterDto filter,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final int pageSize = 100,
    final int pageNumber = 1,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/FilterGroupChatMessages",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void createGroupChatMessage({
    required final GroupChatMessageCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChatMessage",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void updateMessage({
    required final GroupChatMessageCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChatMessage",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void deleteMessage({
    required final String chatId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Chat/DeleteGroupChatMessage/$chatId",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void seenGroupChatMessage({
    required final String id,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Chat/SeenGroupChatMessage/$id",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );
}
