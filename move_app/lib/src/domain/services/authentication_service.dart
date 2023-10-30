import 'package:move_app/lib.dart';

abstract class IAuthenticationService {
  Future<String> login(String email, String password);

  Future<void> logout();

  Future<String> refreshToken();

  Future<User> getUser();

  Future<String> register(
      String name, String email, String password, String confirmPassword);
}
