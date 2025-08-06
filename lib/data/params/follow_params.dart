part of "../data.dart";

class FollowParams {
  final String? userId;
  final String targetUserId;

  FollowParams({
    this.userId,
    required this.targetUserId,
  });

  factory FollowParams.fromJson(String str) => FollowParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FollowParams.fromMap(Map<String, dynamic> json) => FollowParams(
    userId: json["userId"],
    targetUserId: json["targetUserId"] ?? 1,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "targetUserId": targetUserId,
  };
}