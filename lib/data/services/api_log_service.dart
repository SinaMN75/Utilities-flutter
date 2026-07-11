part of "../data.dart";

class ApiLogService {
  Future<(UResponse<List<UApiLogResponse>>?, UEmptyResponse?, String?)> read({
    required final UApiLogReadParams p,
    final Function(UResponse<List<UApiLogResponse>> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) async {
    (UResponse<List<UApiLogResponse>>?, UEmptyResponse?, String?) result = (null, null, null);
    await UHttpClient.send(
      method: "POST",
      endpoint: "${U.baseUrl}/ApiLog/Read",
      body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
      onSuccess: (final Response r) {
        final UResponse<List<UApiLogResponse>> ok = UResponse<List<UApiLogResponse>>.fromJson(
          r.body,
          (final dynamic i) => List<UApiLogResponse>.from((i as List<dynamic>).map((final dynamic x) => UApiLogResponse.fromMap(x))),
        );
        result = (ok, null, null);
        onOk?.call(ok);
      },
      onError: (final Response r) {
        final UEmptyResponse err = UEmptyResponse.fromJson(r.body);
        result = (null, err, null);
        onError?.call(err);
      },
      onException: (final String e) {
        result = (null, null, e);
        onException?.call(e);
      },
    );
    return result;
  }

  Future<(UResponse<UApiLogStatsResponse>?, UEmptyResponse?, String?)> stats({
    required final UApiLogStatsParams p,
    final Function(UResponse<UApiLogStatsResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) async {
    (UResponse<UApiLogStatsResponse>?, UEmptyResponse?, String?) result = (null, null, null);
    await UHttpClient.send(
      method: "POST",
      endpoint: "${U.baseUrl}/ApiLog/Stats",
      body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
      onSuccess: (final Response r) {
        final UResponse<UApiLogStatsResponse> ok = UResponse<UApiLogStatsResponse>.fromJson(r.body, (final dynamic i) => UApiLogStatsResponse.fromMap(i));
        result = (ok, null, null);
        onOk?.call(ok);
      },
      onError: (final Response r) {
        final UEmptyResponse err = UEmptyResponse.fromJson(r.body);
        result = (null, err, null);
        onError?.call(err);
      },
      onException: (final String e) {
        result = (null, null, e);
        onException?.call(e);
      },
    );
    return result;
  }

  Future<(String?, UEmptyResponse?, String?)> export({
    required final UApiLogReadParams p,
    final Function(String csv)? onOk,
    final VoidCallback? onError,
    final Function(String e)? onException,
  }) async {
    (String?, UEmptyResponse?, String?) result = (null, null, null);
    await UHttpClient.send(
      method: "POST",
      endpoint: "${U.baseUrl}/ApiLog/Export",
      body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
      onSuccess: (final Response r) {
        final String ok = r.body;
        result = (ok, null, null);
        onOk?.call(ok);
      },
      onError: (final Response r) {
        final UEmptyResponse err = UEmptyResponse.fromJson(r.body);
        result = (null, err, null);
        onError?.call();
      },
      onException: (final String e) {
        result = (null, null, e);
        onException?.call(e);
      },
    );
    return result;
  }
}
