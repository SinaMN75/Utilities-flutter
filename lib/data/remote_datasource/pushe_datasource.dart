import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/data/dto/pushe.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class PusheDataSource {
  PusheDataSource();

  Future<void> create({
    required final String token,
    required final String appIds,
    required final String title,
    required final String content,
    required final List<String> userIds,
    required final Function(PusheReadDto pusheReadDto) onResponse,
    required final VoidCallback error,
    final String? bigTitle,
    final String? bigContent,
    final bool? showForeground,
    final bool? isDraft,
    final String? url,
    final String? actionType,
    Duration? timeout,
  }) async {
    Dio dio = Dio();
    final Map<String, String> header = <String, String>{"Authorization": "Token $token", "Content-Type": "application/json"};
    PusheCreateDto dto = PusheCreateDto(
        appIds: appIds,
        data: PusheData(
          title: title,
          bigTitle: bigTitle,
          content: content,
          bigContent: bigContent,
          showForeground: showForeground ?? false,
          action: PusheAction(
            actionType: actionType ?? 'U',
            url: url,
          ),
        ),
        isDraft: isDraft ?? false,
        filter: PusheFilter(
          customId: userIds,
        ));
    Response response = await dio.post('https://api.pushe.co/v2/messaging/notifications/', data: dto.toJson(), options: Options(headers: header));

    if (response.isSuccessful()) {
      onResponse(PusheReadDto.fromMap(response.data));
    } else {
      error();
    }
  }
}
