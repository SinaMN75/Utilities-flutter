import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:utilities/utilities2.dart';
import 'package:utilities/utils/utils.dart';

class FireBaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications({required final Function(RemoteMessage? message) onMessageReceived}) async {
    if (isAndroid) {
      getFcmToken();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) => onMessageReceived(message));
      FirebaseMessaging.onBackgroundMessage((RemoteMessage message) => onMessageReceived(message));
    }
  }

  Future<String?> getFcmToken() async {
    await _firebaseMessaging.requestPermission(announcement: true, carPlay: true, criticalAlert: true, provisional: true);
    final String? fcmToken = await _firebaseMessaging.getToken();
    log("FCM Token: $fcmToken");
    return fcmToken;
  }
}
