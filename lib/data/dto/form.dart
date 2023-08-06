import 'package:utilities/data/dto/form_filed.dart';
import 'package:utilities/utilities.dart';

class FormReadDto {
  FormReadDto({
    this.id,
    this.title,
    this.formField,
    this.tags,
    this.children = const <FormReadDto>[],
  });

  final String? id;
  final String? title;
  final FormFieldReadDto? formField;
  List<int>? tags;
  List<FormReadDto> children;

  factory FormReadDto.fromJson(String str) => FormReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormReadDto.fromMap(dynamic json) => FormReadDto(
    id: json["id"],
    title: json["title"],
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    formField: json["formField"] == null ? null : FormFieldReadDto.fromMap(json["formField"]),
    children: json["children"] == null ? [] : List<FormReadDto>.from(json["children"].cast<dynamic>().map(FormReadDto.fromMap)).toList(),
  );

  dynamic toMap() => {
    "id": id,
    "title": title,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
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
    this.tags,
  });

  final String? userId;
  final String? productId;
  final String? orderDetailId;
  List<int>? tags;
  final List<FormReadDto>? forms;

  factory FormCreateUpdateDto.fromJson(String str) => FormCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormCreateUpdateDto.fromMap(dynamic json) => FormCreateUpdateDto(
    userId: json["userId"],
    productId: json["productId"],
    orderDetailId: json["orderDetailId"],
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    forms: json["form"] == null ? null : List<FormReadDto>.from(json["form"].cast<dynamic>().map(FormReadDto.fromMap)).toList(),
  );

  dynamic toMap() => {
    "userId": userId,
    "productId": productId,
    "orderDetailId": orderDetailId,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
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
    this.tags,
    this.categoryId,
  });

  final String? id;
  final String? label;
  final String? title;
  final bool? isRequired;

  // final String? optionList;
  final int? type;
  List<int>? tags;
  List<String>? optionList;
  final String? categoryId;

  factory FormFieldCreateUpdateDto.fromJson(String str) => FormFieldCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormFieldCreateUpdateDto.fromMap(dynamic json) => FormFieldCreateUpdateDto(
    id: json["id"],
    label: json["label"],
    title: json["title"],
    isRequired: json["isRequired"],
    // optionList: json["optionList"],
    type: json["type"],
    optionList: json["optionList"] == null ? <String>[] : List<String>.from(json["optionList"]!.map((final dynamic x) => x)),
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    categoryId: json["categoryId"],
  );

  dynamic toMap() => {
    "id": id,
    "label": label,
    "title": title,
    "isRequired": isRequired,
    // "optionList": optionList,
    "type": type,
    "optionList": tags == null ? [] : List<dynamic>.from(optionList!.map((final String x) => x)),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
    "categoryId": categoryId,
  };
}
