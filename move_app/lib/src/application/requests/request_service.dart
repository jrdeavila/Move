import 'package:move_app/lib.dart';

class SendRequestServiceRequest {
  final AppUser clientCreator;
  final AppUser? driver;
  final TravelPoint origin;
  final TravelPoint destination;
  final Payment payment;
  final double tee;

  SendRequestServiceRequest({
    required this.clientCreator,
    required this.driver,
    required this.origin,
    required this.destination,
    required this.payment,
    required this.tee,
  });
}
