part of "../data.dart";

class ProductService {
  ProductService({
    required this.baseUrl,
    required this.apiKey,
    required this.token,
  });

  final String? token;
  final String apiKey;
  final String baseUrl;

  void create({
    required final ProductCreateParams p,
    required final Function(UResponse<ProductResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/product/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<ProductResponse>.fromJson(r.body, (final dynamic i) => ProductResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final CategoryReadParams p,
    required final Function(UResponse<List<ProductResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/product/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<List<ProductResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<ProductResponse>.from((i as List<dynamic>).map((final dynamic x) => ProductResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final IdParams p,
    required final Function(UResponse<ProductResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/product/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<ProductResponse>.fromJson(r.body, (final dynamic i) => ProductResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void update({
    required final CategoryUpdateParams p,
    required final Function(UResponse<ProductResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/product/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<ProductResponse>.fromJson(r.body, (final dynamic i) => ProductResponse.fromMap(i))),
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
        "$baseUrl/product/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
