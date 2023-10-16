part of '../data.dart';

class ScrapperDataSource {
  final String baseUrl;

  ScrapperDataSource({required this.baseUrl});

  Future<void> readByUserName({
    required final String username,
    required final Function(InstaPostReadDto response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/GetInstaPostRapidApi/$username",
        action: (Response response) => onResponse(InstaPostReadDto.fromJson(response.bodyString ?? "")),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
