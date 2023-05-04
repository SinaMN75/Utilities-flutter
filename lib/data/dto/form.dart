import 'package:utilities/data/dto/form_filed.dart';
import 'package:utilities/utilities.dart';

class FormReadDto {
  FormReadDto({
    this.id,
    this.title,
    this.formField,
    this.children = const <FormReadDto>[],
  });

  final String? id;
  final String? title;
  final FormFieldReadDto? formField;
  List<FormReadDto> children;

  factory FormReadDto.fromJson(String str) => FormReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormReadDto.fromMap(Map<String, dynamic> json) => FormReadDto(
        id: json["id"],
        title: json["title"],
        formField: json["formField"] == null ? null : FormFieldReadDto.fromMap(json["formField"]),
        children: json["children"] == null ? [] : List<FormReadDto>.from(json["children"].map((x) => FormReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "formField": formField == null ? null : formField!.toMap(),
        "children": List<dynamic>.from(children.map((e) => e.toMap())),
      };
}

class FormCreateUpdateDto {
  FormCreateUpdateDto({
    this.userId,
    this.productId,
    this.orderDetailId,
    this.forms,
  });

  final String? userId;
  final String? productId;
  final String? orderDetailId;
  final List<FormReadDto>? forms;

  factory FormCreateUpdateDto.fromJson(String str) => FormCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormCreateUpdateDto.fromMap(Map<String, dynamic> json) => FormCreateUpdateDto(
        userId: json["userId"],
        productId: json["productId"],
        orderDetailId: json["orderDetailId"],
        forms: json["form"] == null ? null : List<FormReadDto>.from(json["form"].map((x) => FormReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "productId": productId,
        "orderDetailId": orderDetailId,
        "form": forms == null ? null : List<dynamic>.from(forms!.map((x) => x.toMap())),
      };
}

class FormFieldCreateUpdateDto {
  FormFieldCreateUpdateDto({
    this.id,
    this.label,
    this.title,
    this.isRequired,
    this.optionList,
    this.type,
    this.categoryId,
  });

  final String? id;
  final String? label;
  final String? title;
  final bool? isRequired;
  final String? optionList;
  final int? type;
  final String? categoryId;

  factory FormFieldCreateUpdateDto.fromJson(String str) => FormFieldCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormFieldCreateUpdateDto.fromMap(Map<String, dynamic> json) => FormFieldCreateUpdateDto(
        id: json["id"],
        label: json["label"],
        title: json["title"],
        isRequired: json["isRequired"],
        optionList: json["optionList"],
        type: json["type"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "label": label,
        "title": title,
        "isRequired": isRequired,
        "optionList": optionList,
        "type": type,
        "categoryId": categoryId,
      };
}
