class AppUser {
  String uuid;
  final String firstname;
  final String lastname;
  final String phone;
  final String email;
  final List<AppUserRole> roles;

  AppUser({
    required this.uuid,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.roles,
  });
}

enum AppUserRole {
  client,
  driver,
  admin,
}
