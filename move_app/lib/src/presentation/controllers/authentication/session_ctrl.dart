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
    ever(_user, _routing);
    ever(_user, _mountServicesOfUser,
        condition: (AppUser? user) => user != null);
    everAll([
      _user,
      _currentSessionRole,
    ], _mountServicesOfUser, condition: (value) {
      final user = value[0] as AppUser?;
      final role = value[1] as AppUserRole?;

      return user != null && role != null;
    });
    _authenticationService.isAuthenticated().listen((event) {
      if (event) {
        var userId = _authenticationService.getUserUuid();
        _userRepository.getUser(userId).then((value) => _user.value = value);
      }
    });
    _currentSessionRole.value = _getCurrentSessionRole();
  }

  void _routingAndRemember(AppUserRole role) {
    if (role == AppUserRole.driver) {
      Get.toNamed(DriverRequestRoutes.driverMode);
    } else {
      Get.offAllNamed(DashboardRoutes.homeClient);
    }
    _setCurrentSessionRole(role);
  }

  void _routing(AppUser? user) {
    if (user == null) {
      Get.offAllNamed(AuthenticationRoutes.login);
    } else {
      Get.addPages(ProfileRoutes.routes);
      final currentRole = _getCurrentSessionRole();
      if (user.roles.contains(currentRole)) {
        _routingAndRemember(currentRole);
      } else {
        _routingAndRemember(user.roles.first);
      }
    }
  }

  void _mountServicesOfUser(dynamic values) {
    Get.put(ClientPointCtrl(user: _user.value!), permanent: true);
    Get.put(DriverBalanceCtrl(user: _user.value!), permanent: true);
    if (_currentSessionRole.value == AppUserRole.driver) {
      Get.delete<LocationCtrl>();
      Get.delete<ListenCurrentServiceCtrl>();
      Get.put(DriverRequestRegisterCtrl(user: _user.value!), permanent: true);
    } else {
      Get.delete<DriverRequestRegisterCtrl>();
      Get.put<LocationCtrl>(LocationCtrl(), permanent: true);
      Get.put(ListenCurrentServiceCtrl(user: _user.value!), permanent: true);
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

  void goToShowServices() {
    Get.toNamed(ProfileRoutes.showServices);
  }
}
