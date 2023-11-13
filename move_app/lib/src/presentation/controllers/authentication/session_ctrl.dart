import 'package:move_app/lib.dart';

class SessionCtrl extends GetxController {
  final IAuthenticationService _authenticationService =
      getIt<IAuthenticationService>();
  final IUserRepository _userRepository = getIt<IUserRepository>();

  // -------------------------------------------------

  final Rx<AppUser?> _user = Rx<AppUser?>(null);

  // -------------------------------------------------

  AppUser? get user => _user.value;

  // -------------------------------------------------

  @override
  void onReady() {
    super.onReady();
    ever(_user, _routing);
    _authenticationService.isAuthenticated().listen((event) {
      if (event) {
        var userId = _authenticationService.getUserUuid();
        _userRepository.getUser(userId).then((value) => _user.value = value);
      }
    });
  }

  void _routing(AppUser? user) {
    if (user == null) {
      Get.offAllNamed(AuthenticationRoutes.login);
    } else {
      Get.offAllNamed(DashboardRoutes.homeClient);
    }
  }

  // -------------------------------------------------

  void onRegisterSuccess(AppUser user) {
    _user.value = user;
  }

  void logout() {
    _authenticationService.logout();
    _user.value = null;
  }
}
