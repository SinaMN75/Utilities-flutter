import 'package:utilities/utilities.dart';

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

  String toJson() => json.encode(toMap());

  factory CreateMailSmsNotificationDto.fromMap(Map<String, dynamic> json) => CreateMailSmsNotificationDto(
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((x) => x)),
        title: json["title"],
        bigTitle: json["bigTitle"],
        content: json["content"],
        bigContent: json["bigContent"],
        url: json["url"],
        actionType: json["actionType"],
        showForeground: json["showForeground"],
      );

  Map<String, dynamic> toMap() => {
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
