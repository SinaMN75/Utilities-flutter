part of "../data.dart";

class UserService {
  Future<UHttpClientResponse> create({
    required final UUserCreateParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/user/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UUserResponse>.fromJson(r.body, (final dynamic i) => UUserResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> bulkCreate({
    required final UUserBulkCreateParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/user/BulkCreate",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> read({
    required final UUserReadParams p,
    required final Function(UResponse<List<UUserResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) async => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/User/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<List<UUserResponse>>.fromJson(r.body, (final dynamic i) => List<UUserResponse>.from((i as List<dynamic>).map((final dynamic x) => UUserResponse.fromMap(x))))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> readById({
    required final UIdParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/user/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UUserResponse>.fromJson(r.body, (final dynamic i) => UUserResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> update({
    required final UUserUpdateParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/user/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UUserResponse>.fromJson(r.body, (final dynamic i) => UUserResponse.fromMap(i))),
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
    endpoint: "${U.baseUrl}/user/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: onException,
    );
}
