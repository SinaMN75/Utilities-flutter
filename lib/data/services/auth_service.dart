part of "../data.dart";

class AuthService {
  AuthService({
    required this.apiKey,
    required this.token,
    required this.httpClient,
  });

  final String? token;
  final String apiKey;
  final UHttpClient httpClient;

  void register({
    required final URegisterParams p,
    required final Function(UResponse<ULoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    httpClient.post(
      "/auth/Register",
      body: p.toMap().add("apiKey", apiKey).add("token", token),
      onSuccess: (final String r) => onOk(UResponse<ULoginResponse>.fromJson(r, (final dynamic i) => ULoginResponse.fromMap(i))),
      onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
      onException: (dynamic e) {
        if (onException != null) onException(e);
      },
    );
  }

  void loginWithUserNamePassword({
    required final ULoginWithUserNamePasswordParams p,
    required final Function(UResponse<ULoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/auth/LoginWithUserNamePassword",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<ULoginResponse>.fromJson(r, (final dynamic i) => ULoginResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void loginWithEmailPassword({
    required final ULoginWithEmailPasswordParams p,
    required final Function(UResponse<ULoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/auth/LoginWithEmailPassword",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<ULoginResponse>.fromJson(r, (final dynamic i) => ULoginResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readUserByToken({
    required final UBaseParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/auth/ReadUserByToken",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UUserResponse>.fromJson(r, (final dynamic i) => UUserResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
