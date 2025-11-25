part of "../data.dart";

class CategoryService {
  CategoryService({
    required this.apiKey,
    required this.baseUrl,
  });

  final String apiKey;
  final String baseUrl;

  void create({
    required final UCategoryCreateParams p,
    required final Function(UResponse<UCategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/category/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<UCategoryResponse>.fromJson(r.body, (final dynamic i) => UCategoryResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void read({
    required final UCategoryReadParams p,
    required final Function(UResponse<List<UCategoryResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/category/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UCategoryResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UCategoryResponse>.from((i as List<dynamic>).map((final dynamic x) => UCategoryResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UCategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/category/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<UCategoryResponse>.fromJson(r.body, (final dynamic i) => UCategoryResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void update({
    required final UCategoryUpdateParams p,
    required final Function(UResponse<UCategoryResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/category/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<UCategoryResponse>.fromJson(r.body, (final dynamic i) => UCategoryResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/category/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );
}
