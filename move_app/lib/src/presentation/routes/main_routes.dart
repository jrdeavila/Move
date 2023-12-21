import 'package:move_app/lib.dart';

abstract class MainRoutes {
  static const main = '/main';
  static const loading = "/loading";

  static final routes = [
    GetPage(
        name: main,
        page: () => const Main(),
        binding: BindingsBuilder(() {
          Get.put(LoginCtrl());
        })),
    GetPage(
      name: loading,
      page: () => const LoadingPage(),
    ),
  ];
}
