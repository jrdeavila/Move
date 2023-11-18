import 'package:move_app/lib.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExceptionCtrl());
    Get.put(SessionCtrl());
  }
}