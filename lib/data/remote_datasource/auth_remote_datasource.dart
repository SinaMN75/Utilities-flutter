import 'dart:ui';

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
    final VoidCallback? onException,
  }) {
    SimpleHttp().post(
      "$baseUrl/auth/Register",
      body: dto.toMap(),
      onSuccess: (response) => onOk(BaseResponse<UserResponse>.fromJson(response.body, fromMap: UserResponse.fromMap)),
      onError: (response) => onOk(BaseResponse.fromJson(response.body, fromMap: UserResponse.fromMap)),
      onException: (e) {
        if (onException != null) onException();
      },
    );
  }
}
