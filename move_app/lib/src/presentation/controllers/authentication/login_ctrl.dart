import 'package:move_app/src/src.dart';

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
        onCodeRetrival: (code) {
          print(code);
        },
        onCodeSend: () {
          Get.to(() => const VerificationCode());
        },
        onError: () {
          Get.snackbar(
            'Error',
            'Error al enviar el código de verificación',
            backgroundColor: Colors.red,
          );
        },
        onVerificationComplete: (user) {
          print(user);
        },
      ),
    );
  }

  void sendCode() {}
}
