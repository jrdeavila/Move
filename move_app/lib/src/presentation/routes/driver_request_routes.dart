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
    GetPage(
      name: license,
      page: () => const LicenseData(),
      binding: LicenseBinding(),
      middlewares: [
        VerifyAuth(),
      ],
    ),
    GetPage(
      name: dni,
      page: () => const DNIData(),
      binding: DNIBinding(),
      middlewares: [
        VerifyAuth(),
      ],
    ),
    GetPage(
      name: soat,
      page: () => const SoatData(),
      binding: SoatBinding(),
      middlewares: [
        VerifyAuth(),
      ],
    ),
    GetPage(
      name: technicalReview,
      page: () => const TechnicalPreviewData(),
      binding: TechnicalPreviewBinding(),
    ),
    GetPage(
        name: onwerShip,
        page: () => const OwnerShipData(),
        binding: OwnerShipBinding()),
    // TODO: add routes
  ];
}
