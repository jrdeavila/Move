abstract class IAuthenticationService {
  Future<void> logout();

  Stream<bool> isAuthenticated();

  String getUserUuid();
  String getUserPhone();
}

abstract class IPhoneAuthenticationService {
  Future<void> loginWithPhone({
    required String phone,
    required void Function() onCodeSend,
  });

  Future<void> verifyCode({
    required String smsCode,
    required void Function() onLoginSuccess,
    required void Function() onShouldRegister,
  });
}
