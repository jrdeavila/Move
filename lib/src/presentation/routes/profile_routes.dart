import 'package:mevo/lib.dart';

abstract class ProfileRoutes {
  static const String profile = '/profile';
  static const String details = '/details';
  static const String requestService = "/requestService";
  static const String showServices = "/showServices";
  static const String driverService = "/driverService";

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
        name: requestService,
        page: () => const RequestServicePage(),
        middlewares: [
          VerifyAuth(),
        ]),

    GetPage(
        name: showServices,
        page: () => const ListServicePage(),
        middlewares: [
          VerifyAuth(),
        ]),

    GetPage(
      name: driverService,
      page: () => const DriverCurrentServicePage(),
      middlewares: [
        VerifyAuth(),
      ],
    ),

    // ------------------------------------------------------------
    DriverRequestRoutes.routes.firstWhere(
      (element) => element.name == DriverRequestRoutes.driverMode,
    ),
  ];
}
