import 'package:utilities/utilities.dart';

class Gender {
  Gender({
    this.id,
    this.title,
    this.titleTr1,
  });

  final int? id;
  final String? title;
  final String? titleTr1;

  factory Gender.fromJson(String str) => Gender.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gender.fromMap(Map<String, dynamic> json) => Gender(
        id: json["id"],
        title: json["title"],
        titleTr1: json["titleTr1"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "titleTr1": titleTr1,
      };
}
