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
  final void Function() onCodeSend;
  final void Function() onError;

  LoginWithPhoneRequest({
    required this.phone,
    required this.onCodeSend,
    required this.onError,
  });
}

class RegisterRequest {
  final String firstname;
  final String lastname;
  final String email;

  RegisterRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
  });
}

class SendCodeRequest {
  final String code;
  final void Function() onLoginSuccessful;
  final void Function() onShouldRegister;
  SendCodeRequest({
    required this.code,
    required this.onLoginSuccessful,
    required this.onShouldRegister,
  });
}
