part of "../data.dart";

class AuthService {
  AuthService({
    required this.apiKey,
    required this.baseUrl,
  });

  final String apiKey;
  final String baseUrl;

  void register({
    required final URegisterParams p,
    required final Function(UResponse<ULoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) {
    UHttpClient.post(
      "$baseUrl/auth/Register",
      body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
      onSuccess: (final Response r) => onOk(UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (String e) => onException(e),
    );
  }

  void loginWithUserNamePassword({
    required final ULoginWithUserNamePasswordParams p,
    required final Function(UResponse<ULoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/auth/LoginWithUserNamePassword",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void loginWithEmailPassword({
    required final ULoginWithEmailPasswordParams p,
    required final Function(UResponse<ULoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/auth/LoginWithEmailPassword",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void readUserByToken({
    required final UBaseParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/auth/ReadUserByToken",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(UResponse<UUserResponse>.fromJson(r.body, (final dynamic i) => UUserResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );
}
