part of "../data.dart";

class ProductService {
  ProductService({
    required this.apiKey,
    required this.token,
    required this.httpClient,
  });

  final String? token;
  final String apiKey;
  final UHttpClient httpClient;

  void create({
    required final UProductCreateParams p,
    required final Function(UResponse<UProductResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/product/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UProductResponse>.fromJson(r, (final dynamic i) => UProductResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final UProductReadParams p,
    required final Function(UResponse<List<UProductResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/product/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(
          UResponse<List<UProductResponse>>.fromJson(
            r,
            (final dynamic i) => List<UProductResponse>.from((i as List<dynamic>).map((final dynamic x) => UProductResponse.fromMap(x))),
          ),
        ),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UProductResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/product/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UProductResponse>.fromJson(r, (final dynamic i) => UProductResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void update({
    required final UProductUpdateParams p,
    required final Function(UResponse<UProductResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      httpClient.post(
        "/product/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UProductResponse>.fromJson(r, (final dynamic i) => UProductResponse.fromMap(i))),
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
        "/product/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
