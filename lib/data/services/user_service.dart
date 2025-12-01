part of "../data.dart";

class UserService {
  UserService({
    required this.apiKey,
    required this.baseUrl,
  });

  final String apiKey;
  final String baseUrl;

  void create({
    required final UUserCreateParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.post(
    "$baseUrl/user/Create",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UUserResponse>.fromJson(r.body, (final dynamic i) => UUserResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException(e),
  );

  void bulkCreate({
    required final UUserBulkCreateParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.post(
    "$baseUrl/user/BulkCreate",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException(e),
  );

  Future<UResponse<List<UUserResponse>>?> read({
    required final UUserReadParams p,
    required final Function(UResponse<List<UUserResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) async {
    final Response? r = await UHttpClient.post(
      "$baseUrl/User/Read",
      body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
      onSuccess: (final Response r) => onOk(
        UResponse<List<UUserResponse>>.fromJson(
          r.body,
          (final dynamic i) => List<UUserResponse>.from(
            (i as List<dynamic>).map((final dynamic x) => UUserResponse.fromMap(x)),
          ),
        ),
      ),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (String e) => onException(e),
    );
    if (r.isSuccessful()) {
      return UResponse<List<UUserResponse>>.fromJson(
        r!.body,
        (final dynamic i) => List<UUserResponse>.from(
          (i as List<dynamic>).map((final dynamic x) => UUserResponse.fromMap(x)),
        ),
      );
    }
    return null;
  }

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) {
    UHttpClient.post(
      "$baseUrl/user/ReadById",
      body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
      onSuccess: (final Response r) => onOk(UResponse<UUserResponse>.fromJson(r.body, (final dynamic i) => UUserResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (String e) => onException(e),
    );
  }

  void update({
    required final UUserUpdateParams p,
    required final Function(UResponse<UUserResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) {
    UHttpClient.post(
      "$baseUrl/user/Update",
      body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
      onSuccess: (final Response r) => onOk(UResponse<UUserResponse>.fromJson(r.body, (final dynamic i) => UUserResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (String e) => onException(e),
    );
  }

  void delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) {
    UHttpClient.post(
      "$baseUrl/user/Delete",
      body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
      onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (String e) => onException(e),
    );
  }
}
