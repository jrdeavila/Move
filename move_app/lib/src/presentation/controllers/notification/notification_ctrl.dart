import 'package:move_app/lib.dart';

class NotificationCtrl extends GetxController {
  // ----------------------------- Public Methods -----------------------------

  void showNotification({
    required String title,
    required String body,
  }) {
    final bgNotificationService = getIt<IBackgroundNotificationService>();
    bgNotificationService.showNotification(title: title, body: body);
  }
}
