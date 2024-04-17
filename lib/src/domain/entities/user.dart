class AppUser {
  String uuid;
  final String firstname;
  final String lastname;
  final String phone;
  final String email;
  final List<AppUserRole> roles;
  final DriverInfo? driverInfo;
  final double? rating;

  AppUser({
    required this.uuid,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.roles,
    this.driverInfo,
    this.rating,
  });

  bool get isAdmin => roles.contains(AppUserRole.admin);
  bool get isClient => roles.contains(AppUserRole.client);
  bool get isDriver => roles.contains(AppUserRole.driver);

  DriverInfo get driver {
    if (isDriver) {
      return driverInfo!;
    }
    throw Exception("El usuario no es un conductor");
  }
}

enum AppUserRole {
  client,
  driver,
  admin,
}

class DriverInfo {
  final String carBrand;
  final String carPlate;
  final String carImage;
  final String carModel;

  DriverInfo({
    required this.carBrand,
    required this.carPlate,
    required this.carImage,
    required this.carModel,
  });
}
