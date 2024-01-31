import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IBackgroundNotificationService)
class BackgroundNotificationService implements IBackgroundNotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  BackgroundNotificationService({
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) : _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin;

  @override
  void showNotification({required String title, required String body}) {
    if (Platform.isIOS) {
      _showOnIosNotification(title: title, body: body);
    } else {
      _showOnAndroidNotification(title: title, body: body);
    }
  }

  Future<void> _showOnIosNotification(
      {required String title, required String body}) async {
    // TODO: Implementar notificaciones en IOS
  }

  Future<void> _showOnAndroidNotification(
      {required String title, required String body}) {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channelID', 'channelName',
      importance: Importance.max,
      priority: Priority.high,
      // Configure sound in assets
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    return _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
