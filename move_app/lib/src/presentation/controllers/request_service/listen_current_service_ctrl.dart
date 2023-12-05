import 'package:latlong2/latlong.dart';
import 'package:move_app/lib.dart';

const lyfeTimeOfOffer = 12;

class TimeLyfeOfOffer {
  final RequestService offer;
  final VoidCallback onTimeOut;

  Timer get timer => Timer(const Duration(seconds: lyfeTimeOfOffer), onTimeOut);

  TimeLyfeOfOffer({
    required this.offer,
    required this.onTimeOut,
  });
}

class ListenCurrentServiceCtrl extends GetxController {
  // ---------------------- Final Variables ----------------------
  final AppUser user;

  // ---------------------- Constructor ----------------------

  ListenCurrentServiceCtrl({
    required this.user,
  });

  // ---------------------- No Observable ----------------------

  StreamSubscription<List<RequestService>>? _streamSubscription;

  // ---------------------- Observables ----------------------

  final Rx<RequestService?> _currentRequestService = Rx(null);
  final Rx<LatLng?> _driverLocation = Rx(null);
  final RxList<TimeLyfeOfOffer> _listCounterOffers = <TimeLyfeOfOffer>[].obs;

  // ---------------------- Getters ----------------------

  RequestService? get currentRequestService => _currentRequestService.value;
  LatLng? get driverLocation => _driverLocation.value;
  List<TimeLyfeOfOffer> get listCounterOffers => _listCounterOffers;

  // ---------------------- LifeCycle ----------------------

  @override
  void onReady() {
    super.onReady();
    ever(_currentRequestService, _routing);
    everAll([
      _currentRequestService,
      _listCounterOffers,
    ], _playSound);
    ever(_currentRequestService, _listenCounterOffers);
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

  void _listenCounterOffers(RequestService? requestService) {
    if (requestService != null) {
      final useCase = getIt<IListenRequestServiceCounterOffersUseCase>();
      _streamSubscription?.cancel();
      _streamSubscription = useCase
          .listen(ListenRequestServiceCounterOffersRequest(
              requestService: requestService))
          .listen((event) {
        var itemsNotAdded = event
            .where((element) =>
                !_listCounterOffers.any((e) => e.offer.uuid == element.uuid))
            .map((e) => TimeLyfeOfOffer(
                  offer: e,
                  onTimeOut: () {
                    final useCase = getIt<ICancelCounterOfferUseCase>();
                    useCase.cancelCounterOffer(
                      CancelCounterOfferRequest(
                        requestService: requestService,
                        offer: e,
                      ),
                    );
                    _listCounterOffers
                        .removeWhere((element) => element.offer.uuid == e.uuid);
                  },
                ))
            .toList();
        _listCounterOffers.value = itemsNotAdded;
      });
    } else {
      clearStreams();
    }
  }

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

  void _playSound(values) {
    if (currentRequestService?.status == RequestServiceStatus.started) {
      Get.find<SoundCtrl>().playSound();
      return;
    }

    if (listCounterOffers.isNotEmpty) {
      Get.find<SoundCtrl>().playSound();
      return;
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
    clearStreams();
  }

  void acceptDriverOffert(RequestService requestService) {
    final useCase = getIt<IAcceptCounterOfferUseCase>();
    useCase.acceptCounterOffer(
      AcceptCounterOfferRequest(
        requestService: currentRequestService!,
        offer: requestService,
      ),
    );
    clearStreams();
  }

  void clearStreams() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _driverLocation.value = null;
  }
}
