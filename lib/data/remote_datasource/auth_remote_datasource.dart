import 'package:http/http.dart';
import 'package:u/data/params/auth_params.dart';
import 'package:u/data/responses/auth_response.dart';
import 'package:u/data/responses/base_response.dart';
import 'package:u/utils/http_client.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({required this.baseUrl});

  final String baseUrl;

  void register({
    required final RegisterParams dto,
    required final Function(UResponse<LoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      SimpleHttp().post(
        "$baseUrl/auth/Register",
        body: dto.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<LoginResponse>.fromJson(r.body)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body)),
        onException: (e) {
          if (onException != null) onException(e);
        },
      );

  void login({
    required final RegisterParams dto,
    required final Function(UResponse<LoginResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      SimpleHttp().post(
        "$baseUrl/auth/LoginWithPassword",
        body: dto.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<LoginResponse>.fromJson(r.body)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body)),
        onException: (e) {
          if (onException != null) onException(e);
        },
      );
}
