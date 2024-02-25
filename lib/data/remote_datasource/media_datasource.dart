part of '../data.dart';

class MediaDataSource {
  final String baseUrl;

  MediaDataSource({required this.baseUrl});

  void create({
    required final FileData fileData,
    required final String fileExtension,
    required final List<int> tags,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
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
    final Duration? timeout,
  }) async {
    final FormData form = FormData(
      <String, dynamic>{
        'File': MultipartFile(kIsWeb ? fileData.bytes : File(fileData.path!), filename: fileData.path!.split('/').last),
        'CategoryId': categoryId,
        'ContentId': contentId,
        'GroupChatId': groupChatId,
        'NotificationId': notificationId,
        'GroupChatMessageId': groupChatMessageId,
        'ProductId': productId,
        'CommentId': commentId,
        'BookmarkId': bookmarkId,
        'ChatId': chatId,
        'UserId': userId,
        'Tags':fileData.tags?? tags,
        'Time':fileData.jsonDetail?.time?? time,
        'Artist':fileData.jsonDetail?.artist?? artist,
        'Album':fileData.jsonDetail?.album?? album,
        'Title':fileData.jsonDetail?.title?? title,
        'Size':fileData.jsonDetail?.size?? size,
      },
    );


    try {
      GetConnect connect = GetConnect(
        timeout: Duration(seconds: 200),
        maxAuthRetries: 10,
        maxRedirects: 10,
      );

      final Response<dynamic> response = await connect
          .post(
            '$baseUrl/Media',
            form,
            headers: <String, String>{
              "Authorization": getString(UtilitiesConstants.token) ?? "",
            },
            contentType: "multipart/form-data",
          )
          .timeout(Duration(seconds: 200));
      log("UPLOAD: ${response.statusCode} ${response.bodyString}");
      onResponse();
    } catch (e) {
      onError();
    }
  }

  void filter({
    required final MediaFilterDto dto,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Media/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<MediaReadDto>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void update({
    required final MediaUpdateDto dto,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Media",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<MediaReadDto>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void delete({
    required final String id,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Media/$id",
        action: (final Response response) => onResponse(),
        error: (final Response response) => onError(),
        failure: failure,
      );
}
