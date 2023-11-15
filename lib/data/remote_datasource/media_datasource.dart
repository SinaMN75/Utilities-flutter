part of '../data.dart';

class MediaDataSource {
  final String baseUrl;

  MediaDataSource({required this.baseUrl});

  Future<void> create({
    required final List<File> files,
    required final List<int> tags,
    required final VoidCallback action,
    required final Function(GenericResponse errorResponse) onError,
    final Function(List<MediaReadDto> list)? onResponse,
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
    files.forEach(
      (final File i) async {
        dynamic data = null;
        String fileName = 'file';
        if (isWeb) {
          data = i.readAsBytesSync();
        } else {
          data = i.path;
          fileName = i.path.split('/').last;
        }

        FormData form = FormData(
          <String, dynamic>{
            'Files': MultipartFile(await data, filename: fileName),
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
            'Title': title ?? fileName,
            'NotificationId': notificationId,
            'Size': size,
          },
        );

        await GetConnect().post(
          '$baseUrl/Media',
          form,
          headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
          contentType: "multipart/form-data",
        );
      },
    );
  }

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
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Media/$id",
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: MediaReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
