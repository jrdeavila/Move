import 'package:move_app/lib.dart';

class DriverModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriverRequestRegisterCtrl());
  }
}

class AboutMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutMeCtrl());
  }
}
