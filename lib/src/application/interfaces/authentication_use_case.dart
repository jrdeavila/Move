import 'package:mevo/lib.dart';

abstract class ILoginWithGoogleUseCase {
  Future<void> loginWithGoogle();
}

abstract class ILogoutUseCase {
  Future<void> logout();
}

abstract class IGetUserUseCase {
  Future<AppUser?> getUser();
}

abstract class IRegisterUseCase {
  Future<AppUser> register(RegisterRequest registerRequest);
}
