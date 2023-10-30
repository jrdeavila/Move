import 'package:move_app/lib.dart';

abstract class ILoginUseCase {
  Future<String> login(LoginRequest loginRequest);
}

abstract class ILogoutUseCase {
  Future<void> logout();
}

abstract class IRefreshTokenUseCase {
  Future<String> refreshToken();
}

abstract class IGetUserUseCase {
  Future<User> getUser();
}

abstract class IGetAccessTokenUseCase {
  Future<String> getAccessToken();
}

abstract class IRegisterUseCase {
  Future<String> register(RegisterRequest registerRequest);
}
