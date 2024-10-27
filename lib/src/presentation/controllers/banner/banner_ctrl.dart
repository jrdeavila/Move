import 'package:mevo/lib.dart';

class BannerCtrl extends GetxController {
  void showInfo(String title, String message) {
    showSnackbar(title, message, icon: Icons.info_outline_rounded);
  }

  void showSuccess(String title, String message) {
    showSnackbar(title, message, icon: Icons.check_circle_outline_rounded);
  }

  void showError(String title, String message) {
    showSnackbar(title, message, icon: Icons.error_outline_rounded);
  }
}
