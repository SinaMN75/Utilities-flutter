import 'package:utilities/data/dto/reaction.dart';
import 'package:utilities/utilities.dart';

class CommentReadDto {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? score;
  String? comment;
  int? status;
  String? parentId;
  CommentReadDto? parent;
  UserReadDto? user;
  String? userId;
  CommentJsonDetail? commentJsonDetail;
  List<CommentReadDto>? children;
  List<MediaReadDto>? media;

  CommentReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.score,
    this.comment,
    this.status,
    this.parentId,
    this.parent,
    this.user,
    this.userId,
    this.commentJsonDetail,
    this.children,
    this.media,
  });

  factory CommentReadDto.fromJson(final String str) => CommentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentReadDto.fromMap(final Map<String, dynamic> json) => CommentReadDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        score: json["score"],
        comment: json["comment"],
        status: json["status"],
        parentId: json["parentId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        parent: json["parent"] == null ? null : CommentReadDto.fromMap(json["parent"]),
        userId: json["userId"],
        commentJsonDetail: json["commentJsonDetail"] == null ? null : CommentJsonDetail.fromMap(json["commentJsonDetail"]),
        children: json["children"] == null ? <CommentReadDto>[] : List<CommentReadDto>.from(json["children"].cast<Map<String, dynamic>>().map(CommentReadDto.fromMap)).toList(),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "score": score,
        "comment": comment,
        "status": status,
        "parentId": parentId,
        "parent": parent,
        "user": user?.toMap(),
        "userId": userId,
        "commentJsonDetail": commentJsonDetail?.toMap(),
        "children": children == null ? <String>[] : List<String>.from(children!.map((final x) => x)),
        "media": media == null ? <MediaReadDto>[] : List<MediaReadDto>.from(media!.map((final x) => x.toMap())),
      };
}

class CommentJsonDetail {
  List<ReactionReadDto>? commentReacts;

  CommentJsonDetail({
    this.commentReacts,
  });

  factory CommentJsonDetail.fromJson(final String str) => CommentJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentJsonDetail.fromMap(final Map<String, dynamic> json) => CommentJsonDetail(
    commentReacts: json["reacts"] == null ? <ReactionReadDto>[] : List<ReactionReadDto>.from(json["reacts"].cast<Map<String, dynamic>>().map(ReactionReadDto.fromMap)).toList(),
      );

  Map<String, dynamic> toMap() => {
        "reacts": commentReacts == null ? <ReactionReadDto>[] : List<ReactionReadDto>.from(commentReacts!.map((final x) => x.toMap())),
      };
}


class CommentCreateUpdateDto {
  CommentCreateUpdateDto({
    this.parentId,
    this.score,
    this.comment,
    this.productId,
  });

  final String? parentId;
  final double? score;
  final String? comment;
  final String? productId;

  factory CommentCreateUpdateDto.fromJson(final String? str) => CommentCreateUpdateDto.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory CommentCreateUpdateDto.fromMap(final Map<String, dynamic> json) => CommentCreateUpdateDto(
        parentId: json["parentId"],
        score: json["score"],
        comment: json["comment"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "parentId": parentId,
        "score": score,
        "comment": comment,
        "productId": productId,
      };
}
