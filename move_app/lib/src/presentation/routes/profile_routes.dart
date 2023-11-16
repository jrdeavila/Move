import 'package:move_app/lib.dart';

abstract class ProfileRoutes {
  static const String profile = '/profile';
  static const String details = '/details';
  static const String driverMode = '/driverMode';

  static final routes = [
    GetPage(
        name: profile,
        page: () => const Profiles(),
        binding: DetailsBinding(),
        middlewares: [
          VerifyAuth(),
        ]),
    GetPage(
        name: details,
        page: () => const Details(),
        binding: DetailsBinding(),
        middlewares: [
          VerifyAuth(),
        ]),
    GetPage(
        name: driverMode,
        page: () => const ApplicationForm(),
        middlewares: [
          VerifyAuth(),
          CheckIfUserIsDriver(),
        ]),
  ];
}
