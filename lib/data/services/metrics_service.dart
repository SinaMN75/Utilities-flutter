part of "../data.dart";

class MetricsService {
  MetricsService({required this.baseUrl});

  final String baseUrl;

  void get({
    required final Function(MetricsResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().get(
        "$baseUrl/metrics",
        onSuccess: (final Response r) => onOk(MetricsResponse.fromJson(r.body)),
        onError: (final Response r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
