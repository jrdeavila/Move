import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:mevo/lib.dart';

class ListenCurrentServiceCtrl extends GetxController {
  // ---------------------- Final Variables ----------------------
  final AppUser user;

  // ---------------------- Constructor ----------------------

  ListenCurrentServiceCtrl({
    required this.user,
  });

  // ---------------------- No Observable ----------------------

  // StreamSubscription<List<RequestService>>? _streamSubscription;

  // ---------------------- Observables ----------------------

  final Rx<RequestService?> _currentRequestService = Rx(null);
  final Rx<LatLng?> _driverLocation = Rx(null);
  RxList<RequestService> _listCounterOffers = <RequestService>[].obs;
  final RxBool _loading = false.obs;
  final RxDouble _currentOffer = 0.0.obs;
  final Rx<VoidCallback> _actionChangeCallback = Rx(() {});

  // ---------------------- Getters ----------------------

  RequestService? get currentRequestService => _currentRequestService.value;
  LatLng? get driverLocation => _driverLocation.value;
  List<RequestService> get listCounterOffers => _listCounterOffers;
  double get currentOffer => _currentOffer.value;

  bool get loading => _loading.value;

  bool get enableDecrementOffer500 =>
      currentOffer <= (_currentRequestService.value?.tee ?? 0);

  bool get onUpdatingCurrentOffer =>
      _currentOffer.value != _currentRequestService.value?.tee;

  // ---------------------- LifeCycle ----------------------

  @override
  void onReady() {
    super.onReady();
    ever(_currentRequestService, (value) {
      _runActionCallback(value);
      _showQualificationDialog(value);
      _updateCurrentOffer(value);
      _listenCounterOffers(value);
      _listenDriverLocation(value);
      _routing(value);
    });

    ever(_driverLocation, _moveCamera);
    ever(_listCounterOffers, _playSoundOnGetOffers);
    _listenCurrentRequestService();
  }

  @override
  void onClose() {
    _currentRequestService.close();
    _driverLocation.close();
    super.onClose();
  }

  // ---------------------- Private Methods ----------------------

  void _runActionCallback(RequestService? requestService) {
    if (requestService != null) {
      _actionChangeCallback.value();
    }
  }

  void _showQualificationDialog(RequestService? requestService) async {
    if (requestService?.status == RequestServiceStatus.finished) {
      if (Get.isDialogOpen!) {
        Get.back();
      }
      final rating = await Get.dialog(
        const QualificationDialog(),
      );

      if (rating != null) {
        qualifyService(rating);
      }
    }
    if (requestService?.status == RequestServiceStatus.qualified) {
      if (Get.isDialogOpen!) {
        Get.back();
      }
    }
  }

  void _updateCurrentOffer(RequestService? requestService) {
    _currentOffer.value = requestService?.tee ?? 0;
  }

  void _listenCounterOffers(RequestService? requestService) {
    if (requestService != null &&
        requestService.status == RequestServiceStatus.waiting) {
      final useCase = getIt<IListenRequestServiceCounterOffersUseCase>();
      List<RequestService> lastOffers = _listCounterOffers;
      _listCounterOffers = RxList(lastOffers);
      _listCounterOffers.bindStream(useCase.listen(
        ListenRequestServiceCounterOffersRequest(
          requestService: requestService,
        ),
      ));
      _listCounterOffers.refresh();
    } else {
      _listCounterOffers.clear();
      _listCounterOffers = <RequestService>[].obs;
    }
  }

  void _moveCamera(LatLng? location) {
    if (location != null) {
      Get.find<LocationCtrl>().moveCameraToLocation(location);
    }
  }

