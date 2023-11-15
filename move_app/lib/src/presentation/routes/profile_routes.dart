import 'package:move_app/lib.dart';

abstract class ProfileRoutes {
  static const String profile = '/profile';
  static const String details = '/details';

  static final routes = [
    GetPage(
      name: profile,
      page: () => const Profiles(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: details,
      page: () => const Details(),
      binding: DetailsBinding(),
    ),
  ];
}
