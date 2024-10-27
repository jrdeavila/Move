import 'package:mevo/lib.dart';

class NotificationCtrl extends GetxController {
  // ----------------------------- Public Methods -----------------------------

  void showNotification({
    int id = 0,
    required String title,
    required String body,
  }) {
    final bgNotificationService = getIt<IBackgroundNotificationService>();
    bgNotificationService.showNotification(title: title, body: body, id: id);
  }
}
