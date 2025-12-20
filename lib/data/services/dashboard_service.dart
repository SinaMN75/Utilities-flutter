part of "../data.dart";

class DashboardService {
  Future<UHttpClientResponse> readSystemMetrics({
    final Function(UMetricsResponse r)? onOk,
    final VoidCallback? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/ReadSystemMetrics",
    onSuccess: (final Response r) => onOk?.call(UMetricsResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> read({
    final Function(UDashboardResponse r)? onOk,
    final VoidCallback? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Read",
    onSuccess: (final Response r) => onOk?.call(UDashboardResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(),
    onException: (String e) => onException?.call(e),
  );

  void getLogStructure({
    final Function(LogStructureResponse r)? onOk,
    final VoidCallback? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Logs/structure",
    onSuccess: (final Response r) => onOk?.call(LogStructureResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(),
    onException: (String e) => onException?.call(e),
  );

  void getLogContent({
    required final String logId,
    final Function(String r)? onOk,
    final VoidCallback? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Logs/content",
    body: <String, String>{"id": logId},
    onSuccess: (final Response r) => onOk?.call(r.body),
    onError: (final Response r) => onError?.call(),
    onException: (String e) => onException?.call(e),
  );
}
