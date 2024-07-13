part of '../data.dart';

class NotificationDataSource {

  NotificationDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void read({
    required final Function(GenericResponse<NotificationReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Notification",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.body, fromMap: NotificationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
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
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.body, fromMap: NotificationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
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
        apiKey: apiKey,
        body: filter,
        action: (Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.body, fromMap: NotificationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
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
        apiKey: apiKey,
        body: notificationIds,
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
