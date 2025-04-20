import 'package:http/http.dart';
import 'package:u/data/params/base_params.dart';
import 'package:u/data/params/user_params.dart';
import 'package:u/data/responses/base_response.dart';
import 'package:u/data/responses/user_response.dart';
import 'package:u/utils/http_client.dart';

class UserService {
  UserService({required this.baseUrl});

  final String baseUrl;

  void create({
    required final UserCreateParams p,
    required final Function(UResponse<UserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      SimpleHttp().post(
        "$baseUrl/user/Create",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<UserResponse>.fromJson(r.body, (final dynamic i) => UserResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final UserReadParams p,
    required final Function(UResponse<List<UserResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      SimpleHttp().post(
        "$baseUrl/User/Read",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UserResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UserResponse>.from(
              (i as List<dynamic>).map((final dynamic x) => UserResponse.fromMap(x)),
            ),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final IdParams p,
    required final Function(UResponse<UserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    SimpleHttp().post(
      "$baseUrl/user/ReadById",
      body: p.toMap(),
      onSuccess: (final Response r) => onOk(UResponse<UserResponse>.fromJson(r.body, (final dynamic i) => UserResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (e) {
        if (onException != null) onException(e);
      },
    );
  }

  void update({
    required final UserUpdateParams p,
    required final Function(UResponse<UserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    SimpleHttp().post(
      "$baseUrl/user/Update",
      body: p.toMap(),
      onSuccess: (final Response r) => onOk(UResponse<UserResponse>.fromJson(r.body, (final dynamic i) => UserResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (e) {
        if (onException != null) onException(e);
      },
    );
  }
}
