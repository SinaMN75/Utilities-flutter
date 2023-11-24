part of '../data.dart';

class FirebaseDataSource {
  final String authorization;

  FirebaseDataSource({required this.authorization});

  Future<void> sendPushNotification({
    required final String fcmToken,
    required final String title,
    required final String body,
  }) async =>
      await GetConnect().post(
        "https://fcm.googleapis.com/fcm/send",
        <String, dynamic>{
          "to": fcmToken,
          "notification": <String, dynamic>{"title": title, "body": body, "mutable_content": true, "sound": "Tri-tone"},
          "data": <String, String>{"url": "hello"}
        },
        headers: <String, String>{"Authorization": authorization},
      );
}
