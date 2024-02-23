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
        'File': MultipartFile(kIsWeb ? fileData.bytes : File(fileData.path!), filename: ":).$fileExtension"),
        'Tags': tags,
        'CategoryId': categoryId,
        'ContentId': contentId,
        'GroupChatId': groupChatId,
        'GroupChatMessageId': groupChatMessageId,
        'ProductId': productId,
        'UserId': userId,
        'Time': time,
        'Artist': artist,
        'Album': album,
        'CommentId': commentId,
        'BookmarkId': bookmarkId,
        'ChatId': chatId,
        'Title': title,
        'NotificationId': notificationId,
        'Size': size,
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
    required final String mediaId,
    final String? title,
    final String? size,
    final List<int>? tags,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Media/$mediaId",
        body: MediaReadDto(jsonDetail: MediaJsonDetail(title: title, size: size), tags: tags, url: ""),
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
