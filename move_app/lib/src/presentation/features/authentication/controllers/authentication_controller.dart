import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@injectable
class LoginCtrl extends GetxController {
  final Rx<String?> _email = Rx<String?>(null);
  final Rx<String?> _password = Rx<String?>(null);
  final RxBool _rememberMe = RxBool(false);

  final RxMap<String, List> _errors = RxMap({});

  List<String> errors(String key) => _errors[key]?.cast<String>() ?? [];
  bool get rememberMe => _rememberMe.value;
  String? get email => _email.value;
  String? get password => _password.value;

  void setEmail(String value) => _email.value = value;
  void setPassword(String value) => _password.value = value;
  void setRememberMe(bool? value) => _rememberMe.value = value ?? false;

  @override
  void onReady() {
    super.onReady();
    _loadFromCache();
  }

  void _loadFromCache() {
    // TODO: Implement load from cache
  }

  void submit() {
    // TODO: Implement submit
  }

  void _saveOnCache() {
    // TODO: Implement save on cache
  }

  void goToRegister() {
    Get.offAllNamed(registerRoute);
  }
}

class RegisterController extends GetxController {
  final Rx<String?> _name = Rx<String?>(null);
  final Rx<String?> _email = Rx<String?>(null);
  final Rx<String?> _password = Rx<String?>(null);
  final Rx<String?> _confirmPassword = Rx<String?>(null);

  final RxMap<String, List> _errors = RxMap({});

  List<String> errors(String key) => _errors[key]?.cast<String>() ?? [];
  String? get name => _name.value;
  String? get email => _email.value;
  String? get password => _password.value;
  String? get confirmPassword => _confirmPassword.value;

  void setName(String value) => _name.value = value;
  void setEmail(String value) => _email.value = value;
  void setPassword(String value) => _password.value = value;
  void setConfirmPassword(String value) => _confirmPassword.value = value;

  void submit() {
    // TODO: Implement submit
  }

  void goToLogin() {
    Get.offAllNamed(loginRoute);
  }
}
