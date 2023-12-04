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
