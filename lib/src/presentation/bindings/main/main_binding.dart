import 'package:mevo/lib.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExceptionCtrl(), permanent: true);
    Get.put(BannerCtrl(), permanent: true);
    Get.put(SoundCtrl(), permanent: true);
    Get.put(ConnectionCtrl(), permanent: true);
  }
}
