import 'package:move_app/lib.dart';

abstract class IAuthenticationService {
  Future<void> logout();

  Stream<bool> isAuthenticated();

  Future<AppUser> getUser();

  Future<AppUser> register(
    AppUser appUser, {
    required String password,
  });
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
