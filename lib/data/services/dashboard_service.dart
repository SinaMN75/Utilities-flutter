part of "../data.dart";

class DashboardService {
  DashboardService({required this.baseUrl});

  final String baseUrl;

  void readSystemMetrics({
    required final Function(UMetricsResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/dashboard/ReadSystemMetrics",
        onSuccess: (final String r) => onOk(UMetricsResponse.fromJson(r)),
        onError: (final String r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void read({
    required final Function(UDashboardResponse r) onOk,
    required final VoidCallback onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient().post(
        "$baseUrl/dashboard/Read",
        onSuccess: (final String r) => onOk(UDashboardResponse.fromJson(r)),
        onError: (final String r) => onError(),
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
        onSuccess: (final String r) => onOk(LogStructureResponse.fromJson(r)),
        onError: (final String r) => onError(),
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
        body: <String, String>{"id": logId},
        onSuccess: (final String r) => onOk(json.decode(r).map((dynamic e) => LogContentResponse.fromMap(e)).toList()),
        onError: (final String r) => onError(),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
