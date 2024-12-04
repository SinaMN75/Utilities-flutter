import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:utilities/utilities.dart';

part 'dto/address.dart';
part 'dto/app_settings.dart';
part 'dto/base.dart';
part 'dto/category.dart';
part 'dto/comment.dart';
part 'dto/content.dart';
part 'dto/dashboard_data.dart';
part 'dto/discount.dart';
part 'dto/follow_bookmark.dart';
part 'dto/generic_response.dart';
part 'dto/insta_post_dto.dart';
part 'dto/location.dart';
part 'dto/mail_sms_notification.dart';
part 'dto/media.dart';
part 'dto/notification.dart';
part 'dto/order.dart';
part 'dto/payment.dart';
part 'dto/product.dart';
part 'dto/question.dart';
part 'dto/registration.dart';
part 'dto/report.dart';
part 'dto/transaction.dart';
part 'dto/user.dart';
part 'local_datasource/local_datasource.dart';
part 'read_initial_data.dart';
part 'remote_datasource/address_datasource.dart';
part 'remote_datasource/app_settings_datasource.dart';
part 'remote_datasource/block_datasource.dart';
part 'remote_datasource/category_datasource.dart';
part 'remote_datasource/comment_datasource.dart';
part 'remote_datasource/content_datasource.dart';
part 'remote_datasource/firebase_datasource.dart';
part 'remote_datasource/follow_bookmark_datasource.dart';
part 'remote_datasource/mail_sms_notification_datasource.dart';
part 'remote_datasource/media_datasource.dart';
part 'remote_datasource/notification_datasource.dart';
part 'remote_datasource/order_datasource.dart';
part 'remote_datasource/payment_datasource.dart';
part 'remote_datasource/product_datasource.dart';
part 'remote_datasource/question_datasource.dart';
part 'remote_datasource/registration_datasource.dart';
part 'remote_datasource/report_datasource.dart';
part 'remote_datasource/scrapper_datasource.dart';
part 'remote_datasource/transaction_datasource.dart';
part 'remote_datasource/user_datasource.dart';

class URemoteDataSource {
  URemoteDataSource(this.baseUrl) {
    address = AddressDataSource(baseUrl: baseUrl);
    appSettings = AppSettingsDataSource(baseUrl: baseUrl);
    block = BlockDataSource(baseUrl: baseUrl);
    category = CategoryDataSource(baseUrl: baseUrl);
    comment = CommentDataSource(baseUrl: baseUrl);
    content = ContentDataSource(baseUrl: baseUrl);
    followBookmark = FollowBookmarkDataSource(baseUrl: baseUrl);
    mailSmsNotification = MailSmsNotificationDataSource(baseUrl: baseUrl);
    media = MediaDataSource(baseUrl: baseUrl);
    notification = NotificationDataSource(baseUrl: baseUrl);
    order = OrderDataSource(baseUrl: baseUrl);
    payment = PaymentDataSource(baseUrl: baseUrl);
    product = ProductDataSource(baseUrl: baseUrl);
    question = QuestionDataSource(baseUrl: baseUrl);
    registration = RegistrationDataSource(baseUrl: baseUrl);
    report = ReportDataSource(baseUrl: baseUrl);
    scrapper = ScrapperDataSource(baseUrl: baseUrl);
    transaction = TransactionDataSource(baseUrl: baseUrl);
    user = UserDataSource(baseUrl: baseUrl);
  }

  late String baseUrl;

  late AddressDataSource address;
  late AppSettingsDataSource appSettings;
  late BlockDataSource block;
  late CategoryDataSource category;
  late CommentDataSource comment;
  late ContentDataSource content;
  late FollowBookmarkDataSource followBookmark;
  late MailSmsNotificationDataSource mailSmsNotification;
  late MediaDataSource media;
  late NotificationDataSource notification;
  late OrderDataSource order;
  late PaymentDataSource payment;
  late ProductDataSource product;
  late QuestionDataSource question;
  late RegistrationDataSource registration;
  late ReportDataSource report;
  late ScrapperDataSource scrapper;
  late TransactionDataSource transaction;
  late UserDataSource user;
}

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
