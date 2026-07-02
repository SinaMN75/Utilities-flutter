part of "../data.dart";

class ApiLogService {
  Future<UHttpClientResponse> read({
    required final UApiLogReadParams p,
    final Function(UResponse<List<UApiLogResponse>> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/ApiLog/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UApiLogResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UApiLogResponse>.from((i as List<dynamic>).map((final dynamic x) => UApiLogResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> stats({
    required final UApiLogStatsParams p,
    final Function(UResponse<UApiLogStatsResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/ApiLog/Stats",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UApiLogStatsResponse>.fromJson(r.body, (final dynamic i) => UApiLogStatsResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> export({
    required final UApiLogReadParams p,
    final Function(String csv)? onOk,
    final VoidCallback? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/ApiLog/Export",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(r.body),
    onError: (final Response r) => onError?.call(),
    onException: (String e) => onException?.call(e),
  );
}
