part of "../data.dart";

class SimService {
  Future<UHttpClientResponse> create({
    required final USimCreateParams p,
    final Function(UResponse<String> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Sim/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<String>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> read({
    required final USimReadParams p,
    final Function(UResponse<List<USimResponse>> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Sim/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<List<USimResponse>>.fromJson(r.body, (final dynamic i) => List<USimResponse>.from((i as List<dynamic>).map((final dynamic x) => USimResponse.fromMap(x))))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readById({
    required final UIdParams p,
    final Function(UResponse<USimResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Sim/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<USimResponse>.fromJson(r.body, (final dynamic i) => USimResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> update({
    required final USimUpdateParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Sim/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> delete({
    required final UIdParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Sim/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );
}
