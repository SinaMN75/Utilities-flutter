part of '../data.dart';

class MailSmsNotificationDataSource {
  final String baseUrl;

  MailSmsNotificationDataSource({required this.baseUrl});

  Future<void> create({
    required final CreateMailSmsNotificationDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/MailSmsNotification/SendNotification",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: CreateMailSmsNotificationDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> sendOtpSms({
    required final SendOtpSmsDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/MailSmsNotification/SendOtpSms",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
