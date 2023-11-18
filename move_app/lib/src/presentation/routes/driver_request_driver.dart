import 'package:move_app/lib.dart';

abstract class DriverRequestRoutes {
  static const String aboutMe = '/about_me';
  static const String soat = '/soat';
  static const String dni = '/dni';
  static const String license = '/license';
  static const String onwerShip = '/onwer_ship';
  static const String aboutCar = '/about_car';
  static const String technicalReview = '/technical_review';

  static final routes = [
    GetPage(
      name: aboutMe,
      page: () => const PersonalData(),
      binding: AboutMeBinding(),
      middlewares: [
        VerifyAuth(),
      ],
    ),
    // TODO: add routes
  ];
}
