import 'package:move_app/lib.dart';

abstract class IAuthenticationService {
  Future<AppUser> login(String email, String password);

  Future<void> logout();

  Stream<bool> isAuthenticated();

  Future<AppUser> getUser();

  Future<AppUser> register(
      String name, String email, String password, String confirmPassword);
}
