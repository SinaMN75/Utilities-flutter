import 'package:utilities/utilities.dart';

class ReportCreateUpdateDto {
  ReportCreateUpdateDto({
    this.title,
    this.description,
    this.productId,
    this.commentId,
    this.chatId,
    this.groupChatId,
    this.groupChatMessageId,
    this.userId,
  });

  final String? title;
  final String? description;
  final String? productId;
  final String? commentId;
  final String? groupChatId;
  final String? groupChatMessageId;
  final String? chatId;
  final String? userId;

  factory ReportCreateUpdateDto.fromJson(String str) => ReportCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportCreateUpdateDto.fromMap(Map<String, dynamic> json) => ReportCreateUpdateDto(
        title: json["title"],
        description: json["description"],
        productId: json["productId"],
        commentId: json["commentId"],
        groupChatId: json["groupChatId"],
        groupChatMessageId: json["groupChatMessageId"],
        chatId: json["chatId"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "productId": productId,
        "commentId": commentId,
        "chatId": chatId,
        "groupChatId": groupChatId,
        "groupChatMessageId": groupChatMessageId,
        "userId": userId,
      };
}

class ReportReadDto {
  ReportReadDto({
    this.id,
    this.title,
    this.description,
    this.product,
  });

  final String? id;
  final String? title;
  final String? description;
  final ProductReadDto? product;

  factory ReportReadDto.fromJson(String str) => ReportReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportReadDto.fromMap(Map<String, dynamic> json) => ReportReadDto(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "product": product == null ? null : product!.toMap(),
      };
}

class Report {
  Report({
    this.title,
    this.description,
    this.creatorUserId,
    this.productId,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  final String? title;
  final String? description;
  final String? creatorUserId;
  final String? productId;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  factory Report.fromJson(String str) => Report.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Report.fromMap(Map<String, dynamic> json) => Report(
        title: json["title"],
        description: json["description"],
        creatorUserId: json["creatorUserId"],
        productId: json["productId"],
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "creatorUserId": creatorUserId,
        "productId": productId,
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class ReportFilterDto {
  ReportFilterDto({
    this.user,
    this.product,
    this.chat,
    this.groupChat,
    this.groupChatMessage,
  });

  final bool? user;
  final bool? product;
  final bool? chat;
  final bool? groupChat;
  final bool? groupChatMessage;

  factory ReportFilterDto.fromJson(String str) => ReportFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportFilterDto.fromMap(Map<String, dynamic> json) => ReportFilterDto(
        user: json["user"],
        product: json["product"],
        chat: json["chat"],
        groupChat: json["groupChat"],
        groupChatMessage: json["groupChatMessage"],
      );

  Map<String, dynamic> toMap() => {
        "user": user,
        "product": product,
        "chat": chat,
        "groupChat": groupChat,
        "groupChatMessage": groupChatMessage,
      };
}
