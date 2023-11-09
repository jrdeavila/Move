import 'package:move_app/lib.dart';

abstract class IAuthenticationService {
  Future<AppUser> login(String email, String password);

  Future<void> logout();

  Stream<bool> isAuthenticated();

  Future<AppUser> getUser();

  Future<AppUser> register(
    AppUser appUser, {
    required String password,
  });
}

abstract class IPhoneAuthenticationService {
  Future<Future<AppUser> Function(String verficationCode)> loginWithPhone(
      String phone);
}
