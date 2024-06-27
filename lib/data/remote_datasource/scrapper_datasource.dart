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
      action: (http.Response response) {
        onResponse(InstaPostReadDto.fromJson(response.body));
      },
      error: (http.Response response) {
        onError();
      },
    );
  }
}
