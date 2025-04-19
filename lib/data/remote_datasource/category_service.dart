import 'package:http/http.dart';
import 'package:u/data/params/category_params.dart';
import 'package:u/data/params/user_params.dart';
import 'package:u/data/responses/base_response.dart';
import 'package:u/data/responses/category.dart';
import 'package:u/data/responses/user_response.dart';
import 'package:u/utils/http_client.dart';

class CategoryService {
  CategoryService({required this.baseUrl});

  final String baseUrl;

  void readById({
    required final UserReadParams p,
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

  void read({
    required final CategoryReadParams p,
    required final Function(UResponse<List<CategoryResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    SimpleHttp().post(
      "$baseUrl/user/Update",
      body: p.toMap(),
      onSuccess: (final Response r) => onOk(UResponse<List<CategoryResponse>>.fromJson(
        r.body,
            (data) => List<CategoryResponse>.from(data.map((x) => CategoryResponse.fromMap(x))),
      )),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (e) {
        if (onException != null) onException(e);
      },
    );
  }
}
