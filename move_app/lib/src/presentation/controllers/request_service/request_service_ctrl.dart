import 'package:move_app/lib.dart';

class RequestServiceCtrl extends GetxController {
  // -----------------------No Observable -------------------------------
  bool editingBeginAddress = false;
  bool editingEndAddress = false;
  // ----------------------- Observables -------------------------------
  final RxList<TravelPoint> _addressessSearched = RxList();

  final Rx<TravelPoint?> _beginTravelPoint = Rx(null);
  final Rx<TravelPoint?> _endTravelPoint = Rx(null);
  final RxDouble _teeValue = RxDouble(0);

  final RxList<Payment> _paymentsAbailables = RxList();
  final Rx<Payment> _currentPayment = Rx(payments.first);

  // ----------------------- Getters -------------------------------

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

  // ----------------------- LifeCycle -------------------------------

  @override
  void onReady() {
    super.onReady();
    _fetchPayments();
  }

  // ----------------------- Private Methods -------------------------------

  void _fetchPayments() async {
    final useCase = getIt<IGetPaymentsUseCase>();
    final payments = await useCase.get();
    _paymentsAbailables.value = payments;
    _currentPayment.value = payments.first;
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
  }

  void onEditingBeginAddress() {
    editingBeginAddress = true;
    editingEndAddress = false;
  }

  void onEditingEndAddress() {
    editingBeginAddress = false;
    editingEndAddress = true;
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
      return;
    }
    if (editingEndAddress) {
      _endTravelPoint.value = travelPoint;
      return;
    }
  }
}
