import 'package:move_app/lib.dart';

abstract class ProfileRoutes {
  static const String profile = '/profile';
  static const String details = '/details';
  static const String requestService = "/requestService";
  static const String showServices = "/showServices";

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
        binding: BindingsBuilder(() {
          Get.lazyPut<RequestServiceCtrl>(() => RequestServiceCtrl());
          Get.put<LocationCtrl>(LocationCtrl());
        }),
        middlewares: [
          VerifyAuth(),
        ]),

    GetPage(
        name: showServices,
        page: () => const ListServicePage(),
        middlewares: [
          VerifyAuth(),
        ]),

    // ------------------------------------------------------------
    DriverRequestRoutes.routes.firstWhere(
      (element) => element.name == DriverRequestRoutes.driverMode,
    ),
  ];
}
