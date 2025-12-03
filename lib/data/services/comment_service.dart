part of "../data.dart";

class CommentService {
  CommentService({
    required this.apiKey,
    required this.baseUrl,
  });

  final String apiKey;
  final String baseUrl;

  void create({
    required final UCommentCreateParams p,
    required final Function(UResponse<UCommentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/comment/Create",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(UResponse<UCommentResponse>.fromJson(r.body, (final dynamic i) => UCommentResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void read({
    required final UCommentReadParams p,
    required final Function(UResponse<List<UCommentResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/comment/Read",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UCommentResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UCommentResponse>.from((i as List<dynamic>).map((final dynamic x) => UCommentResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UCommentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/comment/ReadById",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(UResponse<UCommentResponse>.fromJson(r.body, (final dynamic i) => UCommentResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void update({
    required final UCommentUpdateParams p,
    required final Function(UResponse<UCommentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/comment/Update",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(UResponse<UCommentResponse>.fromJson(r.body, (final dynamic i) => UCommentResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/comment/Delete",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void readProductCommentCount({
    required final UIdParams p,
    required final Function(UResponse<int> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/comment/ReadProductCommentCount",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(UResponse<int>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void readUserCommentCount({
    required final UIdParams p,
    required final Function(UResponse<int> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/comment/ReadUserCommentCount",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
        onSuccess: (final Response r) => onOk(UResponse<int>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );
}
