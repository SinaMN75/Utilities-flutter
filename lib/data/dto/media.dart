import 'package:utilities/utilities.dart';

class MediaReadDto {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fileName;
  int? tagUseCase;
  MediaJsonDetail? mediaJsonDetail;
  String? url;
  List<int>? tags;
  String? fileType;

  MediaReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fileName,
    this.tagUseCase,
    this.mediaJsonDetail,
    this.url,
    this.tags,
    this.fileType,
  });

  factory MediaReadDto.fromJson(String str) => MediaReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaReadDto.fromMap(dynamic json) => MediaReadDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        fileName: json["fileName"],
        tagUseCase: json["tagUseCase"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        fileType: json["url"] == null ? '' : json["url"].toString().split('.').last,
        mediaJsonDetail: json["jsonDetail"] == null ? null : MediaJsonDetail.fromMap(json["jsonDetail"]),
        url: json["url"],
      );

  dynamic toMap() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "fileName": fileName,
        "tagUseCase": tagUseCase,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
        "fileType": url?.split('.').last ?? '',
        "mediaJsonDetail": mediaJsonDetail?.toMap(),
        "url": url,
      };
}

class MediaJsonDetail {
  String? link;
  String? title;
  String? size;
  String? time;
  String? artist;
  String? album;
  int? isPrivate;

  MediaJsonDetail({
    this.link,
    this.title,
    this.size,
    this.time,
    this.artist,
    this.album,
    this.isPrivate,
  });

  factory MediaJsonDetail.fromJson(String str) => MediaJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaJsonDetail.fromMap(dynamic json) => MediaJsonDetail(
        link: json["link"],
        title: json["title"],
        size: json["size"],
        time: json["time"],
        artist: json["artist"],
        album: json["album"],
        isPrivate: json["isPrivate"],
      );

  dynamic toMap() => {
        "link": link,
        "title": title,
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
  String? time;
  String? artist;
  String? album;
  String? commentId;
  String? bookmarkId;
  String? chatId;
  String? title;
  String? notificationId;
  String? size;

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fileName;
  int? tagUseCase;
  MediaJsonDetail? mediaJsonDetail;
  String? url;
  List<int>? tags;
  String? fileType;

  CreateMediaReadDto({
    this.filesPath,
    this.categoryId,
    this.contentId,
    this.groupChatId,
    this.groupChatMessageId,
    this.productId,
    this.userId,
    this.privacyType,
    this.time,
    this.artist,
    this.album,
    this.commentId,
    this.bookmarkId,
    this.chatId,
    this.title,
    this.notificationId,
    this.size,

  });

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
    "filesPath": filesPath,
    "CategoryId": categoryId,
    "ContentId": contentId,
    "GroupChatId": groupChatId,
    "ProductId": productId,
    "UserId": userId,
    "PrivacyType": privacyType,
    "Artist": artist,
    'Album': album,
    'CommentId': commentId,
    'BookmarkId': bookmarkId,
    'ChatId': chatId,
    'Title': title ?? fileName,
    'NotificationId': notificationId,
    'Size': size,

  };
}

