import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IServiceActionService)
class FirebaseServiceActionService implements IServiceActionService {
  final FirebaseFirestore _firestore;

  FirebaseServiceActionService({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;
  @override
  Future<void> cancelRequestService(RequestService request) {
    return _firestore
        .collection('services')
        .doc(request.uuid)
        .update({'status': RequestServiceStatus.canceled.toString()});
  }

  @override
  Stream<RequestService?> listenCurrentRequestService(AppUser clientCreator) {
    return _firestore
        .collection('services')
        .where("clientCreator", isEqualTo: clientCreator.uuid)
        .where('status', whereIn: [
          RequestServiceStatus.waiting.toString(),
          RequestServiceStatus.started.toString(),
        ])
        .snapshots()
        .asyncMap((event) async {
          if (event.docs.isEmpty) {
            return Future.value(null);
          }
          final creator = await _getUser(event.docs.first['clientCreator']);
          final driver = event.docs.first.data()['driver'] != null
              ? await _getUser(event.docs.first['driver'])
              : null;
          return requestServiceFromMapWithUserAndDriver(
            event.docs.first.data(),
            clientCreator: creator,
            driver: driver,
          );
        });
  }

  Future<AppUser> _getUser(String uuid) async {
    final user = await _firestore.collection('users').doc(uuid).get();
    return userFromJson(user.data()!);
  }

  @override
  Future<void> sendRequestService(RequestService request) {
    return _firestore
        .collection('services')
        .doc(request.uuid)
        .set(requestServiceToMap(request));
  }
}

RequestService requestServiceFromMapWithUserAndDriver(
  Map<String, dynamic> map, {
  required AppUser clientCreator,
  AppUser? driver,
}) {
  PaymentType getPaymentType(String type) {
    switch (type) {
      case 'PaymentType.virtual':
        return PaymentType.virtual;
      case 'PaymentType.cash':
        return PaymentType.cash;
      default:
        return PaymentType.cash;
    }
  }

  Payment getPayment(Map<String, dynamic> payment) {
    return Payment(
      name: payment['name'],
      type: getPaymentType(payment['type']),
    );
  }

  TravelPoint getTravelPoint(Map<String, dynamic> travelPoint) {
    return TravelPoint(
      name: travelPoint['name'],
      address: travelPoint['address'],
      latitude: travelPoint['latitude'],
      longitude: travelPoint['longitude'],
    );
  }

  RequestServiceStatus getRequestServiceStatus(String status) {
    switch (status) {
      case 'RequestServiceStatus.waiting':
        return RequestServiceStatus.waiting;
      case 'RequestServiceStatus.started':
        return RequestServiceStatus.started;
      case 'RequestServiceStatus.canceled':
        return RequestServiceStatus.canceled;
      case 'RequestServiceStatus.finished':
        return RequestServiceStatus.finished;
      default:
        return RequestServiceStatus.waiting;
    }
  }

  return RequestService(
    uuid: map['uuid'],
    clientCreator: clientCreator,
    driver: driver,
    origin: getTravelPoint(map['origin']),
    destination: getTravelPoint(map['destination']),
    payment: getPayment(map['payment']),
    tee: map['tee'],
    status: getRequestServiceStatus(map['status']),
  );
}

Map<String, dynamic> requestServiceToMap(RequestService request) {
  return {
    'uuid': request.uuid,
    'clientCreator': request.clientCreator.uuid,
    'driver': request.driver?.uuid,
    'origin': {
      'name': request.origin.name,
      'address': request.origin.address,
      'latitude': request.origin.latitude,
      'longitude': request.origin.longitude,
    },
    'destination': {
      'name': request.destination.name,
      'address': request.destination.address,
      'latitude': request.destination.latitude,
      'longitude': request.destination.longitude,
    },
    'payment': {
      'name': request.payment.name,
      'type': request.payment.type.toString(),
    },
    'tee': request.tee,
    'status': request.status.toString(),
  };
}

@Injectable(as: IGetDriverLocationService)
class FirebaseGetDriverLocationService implements IGetDriverLocationService {
  final FirebaseFirestore _firestore;

  FirebaseGetDriverLocationService({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;
  @override
  Stream<DriverLocation?> listen(AppUser driver) {
    return _firestore
        .collection('users')
        .doc(driver.uuid)
        .snapshots()
        .map((event) {
      return driverLocationFromMap(event.data()?['location'] as GeoPoint?);
    });
  }
}

DriverLocation? driverLocationFromMap(GeoPoint? location) {
  if (location == null) {
    return null;
  }

  return DriverLocation(
    latitude: location.latitude,
    longitude: location.longitude,
  );
}
