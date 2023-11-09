import 'package:get/get.dart';
import 'package:move_app/lib.dart';

abstract class AuthenticationRoutes {
  static const register = '/register';
  static const login = '/login';

  static final routes = [
    GetPage(
      name: register,
      page: () => const Register(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: login,
      page: () => const Login(),
      binding: LoginBinding(),
    ),
  ];
}
