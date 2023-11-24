part of '../data.dart';

class FirebaseDataSource {

  Future<void> sendPushNotification({
    required final String fcmToken,
    required final String title,
    required final String body,
  }) async =>
      httpPost(
        url: "https://fcm.googleapis.com/fcm/send",
        body: """
        {
    "to": "$fcmToken",
    "notification": {
        "title": "$title",
        "body": "$body",
        "mutable_content": true,
        "sound": "Tri-tone"
    },
    "data": {
        "url": "Hello",
        "dl": "<deeplink action on tap of notification>"
    }
}
        """,
        encodeBody: false,
        action: (Response response) {},
        error: (Response response) {},
      );
}
