import 'package:move_app/lib.dart';

class RegisterCtrl extends GetxController {
  final RxString _firstname = ''.obs;
  final RxString _lastname = ''.obs;

  String get firstname => _firstname.value.trim();
  String get lastname => _lastname.value.trim();

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
          ),
        )
        .then(
          (value) => Get.find<SessionCtrl>().onRegisterSuccess(value),
        );
  }
}
