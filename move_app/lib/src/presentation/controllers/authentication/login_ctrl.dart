import 'package:move_app/lib.dart';

class LoginCtrl extends GetxController {
  // -------------------------------------------------
  final RxString _phone = ''.obs;
  final RxString _verificationCode = ''.obs;
  final RxBool _loading = false.obs;

  // -------------------------------------------------

  bool get loading => _loading.value;

  // -------------------------------------------------
  void setNumberPhone(String value) {
    _phone.value = value;
  }

  void setVerificationCode(String value) {
    _verificationCode.value = value;
  }

  // -------------------------------------------------
  void login() async {
    _loading.value = true;
    final useCase = getIt<ILoginWithPhoneUseCase>();
    useCase.loginWithPhone(
      LoginWithPhoneRequest(
        phone: PhoneConvert.toFirebase(numberPhone: _phone.value),
        onCodeSend: () {
          Get.to(() => const VerificationCode(
                timer: Duration(seconds: 60),
                codeDigits: 6,
              ));
          _loading.value = false;
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
          Get.offAllNamed(DashboardRoutes.homeClient);
        },
        onShouldRegister: () {
          Get.toNamed(AuthenticationRoutes.register);
        },
      ),
    );
  }
}
