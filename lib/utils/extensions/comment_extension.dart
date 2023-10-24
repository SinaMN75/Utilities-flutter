part of '../utils.dart';

extension ReactsExtension on CommentReadDto {
  int reactionByUserId(String userId) => (this.commentJsonDetail?.commentReacts ?? <ReactionReadDto>[]).where((element) => element.userId == userId).toList().firstOrDefault(defaultValue: TagReaction.none.number);
}
