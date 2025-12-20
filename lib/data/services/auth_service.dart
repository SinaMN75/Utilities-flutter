part of "../data.dart";

class AuthService {
  Future<UHttpClientResponse> register({
    required final URegisterParams p,
    final Function(UResponse<ULoginResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/auth/Register",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> loginWithUserNamePassword({
    required final ULoginWithUserNamePasswordParams p,
    final Function(UResponse<ULoginResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/auth/LoginWithUserNamePassword",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> loginWithEmailPassword({
    required final ULoginWithEmailPasswordParams p,
    final Function(UResponse<ULoginResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/auth/LoginWithEmailPassword",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readUserByToken({
    required final UBaseParams p,
    final Function(UResponse<UUserResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/auth/ReadUserByToken",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UUserResponse>.fromJson(r.body, (final dynamic i) => UUserResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );
}
