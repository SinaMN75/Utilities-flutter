part of '../data.dart';

class BlockDataSource {
  final String baseUrl;

  BlockDataSource({required this.baseUrl});

  void create({
    required final String userId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Block?userId=$userId",
        action: (http.Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body)),
        error: (http.Response response) => onError(GenericResponse()),
        failure: failure,
      );

  void read({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Block",
        action: (http.Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void readMine({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Block/ReadMine",
        action: (http.Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
