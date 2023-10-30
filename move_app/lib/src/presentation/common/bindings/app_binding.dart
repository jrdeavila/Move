import 'package:get/get.dart';
import 'package:move_app/lib.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SessionController>(SessionController());
  }
}
