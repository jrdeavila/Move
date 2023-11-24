import 'package:move_app/lib.dart';

abstract class DriverRequestRoutes {
  // ------------------------------------------------------------

  static const String driverMode = '/driver_request_mode';

  // ------------------------------------------------------------

  static const String steps = '/driver_request_steps';
  static const String aboutMe = '/about_me';
  static const String soat = '/soat';
  static const String dni = '/dni';
  static const String license = '/license';
  static const String onwerShip = '/onwer_ship';
  static const String aboutCar = '/about_car';
  static const String technicalReview = '/technical_review';
  static const String noCriminalRecord = '/no_criminal_record';
  static const String loading = '/driver_request_loading';
  static const String sended = '/driver_request_sended';
  static const String approved = '/driver_request_approved';

  // ------------------------------------------------------------

  static final routes = [
    GetPage(
      name: driverMode,
      page: () => const DriverRequestLoading(),
      middlewares: [
        VerifyAuth(),
      ],
    ),
    GetPage(
      name: steps,
      page: () => const ApplicationForm(),
      middlewares: [
        VerifyAuth(),
      ],
    ),
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
    GetPage(
      name: aboutCar,
      page: () => const AboutCar(),
      binding: AboutCarBinding(),
      middlewares: [
        VerifyAuth(),
      ],
    ),
    GetPage(
      name: noCriminalRecord,
      page: () => const NoCriminalRecordData(),
      binding: NoCriminalRecordBinding(),
      middlewares: [
        VerifyAuth(),
      ],
    ),
    GetPage(
      name: sended,
      page: () => const DriverRequestSended(),
    ),
    GetPage(
      name: approved,
      page: () => const DriverRequestApproved(),
    ),
  ];
}
