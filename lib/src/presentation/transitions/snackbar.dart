import 'package:mevo/lib.dart';

showSnackbar(
  String title,
  String message, {
  IconData? icon,
}) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black,
    colorText: Colors.white,
    icon: Icon(icon ?? Icons.error_outline_rounded, color: Colors.white),
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(seconds: 5),
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    margin: const EdgeInsets.all(10.0),
  );
}
