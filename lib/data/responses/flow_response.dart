part of "../data.dart";

class UProcessStepSend {
  UProcessStepSend({
    required this.id,
    required this.fields,
  });

  factory UProcessStepSend.fromJson(String str) => UProcessStepSend.fromMap(json.decode(str));

  factory UProcessStepSend.fromMap(Map<String, dynamic> json) =>
      UProcessStepSend(
    id: json["id"],
        fields: json["fields"] == null ? <UProcessField>[] : List<UProcessField>.from(json["fields"].map((dynamic x) => UProcessField.fromMap(x))),
  );

  final String id;
  final List<UProcessField> fields;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "id": id,
        "fields": List<dynamic>.from(fields.map((dynamic x) => x.toMap())),
      };
}

class UProcessGetParams {
  UProcessGetParams({
    required this.processId,
    this.intro = false,
  });

  factory UProcessGetParams.fromJson(String str) => UProcessGetParams.fromMap(json.decode(str));

  factory UProcessGetParams.fromMap(Map<String, dynamic> json) =>
      UProcessGetParams(
        processId: json["processId"],
        intro: json["intro"] ?? false,
      );

  final String processId;
  final bool intro;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "processId": processId,
        "intro": intro,
      };
}

class UProcess {
  UProcess({
    required this.mainProcesses,
  });

  factory UProcess.fromJson(String str) => UProcess.fromMap(json.decode(str));

  factory UProcess.fromMap(Map<String, dynamic> json) =>
      UProcess(
        mainProcesses: json["mainProcesses"] == null ? <UProcessItem>[] : List<UProcessItem>.from(json["mainProcesses"].map((dynamic x) => UProcessItem.fromMap(x))),
      );

  final List<UProcessItem> mainProcesses;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "mainProcesses": List<dynamic>.from(mainProcesses.map((dynamic x) => x.toMap())),
      };
}

class UProcessItem {
  UProcessItem({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.status,
  });

  factory UProcessItem.fromJson(String str) => UProcessItem.fromMap(json.decode(str));

  factory UProcessItem.fromMap(Map<String, dynamic> json) =>
      UProcessItem(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        icon: json["icon"],
        status: json["status"],
      );

  final String id;
  final String title;
  final String description;
  final String icon;
  final int status;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "title": title,
    "description": description,
    "icon": icon,
    "status": status,
  };
}

class UProcessStepGet {
  UProcessStepGet({
    required this.id,
    required this.title,
    required this.description,
    this.isScrollable = false,
    this.fields,
    this.message,
  });

  factory UProcessStepGet.fromJson(String str) => UProcessStepGet.fromMap(json.decode(str));

  factory UProcessStepGet.fromMap(Map<String, dynamic> json) =>
      UProcessStepGet(
    id: json["id"],
    title: json["title"],
    description: json["description"],
        isScrollable: json["isScrollable"] ?? false,
        fields: json["fields"] == null ? null : List<UProcessField>.from(json["fields"].map((dynamic x) => UProcessField.fromMap(x))),
        message: json["message"],
  );

  final String id;
  final String title;
  final String description;
  final bool isScrollable;
  final List<UProcessField>? fields;
  final String? message;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "title": title,
    "description": description,
    "isScrollable": isScrollable,
    "fields": fields == null ? null : List<dynamic>.from(fields!.map((dynamic x) => x.toMap())),
    "message": message,
  };
}

class UProcessField {
  UProcessField({
    required this.label,
    required this.type,
    required this.required,
    required this.key,
    this.value,
    this.textFieldConfig,
    this.fileConfig,
    this.dropDownConfig,
    this.options,
  });

  factory UProcessField.fromJson(String str) => UProcessField.fromMap(json.decode(str));

  factory UProcessField.fromMap(Map<String, dynamic> json) =>
      UProcessField(
    label: json["label"],
    value: json["value"],
    type: json["type"],
    required: json["required"],
    key: json["key"],
        textFieldConfig: json["textFieldConfig"] == null ? null : UTextFieldConfig.fromMap(json["textFieldConfig"]),
        fileConfig: json["fileConfig"] == null ? null : UFileConfig.fromMap(json["fileConfig"]),
        dropDownConfig: json["dropDownConfig"] == null ? null : UDropDownConfig.fromMap(json["dropDownConfig"]),
        options: json["options"] == null ? null : List<UOption>.from(json["options"].map((dynamic x) => UOption.fromMap(x))),
  );

  final String label;
  String? value;
  final int type;
  final bool required;
  final String key;

  final UTextFieldConfig? textFieldConfig;
  final UFileConfig? fileConfig;
  final UDropDownConfig? dropDownConfig;
  final List<UOption>? options;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "label": label,
    "value": value,
    "type": type,
    "required": required,
    "key": key,
    "textFieldConfig": textFieldConfig?.toMap(),
    "fileConfig": fileConfig?.toMap(),
    "dropDownConfig": dropDownConfig?.toMap(),
    "options": options == null ? null : List<dynamic>.from(options!.map((dynamic x) => x.toMap())),
  };
}

class UTextFieldConfig {
  UTextFieldConfig({
    this.minLength,
    this.maxLength,
  });

  factory UTextFieldConfig.fromJson(String str) => UTextFieldConfig.fromMap(json.decode(str));

  factory UTextFieldConfig.fromMap(Map<String, dynamic> json) =>
      UTextFieldConfig(
    minLength: json["minLength"],
    maxLength: json["maxLength"],
  );

  final int? minLength;
  final int? maxLength;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "minLength": minLength,
    "maxLength": maxLength,
  };
}

class UFileConfig {
  UFileConfig({
    this.allowedExtensions,
    this.isImage = false,
    this.isVideo = false,
    this.isPdf = false,
    this.isCamera = false,
    this.isSelfieCamera = false,
  });

  factory UFileConfig.fromJson(String str) => UFileConfig.fromMap(json.decode(str));

  factory UFileConfig.fromMap(Map<String, dynamic> json) =>
      UFileConfig(
        allowedExtensions: json["allowedExtensions"] == null ? null : List<String>.from(json["allowedExtensions"].map((dynamic x) => x)),
        isImage: json["isImage"] ?? false,
        isVideo: json["isVideo"] ?? false,
        isPdf: json["isPdf"] ?? false,
        isCamera: json["isCamera"] ?? false,
        isSelfieCamera: json["isSelfieCamera"] ?? false,
      );

  final List<String>? allowedExtensions;
  final bool isImage;
  final bool isVideo;
  final bool isPdf;
  final bool isCamera;
  final bool isSelfieCamera;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "allowedExtensions": allowedExtensions == null ? null : List<dynamic>.from(allowedExtensions!.map((dynamic x) => x)),
        "isImage": isImage,
        "isVideo": isVideo,
        "isPdf": isPdf,
        "isCamera": isCamera,
        "isSelfieCamera": isSelfieCamera,
      };
}

class UDropDownConfig {
  UDropDownConfig({
    this.isSearchable = false,
  });

  factory UDropDownConfig.fromJson(String str) => UDropDownConfig.fromMap(json.decode(str));

  factory UDropDownConfig.fromMap(Map<String, dynamic> json) =>
      UDropDownConfig(
        isSearchable: json["isSearchable"] ?? false,
      );

  final bool isSearchable;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "isSearchable": isSearchable,
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
