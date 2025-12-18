part of "../data.dart";

class DashboardService {
  Future<UHttpClientResponse> readSystemMetrics({
    required final Function(UMetricsResponse r) onOk,
    required final VoidCallback onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/ReadSystemMetrics",
    onSuccess: (final Response r) => onOk(UMetricsResponse.fromJson(r.body)),
    onError: (final Response r) => onError(),
    onException: onException,
  );

  Future<UHttpClientResponse> read({
    required final Function(UDashboardResponse r) onOk,
    required final VoidCallback onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Read",
    onSuccess: (final Response r) => onOk(UDashboardResponse.fromJson(r.body)),
    onError: (final Response r) => onError(),
    onException: onException,
  );

  void getLogStructure({
    required final Function(LogStructureResponse r) onOk,
    required final VoidCallback onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Logs/structure",
    onSuccess: (final Response r) => onOk(LogStructureResponse.fromJson(r.body)),
    onError: (final Response r) => onError(),
    onException: onException,
  );

  void getLogContent({
    required final String logId,
    required final Function(String r) onOk,
    required final VoidCallback onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Logs/content",
    body: <String, String>{"id": logId},
    onSuccess: (final Response r) => onOk(r.body),
    onError: (final Response r) => onError(),
    onException: onException,
  );
}
