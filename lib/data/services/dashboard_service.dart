part of "../data.dart";

class DashboardService {
  DashboardService({
    required this.apiKey,
    required this.token,
    required this.httpClient,
  });

  final String? token;
  final String apiKey;
  final UHttpClient httpClient;

  void readSystemMetrics({
    required final Function(UMetricsResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/dashboard/ReadSystemMetrics",
        onSuccess: (final String r) => onOk(UMetricsResponse.fromJson(r)),
        onError: (final String r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final Function(UDashboardResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/dashboard/Read",
        onSuccess: (final String r) => onOk(UDashboardResponse.fromJson(r)),
        onError: (final String r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void getLogStructure({
    required final Function(LogStructureResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/api/logs/structure",
        onSuccess: (final String r) => onOk(LogStructureResponse.fromJson(r)),
        onError: (final String r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void getLogContent({
    required final String logId,
    required final Function(List<LogContentResponse> r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/api/logs/content",
        body: <String, String>{"id": logId},
        onSuccess: (final String r) => onOk(json.decode(r).map((dynamic e) => LogContentResponse.fromMap(e)).toList()),
        onError: (final String r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
