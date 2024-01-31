import 'package:mevo/lib.dart';

class DriverBalanceCtrl extends GetxController {
  // ---------------------- Local variables ----------------------
  final AppUser user;

  // ---------------------- Constructor ----------------------

  DriverBalanceCtrl({required this.user});

  // ---------------------- Observables ----------------------

  final Rx<double> _balance = Rx<double>(0);

  // ---------------------- Getters ----------------------

  double get balance => _balance.value;

  // ---------------------- Lyfecycles ----------------------

  @override
  void onReady() {
    super.onReady();
    _getBalance();
  }

  // ---------------------- Private methods ----------------------

  void _getBalance() async {
    final useCase = getIt<IListenMyBalanceUseCase>();
    _balance.bindStream(useCase.getBalance(GetMyBalanceRequest(user)));
  }
}
