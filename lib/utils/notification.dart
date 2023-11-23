part of 'utils.dart';

void showNotification({
  required final String title,
  required final String message,
  required final VoidCallback onNotificationTap,
  final String channelId = "channelId",
  final String channelName = "channelName",
  final String channelDescription = "channelDescription",
  final String? payload,
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
    title,
    message,
    payload: payload,
    NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        enableLights: true,
        colorized: true,
      ),
    ),
  );
}
