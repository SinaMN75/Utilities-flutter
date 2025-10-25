part of "../data.dart";

class ContentService {
  ContentService({
    required this.apiKey,
    required this.token,
    required this.baseUrl,
  });

  final String? token;
  final String apiKey;
  final String baseUrl;

  void create({
    required final UContentCreateParams p,
    required final Function(UResponse<UContentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/content/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<UContentResponse>.fromJson(r.body, (final dynamic i) => UContentResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void read({
    required final UContentReadParams p,
    required final Function(UResponse<List<UContentResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/content/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UContentResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UContentResponse>.from((i as List<dynamic>).map((final dynamic x) => UContentResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UContentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/content/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<UContentResponse>.fromJson(r.body, (final dynamic i) => UContentResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void update({
    required final UContentUpdateParams p,
    required final Function(UResponse<UContentResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/content/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<UContentResponse>.fromJson(r.body, (final dynamic i) => UContentResponse.fromMap(i))),
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
        "$baseUrl/content/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );
}
