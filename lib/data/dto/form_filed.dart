import 'package:utilities/utilities.dart';

class FormFieldReadDto {
  FormFieldReadDto({
    this.id,
    this.label,
    this.title,
    this.isRequired,
    this.optionList,
    this.type,
    this.categoryId,
    this.children,
  });

  final String? id;
  final String? label;
  final String? title;
  final String? optionList;
  final String? categoryId;
  final bool? isRequired;
  final int? type;
  final List<FormFieldReadDto>? children;

  factory FormFieldReadDto.fromJson(String str) => FormFieldReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormFieldReadDto.fromMap(Map<String, dynamic> json) => FormFieldReadDto(
        id: json["id"],
        label: json["label"],
        title: json["title"],
        isRequired: json["isRequired"],
        optionList: json["optionList"],
        type: json["type"],
        categoryId: json["categoryId"],
        children: json["children"] == null ? null : List<FormFieldReadDto>.from(json["children"].map((e) => FormFieldReadDto.fromMap(e)))
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "label": label,
        "title": title,
        "isRequired": isRequired,
        "optionList": optionList,
        "type": type,
        "categoryId": categoryId,
        "children": children == null ? null : List<dynamic>.from(children!.map((e) => e.toMap())),
      };
}
