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
  final IUserRepository _userRepository;

  GetUserUseCase({
    required IAuthenticationService authenticationService,
    required IUserRepository userRepository,
  })  : _authenticationService = authenticationService,
        _userRepository = userRepository;

  @override
  Future<AppUser> getUser() async {
    String uuid = _authenticationService.getUserUuid();
    return _userRepository.getUser(uuid);
  }
}

@Injectable(as: IRegisterUseCase)
class RegisterUseCase implements IRegisterUseCase {
  final IUserRepository _userRepository;
  final IAuthenticationService _authenticationService;

  RegisterUseCase({
    required IUserRepository userRepository,
    required IAuthenticationService authenticationService,
  })  : _userRepository = userRepository,
        _authenticationService = authenticationService;

  @override
  Future<AppUser> register(RegisterRequest registerRequest) async {
    final user = AppUser(
        uuid: _authenticationService.getUserUuid(),
        firstname: registerRequest.firstname,
        lastname: registerRequest.lastname,
        phone: _authenticationService.getUserPhone(),
        email: registerRequest.email,
        roles: [
          AppUserRole.client,
        ]);
    return _userRepository.createUser(user);
  }
}
