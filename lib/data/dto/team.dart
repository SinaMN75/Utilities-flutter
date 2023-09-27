part of '../data.dart';

class TeamReadDto {
  TeamReadDto({
    this.id,
    this.user,
  });

  final String? id;
  final UserReadDto? user;

  factory TeamReadDto.fromJson(String str) => TeamReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory TeamReadDto.fromMap(dynamic json) => TeamReadDto(
        id: json["id"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
      );

  dynamic toMap() => {
        "id": id,
        "user": user == null ? null : user!.toMap(),
      };
}
