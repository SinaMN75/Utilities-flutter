import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/notification.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class NotificationDataSource {
  final String baseUrl;

  NotificationDataSource({required this.baseUrl});

  Future<void> read({
    required final Function(GenericResponse<NotificationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Notification",
        action: (Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.data, fromMap: NotificationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<NotificationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Notification/$id",
        action: (Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.data, fromMap: NotificationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> filter({
    required final NotificationFilterReadDto filter,
    required final Function(GenericResponse<NotificationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Notification/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse<NotificationReadDto>.fromJson(response.data, fromMap: NotificationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> updateSeenStatus({
    required final List<String> notificationIds,
    required final int status,
    required final VoidCallback onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        encodeBody: false,
        url: "$baseUrl/Notification/UpdateSeenStatus?seenStatus=$status",
        body: notificationIds,
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
}
