import 'package:mevo/lib.dart';

class VerifyAuth extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<SessionCtrl>().user != null) {
      return null;
    } else {
      return const RouteSettings(name: MainRoutes.main);
    }
  }
}
