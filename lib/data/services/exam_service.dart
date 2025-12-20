part of "../data.dart";

class ExamService {
  Future<UHttpClientResponse> create({
    required final UExamCreateParams p,
    final Function(UResponse<UExamResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/exam/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UExamResponse>.fromJson(r.body, (final dynamic i) => UExamResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> read({
    required final UExamReadParams p,
    final Function(UResponse<List<UExamResponse>> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/exam/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UExamResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UExamResponse>.from((i as List<dynamic>).map((final dynamic x) => UExamResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readById({
    required final UIdParams p,
    final Function(UResponse<UExamResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/exam/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UExamResponse>.fromJson(r.body, (final dynamic i) => UExamResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> delete({
    required final UIdListParams p,
    final Function(UResponse<dynamic> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/category/Delete",
    body: p.toIdListMap(),
    onSuccess: (final Response r) => onOk?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> submitAnswers({
    required final USubmitAnswersParams p,
    final Function(UResponse<dynamic> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/exam/SubmitAnswers",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );
}
