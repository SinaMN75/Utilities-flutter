part of "../data.dart";

class FollowParams {

  FollowParams({
    this.userId,
    this.targetUserId,
    this.targetProductId,
    this.targetCategoryId,
  });

  factory FollowParams.fromJson(String str) => FollowParams.fromMap(json.decode(str));

  factory FollowParams.fromMap(Map<String, dynamic> json) => FollowParams(
    userId: json["userId"],
    targetUserId: json["targetUserId"],
    targetProductId: json["targetProductId"],
    targetCategoryId: json["targetCategoryId"],
  );
  final String? userId;
  final String? targetUserId;
  final String? targetProductId;
  final String? targetCategoryId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "targetUserId": targetUserId,
    "targetProductId": targetProductId,
    "targetCategoryId": targetCategoryId,
  };
}