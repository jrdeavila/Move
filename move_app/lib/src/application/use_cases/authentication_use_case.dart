import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: ILoginUseCase)
class LoginUseCase implements ILoginUseCase {
  final IAuthenticationService _authenticationService;

  LoginUseCase(this._authenticationService);

  @override
  Future<AppUser> login(LoginRequest loginRequest) {
    return _authenticationService.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}

@Injectable(as: ILoginWithPhoneUseCase)
class LoginWithPhoneUseCase implements ILoginWithPhoneUseCase {
  final IPhoneAuthenticationService _authenticationService;

  LoginWithPhoneUseCase(this._authenticationService);

  @override
  Future<void> loginWithPhone(LoginWithPhoneRequest loginWithPhoneRequest) {
    return _authenticationService.loginWithPhone(
      phone: loginWithPhoneRequest.phone,
      onCodeRetrival: loginWithPhoneRequest.onCodeRetrival,
      onCodeSend: loginWithPhoneRequest.onCodeSend,
      onError: loginWithPhoneRequest.onError,
      onVerificationComplete: loginWithPhoneRequest.onVerificationComplete,
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
