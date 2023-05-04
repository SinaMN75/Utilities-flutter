import 'package:dio/dio.dart';
import 'package:utilities/data/dto/chat.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class ChatDataSource {
  final String baseUrl;

  ChatDataSource({required this.baseUrl});

  Future<void> create({
    required final ChatCreateDto dto,
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> update({
    required final ChatCreateDto dto,
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Chat",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> read({
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat",
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readByUserId({
    required final String userId,
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/$userId",
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> delete({
    required final String chatId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Chat?id=$chatId",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  String toJ(ChatReadDto chatReadDto){
    return chatReadDto.toJson();
  }
}
