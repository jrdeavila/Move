import 'package:move_app/lib.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExceptionCtrl());
  }
}
