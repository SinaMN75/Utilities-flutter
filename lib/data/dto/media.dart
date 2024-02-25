part of '../data.dart';

class MediaReadDto {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fileName;
  int? tag;
  int? order;
  MediaJsonDetail? jsonDetail;
  String url;
  List<int>? tags;
  String? fileType;
  MediaReadDto? parent;
  String? parentId;
  List<MediaReadDto>? children;

  MediaReadDto({
    required this.url,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fileName,
    this.tag,
    this.order,
    this.jsonDetail,
    this.tags,
    this.fileType,
    this.children,
    this.parent,
    this.parentId,
  });

  factory MediaReadDto.fromJson(String str) => MediaReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory MediaReadDto.fromMap(dynamic json) => MediaReadDto(
    id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        fileName: json["fileName"],
        tag: json["tag"],
        order: json["order"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        fileType: json["url"] == null ? '' : json["url"].toString().split('.').last,
        jsonDetail: json["jsonDetail"] == null ? null : MediaJsonDetail.fromMap(json["jsonDetail"]),
        url: json["url"],
        parent: json["parent"] == null ? null : MediaReadDto.fromMap(json["parent"]),
        parentId: json["parentId"],
        children: json["children"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["children"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
      );

  dynamic toMap() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "fileName": fileName,
        "tag": tag,
        "order": order,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
        "fileType": url.split('.').last,
        "mediaJsonDetail": jsonDetail?.toMap(),
        "url": url,
        "parent": parent?.toMap(),
        "children": children == null ? <MediaReadDto>[] : List<MediaReadDto>.from(children!.map((final MediaReadDto x) => x.toMap())),
        "parentId": parentId,
      };
}

class MediaJsonDetail {
  String? link;
  String? title;
  String? description;
  String? size;
  String? time;
  String? artist;
  String? album;
  String? link1;
  String? link2;
  String? link3;
  int? isPrivate;

  MediaJsonDetail({
    this.link,
    this.title,
    this.description,
    this.size,
    this.time,
    this.artist,
    this.album,
    this.isPrivate,
    this.link1,
    this.link2,
    this.link3,
  });

  factory MediaJsonDetail.fromJson(String str) => MediaJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory MediaJsonDetail.fromMap(dynamic json) => MediaJsonDetail(
        link: json["link"],
        link1: json["link1"],
        link2: json["link2"],
        link3: json["link3"],
        title: json["title"],
        description: json["description"],
        size: json["size"],
        time: json["time"],
        artist: json["artist"],
        album: json["album"],
        isPrivate: json["isPrivate"],
      );

  dynamic toMap() => {
        "link": link,
        "link1": link1,
        "link2": link2,
        "link3": link3,
        "title": title,
        "description": description,
        "size": size,
        "time": time,
        "artist": artist,
        "album": album,
        "isPrivate": isPrivate,
      };
}

class CreateMediaReadDto {
  String? filesPath;
  String? categoryId;
  String? contentId;
  String? groupChatId;
  String? groupChatMessageId;
  String? productId;
  String? userId;
  int? privacyType;
  int? order;
  String? time;
  String? artist;
  String? album;
  String? commentId;
  String? bookmarkId;
  String? chatId;
  String? title;
  String? description;
  String? notificationId;
  String? size;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fileName;
  int? tag;
  MediaJsonDetail? mediaJsonDetail;
  String? url;
  List<int>? tags;
  String? fileType;

  CreateMediaReadDto({
    this.filesPath,
    this.categoryId,
    this.contentId,
    this.groupChatId,
    this.description,
    this.groupChatMessageId,
    this.productId,
    this.userId,
    this.privacyType,
    this.time,
    this.artist,
    this.order,
    this.album,
    this.commentId,
    this.bookmarkId,
    this.chatId,
    this.title,
    this.tags,
    this.notificationId,
    this.size,
  });

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "filesPath": filesPath,
        "CategoryId": categoryId,
        "ContentId": contentId,
        "GroupChatId": groupChatId,
        "description": description,
        "ProductId": productId,
        "UserId": userId,
        "order": order,
        "PrivacyType": privacyType,
        "Artist": artist,
        'Album': album,
        'CommentId': commentId,
        'BookmarkId': bookmarkId,
        'ChatId': chatId,
        "Tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
        'Title': title ?? fileName,
        'NotificationId': notificationId,
        'Size': size,
      };
}

class MediaFilterDto {
  MediaFilterDto({
    this.pageSize,
    this.pageNumber,
  });

  factory MediaFilterDto.fromJson(final String str) => MediaFilterDto.fromMap(json.decode(str));

  factory MediaFilterDto.fromMap(final dynamic json) => MediaFilterDto(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
      );

  int? pageSize;
  int? pageNumber;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber,
      };
}

extension NullableMediaResponseExtension on List<MediaReadDto>? {
  List<MediaReadDto> getByUseCase({required final int tag, final int? exception}) {
    List<MediaReadDto> list = this
            ?.where((final MediaReadDto e) => (e.tags ?? <int>[]).contains(tag))
            .map(
              (final MediaReadDto e) => e,
            )
            .toList() ??
        <MediaReadDto>[];

    if (exception != null) {
      list = this
              ?.where((final MediaReadDto e) => (e.tags ?? <int>[]).contains(exception))
              .map(
                (final MediaReadDto e) => e,
              )
              .toList() ??
          <MediaReadDto>[];
    }

    return list;
  }

