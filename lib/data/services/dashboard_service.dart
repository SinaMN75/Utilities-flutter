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

  // ── New DB-backed API request log endpoints (ApiLogService). ──────────────
  Future<UHttpClientResponse> searchLogs({
    required final UApiLogSearchParams p,
    final Function(UResponse<List<UApiLogListItemResponse>> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Logs/Search",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UApiLogListItemResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UApiLogListItemResponse>.from((i as List<dynamic>).map((final dynamic x) => UApiLogListItemResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> logDetail({
    required final UIdParams p,
    final Function(UResponse<UApiLogDetailResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Logs/Detail",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UApiLogDetailResponse>.fromJson(r.body, (final dynamic i) => UApiLogDetailResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> logStats({
    required final UApiLogStatsParams p,
    final Function(UResponse<UApiLogStatsResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Logs/Stats",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UApiLogStatsResponse>.fromJson(r.body, (final dynamic i) => UApiLogStatsResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  // CSV export honoring the same filters as searchLogs - returns the raw file text (not the usual
  // UResponse envelope, since Logs/Export responds with a text/csv file body directly).
  Future<UHttpClientResponse> exportLogs({
    required final UApiLogSearchParams p,
    final Function(String csv)? onOk,
    final VoidCallback? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/Logs/Export",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(r.body),
    onError: (final Response r) => onError?.call(),
    onException: (String e) => onException?.call(e),
  );
}