  void _listenDriverLocation(RequestService? requestService) async {
    if (requestService != null &&
        requestService.status == RequestServiceStatus.started) {
      final useCase = getIt<IListenDriverLocationUseCase>();
      final future = useCase.get(
        ListenDriverLocationRequest(
          driver: requestService.driver!,
        ),
      );
      final location = await future;
      _driverLocation.value = location != null
          ? LatLng(
              location.latitude,
              location.longitude,
            )
          : null;
    } else {
      _driverLocation.value = null;
    }
  }

  void _playSoundOnGetOffers(List<RequestService> offers) {
    Get.find<SoundCtrl>().cancelSound();
    if (offers.isNotEmpty) {
      Get.find<SoundCtrl>().playSound();
      Future.delayed(3.seconds, () {
        Get.find<SoundCtrl>().cancelSound();
      });
      if (kDebugMode) {
        print("get new offers");
      }
    }
  }

  void _routing(RequestService? requestService) {
    if (requestService != null) {
      Get.toNamed(ProfileRoutes.requestService);
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
    bool? result = await Get.dialog<bool>(
      const CancelDialog(),
    );

    if (result == null || !result) {
      return;
    }

    CancelReasonItem? item = await Get.dialog<CancelReasonItem>(
      CancelReasonDialog(
        reasons: [
          CancelReasonItem(
            reason: RequestServiceCancelReason.notNeedService,
            title: "No necesito el servicio",
          ),
          CancelReasonItem(
            reason: RequestServiceCancelReason.notConvincedPrice,
            title: "No me convence el precio",
          ),
          CancelReasonItem(
            reason: RequestServiceCancelReason.notConvincedDriver,
            title: "No me convence el conductor",
          ),
          CancelReasonItem(
            reason: RequestServiceCancelReason.other,
            title: "Otro",
          ),
        ],
      ),
    );

    if (item == null) {
      return;
    }

    _loading.value = true;

    final useCase = getIt<ICancelRequestServiceUseCase>();
    await useCase
        .cancelRequestService(
          CancelRequestServiceRequest(
            requestService: currentRequestService!,
            reason: item.reason,
          ),
        )
        .onError((error, stackTrace) => _loading.value = false);
    _loading.value = false;
  }

  void acceptDriverOffert(RequestService requestService) async {
    final useCase = getIt<IAcceptCounterOfferUseCase>();
    _loading.value = true;
    await useCase
        .acceptCounterOffer(
      AcceptCounterOfferRequest(
        requestService: currentRequestService!,
        offer: requestService,
      ),
    )
        .onError((error, stackTrace) {
      _loading.value = false;
    });
    _loading.value = false;
  }

  void decrementOffer500() {
    _currentOffer.value -= 500;
  }

  void incrementOffer500() {
    _currentOffer.value += 500;
  }

  void changeOffer() async {
    final useCase = getIt<IChangeRequestServiceOfferUseCase>();
    await useCase.changeRequestServiceOffer(
      ChangeRequestServiceOfferRequest(
        requestService: currentRequestService!,
        offer: currentOffer,
      ),
    );
    _currentRequestService.value?.tee = currentOffer;
  }

  void qualifyService(double rating) async {
    final useCase = getIt<IQualifyRequestServiceUseCase>();
    _loading.value = true;
    await useCase
        .qualifyService(
          QualifyRequestServiceRequest(
            requestService: currentRequestService!,
            rating: rating,
          ),
        )
        .onError((error, stackTrace) => _loading.value = false);
    _loading.value = false;
  }

  void payWithPoints() async {
    final useCase = getIt<IPayRequestServiceWithPointsUseCase>();
    _loading.value = true;
    await useCase
        .payRequestService(PayRequestServiceWithPointsRequest(
      requestService: _currentRequestService.value!,
    ))
        .onError((error, stackTrace) {
      if (error != null) {
        Get.find<ExceptionCtrl>().onDebugException(error, stackTrace);
      }
      _loading.value = false;
    });

    _loading.value = false;
  }

  void setActionChangeCallback(void Function() getActionSize) {
    _actionChangeCallback.value = getActionSize;
  }
}
