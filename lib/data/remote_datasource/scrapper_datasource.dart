part of '../data.dart';

class ScrapperDataSource {
  final String baseUrl;

  ScrapperDataSource({required this.baseUrl});

  Future<void> readByUserName({
    required final String username,
    required final Function(InstaPostReadDto response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async {
    final Response i = await GetConnect().get("$baseUrl/Scrapper/GetInstaPostRapidApi/$username");
    onResponse(InstaPostReadDto.fromJson(i.bodyString ?? "{}"));
  }
}
