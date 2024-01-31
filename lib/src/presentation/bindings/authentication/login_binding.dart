import 'package:mevo/lib.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginCtrl>(() => LoginCtrl());
  }
}
