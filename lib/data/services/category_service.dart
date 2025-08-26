part of "../data.dart";

class CategoryService {
  CategoryService({
    required this.apiKey,
    required this.token,
    required this.httpClient,
  });

  final String? token;
  final String apiKey;
  final UHttpClient httpClient;
  void create({
    required final UCategoryCreateParams p,
    required final Function(UResponse<UCategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/category/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UCategoryResponse>.fromJson(r, (final dynamic i) => UCategoryResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final UCategoryReadParams p,
    required final Function(UResponse<List<UCategoryResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/category/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(
          UResponse<List<UCategoryResponse>>.fromJson(
            r,
            (final dynamic i) => List<UCategoryResponse>.from((i as List<dynamic>).map((final dynamic x) => UCategoryResponse.fromMap(x))),
          ),
        ),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UCategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/category/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UCategoryResponse>.fromJson(r, (final dynamic i) => UCategoryResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void update({
    required final UCategoryUpdateParams p,
    required final Function(UResponse<UCategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/category/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UCategoryResponse>.fromJson(r, (final dynamic i) => UCategoryResponse.fromMap(i))),
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
      httpClient.post(
        "/category/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
