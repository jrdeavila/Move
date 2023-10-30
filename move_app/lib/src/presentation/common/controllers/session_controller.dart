import 'package:get/get.dart';
import 'package:move_app/lib.dart';

class SessionController extends GetxController {
  final Rx<User?> _user = Rx<User?>(null);

  User? get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    _fetchUserData();
    _user.listen(_redirect);
  }

  void _redirect(User? user) {
    // TODO: Implement redirect
  }

  Future<void> _fetchUserData() async {
    // TODO: Implement fetch user data
  }

  Future<void> onRegiter() {
    return _fetchUserData();
  }

  Future<void> onLogin() {
    return _fetchUserData();
  }

  Future<void> onLogout() {
    // TODO: Implement logout
    _user.value = null;
    return Future.value();
  }
}
