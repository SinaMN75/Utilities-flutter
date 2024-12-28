part of '../data.dart';

class BlockDataSource {
  final String baseUrl;

  BlockDataSource({required this.baseUrl});

  void create({
    required final String userId,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Block?userId=$userId",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse()),
      );

  void read({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Block",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readMine({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Block/ReadMine",
        action: (Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
