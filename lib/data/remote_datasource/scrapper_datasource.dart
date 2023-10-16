part of '../data.dart';

class ScrapperDataSource {
  final String baseUrl;

  ScrapperDataSource({required this.baseUrl});

  Future<void> read({
    required final String username,
    required final Function(GenericResponse<InstaPostReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/GetInstaPostRapidApi/$username",
        action: (Response response) => onResponse(GenericResponse<InstaPostReadDto>.fromJson(response.body, fromMap: ContentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
