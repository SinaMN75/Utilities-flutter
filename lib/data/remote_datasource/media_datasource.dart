part of '../data.dart';

class MediaDataSource {
  final String baseUrl;

  MediaDataSource({required this.baseUrl});

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
    final int? privacyType,
    final String? album,
    final String? groupChatId,
    final String? groupChatMessageId,
    final String? bookmarkId,
    final String? title,
    final String? notificationId,
    final String? size,
    final Duration? timeout,
  }) async {
    FormData form = FormData(
      <String, dynamic>{
        'Files': MultipartFile(kIsWeb ? fileData.bytes : fileData.path, filename: ":).$fileExtension"),
        'Tags': tags,
        'CategoryId': categoryId,
        'ContentId': contentId,
        'GroupChatId': groupChatId,
        'GroupChatMessageId': groupChatMessageId,
        'ProductId': productId,
        'UserId': userId,
        'PrivacyType': privacyType,
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
      final Response<dynamic> response = await GetConnect().post(
        '$baseUrl/Media',
        form,
        headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
        contentType: "multipart/form-data",
      );
      log("UPLOAD: ${response.statusCode} ${response.bodyString}");
      onResponse();
    } catch (e) {
      onError();
    }
  }

  Future<void> filter({
    required final MediaFilterDto dto,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Media/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<MediaReadDto>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> update({
    required final String mediaId,
    final String? title,
    final String? size,
    final int? tagUseCase,
    final List<int>? tags,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Media/$mediaId",
        body: MediaReadDto(mediaJsonDetail: MediaJsonDetail(title: title, size: size), tagUseCase: tagUseCase, tags: tags, url: ""),
        action: (final Response response) => onResponse(GenericResponse<MediaReadDto>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
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
        action: (final Response response) => onResponse(),
        error: (final Response response) => onError(),
        failure: failure,
      );
}
