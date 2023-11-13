import 'package:move_app/lib.dart';

abstract class MainRoutes {
  static const main = '/main';

  static final routes = [
    GetPage(
      name: main,
      page: () => const Main(),
      binding: MainBinding(),
    ),
  ];
}
