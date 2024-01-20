import 'package:move_app/lib.dart';

class LoginCtrl extends GetxController {
  final RxBool _loading = false.obs;

  @override
  void onReady() {
    super.onReady();

    ever(_loading, _showLoading);
  }

  void _showLoading(show) {
    if (show) {
      Get.offAllNamed(MainRoutes.loading);
    } else {
      Get.offAllNamed(MainRoutes.main);
    }
  }

  void loginWithGoogle() {
    _loading.value = true;
    getIt<ILoginWithGoogleUseCase>()
        .loginWithGoogle()
        .onError((error, stackTrace) {
      _loading.value = false;
      throw error as Exception;
    }).whenComplete(() => _loading.value = false);
  }
}
