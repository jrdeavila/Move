import 'package:move_app/lib.dart';

abstract class DashboardRoutes {
  static const String homeClient = '/home_client';
  static const String homeDriver = '/home_driver';

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
