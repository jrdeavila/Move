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

class LicenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LicenseCtrl());
  }
}

class DNIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DNICtrl());
  }
}
