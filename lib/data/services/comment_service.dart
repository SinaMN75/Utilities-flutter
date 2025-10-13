part of "../data.dart";

class CommentService {
  CommentService({
    required this.apiKey,
    required this.token,
  });

  final String? token;
  final String apiKey;

  void create({
    required final UCommentCreateParams p,
    required final Function(UResponse<UCommentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/comment/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UCommentResponse>.fromJson(r, (final dynamic i) => UCommentResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final UCommentReadParams p,
    required final Function(UResponse<List<UCommentResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/comment/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(
          UResponse<List<UCommentResponse>>.fromJson(
            r,
            (final dynamic i) => List<UCommentResponse>.from((i as List<dynamic>).map((final dynamic x) => UCommentResponse.fromMap(x))),
          ),
        ),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UCommentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/comment/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UCommentResponse>.fromJson(r, (final dynamic i) => UCommentResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void update({
    required final UCommentUpdateParams p,
    required final Function(UResponse<UCommentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/comment/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UCommentResponse>.fromJson(r, (final dynamic i) => UCommentResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/comment/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readProductCommentCount({
    required final UIdParams p,
    required final Function(UResponse<int> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/comment/ReadProductCommentCount",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<int>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readUserCommentCount({
    required final UIdParams p,
    required final Function(UResponse<int> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/comment/ReadUserCommentCount",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<int>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
