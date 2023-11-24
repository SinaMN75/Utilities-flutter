part of 'utils.dart';

class FireBaseApi {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FirebaseAnalytics instance = FirebaseAnalytics.instance;

  static Future<void> initNotifications({required final Function(RemoteMessage? message) onMessageReceived}) async {
    if (isAndroid) {
      await getFcmToken();
      FirebaseMessaging.onMessage.listen(onMessageReceived);
      FirebaseMessaging.onBackgroundMessage(onMessageReceived as BackgroundMessageHandler);
    }
  }

  static Future<String?> getFcmToken() async {
    await _firebaseMessaging.requestPermission(announcement: true, carPlay: true, criticalAlert: true, provisional: true);
    final String? fcmToken = await _firebaseMessaging.getToken();
    developer.log("FCM Token: $fcmToken");
    return fcmToken;
  }

  void deleteFcmToken() => _firebaseMessaging.deleteToken();
}