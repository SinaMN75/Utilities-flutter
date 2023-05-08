import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/media.dart';
import 'package:utilities/utils/constants.dart';
import 'package:utilities/utils/dio_interceptor.dart';
import 'package:utilities/utils/local_storage.dart';

class MediaDataSource {
  final String baseUrl;

  MediaDataSource({required this.baseUrl});

  Future<void> create({
    required final String useCase,
    required final VoidCallback action,
    required final Function(GenericResponse response) onError,
    final ProgressCallback? onSendProgress,
    final Function(List<ResponseMediaDto> list)? onResponse,
    final List<File>? files,
    final String? categoryId,
    final String? contentId,
    final String? productId,
    final String? userId,
    final String? commentId,
    final String? chatId,
    final String? time,
    final String? artist,
    final bool? isPrivate,
    final String? album,
    final String? groupChatId,
    final String? groupChatMessageId,
    final String? bookmarkId,
    final String? title,
    final String? notificationId,
    final String? size,
    final Duration? timeout,
  }) async {
    Dio dio = Dio();
    List<ResponseMediaDto> mediResponseList = <ResponseMediaDto>[];
    for (int i = 0; i < files!.length; i++) {
      File file = files[i];
      String fileName = file.path.split('/')[file.path.split('/').length - 1];

      final Response<dynamic> response = await dio.post(
        '$baseUrl/Media',
        onSendProgress: onSendProgress,
        data: FormData.fromMap({
          'Files': await MultipartFile.fromFile(file.path, filename: fileName),
          'UseCase': useCase,
          'CategoryId': categoryId,
          'ContentId': contentId,
          'GroupChatId': groupChatId,
          'GroupChatMessageId': groupChatMessageId,
          'ProductId': productId,
          'UserId': userId,
          'IsPrivate': isPrivate,
          'Time': time,
          'Artist': artist,
          'Album': album,
          'CommentId': commentId,
          'BookmarkId': bookmarkId,
          'ChatId': chatId,
          'Title': title ?? fileName,
          'NotificationId': notificationId,
          'Size': size,
        }),
        options: Options(headers: <String, String>{
          "Authorization": getString(UtilitiesConstants.token) ?? "",
        }),
      );

      if (response.isSuccessful()) {
        List<ResponseMediaDto> l1 = List<ResponseMediaDto>.from(response.data['result'].cast<Map<String, dynamic>>().map(ResponseMediaDto.fromMap));
        mediResponseList.add(l1.first);
        if (i == files.length - 1) {
          action();
          if (onResponse != null) {
            onResponse(mediResponseList);
          }
        } else {
          onError(GenericResponse.fromJson(response.data));
        }
      }
    }
  }

  Future<void> createSingle({
    required final File file,
    required final String useCase,
    required final Function(ResponseMediaDto response) onResponse,
    required final Function(GenericResponse<dynamic> response) onError,
    final ProgressCallback? onSendProgress,
    final String? categoryId,
    final String? contentId,
    final String? productId,
    final String? userId,
    final String? commentId,
    final String? chatId,
    final String? time,
    final String? artist,
    final String? album,
    final String? groupChatId,
    final String? groupChatMessageId,
    final String? bookmarkId,
    final String? title,
    final String? notificationId,
    final String? size,
    final bool? isPrivate,
  }) async {
    final Dio dio = Dio();
    final String fileName = file.path.split('/').last;

    final Response<dynamic> response = await dio.post(
      '$baseUrl/Media',
      onSendProgress: onSendProgress,
      data: FormData.fromMap(<String, dynamic>{
        'Files': await MultipartFile.fromFile(file.path, filename: fileName),
        'UseCase': useCase,
        'CategoryId': categoryId,
        'ContentId': contentId,
        'GroupChatId': groupChatId,
        'GroupChatMessageId': groupChatMessageId,
        'ProductId': productId,
        'UserId': userId,
        'IsPrivate': isPrivate,
        'Time': time,
        'Artist': artist,
        'Album': album,
        'CommentId': commentId,
        'BookmarkId': bookmarkId,
        'ChatId': chatId,
        'Title': title ?? fileName,
        'NotificationId': notificationId,
        'Size': size,
      }),
      options: Options(headers: <String, String>{
        "Authorization": getString(UtilitiesConstants.token) ?? "",
      }),
    );

    if (response.isSuccessful()) {
      final List<ResponseMediaDto> l1 = List<ResponseMediaDto>.from(response.data['result'].cast<Map<String, dynamic>>().map(ResponseMediaDto.fromMap)).toList();
      onResponse(l1.first);
    } else {
      onError(GenericResponse<dynamic>.fromJson(response.data));
    }
  }

