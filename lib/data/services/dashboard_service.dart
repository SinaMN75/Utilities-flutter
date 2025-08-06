part of "../data.dart";

class DashboardService {
  DashboardService({required this.baseUrl});

  final String baseUrl;

  void readSystemMetrics({
    required final Function(MetricsResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/dashboard/ReadSystemMetrics",
        onSuccess: (final Response r) => onOk(MetricsResponse.fromJson(r.body)),
        onError: (final Response r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final Function(DashboardResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/dashboard/Read",
        onSuccess: (final Response r) => onOk(DashboardResponse.fromJson(r.body)),
        onError: (final Response r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void getLogStructure({
    required final Function(LogStructureResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/api/logs/structure",
        onSuccess: (final Response r) => onOk(LogStructureResponse.fromJson(r.body)),
        onError: (final Response r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void getLogContent({
    required final String logId,
    required final Function(List<LogContentResponse> r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/api/logs/content",
        body: <String, String>{'id': logId},
        onSuccess: (final Response r) => onOk(json.decode(r.body).map((dynamic e) => LogContentResponse.fromMap(e)).toList()),
        onError: (final Response r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
