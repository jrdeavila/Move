import 'package:move_app/lib.dart';

abstract class ILoginWithPhoneUseCase {
  Future<void> loginWithPhone(LoginWithPhoneRequest loginWithPhoneRequest);
}

abstract class ISendCodeUseCase {
  Future<void> sendCode(SendCodeRequest sendCodeRequest);
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
