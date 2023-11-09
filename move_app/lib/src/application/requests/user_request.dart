import 'package:move_app/src/domain/entities/user.dart';

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}

class LoginWithPhoneRequest {
  final String phone;

  LoginWithPhoneRequest({
    required this.phone,
  });
}

class RegisterRequest {
  final String uuid;
  final String firstname;
  final String lastname;
  final String phone;
  final String email;
  final String password;

  RegisterRequest({
    required this.uuid,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.phone,
  });

  AppUser toUser() {
    return AppUser(
      uuid: uuid,
      firstname: firstname,
      lastname: lastname,
      email: email,
      phone: phone,
      roles: [
        AppUserRole.client,
      ],
    );
  }
}
