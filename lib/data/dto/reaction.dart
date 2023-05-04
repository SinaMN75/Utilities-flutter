import 'package:utilities/utilities.dart';

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

  String toJson() => json.encode(toMap());

  factory ReactionReadDto.fromMap(Map<String, dynamic> json) => ReactionReadDto(
        id: json["id"],
        userId: json["userId"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        comment: json["comment"],
        commentId: json["commentId"],
        reaction: json["reaction"],
      );

  Map<String, dynamic> toMap() => {
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
