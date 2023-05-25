import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class BlockDataSource {
  final String baseUrl;

  BlockDataSource({required this.baseUrl});

  Future<void> create({
    required final String userId,
    required final Function(GenericResponse<dynamic>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Block?userId=$userId",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.data)),
        error: (Response response) => onError(GenericResponse()),
        failure: failure,
      );

  Future<void> read({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Block",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readMine({
    required final Function(GenericResponse<UserReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Block/ReadMine",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.data, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
}
