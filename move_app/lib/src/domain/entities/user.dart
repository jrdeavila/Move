class AppUser {
  final String uid;
  final String name;
  final String email;
  final List<AppUserRole> roles;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.roles,
  });
}

enum AppUserRole {
  client,
  driver,
  admin,
}
