import 'package:utilities/data/dto/reaction.dart';
import 'package:utilities/utilities.dart';

class OrdersReadDto {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? score;
  bool? isLiked;
  String? comment;
  int? status;
  String? parentId;
  OrdersReadDto? parent;
  UserReadDto? user;
  String? userId;
  CommentJsonDetail? commentJsonDetail;
  List<OrdersReadDto>? children;
  List<MediaReadDto>? media;

  OrdersReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.score,
    this.comment,
    this.isLiked,
    this.status,
    this.parentId,
    this.parent,
    this.user,
    this.userId,
    this.commentJsonDetail,
    this.children,
    this.media,
  });

  factory OrdersReadDto.fromJson(final String str) => OrdersReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdersReadDto.fromMap(final dynamic json) => OrdersReadDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        score: json["score"],
        comment: json["comment"],
        isLiked: json["isLiked"],
        status: json["status"],
        parentId: json["parentId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        parent: json["parent"] == null ? null : OrdersReadDto.fromMap(json["parent"]),
        userId: json["userId"],
        commentJsonDetail: json["jsonDetail"] == null ? null : CommentJsonDetail.fromMap(json["jsonDetail"]),
        children: json["children"] == null ? <OrdersReadDto>[] : List<OrdersReadDto>.from(json["children"].cast<dynamic>().map(OrdersReadDto.fromMap)).toList(),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<dynamic>().map(MediaReadDto.fromMap)).toList(),
      );

  dynamic toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "score": score,
        "comment": comment,
        "isLiked": isLiked,
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

  factory CommentJsonDetail.fromMap(final dynamic json) => CommentJsonDetail(
        commentReacts: json["reacts"] == null ? <ReactionReadDto>[] : List<ReactionReadDto>.from(json["reacts"].cast<dynamic>().map(ReactionReadDto.fromMap)).toList(),
      );

  dynamic toMap() => {
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

  factory CommentCreateUpdateDto.fromMap(final dynamic json) => CommentCreateUpdateDto(
        parentId: json["parentId"],
        score: json["score"],
        comment: json["comment"],
        productId: json["productId"],
      );

  dynamic toMap() => {
        "parentId": parentId,
        "score": score,
        "comment": comment,
        "productId": productId,
      };
}
