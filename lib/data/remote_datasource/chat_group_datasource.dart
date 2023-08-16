import 'package:dio/dio.dart';
import 'package:utilities/data/dto/chat.dart';
import 'package:utilities/data/dto/chat_group.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class ChatGroupDataSource {
  final String baseUrl;

  ChatGroupDataSource({required this.baseUrl});

  Future<void> readMyGroups({
    required final Function(GenericResponse<ChatGroupReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadMyGroupChats",
        action: (final Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readGroupById({
    required final String groupId,
    required final Function(GenericResponse<ChatGroupReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatById/$groupId",
        action: (final Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> filterGroupChat({
    required final ChatGroupFilterDto filter,
    required final Function(GenericResponse<ChatGroupReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/FilterGroupChat",
        body: filter,
        action: (final Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> createGroup({
    required final ChatGroupCreateUpdateDto dto,
    required final Function(GenericResponse<ChatGroupReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChat",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
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
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> updateGroup({
    required final ChatGroupCreateUpdateDto dto,
    required final Function(GenericResponse<ChatGroupReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChat",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
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
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readGroupMessages({
    required final String groupId,
    required final Function(GenericResponse<ChatGroupMessageReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final int? pageSize,
    final int? pageNumber,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatMessages/$groupId?pageSize=${pageSize ?? 10000}&pageNumber=$pageNumber",
                action: (final Response response) => onResponse(GenericResponse<ChatGroupMessageReadDto>.fromJson(response.data, fromMap: ChatGroupMessageReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> createMessage({
    required final CreateGroupMessage dto,
    required final Function(GenericResponse<ChatGroupMessageReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChatMessage",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ChatGroupMessageReadDto>.fromJson(response.data, fromMap: ChatGroupMessageReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> updateMessage({
    required final CreateGroupMessage dto,
    required final Function(GenericResponse<ChatGroupMessageReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChatMessage",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<ChatGroupMessageReadDto>.fromJson(response.data, fromMap: ChatGroupMessageReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
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
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
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
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
}
