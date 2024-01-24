import 'package:move_app/lib.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsCtrl>(() => DetailsCtrl());
  }
}
