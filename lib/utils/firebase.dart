part of 'utils.dart';

class FireBaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications({required final Function(RemoteMessage? message) onMessageReceived}) async {
    if (isAndroid) {
      await getFcmToken();
      FirebaseMessaging.onMessage.listen(onMessageReceived);
      FirebaseMessaging.onBackgroundMessage(onMessageReceived as BackgroundMessageHandler);
    }
  }

  Future<String?> getFcmToken() async {
    await _firebaseMessaging.requestPermission(announcement: true, carPlay: true, criticalAlert: true, provisional: true);
    final String? fcmToken = await _firebaseMessaging.getToken();
    developer.log("FCM Token: $fcmToken");
    return fcmToken;
  }
}
