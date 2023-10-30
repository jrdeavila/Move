import 'package:get/get.dart';
import 'package:move_app/lib.dart';

const loginRoute = '/login';
const registerRoute = '/register';

final authPages = [
  GetPage(
    name: loginRoute,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: registerRoute,
    page: () => const RegisterScreen(),
    binding: RegisterBinding(),
  ),
];
