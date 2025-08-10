part of "../data.dart";

class FollowerFollowingCountResponse {
  final int followers;
  final int followedUsers;
  final int followedProducts;
  final int followedCategories;

  FollowerFollowingCountResponse({
    required this.followers,
    required this.followedUsers,
    required this.followedProducts,
    required this.followedCategories,
  });

  factory FollowerFollowingCountResponse.fromJson(String str) => FollowerFollowingCountResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FollowerFollowingCountResponse.fromMap(Map<String, dynamic> json) => FollowerFollowingCountResponse(
    followers: json["followers"],
    followedUsers: json["followedUsers"],
    followedProducts: json["followedProducts"],
    followedCategories: json["followedCategories"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "followers": followers,
    "followedUsers": followedUsers,
    "followedProducts": followedProducts,
    "followedCategories": followedCategories,
  };
}