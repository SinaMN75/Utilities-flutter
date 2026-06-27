part of "../data.dart";

class AccountingService {
  // Fetch the money-in vs money-out report (system-wide or per-user).
  Future<UHttpClientResponse> report({
    required final UAccountingReportParams p,
    final Function(UResponse<UAccountingReportResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/accounting/Report",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<UAccountingReportResponse>.fromJson(
        r.body,
        (final dynamic i) => UAccountingReportResponse.fromMap(i),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );
}
