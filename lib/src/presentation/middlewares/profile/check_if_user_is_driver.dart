import 'package:mevo/lib.dart';

class CheckIfUserIsDriver extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!Get.find<SessionCtrl>().user!.isDriver) {
      return null;
    } else {
      return const RouteSettings(name: DashboardRoutes.homeClient);
    }
  }
}
