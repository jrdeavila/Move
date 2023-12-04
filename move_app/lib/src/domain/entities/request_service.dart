import 'package:move_app/lib.dart';

enum RequestServiceStatus {
  waiting,
  started,
  canceled,
  finished,
}

class RequestService {
  String uuid;
  final AppUser clientCreator;
  AppUser? driver;
  final TravelPoint origin;
  final TravelPoint destination;
  final Payment payment;
  RequestServiceStatus status;
  double tee;

  RequestService({
    required this.uuid,
    required this.clientCreator,
    required this.origin,
    required this.destination,
    required this.payment,
    required this.tee,
    required this.driver,
    this.status = RequestServiceStatus.waiting,
  });
}

enum TravelPointType {
  known,
  searched,
}

class TravelPoint {
  String name;
  String address;
  double latitude;
  double longitude;
  TravelPointType type;

  TravelPoint({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.type = TravelPointType.searched,
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
