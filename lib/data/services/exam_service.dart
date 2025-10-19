part of "../data.dart";

class ExamService {
  ExamService({
    required this.apiKey,
    required this.token,
    required this.baseUrl,
  });

  final String? token;
  final String apiKey;
  final String baseUrl;

  void create({
    required final UExamCreateParams p,
    required final Function(UResponse<UExamResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/exam/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<UExamResponse>.fromJson(r.body, (final dynamic i) => UExamResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void read({
    required final UExamReadParams p,
    required final Function(UResponse<List<UExamResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/exam/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UExamResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UExamResponse>.from((i as List<dynamic>).map((final dynamic x) => UExamResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UExamResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/exam/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<UExamResponse>.fromJson(r.body, (final dynamic i) => UExamResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void delete({
    required final UIdListParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/category/Delete",
        body: p.toIdListMap(),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void submitAnswers({
    required final USubmitAnswersParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/exam/SubmitAnswers",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );
}
