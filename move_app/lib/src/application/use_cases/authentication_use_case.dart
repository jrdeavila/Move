import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: ILoginWithPhoneUseCase)
class LoginWithPhoneUseCase implements ILoginWithPhoneUseCase {
  final IPhoneAuthenticationService _authenticationService;

  LoginWithPhoneUseCase(this._authenticationService);

  @override
  Future<void> loginWithPhone(LoginWithPhoneRequest loginWithPhoneRequest) {
    return _authenticationService.loginWithPhone(
      phone: loginWithPhoneRequest.phone,
      onCodeSend: loginWithPhoneRequest.onCodeSend,
    );
  }
}

@Injectable(as: ILogoutUseCase)
class LogoutUseCase implements ILogoutUseCase {
  final IAuthenticationService _authenticationService;

  LogoutUseCase(this._authenticationService);

  @override
  Future<void> logout() {
    return _authenticationService.logout();
  }
}

@Injectable(as: ISendCodeUseCase)
class SendCodeUseCase implements ISendCodeUseCase {
  final IPhoneAuthenticationService _authenticationService;

  SendCodeUseCase(this._authenticationService);
  @override
  Future<void> sendCode(SendCodeRequest sendCodeRequest) {
    return _authenticationService.verifyCode(
      smsCode: sendCodeRequest.code,
      onLoginSuccess: sendCodeRequest.onLoginSuccessful,
      onShouldRegister: sendCodeRequest.onShouldRegister,
    );
  }
}

@Injectable(as: IGetUserUseCase)
class GetUserUseCase implements IGetUserUseCase {
  final IAuthenticationService _authenticationService;

  GetUserUseCase(this._authenticationService);

  @override
  Future<AppUser> getUser() {
    return _authenticationService.getUser();
  }
}

@Injectable(as: IRegisterUseCase)
class RegisterUseCase implements IRegisterUseCase {
  final IAuthenticationService _authenticationService;

  RegisterUseCase(this._authenticationService);

  @override
  Future<AppUser> register(RegisterRequest registerRequest) {
    AppUser appUser = registerRequest.toUser();
    return _authenticationService.register(
      appUser,
      password: registerRequest.password,
    );
  }
}
