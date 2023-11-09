import 'package:get/get.dart';
import 'package:move_app/src/src.dart';

class RegisterCtrl extends GetxController {
  final RxString _email = ''.obs;
  final RxString _password = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _firstname = ''.obs;
  final RxString _lastname = ''.obs;

  String get email => _email.value;
  String get password => _password.value;
  String get phone => _phone.value;
  String get firstname => _firstname.value;
  String get lastname => _lastname.value;

  void onEmailChanged(String text) {
    _email.value = text;
  }

  void onPasswordChanged(String text) {
    _password.value = text;
  }

  void onPhoneChanged(String text) {
    _phone.value = text;
  }

  void onFirstnameChanged(String text) {
    _firstname.value = text;
  }

  void onLastnameChanged(String text) {
    _lastname.value = text;
  }

  void register() {
    final useCase = getIt<IRegisterUseCase>();
    useCase.register(
      RegisterRequest(
        uuid: '',
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: password,
        phone: phone,
      ),
    );
  }
}
