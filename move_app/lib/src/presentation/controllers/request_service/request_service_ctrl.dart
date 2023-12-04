import 'package:move_app/lib.dart';

class TravelPoint {
  String name;
  String address;
  double latitude;
  double longitude;

  TravelPoint({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}

enum PaymentType {
  virtual,
  cash,
}

class Payment {
  final String name;
  final PaymentType type;

  Payment({
    required this.name,
    required this.type,
  });
}

final payments = [
  Payment(
    name: "Efectivo",
    type: PaymentType.cash,
  ),
  Payment(
    name: "Nequi",
    type: PaymentType.virtual,
  ),
  Payment(
    name: "Bancolombia a la Mano",
    type: PaymentType.virtual,
  ),
];

class RequestServiceCtrl extends GetxController {
  // ----------------------- Observables -------------------------------

  final Rx<TravelPoint?> _beginTravelPoint = Rx(null);
  final Rx<TravelPoint?> _endTravelPoint = Rx(null);

  final RxList<Payment> _paymentsAbailables = RxList();
  final Rx<Payment> _currentPayment = Rx(payments.first);

  // ----------------------- Getters -------------------------------

  TravelPoint? get beginTravelPoint => _beginTravelPoint.value;
  TravelPoint? get endTravelPoint => _endTravelPoint.value;
  List<Payment> get paymentsAbailables => _paymentsAbailables;
  Payment get currentPayment => _currentPayment.value;

  // ----------------------- Setters -------------------------------

  void setCurrentPayment(Payment payment) {
    _currentPayment.value = payment;
  }

  // ----------------------- LifeCycle -------------------------------

  @override
  void onReady() {
    super.onReady();
    _fetchPayments();
  }

  // ----------------------- Private Methods -------------------------------

  void _fetchPayments() async {
    // TODO: Implements Use Case

    await Future.delayed(const Duration(seconds: 1));
    _paymentsAbailables.addAll(payments);
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
}
