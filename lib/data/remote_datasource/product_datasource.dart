import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/product.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class ProductDataSource {
  final String baseUrl;

  ProductDataSource({required this.baseUrl});

  Future<void> create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> simpleSell({
    required final String buyerUserId,
    required final String productId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2/SimpleSell",
        body: <String, dynamic>{
          'buyerUserId': buyerUserId,
          "productId": productId,
        },
        encodeBody: false,
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  // class Me {
  // final File file;
  // final String useCase;
  // }

  //   Future<void> createWithMedia({
  //   required final ProductCreateUpdateDto dto,
  //   required final List<Me> files,
  //   required final Function(GenericResponse<ProductReadDto>) onResponse,
  //   required final Function(GenericResponse response) onError,
  //   final Function(String error)? failure,
  // }) async {
  //     Dio dio = Dio();
  //
  //     FormData formData = FormData();
  //     //
  //     // FormData media = FormData.fromMap({
  //     //   'Files': await MultipartFile.fromFile(file.path, filename: fileName),
  //     //   'UseCase': useCase,
  //     //   'ProductId': productId,
  //     //   'ChatId': chatId,
  //     //   'Title': title ?? fileName,
  //     //   'Size': size
  //     // });
  //
  //     for (var i in files) {
  //       var x = await MultipartFile.fromFile(i.path, filename: i.path);
  //       formData.files.add(MapEntry("Files", x));
  //       formData.fields.add(i.useCase)
  //     }
  //
  //
  //
  //
  //
  //     for (int i = 0; i < files!.length; i++) {
  //       File file = files[i];
  //       String fileName = file.path.split('/')[file.path.split('/').length - 1];
  //
  //       FormData form = FormData.fromMap({
  //         'Upload': media,
  //
  //         'UseCase': useCase,
  //         'CategoryId': categoryId,
  //         'ContentId': contentId,
  //         'ProductId': productId,
  //         'UserId': userId,
  //         'BookmarkId': bookmarkId,
  //         'ChatId': chatId,
  //         'Title': title ?? fileName,
  //         'NotificationId': notificationId,
  //         'Size': size,
  //
  //       });
  //
  //       final Response<dynamic> response = await dio.post(
  //         '$baseUrl/Media',
  //         onSendProgress: onSendProgress,
  //         data: FormData.fromMap({
  //           'Files': await MultipartFile.fromFile(file.path, filename: fileName),
  //
  //           'UseCase': useCase,
  //           'CategoryId': categoryId,
  //           'ContentId': contentId,
  //           'ProductId': productId,
  //           'UserId': userId,
  //           'BookmarkId': bookmarkId,
  //           'ChatId': chatId,
  //           'Title': title ?? fileName,
  //           'NotificationId': notificationId,
  //           'Size': size,
  //         }),
  //         options: Options(headers: <String, String>{
  //           "Authorization": getString(UtilitiesConstants.token) ?? "",
  //         }),
  //       );
  //
  //       if (response.isSuccessful()) {
  //         if (i == files.length - 1) {
  //           action();
  //         } else {
  //           onError(GenericResponse.fromJson(response.data));
  //         }
  //       }
  //     }
  //
  //
  //
  //   };

  Future<void> update({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> read({
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2/$id",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/ProductV2/$id",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
        failure: failure,
      );

  Future<void> filter({
    required final ProductFilterDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readMine({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2/Mine",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

// Future<void> createWithMedia({
//   required final String useCase,
//   required final VoidCallback action,
//   required final Function(GenericResponse response) onError,
//   final ProgressCallback? onSendProgress,
//   final List<File>? files,
//   final String? categoryId,
//   final String? contentId,
//   final String? productId,
//   final String? userId,
//   final String? chatId,
//   final String? title,
//   final String? notificationId,
//   final String? size,
//   Duration? timeout,
// }) async {
//   Dio dio = Dio();
//   for (int i = 0; i < files!.length; i++) {
//     File file = files[i];
//     String fileName = file.path.split('/')[file.path
//         .split('/')
//         .length - 1];
//     final Response<dynamic> response = await dio.post(
//       '$baseUrl/Media',
//       onSendProgress: onSendProgress,
//       data: FormData.fromMap({
//         'Files': await MultipartFile.fromFile(file.path, filename: fileName),
//         // 'Files': <MultipartFile>[await MultipartFile(file.path, filename: file.path)],
//         'UseCase': useCase,
//         'CategoryId': categoryId,
//         'ContentId': contentId,
//         'ProductId': productId,
//         'UserId': userId,
//         'ChatId': chatId,
//         'Title': title ?? fileName,
//         'NotificationId': notificationId,
//         'Size': size,
//       }),
//       options: Options(headers: <String, String>{
//         "Authorization": getString(UtilitiesConstants.token) ?? "",
//       }),
//     );
//
//     if (response.isSuccessful()) {
//       if (i == files.length - 1) {
//         action();
//       } else {
//         onError(GenericResponse.fromJson(response.data));
//       }
//     }
//   }
// }
}
