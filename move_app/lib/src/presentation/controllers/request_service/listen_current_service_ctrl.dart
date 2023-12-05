import 'package:audioplayers/audioplayers.dart';
import 'package:latlong2/latlong.dart';
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
  final Rx<LatLng?> _driverLocation = Rx(null);

  // ---------------------- Getters ----------------------

  RequestService? get currentRequestService => _currentRequestService.value;
  LatLng? get driverLocation => _driverLocation.value;

  // ---------------------- LifeCycle ----------------------

  @override
  void onReady() {
    super.onReady();
    ever(_currentRequestService, _routing);
    ever(_currentRequestService, _playSound);
    ever(_currentRequestService, _listenDriverLocation);
    ever(_driverLocation, _moveCamera);
    _listenCurrentRequestService();
  }

  @override
  void onClose() {
    _currentRequestService.close();
    _driverLocation.close();
    super.onClose();
  }

  // ---------------------- Private Methods ----------------------

  void _moveCamera(LatLng? location) {
    if (location != null) {
      Get.find<LocationCtrl>().moveCameraToLocation(location);
    }
  }

  void _listenDriverLocation(RequestService? requestService) {
    if (requestService != null &&
        requestService.status == RequestServiceStatus.started) {
      final useCase = getIt<IListenDriverLocationUseCase>();
      final stream = useCase.listen(
        ListenDriverLocationRequest(
          driver: requestService.driver!,
        ),
      );
      _driverLocation.bindStream(stream.map((event) => event != null
          ? LatLng(
              event.latitude,
              event.longitude,
            )
          : null));
    }
  }

  void _playSound(RequestService? requestService) {
    if (requestService?.status == RequestServiceStatus.started) {
      final audioPlayerService = getIt<IPlaySound>();
      audioPlayerService(
        PlaySoundRequest(
          source: AssetSource('sounds/new-service.mp3'),
        ),
      );
    }
  }

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
