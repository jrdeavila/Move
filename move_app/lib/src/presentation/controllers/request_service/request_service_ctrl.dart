import 'package:move_app/lib.dart';

class RequestServiceCtrl extends GetxController {
  // ----------------------- Final Variables -------------------------------
  final AppUser user;

  // ----------------------- Constructor -------------------------------

  RequestServiceCtrl({
    required this.user,
  });

  // -----------------------No Observable -------------------------------
  bool editingBeginAddress = false;
  bool editingEndAddress = false;
  TextEditingController beginAddressController = TextEditingController();
  TextEditingController endAddressController = TextEditingController();
  TextEditingController beginNeighborhoodController = TextEditingController();
  TextEditingController endNeighborhoodController = TextEditingController();

  // ----------------------- Observables -------------------------------
  final RxList<TravelPoint> _addressessSearched = RxList();
  final RxList<Payment> _paymentsAbailables = RxList();
  final RxBool _loading = RxBool(false);

  // Fields to request service
  final Rx<TravelPoint?> _beginTravelPoint = Rx(null);
  final Rx<TravelPoint?> _endTravelPoint = Rx(null);
  final RxDouble _teeValue = RxDouble(0);
  final Rx<Payment> _currentPayment = Rx(payments.first);

  // ----------------------- Getters -------------------------------

  bool get loading => _loading.value;
  List<TravelPoint> get addressessSearched => _addressessSearched;
  TravelPoint? get beginTravelPoint => _beginTravelPoint.value;
  TravelPoint? get endTravelPoint => _endTravelPoint.value;
  List<Payment> get paymentsAbailables => _paymentsAbailables;
  Payment get currentPayment => _currentPayment.value;
  double get teeValue => _teeValue.value;

  // ----------------------- Setters -------------------------------

  void setBeginTravelPoint(TravelPoint value) {
    _beginTravelPoint.value = value;
  }

  void setCurrentPayment(Payment payment) {
    _currentPayment.value = payment;
  }

  void setTeeValue(num unformattedValue) {
    _teeValue.value = unformattedValue.toDouble();
  }

  void setAddressBegin(String address) {
    beginAddressController.text = address;
    _beginTravelPoint.value?.address = address;
    _beginTravelPoint.refresh();
  }

  void setAddressEnd(String address) {
    endAddressController.text = address;
    _endTravelPoint.value?.address = address;
    _endTravelPoint.refresh();
  }

  // ----------------------- LifeCycle -------------------------------

  @override
  void onReady() {
    super.onReady();
    ever(_beginTravelPoint, _mapBeginTravelPoint);
    ever(_endTravelPoint, _mapEndTravelPoint);
    _fetchPayments();
  }

  void _mapBeginTravelPoint(TravelPoint? travelPoint) {
    if (travelPoint == null) return;
    beginAddressController.text = travelPoint.address;
    beginNeighborhoodController.text = travelPoint.name;
  }

  void _mapEndTravelPoint(TravelPoint? travelPoint) {
    if (travelPoint == null) return;
    endAddressController.text = travelPoint.address;
    endNeighborhoodController.text = travelPoint.name;
  }

  // ----------------------- Private Methods -------------------------------

  void _fetchPayments() async {
    final useCase = getIt<IGetPaymentsUseCase>();
    final payments = await useCase.get();
    _paymentsAbailables.value = payments;
    _currentPayment.value = payments.first;
  }

  void _fetchKnownAddresses(String tag) async {
    final useCase = getIt<IGetKnownAddressesUseCase>();
    final res = await useCase.getKnownAddresses(tag: tag);
    _addressessSearched.value = res;
  }

  void _sendRequestService() async {
    final sendServiceUseCase = getIt<ISendRequestServiceUseCase>();
    final saveAddressUseCase = getIt<ISaveAddressUseCase>();
    final request = SendRequestServiceRequest(
      clientCreator: user,
      origin: beginTravelPoint!,
      destination: endTravelPoint!,
      tee: teeValue,
      driver: null,
      payment: currentPayment,
    );
    await saveAddressUseCase
        .saveAddress(
          SaveAddressRequest(
            tag: 'origin',
            address: beginTravelPoint!,
          ),
        )
        .onError((error, stackTrace) => _loading.value = false);
    await saveAddressUseCase
        .saveAddress(
          SaveAddressRequest(
            tag: 'destination',
            address: endTravelPoint!,
          ),
        )
        .onError((error, stackTrace) => _loading.value = false);
    _loading.value = true;
    await sendServiceUseCase
        .sendRequestService(request)
        .onError((error, stackTrace) => _loading.value = false);
    _loading.value = false;
  }

  // ----------------------- Public Methods -------------------------------

  void openSearchAddress(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return const SearchAddressModal();
        });
  }

  void openSetTee(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const SetTeeModal();
        });
  }

  void requestService(context) {
    if (beginTravelPoint == null) {
      openSearchAddress(context);
      return;
    }
    if (endTravelPoint == null) {
      openSearchAddress(context);
      return;
    }

    if (teeValue == 0) {
      openSetTee(context);
      return;
    }

    _sendRequestService();
  }

  void onEditingBeginAddress() {
    editingBeginAddress = true;
    editingEndAddress = false;
    _fetchKnownAddresses('origin');
  }

  void onEditingEndAddress() {
    editingBeginAddress = false;
    editingEndAddress = true;
    _fetchKnownAddresses('destination');
  }

  void searchTravelPoints(String query) async {
    final useCase = getIt<IGetAddressesByQueryUseCase>();
    final addresses = await useCase.getAddresses(
      QueryAddressRequest(
        query: query,
        latitudeRef: Get.find<LocationCtrl>().currentLocation.latitude,
        longitudeRef: Get.find<LocationCtrl>().currentLocation.longitude,
      ),
    );
    _addressessSearched.value = addresses;
  }

  void selectTravelPoint(TravelPoint travelPoint) {
    if (editingBeginAddress) {
      _beginTravelPoint.value = travelPoint;
      Get.find<LocationCtrl>().focusOnTravelPoint(travelPoint);
      return;
    }
    if (editingEndAddress) {
      _endTravelPoint.value = travelPoint;
      Get.find<LocationCtrl>().focusOnTravelPoint(travelPoint);
      return;
    }
  }
}
