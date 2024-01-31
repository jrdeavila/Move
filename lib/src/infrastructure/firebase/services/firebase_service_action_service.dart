import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

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

  @override
  Stream<List<RequestService>> getRequestServiceCounterOffers(
      RequestService requestService) {
    final ref = _firestore.collection("services").doc(requestService.uuid);
    return ref
        .collection("counter_offer")
        .where("status", isEqualTo: RequestServiceStatus.waiting.toString())
        .snapshots()
        .asyncMap((event) async {
      final docsNoViewed = event.docs.where((doc) {
        final clientViewed = doc.data()["viewedBy"] ?? [];
        return !clientViewed.contains(requestService.clientCreator.uuid);
      }).toList();

      final List<RequestService> offers = await _getOffers(docsNoViewed);

      return offers;
    });
  }

  Future<List<RequestService>> _getOffers(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docsNoViewed) async {
    final List<RequestService> offers = [];

    for (final counterOffer in docsNoViewed) {
      final creator = await _getUser(counterOffer['clientCreator']);
      final driver = counterOffer.data()['driver'] != null
          ? await _getUser(counterOffer['driver'])
          : null;
      final requestService = requestServiceFromMapWithUserAndDriver(
        counterOffer.data(),
        clientCreator: creator,
        driver: driver,
      );
      offers.add(requestService);
    }

    return offers;
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

  @override
  Future<void> acceptCounterOffer(
      RequestService requestService, RequestService counterOffer) async {
    final driverIsAvailable = await _driverIsAvailable(counterOffer.driver!);
    if (driverIsAvailable) {
      await cancelRequestService(requestService);
      await _acceptCounterOffer(requestService, counterOffer);
      counterOffer.status = RequestServiceStatus.started;
      await sendRequestService(counterOffer);
    } else {
      await cancelCounterOffer(requestService, counterOffer);
      throw ExceptionMessage(code: 'driver-not-available');
    }
  }

  Future<void> _acceptCounterOffer(
      RequestService requestService, RequestService counterOffer) async {
    final ref = _firestore.collection("services").doc(requestService.uuid);
    return ref
        .collection("counter_offer")
        .doc(counterOffer.driver?.uuid)
        .update({
      'status': RequestServiceStatus.started.toString(),
    });
  }

  @override
  Future<void> cancelCounterOffer(
      RequestService requestService, RequestService counterOffer) async {
    final ref = _firestore.collection("services").doc(requestService.uuid);
    return ref
        .collection("counter_offer")
        .doc(counterOffer.driver?.uuid)
        .update({'status': RequestServiceStatus.canceled.toString()});
  }

  Future<bool> _driverIsAvailable(AppUser driver) async {
    return _firestore
        .collection('services')
        .where(
          'driver',
          isEqualTo: driver.uuid,
        )
        .where(
          'status',
          isEqualTo: RequestServiceStatus.started.toString(),
        )
        .get()
        .then((value) => !value.docs.isNotEmpty);
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

@Injectable(as: IChangeRequestServiceOfferService)
class FirebaseChangeRequestServiceOfferService
    implements IChangeRequestServiceOfferService {
  final FirebaseFirestore _firestore;

  FirebaseChangeRequestServiceOfferService({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<void> changeRequestServiceOffer(
      RequestService requestService, double offer) {
    return _firestore.collection("services").doc(requestService.uuid).update({
      'tee': offer,
      'viewedBy': [],
    });
  }
}
