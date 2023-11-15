import 'package:move_app/lib.dart';

class LoginCtrl extends GetxController {
  // -------------------------------------------------
  final RxString _phone = ''.obs;
  final RxString _verificationCode = ''.obs;

  // -------------------------------------------------
  void setNumberPhone(String value) {
    _phone.value = value;
  }

  void setVerificationCode(String value) {
    _verificationCode.value = value;
  }

  // -------------------------------------------------
  void login() async {
    final useCase = getIt<ILoginWithPhoneUseCase>();
    useCase.loginWithPhone(
      LoginWithPhoneRequest(
        phone: PhoneConvert.toFirebase(numberPhone: _phone.value),
        onCodeSend: () {
          Get.to(() => const VerificationCode(
                timer: Duration(seconds: 60),
                codeDigits: 6,
              ));
        },
      ),
    );
  }

  void sendCode() {
    final useCase = getIt<ISendCodeUseCase>();
    useCase.sendCode(
      SendCodeRequest(
        code: _verificationCode.value,
        onLoginSuccessful: () {
          Get.offAllNamed(MainRoutes.main);
        },
        onShouldRegister: () {
          Get.toNamed(AuthenticationRoutes.register);
        },
      ),
    );
  }
}
