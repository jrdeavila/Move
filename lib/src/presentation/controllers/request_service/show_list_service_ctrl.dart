import 'package:mevo/lib.dart';

const lyfeTimeOfRequestService = 15;

class ShowListServiceCtrl extends GetxController {
  // ---------------------------- Final Variables ----------------------------
  final AppUser user;

  // ---------------------------- Constructor ----------------------------

  ShowListServiceCtrl({
    required this.user,
  });

  // ---------------------------- Observables ----------------------------

  final RxList<RequestService> _listRequestService = <RequestService>[].obs;
  final RxList<ServiceCommonOffer> _listServiceCommonOffert =
      <ServiceCommonOffer>[].obs;
  final RxDouble _currentOffert = 0.0.obs;

  // ---------------------------- Getters ----------------------------

  List<RequestService> get listRequestService => _listRequestService;
  List<ServiceCommonOffer> get listServiceCommonOffert =>
      _listServiceCommonOffert;
  double get currentOffert => _currentOffert.value;

  // ---------------------------- Setters ----------------------------

  // ---------------------------- Lyfecycles ----------------------------

  @override
  void onReady() {
    super.onReady();
    ever(_listRequestService, _playSound);
    ever(_listRequestService, _notifyInBackgroud);
    ever(_listRequestService, _routing);
    _listenRequestService();
    _fetchServiceCommonOffert();
  }

  // ---------------------------- Private Methods -----------------------------

  void _notifyInBackgroud(List<RequestService> listRequestService) {
    if (listRequestService.isNotEmpty) {
      // Check if app is in background
      Get.find<NotificationCtrl>().showNotification(
        title: 'Nueva solicitud de servicio',
        body: 'Tienes una nueva solicitud de servicio',
      );
    }
  }

  void _routing(List<RequestService> listRequestService) {
    if (listRequestService.isNotEmpty) {
      Get.toNamed(ProfileRoutes.showServices);
    }
  }

  void _playSound(List<RequestService> listRequestService) {
    if (listRequestService.isNotEmpty) {
      Get.find<SoundCtrl>().playSound();
    }
  }

  void _listenRequestService() {
    final useCase = getIt<IListenAllRequestServiceUseCase>();
    useCase
        .listen(
      ListenAllRequestServiceRequest(
        driver: user,
      ),
    )
        .listen((event) {
      _listRequestService.value = event;
      _listRequestService.refresh();
    });
  }

  void _fetchServiceCommonOffert() {
    final useCase = getIt<IGetServiceCommonOffertsUseCase>();
    useCase.get().then((value) => _listServiceCommonOffert.addAll(value));
  }

  // ---------------------------- Public Methods -----------------------------

  void showContraOffertModal(RequestService requestService) {
    _currentOffert.value = requestService.tee;
    showModalBottomSheet(
        context: Get.context!,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return CounterOffertModal(
            requestService: requestService,
          );
        });
  }

  void onSelectCommonOffert(ServiceCommonOffer serviceCommonOffert,
      RequestService requestService) async {
    final useCase = getIt<ISendCounterOfferUseCase>();
    await useCase.sendCounterOffer(
      SendCounterOfferRequest(
        driver: user,
        requestService: requestService,
        counterOffer: serviceCommonOffert.offer,
      ),
    );
    Get.find<BannerCtrl>().showInfo(
      'Oferta Enviada! 🎉',
      'Espera a que el cliente acepte tu oferta',
    );
  }

  void onChangeOffert(double value) {
    _currentOffert.value = value;
  }

  void sendCounterOffert(RequestService requestService) async {
    _currentOffert.value = requestService.tee;
    final useCase = getIt<ISendCounterOfferUseCase>();
    await useCase.sendCounterOffer(
      SendCounterOfferRequest(
        driver: user,
        requestService: requestService,
        counterOffer: _currentOffert.value,
      ),
    );

    Get.find<BannerCtrl>().showInfo(
      'Genial! 🎉',
      'Espera a que el cliente acepte tu servicio',
    );
  }

  void removeRequestService(RequestService requestService) {
    final useCase = getIt<IMarkAsViewedRequestServiceUseCase>();
    useCase.markAsViewed(
      MarkAsViewedRequest(
        driver: user,
        requestService: requestService,
      ),
    );
  }
}
