part of "../data.dart";

class ExamService {
  ExamService({required this.baseUrl});

  final String baseUrl;

  void create({
    required final ExamCreateParams p,
    required final Function(UResponse<ExamResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/exam/Create",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<ExamResponse>.fromJson(r.body, (final dynamic i) => ExamResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final ExamReadParams p,
    required final Function(UResponse<List<ExamResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/exam/Read",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(
          UResponse<List<ExamResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<ExamResponse>.from((i as List<dynamic>).map((final dynamic x) => ExamResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readById({
    required final IdParams p,
    required final Function(UResponse<ExamResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/exam/ReadById",
        body: p.toIdParamMap(),
        onSuccess: (final Response r) => onOk(UResponse<ExamResponse>.fromJson(r.body, (final dynamic i) => ExamResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void delete({
    required final IdListParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/category/Delete",
        body: p.toIdListMap(),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void submitAnswers({
    required final SubmitAnswersParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/exam/SubmitAnswers",
        body: p.toMap(),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
