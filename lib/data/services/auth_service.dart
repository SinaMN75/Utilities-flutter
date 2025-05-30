part of "../data.dart";

class AuthService {
  AuthService({required this.baseUrl});

  final String baseUrl;

  void register({
    required final RegisterParams p,
    required final Function(UResponse<LoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    UHttpClient().post(
      "$baseUrl/auth/Register",
      body: p.toMap(),
      onSuccess: (final Response r) => onOk(UResponse<LoginResponse>.fromJson(r.body, (final dynamic i) => LoginResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (dynamic e) {
        if (onException != null) onException(e);
      },
    );
  }

  void login({
    required final LoginWithUserNamePasswordParams p,
    required final Function(UResponse<LoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/auth/LoginWithUserNamePassword",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<LoginResponse>.fromJson(r.body, (final dynamic i) => LoginResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
