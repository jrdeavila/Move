import 'package:move_app/lib.dart';

class SessionCtrl extends GetxController {
  final IAuthenticationService _authenticationService =
      getIt<IAuthenticationService>();
  final IUserRepository _userRepository = getIt<IUserRepository>();
  final GetStorage _getStorage = GetStorage();

  // -------------------------------------------------

  final Rx<AppUser?> _user = Rx<AppUser?>(null);
  final Rx<AppUserRole?> _currentSessionRole = Rx<AppUserRole?>(null);
  final RxBool _userLoaded = RxBool(false);

  // -------------------------------------------------

  AppUser? get user => _user.value;
  AppUserRole? get currentSessionRole => _currentSessionRole.value;

  // -------------------------------------------------

  @override
  void onReady() {
    super.onReady();
    ever(_userLoaded, _routing);
    _listenAuthentication();
  }

  //--------------------------------------------------

  void _listenAuthentication() {
    _authenticationService.isAuthenticated().listen((event) {
      if (event) {
        var userId = _authenticationService.getUserUuid();
        _userRepository.getUser(userId).then((value) {
          Future.delayed(const Duration(seconds: 1), () {
            _user.value = value;
            _userLoaded.value = true;
            _userLoaded.refresh();
          });
        });
      } else {
        _onLogoutUmountServices();
      }
    });
  }

  void _onLogoutUmountServices() {
    Get.delete<ClientPointCtrl>();
    Get.delete<DriverBalanceCtrl>();
    Get.delete<DriverRequestRegisterCtrl>();
    Get.delete<LocationCtrl>();
    Get.delete<ListenCurrentServiceCtrl>();
    Get.toNamed(MainRoutes.main);
  }

  void _routing(userLoaded) {
    if (_user.value != null) {
      _routingAsUserAuthenticated(_user.value!);
      return;
    } else {
      Get.offAllNamed(AuthenticationRoutes.register);
    }
  }

  void _routingAsUserAuthenticated(AppUser user) {
    final role = _getCurrentSessionRole();
    if (user.roles.contains(role)) {
      _mountServicesOfUser(role);
      return;
    }
    _mountServicesOfUser(AppUserRole.client);
    return;
  }

  void _mountServicesOfUser(AppUserRole role) {
    Get.put(ClientPointCtrl(user: _user.value!), permanent: true);
    Get.put(DriverBalanceCtrl(user: _user.value!), permanent: true);
    Get.put(LocationCtrl(user: _user.value!), permanent: true);
    Get.put(DriverRequestRegisterCtrl(user: _user.value!), permanent: true);
    Get.addPages(ProfileRoutes.routes);

    _mountServiceByRole(role);
    _setCurrentSessionRole(role);
  }

  void _mountServiceByRole(AppUserRole role) {
    if (role == AppUserRole.driver) {
      Get.delete<ListenCurrentServiceCtrl>();
      Get.delete<RequestServiceCtrl>();
      Get.put(ShowListServiceCtrl(user: _user.value!), permanent: true);
      Get.put(ListenDriverCurrentServiceCtrl(user: _user.value!),
          permanent: true);
      Get.offAllNamed(DashboardRoutes.homeDriver);
    } else {
      Get.delete<ListenDriverCurrentServiceCtrl>();
      Get.delete<ShowListServiceCtrl>();
      Get.put(ListenCurrentServiceCtrl(user: _user.value!), permanent: true);
      Get.put(RequestServiceCtrl(user: _user.value!), permanent: true);
      Get.offAllNamed(DashboardRoutes.homeClient);
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
    _userLoaded.value = true;
    _userLoaded.refresh();
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
    Get.find<DriverRequestRegisterCtrl>().routingByStatus();
  }

  void onChangeSessionToClient() {
    _currentSessionRole.value = AppUserRole.client;
    _mountServiceByRole(AppUserRole.client);
    _setCurrentSessionRole(AppUserRole.client);
  }

  void onDriverIsReady() {
    _currentSessionRole.value = AppUserRole.driver;
    _mountServiceByRole(AppUserRole.driver);
    _setCurrentSessionRole(AppUserRole.driver);
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
