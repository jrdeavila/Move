import 'package:move_app/lib.dart';

class ListenCurrentServiceCtrl extends GetxController {
  // ---------------------- Final Variables ----------------------
  final AppUser user;

  // ---------------------- Constructor ----------------------

  ListenCurrentServiceCtrl({
    required this.user,
  });

  // ---------------------- Observables ----------------------

  final Rx<RequestService?> _currentRequestService = Rx(null);

  // ---------------------- Getters ----------------------

  RequestService? get currentRequestService => _currentRequestService.value;

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
      Get.offAllNamed(ProfileRoutes.requestService);
    } else {
      Get.offAllNamed(DashboardRoutes.homeClient);
    }
  }

  void _listenCurrentRequestService() async {
    final useCase = getIt<IListenCurrentRequestServiceUseCase>();
    final stream = useCase.listen(
      ListenCurrentRequestServiceRequest(
        user: user,
      ),
    );
    _currentRequestService.bindStream(stream);
  }

  // ---------------------- Public Methods ----------------------

  void cancelRequestService() async {
    final useCase = getIt<ICancelRequestServiceUseCase>();
    await useCase.cancelRequestService(
      CancelRequestServiceRequest(
        requestService: currentRequestService!,
      ),
    );
  }
}
