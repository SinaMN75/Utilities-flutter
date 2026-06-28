part of "../data.dart";

class AppSettingsService {
  // Reads server-side prices (vehicle service costs, operator presets) for the payment page.
  Future<UHttpClientResponse> read({
    required final UAppSettingsReadParams p,
    final Function(UResponse<UAppSettingsResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/AppSettings/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UAppSettingsResponse>.fromJson(r.body, (final dynamic i) => UAppSettingsResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );
}
