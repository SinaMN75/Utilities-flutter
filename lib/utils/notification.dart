import 'dart:html';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void showNotification({
  required final VoidCallback onNotificationTap,
  required final String message,
}) {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: const AndroidInitializationSettings('@mipmap/launcher_icon'),
    iOS: DarwinInitializationSettings(
      onDidReceiveLocalNotification: (final int? id, final String? title, final String? body, final String? payload) => onNotificationTap,
    ),
    linux: const LinuxInitializationSettings(defaultActionName: 'Open notification'),
  );
  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (final NotificationResponse notificationResponse) => onNotificationTap,
  );
  flutterLocalNotificationsPlugin.show(
    0,
    'پورشیا',
    message,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        enableLights: true,
        colorized: true,
      ),
    ),
    payload: 'item x',
  );
}
