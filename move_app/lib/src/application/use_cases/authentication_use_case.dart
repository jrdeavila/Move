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
    return _authenticationService.register(
      registerRequest.name,
      registerRequest.email,
      registerRequest.password,
      registerRequest.confirmPassword,
    );
  }
}
