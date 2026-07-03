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

  // System-wide wallet/merchant/terminal/txn analytics for the financial & operations dashboard.
  Future<UHttpClientResponse> readFinancialOpsDashboard({
    required final UDashboardRangeParams p,
    final Function(UResponse<UFinancialOpsDashboardResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/ReadFinancialOpsDashboard",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<UFinancialOpsDashboardResponse>.fromJson(
        r.body,
        (final dynamic i) => UFinancialOpsDashboardResponse.fromMap(i),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  // Users/hotels/dorms/contracts/invoices analytics for the property dashboard.
  Future<UHttpClientResponse> readPropertyDashboard({
    required final UDashboardRangeParams p,
    final Function(UResponse<UPropertyDashboardResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/dashboard/ReadPropertyDashboard",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<UPropertyDashboardResponse>.fromJson(
        r.body,
        (final dynamic i) => UPropertyDashboardResponse.fromMap(i),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
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
