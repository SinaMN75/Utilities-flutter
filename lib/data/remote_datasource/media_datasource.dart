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
    final String? id,
    final String? categoryId,
    final String? contentId,
    final String? productId,
    final String? userId,
    final String? commentId,
    final String? chatId,
    final String? parentId,
    final String? groupChatId,
    final String? groupChatMessageId,
    final String? bookmarkId,
    final String? notificationId,
  }) async {
    final FormData form = FormData(
      <String, dynamic>{
        'Id': id,
        'File': MultipartFile(kIsWeb ? fileData.bytes : File(fileData.path!), filename: isWeb ? ":).${fileData.extension}" : fileData.path!.split('/').last),
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
        'ParentId': parentId,
        'Tags': fileData.tags ?? tags,
        'Time': fileData.jsonDetail?.time,
        'Artist': fileData.jsonDetail?.artist,
        'Album': fileData.jsonDetail?.album,
        'Title': fileData.jsonDetail?.title,
        'Size': fileData.jsonDetail?.size,
        'Description': fileData.jsonDetail?.description,
        'Link1': fileData.jsonDetail?.link1,
        'Link2': fileData.jsonDetail?.link2,
        'Link3': fileData.jsonDetail?.link3,
      },
    );

    try {
      GetConnect connect = GetConnect(
        timeout: Duration(minutes: 60),
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
          .timeout(Duration(minutes: 60));
      log("UPLOAD: ${response.statusCode} ${response.bodyString}");
      onResponse();
      return;
    } catch (e) {
      onError();
      return;
    }
  }

  void filter({
    required final MediaFilterDto dto,
    required final Function(GenericResponse<MediaReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
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
    final Function(dynamic error)? failure,
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
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Media/$id",
        action: (final Response response) => onResponse(),
        error: (final Response response) => onError(),
        failure: failure,
      );
}
