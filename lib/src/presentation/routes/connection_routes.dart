import 'package:mevo/lib.dart';

abstract interface class ConnectionRoutes {
  static const String noConnection = '/no-connection';

  static final routes = [
    GetPage(
      name: noConnection,
      page: () => const NoConnectionPage(),
    ),
  ];
}
