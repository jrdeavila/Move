import 'package:move_app/lib.dart';

class SessionCtrl extends GetxController {
  final IAuthenticationService _authenticationService =
      getIt<IAuthenticationService>();
  final IUserRepository _userRepository = getIt<IUserRepository>();
  final GetStorage _getStorage = GetStorage();

  // -------------------------------------------------

  final Rx<AppUser?> _user = Rx<AppUser?>(null);
  final Rx<AppUserRole?> _currentSessionRole = Rx<AppUserRole?>(null);

  // -------------------------------------------------

  AppUser? get user => _user.value;
  AppUserRole? get currentSessionRole => _currentSessionRole.value;

  // -------------------------------------------------

  @override
  void onReady() {
    super.onReady();
    _getStorage.remove("session_role");
    ever(_user, _routing);
    _authenticationService.isAuthenticated().listen((event) {
      if (event) {
        var userId = _authenticationService.getUserUuid();
        _userRepository.getUser(userId).then((value) => _user.value = value);
      }
    });
  }

  void _routingAndRemember(AppUserRole? role) {
    if (role == null) return;
    if (role == AppUserRole.driver) {
      Get.put(DriverRequestRegisterCtrl());
      Get.toNamed(DriverRequestRoutes.driverMode);
    } else {
      Get.offAllNamed(DashboardRoutes.homeClient);
    }
  }

  void _routing(AppUser? user) {
    if (user == null) {
      Get.offAllNamed(AuthenticationRoutes.login);
    } else {
      Get.addPages(ProfileRoutes.routes);
      ever(_currentSessionRole, _routingAndRemember);
      _currentSessionRole.value = _getCurrentSessionRole();
    }
  }

  AppUserRole _getCurrentSessionRole() {
    final role = _getStorage.read<String>("session_role");
    if (role == null) return AppUserRole.client;
    return AppUserRole.values.firstWhere(
      (element) => element.toString().split('.').last == role,
    );
  }

  Future<void> _setCurrentSessionRole(AppUserRole role) {
    return _getStorage.write("session_role", role.toString().split('.').last);
  }

  // -------------------------------------------------

  void onRegisterSuccess(AppUser user) {
    _user.value = user;
  }

  void onUpdateProfileSuccess(AppUser user) {
    _user.value = user;
  }

  void logout() {
    _authenticationService.logout();
    _user.value = null;
    _currentSessionRole.value = null;
    _getStorage.remove("session_role");
  }

  // -------------------------------------------------

  void onChangeSessionToDriver() {
    _currentSessionRole.value = AppUserRole.driver;
    _setCurrentSessionRole(AppUserRole.driver);
  }

  void onChangeSessionToClient() {
    _currentSessionRole.value = AppUserRole.client;
    _setCurrentSessionRole(AppUserRole.client);
  }

  void goToProfile() {
    Get.toNamed(ProfileRoutes.profile);
  }

  void goToRequestService() {
    Get.toNamed(ProfileRoutes.requestService);
  }
}