  Future<void> createWeb({
    required final List<PlatformFile> files,
    required final String useCase, //media
    required final VoidCallback action,
    final Function(int statusCode)? error,
    final String? categoryId,
    final String? contentId,
    final String? commentId,
    final String? groupChatMessageId,
    final String? groupChatId,
    final String? productId, //8f11171f-c0a4-4a70-7fe2-08da91550c6f
    final String? userId,
    final String? chatId,
    final bool? isPrivate,
    final String? time,
    final String? artist,
    final String? album,
    final String? notificationId,
    final String? size,
    final String? title,
  }) async {
    // int i = 0;

    for (int i = 0; i < files.length; i++) {
      PlatformFile platformFile = files[i];
      Uint8List? uint8list = platformFile.bytes;
      final List<int> _selectedFile = uint8list!;
      String fileName = platformFile.name;
      final http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('$baseUrl/Media'));
      request.fields['UseCase'] = useCase;
      if (categoryId != null) {
        request.fields['CategoryId'] = categoryId;
      }

      if (productId != null) {
        request.fields['ProductId'] = productId;
      }

      if (userId != null) {
        request.fields['UserId'] = userId;
      }

      if (isPrivate != null) {
        request.fields['IsPrivate'] = isPrivate.toString();
      }

      if (time != null) {
        request.fields['Time'] = time;
      }
      if (artist != null) {
        request.fields['Artist'] = artist;
      }
      if (album != null) {
        request.fields['Album'] = album;
      }

      if (commentId != null) {
        request.fields['CommentId'] = commentId;
      }
      if (groupChatMessageId != null) {
        request.fields['GroupChatMessageId'] = groupChatMessageId;
      }
      if (groupChatId != null) {
        request.fields['GroupChatId'] = groupChatId;
      }

      if (chatId != null) {
        request.fields['ChatId'] = chatId;
      }

      if (contentId != null) {
        request.fields['ContentId'] = contentId;
      }

      if (notificationId != null) {
        request.fields['NotificationId'] = notificationId;
      }
      if (size != null) {
        request.fields['Size'] = size;
      }

      request.fields['Title'] = title ?? fileName;

      request.headers['Authorization'] = getString(UtilitiesConstants.token) ?? "";

      request.files.add(http.MultipartFile.fromBytes('Files', _selectedFile, filename: fileName));

      await request.send().then((final http.StreamedResponse response) {
        if (response.statusCode == 200) {
          if (i == files.length - 1) {
            action();
          }
        } else {
          if (i == files.length - 1) {
            error!(response.statusCode);
          }
        }
      });
    }
  }

  Future<void> createLink({
    required final List<String> links,
    required final String useCase,
    required final VoidCallback action,
    required final Function(GenericResponse response) onError,
    final ProgressCallback? onSendProgress,
    final String? categoryId,
    final String? contentId,
    final String? productId,
    final String? groupChatId,
    final String? groupChatMessageId,
    final String? commentId,
    final String? userId,
    final String? time,
    final String? artist,
    final String? album,
    final String? chatId,
    final String? notificationId,
    final String? size,
    final Duration? timeout,
  }) async {
    Dio dio = Dio();
    for (int i = 0; i < links.length; i++) {
      final String link = links[i];
      final Response<dynamic> response = await dio.post(
        '$baseUrl/Media',
        onSendProgress: onSendProgress,
        data: FormData.fromMap({
          'Links': <String>[link],
          'UseCase': useCase,
          'CategoryId': categoryId,
          'ContentId': contentId,
          'CommentId': commentId,
          'ProductId': productId,
          'GroupChatId': groupChatId,
          'GroupChatMessageId': groupChatMessageId,
          'Time': time,
          'Artist': artist,
          'Album': album,
          'UserId': userId,
          'ChatId': chatId,
          'NotificationId': notificationId,
          'Size': size,
        }),
        options: Options(headers: <String, String>{
          "Authorization": getString(UtilitiesConstants.token) ?? "",
        }),
      );

      if (response.isSuccessful()) {
        if (i == links.length - 1) {
          action();
        } else {
          onError(GenericResponse.fromJson(response.data));
        }
      }
    }
  }

  Future<void> update({
    required final String mediaId,
    final String? title,
    final String? size,
    final String? useCase,
    required final Function(GenericResponse<MediaReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Media/$mediaId",
        body: MediaReadDto(title: title, useCase: useCase, size: size),
        action: (final Response response) => onResponse(GenericResponse<MediaReadDto>.fromJson(response.data, fromMap: MediaReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Media/$id",
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: MediaReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
}

class MultipartBody {
  String key;
  File file;

  MultipartBody(this.key, this.file);
}
