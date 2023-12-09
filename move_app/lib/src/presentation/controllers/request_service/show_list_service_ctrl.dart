import 'package:move_app/lib.dart';

const lyfeTimeOfRequestService = 17;

class DriverLyfeCicleOfRequestService {
  final RequestService requestService;
  final VoidCallback onTimeOut;

  Timer get timer =>
      Timer(const Duration(seconds: lyfeTimeOfRequestService), onTimeOut);

  DriverLyfeCicleOfRequestService({
    required this.requestService,
    required this.onTimeOut,
  });
}

class ShowListServiceCtrl extends GetxController {
  // ---------------------------- Final Variables ----------------------------
  final AppUser user;

  // ---------------------------- Constructor ----------------------------

  ShowListServiceCtrl({
    required this.user,
  });

  // ---------------------------- Observables ----------------------------

  final RxList<DriverLyfeCicleOfRequestService> _listRequestService =
      <DriverLyfeCicleOfRequestService>[].obs;
  final RxList<ServiceCommonOffert> _listServiceCommonOffert =
      <ServiceCommonOffert>[].obs;
  final RxDouble _currentOffert = 0.0.obs;

  // ---------------------------- Getters ----------------------------

  List<DriverLyfeCicleOfRequestService> get listRequestService =>
      _listRequestService;
  List<ServiceCommonOffert> get listServiceCommonOffert =>
      _listServiceCommonOffert;
  double get currentOffert => _currentOffert.value;

  // ---------------------------- Setters ----------------------------

  // ---------------------------- Lyfecycles ----------------------------

  @override
  void onReady() {
    super.onReady();
    ever(_listRequestService, _playSound);
    ever(_listRequestService, _routing);
    _listenRequestService();
    _fetchServiceCommonOffert();
  }

  // ---------------------------- Private Methods -----------------------------

  void _routing(List<DriverLyfeCicleOfRequestService> listRequestService) {
    if (listRequestService.isNotEmpty) {
      Get.toNamed(ProfileRoutes.showServices);
    }
  }

  void _playSound(List<DriverLyfeCicleOfRequestService> listRequestService) {
    if (listRequestService.isNotEmpty) {
      Get.find<SoundCtrl>().playSoundManyTimes();
    }
  }

  void _listenRequestService() {
    final useCase = getIt<IListenAllRequestServiceUseCase>();
    _listRequestService.bindStream(useCase
        .listen(
      ListenAllRequestServiceRequest(
        driver: user,
      ),
    )
        .map((event) {
      var itemsNoAdded = event
          .where((element) => !_listRequestService
              .any((e) => e.requestService.uuid == element.uuid))
          .map((e) => DriverLyfeCicleOfRequestService(
                requestService: e,
                onTimeOut: () {
                  final useCase = getIt<IMarkAsViewedRequestServiceUseCase>();
                  useCase.markAsViewed(MarkAsViewedRequest(
                    driver: user,
                    requestService: e,
                  ));
                  _listRequestService.removeWhere(
                      (element) => element.requestService.uuid == e.uuid);
                },
              ));
      return itemsNoAdded.toList();
    }));
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

  void onSelectCommonOffert(
      ServiceCommonOffert serviceCommonOffert, RequestService requestService) {
    final useCase = getIt<ISendCounterOfferUseCase>();
    useCase.sendCounterOffer(
      SendCounterOfferRequest(
        driver: user,
        requestService: requestService,
        counterOffer: serviceCommonOffert.offert,
      ),
    );
  }

  void onChangeOffert(double value) {
    _currentOffert.value = value;
  }

  void sendCounterOffert(RequestService requestService) {
    _currentOffert.value = requestService.tee;
    final useCase = getIt<ISendCounterOfferUseCase>();
    useCase.sendCounterOffer(
      SendCounterOfferRequest(
        driver: user,
        requestService: requestService,
        counterOffer: _currentOffert.value,
      ),
    );
  }
}
