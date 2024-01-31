import 'package:mevo/lib.dart';

class ClientPointCtrl extends GetxController {
  // ---------------------- Local variables ----------------------
  final AppUser user;

  // ---------------------- Constructor ----------------------

  ClientPointCtrl({required this.user});

  // ---------------------- Observables ----------------------

  final Rx<int> _points = Rx<int>(0);

  // ---------------------- Getters ----------------------

  int get points => _points.value;

  // ---------------------- Lyfecycles ----------------------

  @override
  void onReady() {
    super.onReady();
    _getPoints();
  }

  // ---------------------- Private methods ----------------------

  void _getPoints() async {
    final useCase = getIt<IListenMyPointsUseCase>();
    _points.bindStream(useCase.getPoints(GetMyPointsRequest(user)));
  }
}
