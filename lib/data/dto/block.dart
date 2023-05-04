import 'package:utilities/utilities.dart';

class BlockCreateUpdateDto {
  BlockCreateUpdateDto({
    this.userId,
  });

  final String? userId;

  factory BlockCreateUpdateDto.fromJson(String str) => BlockCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlockCreateUpdateDto.fromMap(Map<String, dynamic> json) => BlockCreateUpdateDto(
        userId: json["userId"] == null ? null : json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId == null ? null : userId,
      };
}
