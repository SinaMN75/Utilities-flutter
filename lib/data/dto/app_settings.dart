import 'package:utilities/utilities.dart';

class AppSettingsDto {
  AppSettingsDto({
    this.appSettings,
  });

  final AppSettings? appSettings;

  factory AppSettingsDto.fromJson(final String str) => AppSettingsDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettingsDto.fromMap(final dynamic json) => AppSettingsDto(
        appSettings: json["appSettings"] == null ? null : AppSettings.fromMap(json["appSettings"]),
      );

  dynamic toMap() => {
        "appSettings": appSettings == null ? null : appSettings!.toMap(),
      };
}

class AppSettings {
  AppSettings({
    this.formFieldType,
    this.smsPanelSettings,
    this.androidMinimumVersion,
    this.androidLatestVersion,
    this.iosMinimumVersion,
    this.iosLatestVersion,
    this.androidDownloadLink1,
    this.androidDownloadLink2,
    this.iosDownloadLink1,
    this.iosDownloadLink2,
  });

  final SmsPanelSettings? smsPanelSettings;
  final List<FormFieldTypeDto>? formFieldType;
  final String? androidMinimumVersion;
  final String? androidLatestVersion;
  final String? iosMinimumVersion;
  final String? iosLatestVersion;
  final String? androidDownloadLink1;
  final String? androidDownloadLink2;
  final String? iosDownloadLink1;
  final String? iosDownloadLink2;

  factory AppSettings.fromJson(final String str) => AppSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppSettings.fromMap(final dynamic json) => AppSettings(
        smsPanelSettings: json["smsPanelSettings"] == null ? null : SmsPanelSettings.fromMap(json["smsPanelSettings"]),
        formFieldType: json["formFieldType"] == null ? null : List<FormFieldTypeDto>.from(json["formFieldType"].map((x) => FormFieldTypeDto.fromMap(x))),
        androidMinimumVersion: json["androidMinimumVersion"],
        androidLatestVersion: json["androidLatestVersion"],
        iosMinimumVersion: json["iosMinimumVersion"],
        iosLatestVersion: json["iosLatestVersion"],
        androidDownloadLink1: json["androidDownloadLink1"],
        androidDownloadLink2: json["androidDownloadLink2"],
        iosDownloadLink1: json["iosDownloadLink1"],
        iosDownloadLink2: json["iosDownloadLink2"],
      );

  dynamic toMap() => <String, dynamic>{
        "formFieldType": formFieldType == null ? null : List<dynamic>.from(formFieldType!.map((x) => x.toMap())),
        "smsPanelSettings": smsPanelSettings == null ? null : smsPanelSettings!.toMap(),
        "androidMinimumVersion": androidMinimumVersion,
        "androidLatestVersion": androidLatestVersion,
        "iosMinimumVersion": iosMinimumVersion,
        "iosLatestVersion": iosLatestVersion,
        "androidDownloadLink1": androidDownloadLink1,
        "androidDownloadLink2": androidDownloadLink2,
        "iosDownloadLink1": iosDownloadLink1,
        "iosDownloadLink2": iosDownloadLink2,
      };
}

class SmsPanelSettings {
  SmsPanelSettings({
    this.userName,
    this.lineNumber,
    this.smsApiKey,
    this.smsSecret,
    this.otpId,
    this.patternCode,
  });

  final String? userName;
  final String? lineNumber;
  final String? smsApiKey;
  final String? smsSecret;
  final int? otpId;
  final String? patternCode;

  factory SmsPanelSettings.fromJson(final String str) => SmsPanelSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SmsPanelSettings.fromMap(final dynamic json) => SmsPanelSettings(
        userName: json["userName"],
        lineNumber: json["lineNumber"],
        smsApiKey: json["smsApiKey"],
        smsSecret: json["smsSecret"],
        otpId: json["otpId"],
        patternCode: json["patternCode"],
      );

  dynamic toMap() => {
        "userName": userName,
        "lineNumber": lineNumber,
        "smsApiKey": smsApiKey,
        "smsSecret": smsSecret,
        "otpId": otpId,
        "patternCode": patternCode,
      };
}

class FormFieldTypeDto {
  FormFieldTypeDto({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  factory FormFieldTypeDto.fromJson(String str) => FormFieldTypeDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormFieldTypeDto.fromMap(Map<String, dynamic> json) => FormFieldTypeDto(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}
