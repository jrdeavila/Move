import 'package:move_app/lib.dart';

class ListenDriverCurrentServiceCtrl extends GetxController {
  // ---------------------- Final Variables ----------------------
  final AppUser user;

  // ---------------------- Constructor ----------------------

  ListenDriverCurrentServiceCtrl({
    required this.user,
  });

  // ---------------------- Observables ----------------------

  final Rx<RequestService?> _currentRequestService = Rx(null);
  final RxBool _loading = RxBool(false);

  // ---------------------- Getters ----------------------

  RequestService? get currentRequestService => _currentRequestService.value;
  bool get loading => _loading.value;

  // ---------------------- LifeCycle ----------------------

  @override
  void onReady() {
    super.onReady();
    ever(_currentRequestService, _routing);
    _listenCurrentRequestService();
  }

  // ---------------------- Private Methods ----------------------

  void _routing(RequestService? requestService) {
    if (requestService != null) {
      Get.offAllNamed(ProfileRoutes.driverService);
    } else {
      Get.offAllNamed(DashboardRoutes.homeDriver);
    }
  }

  void _listenCurrentRequestService() async {
    final useCase = getIt<IListenCurrentRequestServiceDriverUseCase>();
    final stream = useCase.listen(
      ListenCurrentRequestServiceDriverRequest(
        driver: user,
      ),
    );
    _currentRequestService.bindStream(stream);
  }

  // ---------------------- Public Methods ----------------------

  void finishService() async {
    final useCase = getIt<IFinishServiceDriverUseCase>();
    _loading.value = true;
    useCase
        .finish(
          FinishServiceDriverRequest(
            requestService: currentRequestService!,
          ),
        )
        .then((value) => _loading.value = false)
        .onError((error, stackTrace) => _loading.value = false);
  }
}
