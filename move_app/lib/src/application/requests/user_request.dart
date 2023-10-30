import 'package:move_app/lib.dart';

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });
  JSON toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}

class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  JSON toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };
  }
}
