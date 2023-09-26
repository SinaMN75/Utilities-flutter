import 'dart:convert';

export 'address.dart';
export 'category.dart';
export 'comment.dart';
export 'contact_information.dart';
export 'content.dart';
export 'follow_bookmark.dart';
export 'form.dart';
export 'gender.dart';
export 'generic_response.dart';
export 'group_chat.dart';
export 'location.dart';
export 'mail_sms_notification.dart';
export 'media.dart';
export 'notification.dart';
export 'product.dart';
export 'promote.dart';
export 'shopping_cart.dart';
export 'transaction.dart';
export 'user.dart';

T? removeNullEntries<T>(T? json) {
  if (json == null) return null;

  if (json is List) {
    json.removeWhere((e) => e == null);
    json.forEach(removeNullEntries);
  } else if (json is Map) {
    json.removeWhere((key, value) => key == null || value == null);
    json.values.forEach(removeNullEntries);
  }

  return json;
}

class EmptyObjectDto {
  EmptyObjectDto({this.o});

  factory EmptyObjectDto.fromJson(final String str) => EmptyObjectDto.fromMap(json.decode(str));

  factory EmptyObjectDto.fromMap(final Map<String, dynamic> json) => EmptyObjectDto(o: json["o"]);
  final String? o;

  String toJson() => json.encode(removeNullEntries(toMap()));

  Map<String, dynamic> toMap() => <String, dynamic>{"o": o};
}
