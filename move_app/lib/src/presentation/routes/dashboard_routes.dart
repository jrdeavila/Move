import 'package:move_app/lib.dart';

abstract class DashboardRoutes {
  static const String homeClient = '/home_client';

  static final routes = [
    GetPage(
      name: homeClient,
      page: () => const DashboardClient(),
      middlewares: [
        VerifyAuth(),
      ],
    )
  ];
}
