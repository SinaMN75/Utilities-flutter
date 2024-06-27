part of '../data.dart';

class NotificationDataSource {
  final String baseUrl;

  NotificationDataSource({required this.baseUrl});

  void read({
    required final Function(GenericResponse<NotificationReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Notification",
        action: (http.Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.body, fromMap: NotificationReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<NotificationReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Notification/$id",
        action: (http.Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.body, fromMap: NotificationReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void filter({
    required final NotificationFilterReadDto filter,
    required final Function(GenericResponse<NotificationReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Notification/Filter",
        body: filter,
        action: (http.Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.body, fromMap: NotificationReadDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void updateSeenStatus({
    required final List<String> notificationIds,
    required final int status,
    required final VoidCallback onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        encodeBody: false,
        url: "$baseUrl/Notification/UpdateSeenStatus?seenStatus=$status",
        body: notificationIds,
        action: (http.Response response) => onResponse(),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
