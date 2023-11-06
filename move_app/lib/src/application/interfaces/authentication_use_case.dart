import 'package:move_app/lib.dart';

abstract class ILoginUseCase {
  Future<AppUser> login(LoginRequest loginRequest);
}

abstract class ILogoutUseCase {
  Future<void> logout();
}

abstract class IGetUserUseCase {
  Future<AppUser> getUser();
}

abstract class IRegisterUseCase {
  Future<AppUser> register(RegisterRequest registerRequest);
}
