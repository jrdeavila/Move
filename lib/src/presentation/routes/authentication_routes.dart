import 'package:move_app/lib.dart';

abstract class AuthenticationRoutes {
  static const register = '/register';

  static final routes = [
    GetPage(
      name: register,
      page: () => const Register(),
      binding: RegisterBinding(),
    ),
  ];
}
