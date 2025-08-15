part of "../data.dart";

class UFollowParams {
  UFollowParams({
    this.userId,
    this.targetUserId,
    this.targetProductId,
    this.targetCategoryId,
  });

  factory UFollowParams.fromJson(String str) => UFollowParams.fromMap(json.decode(str));

  factory UFollowParams.fromMap(Map<String, dynamic> json) => UFollowParams(
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
