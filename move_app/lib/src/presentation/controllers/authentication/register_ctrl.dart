import 'package:move_app/lib.dart';

class RegisterCtrl extends GetxController {
  final RxString _email = ''.obs;
  final RxString _firstname = ''.obs;
  final RxString _lastname = ''.obs;

  String get email => _email.value.trim();
  String get firstname => _firstname.value.trim();
  String get lastname => _lastname.value.trim();

  void onEmailChanged(String text) {
    _email.value = text;
  }

  void onFirstnameChanged(String text) {
    _firstname.value = text;
  }

  void onLastnameChanged(String text) {
    _lastname.value = text;
  }

  void register() {
    final useCase = getIt<IRegisterUseCase>();
    useCase
        .register(
          RegisterRequest(
            firstname: firstname,
            lastname: lastname,
            email: email,
          ),
        )
        .then(
          (value) => Get.find<SessionCtrl>().onRegisterSuccess(value),
        );
  }
}
