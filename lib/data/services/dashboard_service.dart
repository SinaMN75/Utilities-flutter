part of "../data.dart";

class DashboardService {
  DashboardService({required this.baseUrl});

  final String baseUrl;

  void readSystemMetrics({
    required final Function(MetricsResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/dashboard/ReadSystemMetrics",
        onSuccess: (final Response r) => onOk(MetricsResponse.fromJson(r.body)),
        onError: (final Response r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final Function(DashboardResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/dashboard/Read",
        onSuccess: (final Response r) => onOk(DashboardResponse.fromJson(r.body)),
        onError: (final Response r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
