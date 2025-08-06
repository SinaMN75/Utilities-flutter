part of "../data.dart";

class FollowerFollowingCountResponse {
  final int followers;
  final int followings;

  FollowerFollowingCountResponse({
    required this.followers,
    required this.followings,
  });

  factory FollowerFollowingCountResponse.fromJson(String str) => FollowerFollowingCountResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FollowerFollowingCountResponse.fromMap(Map<String, dynamic> json) => FollowerFollowingCountResponse(
    followers: json["followers"],
    followings: json["followings"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "followers": followers,
    "followings": followings,
  };
}