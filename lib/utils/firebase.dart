part of 'utils.dart';

class UtilitiesFirebase {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FirebaseAnalytics instance = FirebaseAnalytics.instance;

  static Future<void> initNotifications({
    required final Function(RemoteMessage? message) onMessage,
    required final Function(RemoteMessage? message) onBackgroundMessage,
  }) async {
    if (UAppUtils.isAndroid) {
      FirebaseMessaging.onMessage.listen(onMessage);
      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage as BackgroundMessageHandler);
    } else
      return;
  }

  static Future<String?> getFcmToken() async {
    if (UAppUtils.isAndroid) {
      await _firebaseMessaging.requestPermission(announcement: true, carPlay: true, criticalAlert: true, provisional: true);
      final String? fcmToken = await _firebaseMessaging.getToken();
      developer.log("FCM Token: $fcmToken");
      return fcmToken;
    } else
      return null;
  }

  static void deleteFcmToken() => _firebaseMessaging.deleteToken();
}
