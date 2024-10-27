abstract interface class IBackgroundNotificationService {
  void showNotification({
    required int id,
    required String title,
    required String body,
  });
}
