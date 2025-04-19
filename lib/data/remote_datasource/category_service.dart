import 'package:http/http.dart';
import 'package:u/data/params/base_params.dart';
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
    required final IdParams p,
    required final Function(UResponse<UserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    SimpleHttp().post(
      "$baseUrl/category/ReadById",
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
      "$baseUrl/category/Update",
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
  }) =>
      SimpleHttp().post(
        "$baseUrl/category/Read",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(
          UResponse<List<CategoryResponse>>.fromJson(
            r.body,
            (i) => List<CategoryResponse>.from(i.map((x) => CategoryResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (e) {
          if (onException != null) onException(e);
        },
      );

  void create({
    required final CategoryCreateParams p,
    required final Function(UResponse<CategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      SimpleHttp().post(
        "$baseUrl/category/Create",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<CategoryResponse>.fromJson(r.body, (final dynamic i) => CategoryResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (e) {
          if (onException != null) onException(e);
        },
      );

  void delete({
    required final IdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      SimpleHttp().post(
        "$baseUrl/category/Delete",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (e) {
          if (onException != null) onException(e);
        },
      );
}
