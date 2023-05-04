import 'package:utilities/utilities.dart';

class TeamReadDto {
  TeamReadDto({
    this.id,
    this.user,
  });

  final String? id;
  final UserReadDto? user;

  factory TeamReadDto.fromJson(String str) => TeamReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeamReadDto.fromMap(Map<String, dynamic> json) => TeamReadDto(
        id: json["id"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user": user == null ? null : user!.toMap(),
      };
}
