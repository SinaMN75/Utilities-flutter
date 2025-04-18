import 'dart:convert';

import 'package:http/src/response.dart';
import 'package:u/data/params/auth_params.dart';
import 'package:u/data/responses/base_response.dart';
import 'package:u/data/responses/user_response.dart';
import 'package:u/utils/http_client.dart';

class AuthRemoteDataSource {
  final String baseUrl;

  AuthRemoteDataSource({required this.baseUrl});

  void register({
    required final RegisterParams dto,
    required final Function(BaseResponse<UserResponse> r) onOk,
    required final Function(BaseResponse e) onError,
    final Function(Exception e)? onException,
  }) {
    SimpleHttp().post(
      "$baseUrl/auth/Register",
      body: dto.toMap(),
      onSuccess: (final Response response) => onOk(BaseResponse<UserResponse>.fromJson(
        jsonDecode(response.body),
        (json) => UserResponse.fromJson(json),
      )),
      onError: (final response) {
        return onError(BaseResponse<dynamic>.fromJson(
          jsonDecode(response.body),
          (json) => UserResponse.fromJson(json),
        ));
      },
      onException: (final e) {
        if (onException != null) onException(e);
      },
    );
  }
}
