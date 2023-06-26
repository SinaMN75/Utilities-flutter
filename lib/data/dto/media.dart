import 'package:utilities/utilities.dart';

class MediaReadDto {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fileName;
  String? useCase;
  MediaJsonDetail? mediaJsonDetail;
  String? url;
  String? fileType;

  MediaReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fileName,
    this.useCase,
    this.mediaJsonDetail,
    this.url,
    this.fileType,
  });

  factory MediaReadDto.fromJson(String str) => MediaReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaReadDto.fromMap(dynamic json) => MediaReadDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        fileName: json["fileName"],
        useCase: json["useCase"],
        fileType: json["url"] == null ? '' : json["url"].toString().split('.').last,
        mediaJsonDetail: json["jsonDetail"] == null ? null : MediaJsonDetail.fromMap(json["jsonDetail"]),
        url: json["url"],
      );

  dynamic toMap() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "fileName": fileName,
        "useCase": useCase,
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

class ResponseMediaDto {
  ResponseMediaDto({
    this.fileName,
    this.useCase,
    this.url,
    this.link,
    this.id,
    this.mediaJsonDetail,
    this.createdAt,
  });

  final String? fileName;
  final String? useCase;
  final String? url;
  final String? link;
  final String? id;
  MediaJsonDetail? mediaJsonDetail;
  final DateTime? createdAt;

  factory ResponseMediaDto.fromJson(String str) => ResponseMediaDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseMediaDto.fromMap(dynamic json) => ResponseMediaDto(
        fileName: json["fileName"],
        useCase: json["useCase"],
        link: json["link"],
        url: json["link"] != null ? json["link"] : json["url"],
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        mediaJsonDetail: json["jsonDetail"] == null ? null : MediaJsonDetail.fromMap(json["jsonDetail"]),
      );

  dynamic toMap() => {
        "fileName": fileName,
        "useCase": useCase,
        "url": url,
        "link": url ?? link,
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "mediaJsonDetail": mediaJsonDetail?.toMap(),
      };
}

extension NullableMediaResponseExtension on List<MediaReadDto>? {
  List<MediaReadDto> getByUseCase({required final String useCase, final String? exception}) {
    List<MediaReadDto> list = this
            ?.where((final MediaReadDto e) => (e.useCase == useCase))
            .map(
              (final MediaReadDto e) => e,
            )
            .toList() ??
        <MediaReadDto>[];

    if (exception != null) {
      list = this
              ?.where((final MediaReadDto e) => (e.useCase != exception))
              .map(
                (final MediaReadDto e) => e,
              )
              .toList() ??
          <MediaReadDto>[];
    }

    return list;
  }

  List<String> getAll({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url != null && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getImages({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => (e.url != null && (e.url!.isImageFileName || e.url!.isVectorFileName)) && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getAudios({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url != null && e.url!.isAudioFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getVideos({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url != null && e.url!.isVideoFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getPdfs({final String? useCase}) =>
      this
          ?.where((final MediaReadDto e) => e.url != null && e.url!.isPDFFileName && (useCase != null ? (e.useCase == useCase) : true))
          .map(
            (final MediaReadDto e) => e.url ?? "--",
          )
          .toList() ??
      <String>[];

  List<String> getDocs({final String? useCase}) =>
      this
          ?.where(
            (final MediaReadDto e) => e.url != null && e.url!.isDocumentFileName && (useCase != null ? (e.useCase == useCase) : true),
          )
          .map((final MediaReadDto e) => e.url ?? "--")
          .toList() ??
      <String>[];

  String getFile() {
    List<String> list = this!
        .where((final MediaReadDto e) => e.url != null && e.url!.isImageFileName && ((e.useCase == 'file')))
        .map(
          (final MediaReadDto e) => e.url ?? "--",
        )
        .toList();
    return list.isNotEmpty ? list.first : "--";
  }

  String getCover() => getImages(useCase: UseCaseMedia.cover.title).getFirstIfExist() ?? getImages(useCase: UseCaseMedia.post.title).getFirstIfExist() ?? "--";

  String getImage({final String? useCase}) => getImages(useCase: useCase).getFirstIfExist() ?? "--";

  String getVideo({final String? useCase}) => getVideos(useCase: useCase).getFirstIfExist() ?? "--";

  String getFirst({final String? useCase}) => getAll(useCase: useCase).getFirstIfExist() ?? "--";

  String getDoc({final String? useCase}) => getDocs(useCase: useCase).getFirstIfExist() ?? "--";

  String getPdf({final String? useCase}) => getPdfs(useCase: useCase).getFirstIfExist() ?? "--";

  String getAudio({final String? useCase}) => getAudios(useCase: useCase).getFirstIfExist() ?? "--";
}

extension MediaResponseExtension on List<MediaReadDto> {
  List<MediaReadDto> getByUseCase({required final String useCase, final String? exception}) {
    List<MediaReadDto> list = this
        .where((final MediaReadDto e) => (e.useCase == useCase))
        .map(
          (final MediaReadDto e) => e,
        )
        .toList();

    if (exception != null) {
      list = this
          .where((final MediaReadDto e) => (e.useCase != exception))
          .map(
            (final MediaReadDto e) => e,
          )
          .toList();
    }

    return list;
  }

  List<String> getAll({final String? useCase}) => this
      .where((final MediaReadDto e) => e.url != null && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getImages({final String? useCase}) => this
      .where((final MediaReadDto e) => (e.url != null && (e.url!.isImageFileName || e.url!.isVectorFileName)) && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getAudios({final String? useCase}) => this
      .where((final MediaReadDto e) => e.url != null && e.url!.isAudioFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getVideos({final String? useCase}) => this
      .where((final MediaReadDto e) => e.url != null && e.url!.isVideoFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getPdfs({final String? useCase}) => this
      .where((final MediaReadDto e) => e.url != null && e.url!.isPDFFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  List<String> getDocs({final String? useCase}) => this
      .where((final MediaReadDto e) => e.url != null && e.url!.isDocumentFileName && (useCase != null ? (e.useCase == useCase) : true))
      .map(
        (final MediaReadDto e) => e.url ?? "--",
      )
      .toList();

  String getFile() {
    List<String> list = this
        .where((final MediaReadDto e) => e.url != null && e.url!.isImageFileName && ((e.useCase == 'file')))
        .map(
          (final MediaReadDto e) => e.url ?? "--",
        )
        .toList();
    return list.isNotEmpty ? list.first : "--";
  }

  String getImage({final String? useCase}) => getImages(useCase: useCase).getFirstIfExist() ?? "--";

  String getCover() => getImages(useCase: UseCaseMedia.cover.title).getFirstIfExist() ?? getImages(useCase: UseCaseMedia.post.title).getFirstIfExist() ?? "--";

  String getVideo({final String? useCase}) => getVideos(useCase: useCase).getFirstIfExist() ?? "--";

  String getDoc({final String? useCase}) => getDocs(useCase: useCase).getFirstIfExist() ?? "--";

  String getFirst({final String? useCase}) => getAll(useCase: useCase).getFirstIfExist() ?? "--";

  String getPdf({final String? useCase}) => getPdfs(useCase: useCase).getFirstIfExist() ?? "--";

  String getAudio({final String? useCase}) => getAudios(useCase: useCase).getFirstIfExist() ?? "--";
}
