import 'package:http/http.dart';
import 'package:u/data/params/auth_params.dart';
import 'package:u/data/responses/auth_response.dart';
import 'package:u/data/responses/base_response.dart';
import 'package:u/utils/http_client.dart';

class AuthService {
  AuthService({required this.baseUrl});

  final String baseUrl;

  void register({
    required final RegisterParams p,
    required final Function(UResponse<LoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    SimpleHttp().post(
      "$baseUrl/auth/Register",
      body: p.toMap(),
      onSuccess: (final Response r) => onOk(UResponse<LoginResponse>.fromJson(r.body, (final dynamic i) => LoginResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (e) {
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
      SimpleHttp().post(
        "$baseUrl/auth/LoginWithUserNamePassword",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<LoginResponse>.fromJson(r.body, (final dynamic i) => LoginResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final e) {
          if (onException != null) onException(e);
        },
      );
}
