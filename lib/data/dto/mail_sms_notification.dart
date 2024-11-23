part of '../data.dart';

class CreateMailSmsNotificationDto {
  CreateMailSmsNotificationDto({
    this.userIds,
    this.title,
    this.bigTitle,
    this.content,
    this.bigContent,
    this.url,
    this.actionType,
    this.showForeground,
  });

  final List<String>? userIds;
  final String? title;
  final String? bigTitle;
  final String? content;
  final String? bigContent;
  final String? url;
  final String? actionType;
  final bool? showForeground;

  factory CreateMailSmsNotificationDto.fromJson(String str) => CreateMailSmsNotificationDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory CreateMailSmsNotificationDto.fromMap(dynamic json) => CreateMailSmsNotificationDto(
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((x) => x)),
        title: json["title"],
        bigTitle: json["bigTitle"],
        content: json["content"],
        bigContent: json["bigContent"],
        url: json["url"],
        actionType: json["actionType"],
        showForeground: json["showForeground"],
      );

  dynamic toMap() => {
        "userIds": userIds == null ? [] : List<String>.from(userIds!.map((x) => x)),
        "title": title,
        "bigTitle": bigTitle,
        "content": content,
        "bigContent": bigContent,
        "url": url,
        "actionType": actionType,
        "showForeground": showForeground,
      };
}

class SendOtpSmsDto {
  final String? mobileNumber;
  final String? param1;
  final String? template;
  final String? param2;
  final String? param3;

  SendOtpSmsDto({
    this.mobileNumber,
    this.param1,
    this.template,
    this.param2,
    this.param3,
  });

  factory SendOtpSmsDto.fromJson(String str) => SendOtpSmsDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory SendOtpSmsDto.fromMap(Map<String, dynamic> json) => SendOtpSmsDto(
    mobileNumber: json["mobileNumber"],
    param1: json["param1"],
    template: json["template"],
    param2: json["param2"],
    param3: json["param3"],
  );

  Map<String, dynamic> toMap() => {
    "mobileNumber": mobileNumber,
    "param1": param1,
    "template": template,
    "param2": param2,
    "param3": param3,
  };
}
