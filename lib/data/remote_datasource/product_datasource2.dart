import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:utilities/data/dto/generic_response.dart';


class Me {
  final File? file;
  final String? useCase;

  Me({this.file, this.useCase});
}

class ProductDataSource2 {
  final String baseUrl;

  ProductDataSource2({required this.baseUrl});

  Future<void> createWithMedia({
    required final String useCase,
    required final VoidCallback action,
    required final Function(GenericResponse response) onError,
    final ProgressCallback? onSendProgress,
    final List<Me>? files,
    final String? categoryId,
    final String? contentId,
    final String? productId,
    final String? userId,
    final String? chatId,
    final String? title,
    final String? notificationId,
    final String? size,
    Duration? timeout,
  }) async {
    // Dio dio = Dio();
    for (int i = 0; i < files!.length; i++) {
      // File file = files[i];
      // String fileName = file.path.split('/')[file.path.split('/').length - 1];
      // final Response<dynamic> response = await dio.post(
      //   '$baseUrl/Media',
      //   onSendProgress: onSendProgress,
      //   data: FormData.fromMap({
      //     'Files': await MultipartFile.fromFile(file.path, filename: fileName),
      //     // 'Files': <MultipartFile>[await MultipartFile(file.path, filename: file.path)],
      //     'UseCase': useCase,
      //     'CategoryId': categoryId,
      //     'ContentId': contentId,
      //     'ProductId': productId,
      //     'UserId': userId,
      //     'ChatId': chatId,
      //     'Title': title ?? fileName,
      //     'NotificationId': notificationId,
      //     'Size': size,
      //   }),
      //   options: Options(headers: <String, String>{
      //     "Authorization": getString(UtilitiesConstants.token) ?? "",
      //   }),
      // );

      // if (response.isSuccessful()) {
      //   if (i == files.length - 1) {
      //     action();
      //   } else {
      //     onError(GenericResponse.fromJson(response.data));
      //   }
      // }
    }
  }
}
