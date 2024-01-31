import 'package:mevo/src/domain/domain.dart';

class UpdateProfileRequest {
  final String uuid;
  final String firstname;
  final String lastname;
  final String phone;
  final String email;
  final List<AppUserRole> roles;

  UpdateProfileRequest({
    required this.uuid,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    this.roles = const [AppUserRole.client],
  });
}
