part of '../data.dart';

class MediaDataSource {
  MediaDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> create({
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
    final String? token,
    final Duration? timeout,
  }) async {
    try {
      final Map<String, String> header = <String, String>{"Authorization": token ?? getString(UtilitiesConstants.token) ?? ""};

      final FormData form = FormData(
        <String, dynamic>{
          'File': MultipartFile(kIsWeb ? fileData.bytes : File(fileData.path!), filename: fileData.path!.split('/').last),
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

      final GetConnect connect = GetConnect(
        timeout: const Duration(seconds: 20000),
        maxAuthRetries: 3,
        withCredentials: true,
      );

      final Response<dynamic> response = await connect.post(
        '$baseUrl/Media',
        form,
        headers: header,
      );
      log("UPLOAD: ${response.statusCode} ${response.bodyString}");
      onResponse();
    } on Exception catch (_) {
      onError();
    }
  }

  Future<void> filter({
    required final MediaFilterDto dto,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Media/Filter",
        body: dto,
        action: (final Response<dynamic> response) =>
            onResponse(GenericResponse<MediaReadDto>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  Future<void> update({
    required final String mediaId,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final String? title,
    final String? size,
    final List<int>? tags,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Media/$mediaId",
        body: MediaReadDto(mediaJsonDetail: MediaJsonDetail(title: title, size: size), tags: tags, url: ""),
        action: (final Response<dynamic> response) =>
            onResponse(GenericResponse<MediaReadDto>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  Future<void> delete({
    required final String id,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Media/$id",
        action: (final Response<dynamic> response) => onResponse(),
        error: (final Response<dynamic> response) => onError(),
        failure: failure,
      );
}
