import 'package:get/get.dart';
import 'package:utilities/data/dto/dto.dart';
import 'package:utilities/utils/http_interceptor.dart';

class GroupChatDataSource {
  GroupChatDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> readMyGroupChats({
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadMyGroupChats",
        action: (final Response response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> readGroupById({
    required final String groupId,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatById/$groupId",
        action: (final Response response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> filterGroupChat({
    required final GroupChatFilterDto filter,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/FilterGroupChat",
        body: filter,
        action: (final Response response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> createGroup({
    required final GroupChatCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChat",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> deleteGroup({
    required final String groupId,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Chat/DeleteGroupChat/$groupId",
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: ChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> updateGroup({
    required final GroupChatCreateUpdateDto dto,
    required final Function(GenericResponse<GroupChatReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChat",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<GroupChatReadDto>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> exitFromGroup({
    required final String groupId,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/ExitFromGroup/$groupId",
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: ChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> readGroupMessages({
    required final String groupId,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final int? pageSize,
    final int? pageNumber,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatMessages/$groupId?pageSize=${pageSize ?? 10000}&pageNumber=$pageNumber",
        action: (final Response response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> createMessage({
    required final CreateGroupChatMessage dto,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChatMessage",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> updateMessage({
    required final CreateGroupChatMessage dto,
    required final Function(GenericResponse<GroupChatMessageReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChatMessage",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<GroupChatMessageReadDto>.fromJson(response.body, fromMap: GroupChatMessageReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> deleteMessage({
    required final String chatId,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Chat/DeleteGroupChatMessage/$chatId",
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: ChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> seenGroupChatMessage({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/SeenGroupChatMessage/$id",
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: GroupChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
