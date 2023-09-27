part of '../data.dart';

class ReactionProductReadDto {
  ReactionProductReadDto({
    this.reaction,
    this.user,
    this.userId,
    this.productId,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  final int? reaction;
  final UserReadDto? user;
  final String? userId;
  final String? productId;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  factory ReactionProductReadDto.fromJson(String str) => ReactionProductReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ReactionProductReadDto.fromMap(dynamic json) => ReactionProductReadDto(
        reaction: json["reaction"],
        userId: json["userId"],
        productId: json["productId"],
        id: json["id"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  dynamic toMap() => {
        "reaction": reaction,
        "user": user?.toMap(),
        "userId": userId,
        "productId": productId,
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
