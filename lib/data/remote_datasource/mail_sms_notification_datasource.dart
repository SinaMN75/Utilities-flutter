part of '../data.dart';

class MailSmsNotificationDataSource {
  final String baseUrl;

  MailSmsNotificationDataSource({required this.baseUrl});

  void create({
    required final CreateMailSmsNotificationDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/MailSmsNotification/SendNotification",
        body: dto,
        action: (http.Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: CreateMailSmsNotificationDto.fromMap)),
        error: (http.Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void sendOtpSms({
    required final SendOtpSmsDto dto,
    final Function(GenericResponse response)? onResponse,
    final Function(GenericResponse errorResponse)? onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/MailSmsNotification/SendOtpSms",
        body: dto,
        action: (http.Response response) => onResponse == null ? () {} : onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (http.Response response) => onError == null ? () {} : onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
