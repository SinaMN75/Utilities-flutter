part of '../data.dart';

class GroupChatDataSource {
  GroupChatDataSource({required this.baseUrl});

  final String baseUrl;

  void readMyGroupChats({
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Chat/ReadMyGroupChats",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void readGroupById({
    required final String groupId,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Chat/ReadGroupChatById/$groupId",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void filterGroupChat({
    required final GroupChatFilterDto filter,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Chat/FilterGroupChat",
        body: filter,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void filterAllGroupChat({
    required final GroupChatFilterDto filter,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Chat/FilterAllGroupChat",
        body: filter,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void createGroup({
    required final GroupChatCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Chat/CreateGroupChat",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void deleteGroup({
    required final String groupId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/Chat/DeleteGroupChat/$groupId",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void updateGroup({
    required final GroupChatCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.put,
        url: "$baseUrl/Chat/UpdateGroupChat",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void exitFromGroup({
    required final String groupId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Chat/ExitFromGroup/$groupId",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void readGroupMessages({
    required final String groupId,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final int pageSize = 100,
    final int pageNumber = 1,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Chat/ReadGroupChatMessages/$groupId?pageSize=$pageSize&pageNumber=$pageNumber",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void createGroupChatMessage({
    required final GroupChatMessageCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Chat/CreateGroupChatMessage",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void updateMessage({
    required final GroupChatMessageCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.put,
        url: "$baseUrl/Chat/UpdateGroupChatMessage",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void deleteMessage({
    required final String chatId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/Chat/DeleteGroupChatMessage/$chatId",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void seenGroupChatMessage({
    required final String id,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Chat/SeenGroupChatMessage/$id",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );
}
