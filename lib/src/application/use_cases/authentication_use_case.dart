import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: ILoginWithGoogleUseCase)
class LoginWithGoogleUseCase implements ILoginWithGoogleUseCase {
  final ILoginWithGoogleService _loginWithGoogleService;

  LoginWithGoogleUseCase(this._loginWithGoogleService);

  @override
  Future<void> loginWithGoogle() {
    return _loginWithGoogleService.loginWithGoogle();
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
  final IUserRepository _userRepository;

  GetUserUseCase({
    required IAuthenticationService authenticationService,
    required IUserRepository userRepository,
  })  : _authenticationService = authenticationService,
        _userRepository = userRepository;

  @override
  Future<AppUser?> getUser() async {
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
        phone: registerRequest.phone,
        email: _authenticationService.getUserEmail(),
        roles: [
          AppUserRole.client,
        ]);
    return _userRepository.createUser(user);
  }
}
