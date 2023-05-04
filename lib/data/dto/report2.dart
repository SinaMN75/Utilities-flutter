// To parse this JSON data, do
//
//     final createGroupMessage = createGroupMessageFromMap(jsonString);

import 'dart:convert';

import 'package:utilities/data/dto/dto.dart';

class CreateGroupMessage {
  CreateGroupMessage({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.description,
    this.creatorUserId,
    this.creatorUser,
    this.userId,
    this.user,
    this.productId,
    this.product,
    this.comment,
    this.commentId,
    this.chat,
    this.chatId,
    this.groupChatMessage,
    this.groupChatMessageId,
    this.groupChat,
    this.groupChatId,
    this.reportType,
  });

  final String? id;
  final String? commentId;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? title;
  final String? description;
  final String? creatorUserId;
  final UserReadDto? creatorUser;
  final UserReadDto? user;
  final String? productId;
  final ProductReadDto? product;
  final CommentReadDto? comment;
  final Chat? chat;
  final String? chatId;
  final ChatGroupMessageReadDto? groupChatMessage;
  final String? groupChatMessageId;
  final ChatGroupReadDto? groupChat;
  final String? groupChatId;
  final int? reportType;

  factory CreateGroupMessage.fromJson(String str) => CreateGroupMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateGroupMessage.fromMap(Map<String, dynamic> json) => CreateGroupMessage(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
    title: json["title"]!,
    description: json["description"]!,
    creatorUserId: json["creatorUserId"]!,
    creatorUser: json["creatorUser"] == null ? null : UserReadDto.fromMap(json["creatorUser"]),
    userId: json["userId"]!,
    user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
    productId: json["productId"],
    product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
    comment: json["comment"] == null ? null : CommentReadDto.fromMap(json["comment"]),
    commentId: json["commentId"],
    chat: json["chat"] == null ? null : Chat.fromMap(json["chat"]),
    chatId: json["chatId"],
    groupChatMessage: json["groupChatMessage"] == null ? null : ChatGroupMessageReadDto.fromMap(json["groupChatMessage"]),
    groupChatMessageId: json["groupChatMessageId"],
    groupChat: json["groupChat"] == null ? null : ChatGroupReadDto.fromMap(json["groupChat"]),
    groupChatId: json["groupChatId"],
    reportType: json["reportType"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt?.toIso8601String(),
    "title": title,
    "description": description,
    "creatorUserId": creatorUserId,
    "creatorUser": creatorUser?.toMap(),
    "userId": userId,
    "user": user?.toMap(),
    "productId": productId,
    "product": product?.toMap(),
    "comment": comment?.toMap(),
    "commentId": commentId,
    "chat": chat?.toMap(),
    "chatId": chatId,
    "groupChatMessage": groupChatMessage?.toMap(),
    "groupChatMessageId": groupChatMessageId,
    "groupChat": groupChat?.toMap(),
    "groupChatId": groupChatId,
    "reportType": reportType,
  };
}


// class ChatReact {
//   ChatReact({
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.reaction,
//     this.userId,
//     this.chats,
//     this.chatsId,
//     this.comment,
//     this.commentId,
//     this.score,
//     this.user,
//   });
//
//   final String? id;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final DateTime? deletedAt;
//   final int? reaction;
//   final String? userId;
//   final CreatorUserId? chats;
//   final String? chatsId;
//   final CreatorUserId? comment;
//   final String? commentId;
//   final int? score;
//   final CreatorUserId? user;
//
//   factory ChatReact.fromJson(String str) => ChatReact.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory ChatReact.fromMap(Map<String, dynamic> json) => ChatReact(
//     id: json["id"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
//     reaction: json["reaction"],
//     userId: json["userId"],
//     chats: json["chats"]]!,
//     chatsId: json["chatsId"],
//     comment: json["comment"]]!,
//     commentId: json["commentId"],
//     score: json["score"],
//     user: json["user"]]!,
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "deletedAt": deletedAt?.toIso8601String(),
//     "reaction": reaction,
//     "userId": userId,
//     "chats": creatorUserIdValues.reverse[chats],
//     "chatsId": chatsId,
//     "comment": creatorUserIdValues.reverse[comment],
//     "commentId": commentId,
//     "score": score,
//     "user": creatorUserIdValues.reverse[user],
//   };
// }




// class OrderDetail {
//   OrderDetail({
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.price,
//     this.count,
//     this.order,
//     this.orderId,
//     this.product,
//     this.productId,
//     this.categories,
//     this.forms,
//   });
//
//   final String? id;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final DateTime? deletedAt;
//   final int? price;
//   final int? count;
//   final Order? order;
//   final String? orderId;
//   final CreatorUserId? product;
//   final String? productId;
//   final List<CreatorUserId>? categories;
//   final List<CreatorUserId>? forms;
//
//   factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
//     id: json["id"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
//     price: json["price"],
//     count: json["count"],
//     order: json["order"] == null ? null : Order.fromMap(json["order"]),
//     orderId: json["orderId"],
//     product: json["product"]]!,
//     productId: json["productId"],
//     categories: json["categories"] == null ? [] : List<CreatorUserId>.from(json["categories"]!.map((x) => x]!)),
//     forms: json["forms"] == null ? [] : List<CreatorUserId>.from(json["forms"]!.map((x) => x]!)),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "deletedAt": deletedAt?.toIso8601String(),
//     "price": price,
//     "count": count,
//     "order": order?.toMap(),
//     "orderId": orderId,
//     "product": creatorUserIdValues.reverse[product],
//     "productId": productId,
//     "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => creatorUserIdValues.reverse[x])),
//     "forms": forms == null ? [] : List<dynamic>.from(forms!.map((x) => creatorUserIdValues.reverse[x])),
//   };
// }
