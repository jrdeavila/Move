import 'package:move_app/lib.dart';
import 'package:move_app/src/presentation/pages/dashboard/driver/dashboard_driver.dart';

abstract class DashboardRoutes {
  static const String homeClient = '/client';
  static const String homeDriver = '/';
  static final routes = [
    GetPage(
      name: homeClient,
      page: () => const DashboardClient(),
      middlewares: [
        VerifyAuth(),
      ],
    ),
    GetPage(
      name: homeDriver,
      page: () => const DashboardDriver(),
      middlewares: [
        VerifyAuth(),
      ],
    )
  ];
}
