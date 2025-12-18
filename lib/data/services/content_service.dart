part of "../data.dart";

class ContentService {
  Future<UHttpClientResponse> create({
    required final UContentCreateParams p,
    required final Function(UResponse<UContentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/content/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UContentResponse>.fromJson(r.body, (final dynamic i) => UContentResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> read({
    required final UContentReadParams p,
    required final Function(UResponse<List<UContentResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/content/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(
      UResponse<List<UContentResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UContentResponse>.from((i as List<dynamic>).map((final dynamic x) => UContentResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> readById({
    required final UIdParams p,
    required final Function(UResponse<UContentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/content/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UContentResponse>.fromJson(r.body, (final dynamic i) => UContentResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> update({
    required final UContentUpdateParams p,
    required final Function(UResponse<UContentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/content/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UContentResponse>.fromJson(r.body, (final dynamic i) => UContentResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/content/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );
}
