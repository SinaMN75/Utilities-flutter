part of '../data.dart';

class ReactionReadDto {
  ReactionReadDto({
    this.id,
    this.userId,
    this.createdAt,
    this.comment,
    this.commentId,
    this.deletedAt,
    this.reaction,
    this.updatedAt,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? userId;
  final String? comment;
  final String? commentId;
  final int? reaction;

  factory ReactionReadDto.fromJson(String str) => ReactionReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ReactionReadDto.fromMap(dynamic json) => ReactionReadDto(
        id: json["id"],
        userId: json["userId"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        comment: json["comment"],
        commentId: json["commentId"],
        reaction: json["reaction"],
      );

  dynamic toMap() => {
        "id": id,
        "userId": userId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "comment": comment,
        "commentId": commentId,
        "reaction": reaction,
      };
}

class ReactionFilterDto {
  ReactionFilterDto({
    this.productId,
    this.reaction,
    this.pageSize,
    this.pageNumber,
  });

  final String? productId;
  final int? reaction;
  final int? pageSize;
  final int? pageNumber;

  factory ReactionFilterDto.fromJson(String str) => ReactionFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ReactionFilterDto.fromMap(dynamic json) => ReactionFilterDto(
        productId: json["productId"],
        reaction: json["reaction"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
      );

  dynamic toMap() => {
        "productId": productId,
        "reaction": reaction,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
      };
}