  List<String> getAll({final int? tag}) =>
      this
          ?.where((final MediaReadDto e) => (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  List<MediaReadDto>? images({final List<TagMedia>? tags}) => this
      ?.where((final MediaReadDto e) => e.tags.containsAll(tags.getNumbers()))
      .toList()
      .where(
        (final MediaReadDto e) => e.url.isImageFileName,
      )
      .toList();

  List<String>? imagesUrl({final List<TagMedia>? tags}) => images(tags: tags)?.map((final MediaReadDto e) => e.url).toList();

  List<String> getImages({final int? tag}) =>
      this
          ?.where((final MediaReadDto e) => (e.url.isImageFileName || e.url.isVectorFileName) && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  List<String> getAudios({final int? tag}) =>
      this
          ?.where((final MediaReadDto e) => e.url.isAudioFileName && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  List<String> getVideos({final int? tag}) =>
      this
          ?.where((final MediaReadDto e) => e.url.isVideoFileName && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  List<String> getPdfs({final int? tag}) =>
      this
          ?.where((final MediaReadDto e) => e.url.isPDFFileName && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
          .map(
            (final MediaReadDto e) => e.url,
          )
          .toList() ??
      <String>[];

  List<String> getDocs({final int? tag}) =>
      this
          ?.where(
            (final MediaReadDto e) => e.url.isDocumentFileName && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true),
          )
          .map((final MediaReadDto e) => e.url)
          .toList() ??
      <String>[];

  String? getFile() {
    List<String> list = this!
        .where((final MediaReadDto e) => e.url.isImageFileName && (((e.tags ?? <int>[]).contains('file'))))
        .map(
          (final MediaReadDto e) => e.url,
        )
        .toList();
    return list.isNotEmpty ? list.first : null;
  }

  String? getImage({final int? tag}) => getImages(tag: tag).getFirstIfExist();

  String? getVideo({final int? tag}) => getVideos(tag: tag).getFirstIfExist();

  String? getFirst({final int? tag}) => getAll(tag: tag).getFirstIfExist();

  String? getDoc({final int? tag}) => getDocs(tag: tag).getFirstIfExist();

  String? getPdf({final int? tag}) => getPdfs(tag: tag).getFirstIfExist();

  String? getAudio({final int? tag}) => getAudios(tag: tag).getFirstIfExist();
}

extension MediaResponseExtension on List<MediaReadDto> {
  List<MediaReadDto> getByUseCase({required final int tag, final int? exception}) {
    List<MediaReadDto> list = where((final MediaReadDto e) => (e.tags ?? <int>[]).contains(tag))
        .map(
          (final MediaReadDto e) => e,
        )
        .toList();

    if (exception != null) {
      list = where((final MediaReadDto e) => !(e.tags ?? <int>[]).contains(exception))
          .map(
            (final MediaReadDto e) => e,
          )
          .toList();
    }

    return list;
  }

  List<String> getAll({final int? tag}) => where((final MediaReadDto e) => (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  List<String> getImages({final int? tag}) => where((final MediaReadDto e) => ((e.url.isImageFileName || e.url.isVectorFileName)) && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  List<String> getAudios({final int? tag}) => where((final MediaReadDto e) => e.url.isAudioFileName && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  List<String> getVideos({final int? tag}) => where((final MediaReadDto e) => e.url.isVideoFileName && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  List<String> getPdfs({final int? tag}) => where((final MediaReadDto e) => e.url.isPDFFileName && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  List<String> getDocs({final int? tag}) => where((final MediaReadDto e) => e.url.isDocumentFileName && (tag != null ? ((e.tags ?? <int>[]).contains(tag)) : true))
      .map(
        (final MediaReadDto e) => e.url,
      )
      .toList();

  String getFile() {
    List<String> list = where((final MediaReadDto e) => e.url.isImageFileName && (((e.tags ?? <int>[]).contains('file'))))
        .map(
          (final MediaReadDto e) => e.url,
        )
        .toList();
    return list.isNotEmpty ? list.first : "--";
  }

  String getImage({final int? tag}) => getImages(tag: tag).getFirstIfExist() ?? "--";

  String getCover() => getImages(tag: TagMedia.cover.number).getFirstIfExist() ?? getImages(tag: TagMedia.post.number).getFirstIfExist() ?? "--";

  String getVideo({final int? tag}) => getVideos(tag: tag).getFirstIfExist() ?? "--";

  String getDoc({final int? tag}) => getDocs(tag: tag).getFirstIfExist() ?? "--";

  String getFirst({final int? tag}) => getAll(tag: tag).getFirstIfExist() ?? "--";

  String getPdf({final int? tag}) => getPdfs(tag: tag).getFirstIfExist() ?? "--";

  String getAudio({final int? tag}) => getAudios(tag: tag).getFirstIfExist() ?? "--";
}
