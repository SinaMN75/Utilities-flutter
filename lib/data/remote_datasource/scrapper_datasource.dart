part of '../data.dart';

class ScrapperDataSource {
  final String baseUrl;

  ScrapperDataSource({required this.baseUrl});

  void readByUserName({
    required final String username,
    required final Function(InstaPostReadDto response) onResponse,
    required final Function() onError,
  }) async {
    httpGet(
      url: "$baseUrl/Scrapper/GetInstaPostRapidApi/$username",
      action: (final Response response) {
        onResponse(InstaPostReadDto.fromJson(response.bodyString ?? "{}"));
      },
      error: (final Response response) {
        onError();
      },
    );
  }
}
