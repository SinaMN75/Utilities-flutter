part of '../data.dart';

class ScrapperDataSource {

  ScrapperDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void readByUserName({
    required final String username,
    required final Function(InstaPostReadDto response) onResponse,
    required final Function() onError,
  }) async {
    httpGet(
      url: "$baseUrl/Scrapper/GetInstaPostRapidApi/$username",
      apiKey: apiKey,
      action: (final Response response) {
        onResponse(InstaPostReadDto.fromJson(response.bodyString ?? "{}"));
      },
      error: (final Response response) {
        onError();
      },
    );
  }
}
