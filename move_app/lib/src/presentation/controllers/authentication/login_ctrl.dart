import 'package:move_app/lib.dart';

class LoginCtrl extends GetxController {
  void loginWithGoogle() {
    getIt<ILoginWithGoogleUseCase>().loginWithGoogle();
  }
}
