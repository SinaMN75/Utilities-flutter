part of "../data.dart";

class MetricsService {
  MetricsService({required this.baseUrl});

  final String baseUrl;

  void get({
    required final Function(UResponse<MetricsResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) => UHttpClient().get(
      "$baseUrl/metrics",
      onSuccess: (final Response r) => onOk(UResponse<MetricsResponse>.fromJson(r.body, (final dynamic i) => MetricsResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (dynamic e) {
        if (onException != null) onException(e);
      },
    );
}
