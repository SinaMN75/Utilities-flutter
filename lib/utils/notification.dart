
class UNotification {
  // static void showNotification({
  //   required final String title,
  //   required final String message,
  //   required final Function(NotificationResponse) onNotificationTap,
  //   final String channelId = "channelId",
  //   final String channelName = "channelName",
  //   final String channelDescription = "channelDescription",
  //   final String? payload,
  // }) {
  //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //   flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  //   final InitializationSettings initializationSettings = InitializationSettings(
  //     android: const AndroidInitializationSettings('@mipmap/launcher_icon'),
  //     iOS: DarwinInitializationSettings(),
  //     linux: const LinuxInitializationSettings(defaultActionName: ''),
  //     macOS: DarwinInitializationSettings(),
  //   );
  //   flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse: onNotificationTap,
  //     onDidReceiveBackgroundNotificationResponse: onNotificationTap,
  //   );
  //   flutterLocalNotificationsPlugin.show(
  //     0,
  //     title,
  //     message,
  //     payload: payload,
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         channelId,
  //         channelName,
  //         channelDescription: channelDescription,
  //         importance: Importance.max,
  //         priority: Priority.high,
  //         ticker: 'ticker',
  //         enableLights: true,
  //         colorized: true,
  //       ),
  //     ),
  //   );
  // }
}
