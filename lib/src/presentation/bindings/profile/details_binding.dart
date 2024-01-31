import 'package:mevo/lib.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsCtrl>(() => DetailsCtrl());
  }
}
