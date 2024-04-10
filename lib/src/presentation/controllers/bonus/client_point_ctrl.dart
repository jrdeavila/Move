import 'package:mevo/lib.dart';

class ClientPointCtrl extends GetxController {
  // ---------------------- Local variables ----------------------
  final AppUser user;

  // ---------------------- Constructor ----------------------

  ClientPointCtrl({required this.user});

  // ---------------------- Observables ----------------------

  final Rx<int> _points = Rx<int>(0);
  final Rx<int> _quotaPerPoint = Rx<int>(0);
  final Rx<int> _clientBonus = Rx<int>(0);

  // ---------------------- Getters ----------------------

  int get points => _points.value;
  int get quotaPerPoint => _quotaPerPoint.value;
  int get pointsInMoney => _quotaPerPoint.value * _points.value;
  int get clientBonus => _clientBonus.value;

  // ---------------------- Lyfecycles ----------------------

  @override
  void onReady() {
    super.onReady();
    _getPoints();
    _getQuotaPerPoint();
    _getClientBonus();
  }

  // ---------------------- Private methods ----------------------

  void _getPoints() async {
    final useCase = getIt<IListenMyPointsUseCase>();
    _points.bindStream(useCase.getPoints(GetMyPointsRequest(user)));
  }

  void _getQuotaPerPoint() async {
    final useCase = getIt<IGetQuotaPerPointUseCase>();
    _quotaPerPoint.value = await useCase.getQuotaPerPoint();
  }

  void _getClientBonus() async {
    final useCase = getIt<IGetPointsPerTravelUseCase>();
    _clientBonus.value = await useCase.getPointsPerTravel();
  }

  // ---------------------- Public methods -----------------------

  void goToPoints() {
    Get.dialog(
      const ShowPointsDialog(),
    );
  }
}
