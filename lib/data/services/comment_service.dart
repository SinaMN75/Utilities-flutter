part of "../data.dart";

class CommentService {
  CommentService({
    required this.baseUrl,
    required this.apiKey,
    required this.token,
  });

  final String? token;
  final String apiKey;
  final String baseUrl;

  void create({
    required final CommentCreateParams p,
    required final Function(UResponse<CommentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/comment/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<CommentResponse>.fromJson(r.body, (final dynamic i) => CommentResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final CommentReadParams p,
    required final Function(UResponse<List<CommentResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/comment/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<List<CommentResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<CommentResponse>.from((i as List<dynamic>).map((final dynamic x) => CommentResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final IdParams p,
    required final Function(UResponse<CommentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/comment/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<CommentResponse>.fromJson(r.body, (final dynamic i) => CommentResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void update({
    required final CommentUpdateParams p,
    required final Function(UResponse<CommentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/comment/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<CommentResponse>.fromJson(r.body, (final dynamic i) => CommentResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void delete({
    required final IdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/comment/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readProductCommentCount({
    required final IdParams p,
    required final Function(UResponse<int> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/comment/ReadProductCommentCount",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<int>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readUserCommentCount({
    required final IdParams p,
    required final Function(UResponse<int> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/comment/ReadUserCommentCount",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<int>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
