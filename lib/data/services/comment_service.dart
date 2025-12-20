part of "../data.dart";

class CommentService {
  Future<UHttpClientResponse> create({
    required final UCommentCreateParams p,
    final Function(UResponse<UCommentResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/comment/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UCommentResponse>.fromJson(r.body, (final dynamic i) => UCommentResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> read({
    required final UCommentReadParams p,
    final Function(UResponse<List<UCommentResponse>> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/comment/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UCommentResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UCommentResponse>.from((i as List<dynamic>).map((final dynamic x) => UCommentResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readById({
    required final UIdParams p,
    final Function(UResponse<UCommentResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/comment/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UCommentResponse>.fromJson(r.body, (final dynamic i) => UCommentResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> update({
    required final UCommentUpdateParams p,
    final Function(UResponse<UCommentResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/comment/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UCommentResponse>.fromJson(r.body, (final dynamic i) => UCommentResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> delete({
    required final UIdParams p,
    final Function(UResponse<dynamic> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/comment/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readProductCommentCount({
    required final UIdParams p,
    final Function(UResponse<int> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/comment/ReadProductCommentCount",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<int>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readUserCommentCount({
    required final UIdParams p,
    final Function(UResponse<int> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/comment/ReadUserCommentCount",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<int>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );
}
