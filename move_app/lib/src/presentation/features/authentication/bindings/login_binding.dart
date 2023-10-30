import 'package:get/get.dart';
import 'package:move_app/lib.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginCtrl());
  }
}
