part of "../data.dart";

class ExamService {
  ExamService({
    required this.apiKey,
    required this.baseUrl,
  });

  final String apiKey;
  final String baseUrl;

  void create({
    required final UExamCreateParams p,
    required final Function(UResponse<UExamResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/exam/Create",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r, Response? c) => onOk(UResponse<UExamResponse>.fromJson(r.body, (final dynamic i) => UExamResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void read({
    required final UExamReadParams p,
    required final Function(UResponse<List<UExamResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/exam/Read",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r, Response? c) => onOk(
      UResponse<List<UExamResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UExamResponse>.from((i as List<dynamic>).map((final dynamic x) => UExamResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UExamResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/exam/ReadById",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r, Response? c) => onOk(UResponse<UExamResponse>.fromJson(r.body, (final dynamic i) => UExamResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void delete({
    required final UIdListParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/category/Delete",
    body: p.toIdListMap(),
    onSuccess: (final Response r, Response? c) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void submitAnswers({
    required final USubmitAnswersParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/exam/SubmitAnswers",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r, Response? c) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );
}
