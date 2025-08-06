part of "../data.dart";

class CategoryService {
  CategoryService({required this.baseUrl, required this.apiKey});

  final String apiKey;
  final String baseUrl;

  void create({
    required final CategoryCreateParams p,
    required final Function(UResponse<CategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/category/Create",
        body: p.toMap().add("apiKey", apiKey),
        onSuccess: (final Response r) => onOk(UResponse<CategoryResponse>.fromJson(r.body, (final dynamic i) => CategoryResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final CategoryReadParams p,
    required final Function(UResponse<List<CategoryResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/category/Read",
        body: p.toMap().add("apiKey", apiKey),
        onSuccess: (final Response r) => onOk(
          UResponse<List<CategoryResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<CategoryResponse>.from((i as List<dynamic>).map((final dynamic x) => CategoryResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final IdParams p,
    required final Function(UResponse<CategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/category/ReadById",
        body: p.toMap().add("apiKey", apiKey),
        onSuccess: (final Response r) => onOk(UResponse<CategoryResponse>.fromJson(r.body, (final dynamic i) => CategoryResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void update({
    required final CategoryUpdateParams p,
    required final Function(UResponse<CategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/category/Update",
        body: p.toMap().add("apiKey", apiKey),
        onSuccess: (final Response r) => onOk(UResponse<CategoryResponse>.fromJson(r.body, (final dynamic i) => CategoryResponse.fromMap(i))),
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
        "$baseUrl/category/Delete",
        body: p.toMap().add("apiKey", apiKey),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
