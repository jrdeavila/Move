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
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };
  }
}
