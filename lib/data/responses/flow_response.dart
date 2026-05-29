part of "../data.dart";

class UFlowStepSend {
  UFlowStepSend({
    required this.id,
    required this.fields,
  });

  factory UFlowStepSend.fromJson(String str) => UFlowStepSend.fromMap(json.decode(str));

  factory UFlowStepSend.fromMap(Map<String, dynamic> json) => UFlowStepSend(
    id: json["id"],
    fields: json["fields"] == null ? <UFlowField>[] : List<UFlowField>.from(json["fields"].map((dynamic x) => UFlowField.fromMap(x))),
  );

  final String id;
  final List<UFlowField> fields;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "fields": List<dynamic>.from(fields.map((UFlowField x) => x.toMap())),
  };
}

class UFlowStepGet {
  UFlowStepGet({
    required this.id,
    required this.title,
    required this.description,
    required this.fields,
  });

  factory UFlowStepGet.fromJson(String str) => UFlowStepGet.fromMap(json.decode(str));

  factory UFlowStepGet.fromMap(Map<String, dynamic> json) => UFlowStepGet(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    fields: json["fields"] == null
        ? <UFlowField>[]
        : List<UFlowField>.from(
            json["fields"].map((dynamic x) => UFlowField.fromMap(x)),
          ),
  );

  final String id;
  final String title;
  final String description;
  final List<UFlowField> fields;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "title": title,
    "description": description,
    "fields": List<dynamic>.from(fields.map((UFlowField x) => x.toMap())),
  };
}

class UFlowField {
  UFlowField({
    required this.label,
    required this.type,
    required this.required,
    required this.key,
    this.value,
    this.validation,
    this.options,
  });

  factory UFlowField.fromJson(String str) => UFlowField.fromMap(json.decode(str));

  factory UFlowField.fromMap(Map<String, dynamic> json) => UFlowField(
    label: json["label"],
    value: json["value"],
    type: json["type"],
    required: json["required"],
    key: json["key"],
    validation: json["validation"] == null ? null : UValidationRule.fromMap(json["validation"]),
    options: json["options"] == null
        ? <UOption>[]
        : List<UOption>.from(
            json["options"].map((dynamic x) => UOption.fromMap(x)),
          ),
  );

  final String label;
  String? value;
  final int type;
  final bool required;
  final String key;
  final UValidationRule? validation;
  final List<UOption>? options;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "label": label,
    "value": value,
    "type": type,
    "required": required,
    "key": key,
    "validation": validation?.toMap(),
    "options": options == null ? null : List<dynamic>.from(options!.map((UOption x) => x.toMap())),
  };
}

class UValidationRule {
  UValidationRule({
    this.minLength,
    this.maxLength,
    this.message,
    this.allowedType = const <String>[],
    this.maxSizeMb,
  });

  factory UValidationRule.fromJson(String str) => UValidationRule.fromMap(json.decode(str));

  factory UValidationRule.fromMap(Map<String, dynamic> json) => UValidationRule(
    minLength: json["minLength"],
    maxLength: json["maxLength"],
    message: json["message"],
    allowedType: json["allowedType"] == null ? <String>[] : List<String>.from(json["allowedType"].map((dynamic x) => x)),
    maxSizeMb: json["maxSizeMb"],
  );

  final int? minLength;
  final int? maxLength;
  final String? message;
  final List<String> allowedType;
  final int? maxSizeMb;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "minLength": minLength,
    "maxLength": maxLength,
    "message": message,
    "allowedType": List<dynamic>.from(allowedType.map((String x) => x)),
    "maxSizeMb": maxSizeMb,
  };
}

class UOption {
  UOption({
    required this.key,
    required this.value,
  });

  factory UOption.fromJson(String str) => UOption.fromMap(json.decode(str));

  factory UOption.fromMap(Map<String, dynamic> json) => UOption(
    key: json["key"],
    value: json["value"],
  );

  final String key;
  final String value;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "key": key,
    "value": value,
  };
}
