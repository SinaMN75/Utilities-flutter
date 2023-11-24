import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:utilities/utilities.dart';

part 'dto/address.dart';
part 'dto/app_settings.dart';
part 'dto/block.dart';
part 'dto/category.dart';
part 'dto/insta_post_dto.dart';
part 'dto/comment.dart';
part 'dto/content.dart';
part 'dto/dashboard_data.dart';
part 'dto/discount.dart';
part 'dto/follow_bookmark.dart';
part 'dto/gender.dart';
part 'dto/generic_response.dart';
part 'dto/group_chat.dart';
part 'dto/location.dart';
part 'dto/mail_sms_notification.dart';
part 'dto/media.dart';
part 'dto/notification.dart';
part 'dto/order.dart';
part 'dto/payment.dart';
part 'dto/product.dart';
part 'dto/promote.dart';
part 'dto/pushe.dart';
part 'dto/reaction.dart';
part 'dto/reaction_product.dart';
part 'dto/report.dart';
part 'dto/shopping_cart.dart';
part 'dto/subscription.dart';
part 'dto/team.dart';
part 'dto/transaction.dart';
part 'dto/user.dart';
part 'local_datasource/local_datasource.dart';
part 'remote_datasource/address_datasource.dart';
part 'remote_datasource/firebase_datasource.dart';
part 'remote_datasource/app_settings_datasource.dart';
part 'remote_datasource/block_datasource.dart';
part 'remote_datasource/category_datasource.dart';
part 'remote_datasource/comment_datasource.dart';
part 'remote_datasource/content_datasource.dart';
part 'remote_datasource/discounte_datasource.dart';
part 'remote_datasource/follow_bookmark_datasource.dart';
part 'remote_datasource/group_chat_datasource.dart';
part 'remote_datasource/mail_sms_notification_datasource.dart';
part 'remote_datasource/notification_datasource.dart';
part 'remote_datasource/order_datasource.dart';
part 'remote_datasource/payment_datasource.dart';
part 'remote_datasource/product_datasource.dart';
part 'remote_datasource/promote_datasource.dart';
part 'remote_datasource/report_datasource.dart';
part 'remote_datasource/shopping_cart_datasource.dart';
part 'remote_datasource/subscription_payment_datasource.dart';
part 'remote_datasource/transaction_datasource.dart';
part 'remote_datasource/user_datasource.dart';
part 'remote_datasource/scrapper_datasource.dart';
part 'remote_datasource/media_datasource.dart';

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
