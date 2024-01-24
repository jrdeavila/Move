abstract interface class IBackgroundNotificationService {
  void showNotification({
    required String title,
    required String body,
  });
}
