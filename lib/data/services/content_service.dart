part of "../data.dart";

class ContentService {
  ContentService({
    required this.apiKey,
    required this.token,
  });

  final String? token;
  final String apiKey;

  void create({
    required final UContentCreateParams p,
    required final Function(UResponse<UContentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/content/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UContentResponse>.fromJson(r, (final dynamic i) => UContentResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final UContentReadParams p,
    required final Function(UResponse<List<UContentResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/content/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(
          UResponse<List<UContentResponse>>.fromJson(
            r,
            (final dynamic i) => List<UContentResponse>.from((i as List<dynamic>).map((final dynamic x) => UContentResponse.fromMap(x))),
          ),
        ),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UContentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/content/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UContentResponse>.fromJson(r, (final dynamic i) => UContentResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void update({
    required final UContentUpdateParams p,
    required final Function(UResponse<UContentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/content/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UContentResponse>.fromJson(r, (final dynamic i) => UContentResponse.fromMap(i))),
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
        "/content/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