class Chat {
  Chat({
    this.fromUserId,
    this.fromUser,
    this.toUserId,
    this.toUser,
    this.messageText,
    this.readMessage,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  final String? fromUserId;
  final String? toUserId;
  final String? messageText;
  final bool? readMessage;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final UserReadDto? toUser;
  final UserReadDto? fromUser;

  factory Chat.fromJson(String str) => Chat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Chat.fromMap(dynamic json) {
    try {
      return Chat(
        id: json["id"],
        fromUserId: json["fromUserId"],
        toUserId: json["toUserId"],
        messageText: json["messageText"],
        readMessage: json["readMessage"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        fromUser: json["fromUser"] == null ? null : UserReadDto.fromMap(json["fromUser"]),
        toUser: json["toUser"] == null ? null : UserReadDto.fromMap(json["toUser"]),
      );
    } catch (e) {
      print(e.toString());
      return Chat();
    }
  }

  dynamic toMap() => {
        "id": id,
        "fromUserId": fromUserId,
        "toUserId": toUserId,
        "messageText": messageText,
        "readMessage": readMessage,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "fromUser": fromUser!.toMap(),
        "toUser": toUser!.toMap(),
      };
}

class CreateOrUpdateGroupChat {
  CreateOrUpdateGroupChat({
    this.id,
    this.title,
    this.description,
    this.value,
    this.type,
    this.useCase,
    this.department,
    this.readIfExist,
    this.chatStatus,
    this.priority,
    this.userIds,
    this.productIds,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? value;
  final String? type;
  final String? useCase;
  final String? department;
  final bool? readIfExist;
  final int? chatStatus;
  final int? priority;
  final List<String>? userIds;
  final List<String>? productIds;

  factory CreateOrUpdateGroupChat.fromJson(String str) => CreateOrUpdateGroupChat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateOrUpdateGroupChat.fromMap(dynamic json) => CreateOrUpdateGroupChat(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        value: json["value"],
        type: json["type"],
        useCase: json["useCase"],
        department: json["department"],
        readIfExist: json["readIfExist"],
        chatStatus: json["chatStatus"],
        priority: json["priority"],
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((x) => x)),
        productIds: json["productIds"] == null ? [] : List<String>.from(json["productIds"]!.map((x) => x)),
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "value": value,
        "type": type,
        "useCase": useCase,
        "department": department,
        "readIfExist": readIfExist,
        "chatStatus": chatStatus,
        "priority": priority,
        "userIds": userIds == null ? [] : List<String>.from(userIds!.map((x) => x)),
        "productIds": productIds == null ? [] : List<String>.from(productIds!.map((x) => x)),
      };
}


extension NullableMediaResponseExtension on List<MediaReadDto>? {
  List<MediaReadDto> getByUseCase({required final int tagUseCase, final int? exception}) {
    List<MediaReadDto> list = this
            ?.where((final MediaReadDto e) => (e.tags??<int>[]).contains(tagUseCase))
            .map(
              (final MediaReadDto e) => e,
            )
            .toList() ??
        <MediaReadDto>[];

    if (exception != null) {
      list = this
              ?.where((final MediaReadDto e) => (e.tags??<int>[]).contains(exception))
              .map(
                (final MediaReadDto e) => e,
              )
              .toList() ??
          <MediaReadDto>[];
    }

    return list;
  }

  List<String> getAll({final int? tagUseCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url != null && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getImages({final int? tagUseCase}) =>
      this
          ?.where((final MediaReadDto e) => (e.url != null && (e.url!.isImageFileName || e.url!.isVectorFileName)) && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getAudios({final int? tagUseCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url != null && e.url!.isAudioFileName && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getVideos({final int? tagUseCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url != null && e.url!.isVideoFileName && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getPdfs({final int? tagUseCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url != null && e.url!.isPDFFileName && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getDocs({final int? tagUseCase}) =>
      this
          ?.where(
            (final MediaReadDto e) => e.url != null && e.url!.isDocumentFileName && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true),
          )
          .map((final MediaReadDto e) => e.url ?? "--")
          .toList() ??
      <String>[];

  String getFile() {
    List<String> list = this!
        .where((final MediaReadDto e) => e.url != null && e.url!.isImageFileName && (((e.tags??<int>[]).contains('file'))))
        .map(
          (final MediaReadDto e) => e.url ?? "--",
        )
        .toList();
    return list.isNotEmpty ? list.first : "--";
  }

  String getCover() => getImages(tagUseCase: TagMedia.cover.title).getFirstIfExist() ?? getImages(tagUseCase: TagMedia.post.title).getFirstIfExist() ?? "--";

  String getImage({final int? tagUseCase}) => getImages(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getVideo({final int? tagUseCase}) => getVideos(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getFirst({final int? tagUseCase}) => getAll(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getDoc({final int? tagUseCase}) => getDocs(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getPdf({final int? tagUseCase}) => getPdfs(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getAudio({final int? tagUseCase}) => getAudios(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";
}

extension MediaResponseExtension on List<MediaReadDto> {
  List<MediaReadDto> getByUseCase({required final int tagUseCase, final int? exception}) {
    List<MediaReadDto> list = where((final MediaReadDto e) => (e.tags??<int>[]).contains(tagUseCase))
        .map(
          (final MediaReadDto e) => e,
        )
        .toList();

    if (exception != null) {
      list = where((final MediaReadDto e) => !(e.tags??<int>[]).contains(exception))
          .map(
            (final MediaReadDto e) => e,
          )
          .toList();
    }

    return list;
  }

  List<String> getAll({final int? tagUseCase}) => where((final MediaReadDto e) => e.url != null && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getImages({final int? tagUseCase}) => where((final MediaReadDto e) => (e.url != null && (e.url!.isImageFileName || e.url!.isVectorFileName)) && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getAudios({final int? tagUseCase}) => where((final MediaReadDto e) => e.url != null && e.url!.isAudioFileName && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getVideos({final int? tagUseCase}) => where((final MediaReadDto e) => e.url != null && e.url!.isVideoFileName && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getPdfs({final int? tagUseCase}) => where((final MediaReadDto e) => e.url != null && e.url!.isPDFFileName && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getDocs({final int? tagUseCase}) => where((final MediaReadDto e) => e.url != null && e.url!.isDocumentFileName && (tagUseCase != null ? ((e.tags??<int>[]).contains(tagUseCase)) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  String getFile() {
    List<String> list = where((final MediaReadDto e) => e.url != null && e.url!.isImageFileName && (((e.tags??<int>[]).contains('file'))))
        .map(
          (final MediaReadDto e) => e.url ?? "--",
        )
        .toList();
    return list.isNotEmpty ? list.first : "--";
  }

  String getImage({final int? tagUseCase}) => getImages(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getCover() => getImages(tagUseCase: TagMedia.cover.title).getFirstIfExist() ?? getImages(tagUseCase: TagMedia.post.title).getFirstIfExist() ?? "--";

  String getVideo({final int? tagUseCase}) => getVideos(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getDoc({final int? tagUseCase}) => getDocs(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getFirst({final int? tagUseCase}) => getAll(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getPdf({final int? tagUseCase}) => getPdfs(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";

  String getAudio({final int? tagUseCase}) => getAudios(tagUseCase: tagUseCase).getFirstIfExist() ?? "--";
}
