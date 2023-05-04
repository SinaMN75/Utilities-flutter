import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/mail_sms_notification.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class MailSmsNotificationDataSource {
  final String baseUrl;

  MailSmsNotificationDataSource({required this.baseUrl});

  Future<void> create({
    required final CreateMailSmsNotificationDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/MailSmsNotification/SendNotification",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: CreateMailSmsNotificationDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );


}
