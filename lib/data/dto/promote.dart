import 'package:utilities/utilities.dart';

class PromoteCreateUpdateDto {
  PromoteCreateUpdateDto({
    this.id,
    this.displayType,
    this.skills,
    this.gender,
    this.ageCategories,
    this.states,
    this.productId,
    this.groupChatId,
  });

  factory PromoteCreateUpdateDto.fromJson(final String str) => PromoteCreateUpdateDto.fromMap(json.decode(str));

  factory PromoteCreateUpdateDto.fromMap(final dynamic json) => PromoteCreateUpdateDto(
        id: json["id"],
        displayType: json["displayType"],
        skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((final x) => x)),
        gender: json["gender"] == null ? [] : List<String>.from(json["gender"]!.map((final x) => x)),
        ageCategories: json["ageCategories"] == null ? [] : List<String>.from(json["ageCategories"]!.map((final x) => x)),
        states: json["states"] == null ? [] : List<String>.from(json["states"]!.map((final x) => x)),
        productId: json["productId"],
        groupChatId: json["groupChatId"],
      );

  final String? id;
  final int? displayType;
  final List<String>? skills;
  final List<String>? gender;
  final List<String>? ageCategories;
  final List<String>? states;
  final String? productId;
  final String? groupChatId;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "id": id,
        "displayType": displayType,
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((final String x) => x)),
        "gender": gender == null ? [] : List<dynamic>.from(gender!.map((final String x) => x)),
        "ageCategories": ageCategories == null ? [] : List<dynamic>.from(ageCategories!.map((final String x) => x)),
        "states": states == null ? [] : List<dynamic>.from(states!.map((final String x) => x)),
        "productId": productId,
        "groupChatId": groupChatId,
      };
}

class PromoteReadDto {
  PromoteReadDto({
    this.totalSeen,
    this.statePerUsers,
    this.skillPerUsers,
    this.ageCategoryPerUsers,
  });

  factory PromoteReadDto.fromJson(final String str) => PromoteReadDto.fromMap(json.decode(str));

  factory PromoteReadDto.fromMap(final dynamic json) => PromoteReadDto(
        totalSeen: json["totalSeen"],
        statePerUsers: json["statePerUsers"] == null ? [] : List<KeyValueViewModel>.from(json["statePerUsers"]!.map(KeyValueViewModel.fromMap)),
        skillPerUsers: json["skillPerUsers"] == null ? [] : List<KeyValueViewModel>.from(json["skillPerUsers"]!.map(KeyValueViewModel.fromMap)),
        ageCategoryPerUsers: json["ageCategoryPerUsers"] == null ? [] : List<KeyValueViewModel>.from(json["ageCategoryPerUsers"]!.map(KeyValueViewModel.fromMap)),
      );

  final int? totalSeen;
  final List<KeyValueViewModel>? statePerUsers;
  final List<KeyValueViewModel>? skillPerUsers;
  final List<KeyValueViewModel>? ageCategoryPerUsers;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "totalSeen": totalSeen,
        "statePerUsers": statePerUsers == null ? [] : List<dynamic>.from(statePerUsers!.map((final KeyValueViewModel x) => x.toMap())),
        "skillPerUsers": skillPerUsers == null ? [] : List<dynamic>.from(skillPerUsers!.map((final KeyValueViewModel x) => x.toMap())),
        "ageCategoryPerUsers": ageCategoryPerUsers == null ? [] : List<dynamic>.from(ageCategoryPerUsers!.map((final KeyValueViewModel x) => x.toMap())),
      };
}
