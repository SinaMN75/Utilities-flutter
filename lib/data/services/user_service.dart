part of "../data.dart";

class UserService {
  UserService({
    required this.apiKey,
    required this.token,
    required this.httpClient,
  });

  final String? token;
  final String apiKey;
  final UHttpClient httpClient;

  void create({
    required final UUserCreateParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/user/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UUserResponse>.fromJson(r, (final dynamic i) => UUserResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void bulkCreate({
    required final UUserBulkCreateParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/user/BulkCreate",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final UUserReadParams p,
    required final Function(UResponse<List<UUserResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/User/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(
          UResponse<List<UUserResponse>>.fromJson(
            r,
            (final dynamic i) => List<UUserResponse>.from(
              (i as List<dynamic>).map((final dynamic x) => UUserResponse.fromMap(x)),
            ),
          ),
        ),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    httpClient.post(
      "/user/ReadById",
      body: p.toMap().add("apiKey", apiKey).add("token", token),
      onSuccess: (final String r) => onOk(UResponse<UUserResponse>.fromJson(r, (final dynamic i) => UUserResponse.fromMap(i))),
      onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
      onException: (dynamic e) {
        if (onException != null) onException(e);
      },
    );
  }

  void update({
    required final UUserUpdateParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    httpClient.post(
      "/user/Update",
      body: p.toMap().add("apiKey", apiKey).add("token", token),
      onSuccess: (final String r) => onOk(UResponse<UUserResponse>.fromJson(r, (final dynamic i) => UUserResponse.fromMap(i))),
      onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
      onException: (dynamic e) {
        if (onException != null) onException(e);
      },
    );
  }

  void delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) {
    httpClient.post(
      "/user/Delete",
      body: p.toMap().add("apiKey", apiKey).add("token", token),
      onSuccess: (final String r) => onOk(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
      onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
      onException: (dynamic e) {
        if (onException != null) onException(e);
      },
    );
  }
}
