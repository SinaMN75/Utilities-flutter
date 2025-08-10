part of "../data.dart";

class FollowParams {
  final String? userId;
  final String? targetUserId;
  final String? targetProductId;
  final String? targetCategoryId;

  FollowParams({
    this.userId,
    this.targetUserId,
    this.targetProductId,
    this.targetCategoryId,
  });

  factory FollowParams.fromJson(String str) => FollowParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FollowParams.fromMap(Map<String, dynamic> json) => FollowParams(
    userId: json["userId"],
    targetUserId: json["targetUserId"],
    targetProductId: json["targetProductId"],
    targetCategoryId: json["targetCategoryId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "targetUserId": targetUserId,
    "targetProductId": targetProductId,
    "targetCategoryId": targetCategoryId,
  };
}