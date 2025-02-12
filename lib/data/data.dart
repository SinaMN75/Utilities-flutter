import 'package:u/data/messages.dart';
import 'package:u/utilities.dart';

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

abstract class URemoteDataSource {
  static late String baseUrl;

  static AddressDataSource address = AddressDataSource(baseUrl: baseUrl);
  static AppSettingsDataSource appSettings = AppSettingsDataSource(baseUrl: baseUrl);
  static BlockDataSource block = BlockDataSource(baseUrl: baseUrl);
  static CategoryDataSource category = CategoryDataSource(baseUrl: baseUrl);
  static CommentDataSource comment = CommentDataSource(baseUrl: baseUrl);
  static ContentDataSource content = ContentDataSource(baseUrl: baseUrl);
  static FollowBookmarkDataSource followBookmark = FollowBookmarkDataSource(baseUrl: baseUrl);
  static MailSmsNotificationDataSource mailSmsNotification = MailSmsNotificationDataSource(baseUrl: baseUrl);
  static MediaDataSource media = MediaDataSource(baseUrl: baseUrl);
  static NotificationDataSource notification = NotificationDataSource(baseUrl: baseUrl);
  static OrderDataSource order = OrderDataSource(baseUrl: baseUrl);
  static PaymentDataSource payment = PaymentDataSource(baseUrl: baseUrl);
  static ProductDataSource product = ProductDataSource(baseUrl: baseUrl);
  static QuestionDataSource question = QuestionDataSource(baseUrl: baseUrl);
  static RegistrationDataSource registration = RegistrationDataSource(baseUrl: baseUrl);
  static ReportDataSource report = ReportDataSource(baseUrl: baseUrl);
  static ScrapperDataSource scrapper = ScrapperDataSource(baseUrl: baseUrl);
  static TransactionDataSource transaction = TransactionDataSource(baseUrl: baseUrl);
  static UserDataSource user = UserDataSource(baseUrl: baseUrl);
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
