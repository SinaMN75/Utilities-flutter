part of '../data.dart';

extension CommentReadDtoExtension on List<CommentReadDto> {
  List<CommentReadDto> getByTags({required final List<TagComment> tags}) => where(
        (final CommentReadDto e) => e.tags.containsAll(tags.getNumbers()),
      ).toList();
}

class CommentReadDto {
  String? id;
  String? createdAt;
  String? updatedAt;
  double? score;
  bool? isLiked;
  String? comment;
  int? status;
  String? parentId;
  CommentReadDto? parent;
  UserReadDto? user;
  String? userId;
  CommentJsonDetail? commentJsonDetail;
  List<CommentReadDto>? children;
  List<MediaReadDto>? media;
  List<int>? tags;

  CommentReadDto({
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
    this.tags,
  });

  factory CommentReadDto.fromJson(final String str) => CommentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory CommentReadDto.fromMap(final dynamic json) => CommentReadDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        score: json["score"],
        comment: json["comment"],
        isLiked: json["isLiked"],
        status: json["status"],
        parentId: json["parentId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        parent: json["parent"] == null ? null : CommentReadDto.fromMap(json["parent"]),
        userId: json["userId"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        commentJsonDetail: json["jsonDetail"] == null ? null : CommentJsonDetail.fromMap(json["jsonDetail"]),
        children: json["children"] == null ? <CommentReadDto>[] : List<CommentReadDto>.from(json["children"].cast<Map<String, dynamic>>().map(CommentReadDto.fromMap)).toList(),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
      );

  dynamic toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "score": score,
        "comment": comment,
        "isLiked": isLiked,
        "status": status,
        "parentId": parentId,
        "parent": parent,
        "user": user?.toMap(),
        "userId": userId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
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

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory CommentJsonDetail.fromMap(final dynamic json) => CommentJsonDetail(
        commentReacts: json["reacts"] == null ? <ReactionReadDto>[] : List<ReactionReadDto>.from(json["reacts"].cast<Map<String, dynamic>>().map(ReactionReadDto.fromMap)).toList(),
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
    this.tags,
  });

  final String? parentId;
  final double? score;
  final String? comment;
  final String? productId;
  List<int>? tags;

  factory CommentCreateUpdateDto.fromJson(final String? str) => CommentCreateUpdateDto.fromMap(json.decode(str!));

  String? toJson() => json.encode(removeNullEntries(toMap()));

  factory CommentCreateUpdateDto.fromMap(final dynamic json) => CommentCreateUpdateDto(
        parentId: json["parentId"],
        score: json["score"],
        comment: json["comment"],
        productId: json["productId"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
      );

  dynamic toMap() => {
        "parentId": parentId,
        "score": score,
        "comment": comment,
        "productId": productId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
      };
}

class CommentFilterDto {
  CommentFilterDto({
    this.userId,
    this.productOwnerId,
    this.productId,
    this.status,
    this.tags,
    this.pageNumber,
    this.pageSize,
  });

  final String? userId;
  final String? productOwnerId;
  final String? productId;
  final String? status;
  final int? pageSize;
  final int? pageNumber;
  List<int>? tags;

  factory CommentFilterDto.fromJson(final String? str) => CommentFilterDto.fromMap(json.decode(str!));

  String? toJson() => json.encode(removeNullEntries(toMap()));

  factory CommentFilterDto.fromMap(final dynamic json) => CommentFilterDto(
        userId: json["userId"],
        productOwnerId: json["productOwnerId"],
        productId: json["comment"],
        status: json["status"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
      );

  dynamic toMap() => {
        "userId": userId,
        "productOwnerId": productOwnerId,
        "productId": productId,
        "status": status,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
      };
}
