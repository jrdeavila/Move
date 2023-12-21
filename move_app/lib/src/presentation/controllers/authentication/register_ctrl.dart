import 'package:move_app/lib.dart';

class RegisterCtrl extends GetxController {
  final RxString _firstname = ''.obs;
  final RxString _lastname = ''.obs;
  final RxString _phone = ''.obs;

  String get firstname => _firstname.value.trim();
  String get lastname => _lastname.value.trim();
  String get phone => _phone.value.trim();

  void onFirstnameChanged(String text) {
    _firstname.value = text;
  }

  void onLastnameChanged(String text) {
    _lastname.value = text;
  }

  void onPhoneChanged(String text) {
    _phone.value = text;
  }

  void register() {
    final useCase = getIt<IRegisterUseCase>();
    useCase
        .register(
          RegisterRequest(
            firstname: firstname,
            lastname: lastname,
            phone: phone,
          ),
        )
        .then(
          (value) => Get.find<SessionCtrl>().onRegisterSuccess(value),
        );
  }
}
