part of "../data.dart";

class AuthService {
  AuthService({
    required this.apiKey,
    required this.token,
  });

  final String? token;
  final String apiKey;

  void register({
    required final URegisterParams p,
    required final Function(UResponse<ULoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) {
    UHttpClient.post(
      "/auth/Register",
      body: p.toMap().add("apiKey", apiKey).add("token", token),
      onSuccess: (final Response r) => onOk(UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: () => onException?.call(),
    );
  }

  void loginWithUserNamePassword({
    required final ULoginWithUserNamePasswordParams p,
    required final Function(UResponse<ULoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/auth/LoginWithUserNamePassword",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void loginWithEmailPassword({
    required final ULoginWithEmailPasswordParams p,
    required final Function(UResponse<ULoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/auth/LoginWithEmailPassword",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void readUserByToken({
    required final UBaseParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/auth/ReadUserByToken",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<UUserResponse>.fromJson(r.body, (final dynamic i) => UUserResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );
}
