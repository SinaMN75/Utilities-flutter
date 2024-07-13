part of '../data.dart';

class MailSmsNotificationDataSource {

  MailSmsNotificationDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void create({
    required final CreateMailSmsNotificationDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/MailSmsNotification/SendNotification",
        apiKey: apiKey,
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: CreateMailSmsNotificationDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
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
        apiKey: apiKey,
        body: dto,
        action: (Response response) => onResponse == null ? () {} : onResponse(GenericResponse<String>.fromJson(response.body)),
        error: (Response response) => onError == null ? () {} : onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
