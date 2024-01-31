import 'package:mevo/lib.dart';

class RegisterCtrl extends GetxController {
  final RxString _firstname = ''.obs;
  final RxString _lastname = ''.obs;
  final RxString _phone = ''.obs;
  final RxBool _loading = false.obs;

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

  @override
  void onReady() {
    super.onReady();
    ever(_loading, _showLoading);
  }

  void _showLoading(show) {
    if (show) {
      Get.offAllNamed(MainRoutes.loading);
    }
  }

  void register() {
    final useCase = getIt<IRegisterUseCase>();
    _loading.value = true;
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
        )
        .onError((error, stackTrace) {
      _loading.value = false;
      Get.snackbar("Error", error.toString());
    }).whenComplete(() {
      _loading.value = false;
    });
  }
}
