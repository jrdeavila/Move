import 'package:get/get.dart';
import 'package:move_app/src/src.dart';

class LoginCtrl extends GetxController {
  final RxString _phone = ''.obs;
  final Rx<Future<AppUser> Function(String verificationCode)?> _loginWithPhone =
      Rx<Future<AppUser> Function(String verificationCode)?>(null);

  final RxString _verificationCode = ''.obs;

  void login() async {
    final useCase = getIt<ILoginWithPhoneUseCase>();

    final confirmationCode = await useCase.loginWithPhone(
      LoginWithPhoneRequest(
        phone: _phone.value,
      ),
    );

    _loginWithPhone.value = confirmationCode;
  }

  void sendCode() {
    _loginWithPhone.value!(_verificationCode.value);
  }
}
