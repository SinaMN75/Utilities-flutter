part of "../data.dart";

class DashboardService {
  DashboardService({
    required this.apiKey,
    required this.token,
    required this.baseUrl,
  });

  final String? token;
  final String apiKey;
  final String baseUrl;

  void readSystemMetrics({
    required final Function(UMetricsResponse r) onOk,
    required final VoidCallback onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/dashboard/ReadSystemMetrics",
        onSuccess: (final Response r) => onOk(UMetricsResponse.fromJson(r.body)),
        onError: (final Response r) => onError(),
        onException: () => onException?.call(),
      );

  void read({
    required final Function(UDashboardResponse r) onOk,
    required final VoidCallback onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/dashboard/Read",
        onSuccess: (final Response r) => onOk(UDashboardResponse.fromJson(r.body)),
        onError: (final Response r) => onError(),
        onException: () => onException?.call(),
      );

  void getLogStructure({
    required final Function(LogStructureResponse r) onOk,
    required final VoidCallback onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/api/logs/structure",
        onSuccess: (final Response r) => onOk(LogStructureResponse.fromJson(r.body)),
        onError: (final Response r) => onError(),
        onException: () => onException?.call(),
      );

  void getLogContent({
    required final String logId,
    required final Function(List<LogContentResponse> r) onOk,
    required final VoidCallback onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/api/logs/content",
        body: <String, String>{"id": logId},
        onSuccess: (final Response r) => onOk(json.decode(r.body).map((dynamic e) => LogContentResponse.fromMap(e)).toList()),
        onError: (final Response r) => onError(),
        onException: () => onException?.call(),
      );
}
