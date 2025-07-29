part of "../data.dart";

class UserService {
  UserService({required this.baseUrl});

  final String baseUrl;

  void create({
    required final UserCreateParams p,
    required final Function(UResponse<UserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/user/Create",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<UserResponse>.fromJson(r.body, (final dynamic i) => UserResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void bulkCreate({
    required final UserBulkCreateParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/user/BulkCreate",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final UserReadParams p,
    required final Function(UResponse<List<UserResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
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
    UHttpClient().post(
      "$baseUrl/user/ReadById",
      body: p.toMap(),
      onSuccess: (final Response r) => onOk(UResponse<UserResponse>.fromJson(r.body, (final dynamic i) => UserResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (dynamic e) {
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
    UHttpClient().post(
      "$baseUrl/user/Update",
      body: p.toMap(),
      onSuccess: (final Response r) => onOk(UResponse<UserResponse>.fromJson(r.body, (final dynamic i) => UserResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (dynamic e) {
        if (onException != null) onException(e);
      },
    );
  }

  void delete({
    required final IdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    UHttpClient().post(
      "$baseUrl/user/Delete",
      body: p.toMap(),
      onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (dynamic e) {
        if (onException != null) onException(e);
      },
    );
  }
}
