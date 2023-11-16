import 'package:move_app/lib.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCtrl>(() => RegisterCtrl());
  }
}
