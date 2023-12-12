import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IServiceDriverActionService)
class FirebaseServiceDriverActionService
    implements IServiceDriverActionService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseServiceDriverActionService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;
  @override
  Future<void> acceptRequestService(
      RequestService requestService, AppUser driver) {
    requestService.driver = driver;
    requestService.status = RequestServiceStatus.started;
    return _firebaseFirestore
        .collection("services")
        .doc(requestService.uuid)
        .update(
          requestServiceToMap(requestService),
        );
  }

  @override
  Stream<List<RequestService>> listenAllRequestService(AppUser driver) {
    return _firebaseFirestore
        .collection("services")
        .where("status", isEqualTo: RequestServiceStatus.waiting.toString())
        .snapshots()
        .asyncExpand((event) async* {
      final hasCurrentService = await _hasCurrentService(driver);
      if (hasCurrentService) {
        yield [];
      } else {
        final docsNoViewed = event.docs.where((doc) {
          final driverViewed = doc.data()["viewedBy"] ?? [];
          return !driverViewed.contains(driver.uuid);
        }).toList();
        final list = <RequestService>[];

        for (final doc in docsNoViewed) {
          final clientCreator = await _getUser(doc["clientCreator"]);

          list.add(
            requestServiceFromMapWithUserAndDriver(
              doc.data(),
              clientCreator: clientCreator,
            ),
          );
        }

        yield list;
      }
    });
  }

  Future<bool> _hasCurrentService(AppUser driver) {
    return _firebaseFirestore
        .collection("services")
        .where("driver", isEqualTo: driver.uuid)
        .where("status", isEqualTo: RequestServiceStatus.started.toString())
        .get()
        .then((value) {
      return value.docs.isNotEmpty;
    });
  }

  Future<AppUser> _getUser(String uuid) async {
    final user = await _firebaseFirestore.collection('users').doc(uuid).get();
    return userFromJson(user.data()!);
  }

  @override
  Future<void> sendCounterOffer(RequestService requestService,
      RequestService counterOffer, AppUser driver) {
    final ref =
        _firebaseFirestore.collection("services").doc(requestService.uuid);
    return ref.collection("counter_offer").doc(driver.uuid).set(
          requestServiceToMap(counterOffer),
        );
  }

  @override
  Stream<RequestService?> listenCurrentRequestService(AppUser driver) {
    return _firebaseFirestore
        .collection("services")
        .where("status", isEqualTo: RequestServiceStatus.started.toString())
        .where("driver", isEqualTo: driver.uuid)
        .snapshots()
        .asyncMap((event) async {
      if (event.docs.isEmpty) {
        return null;
      }
      final doc = event.docs.first;
      final clientCreator = await _getUser(doc["clientCreator"]);
      return requestServiceFromMapWithUserAndDriver(
        doc.data(),
        clientCreator: clientCreator,
        driver: driver,
      );
    });
  }
}

@Injectable(as: IServiceFinishDriverActionService)
class FirebaseServiceFinishDriverActionService
    implements IServiceFinishDriverActionService {
  final FirebaseFirestore _firebaseFirestore;
  final IClientBonificationService _clientBoniticationService;
  final IDriverPaymentService _driverPaymentService;

  FirebaseServiceFinishDriverActionService({
    required FirebaseFirestore firebaseFirestore,
    required IClientBonificationService clientBoniticationService,
    required IDriverPaymentService driverPaymentService,
  })  : _firebaseFirestore = firebaseFirestore,
        _clientBoniticationService = clientBoniticationService,
        _driverPaymentService = driverPaymentService;

  @override
  Future<void> finish(RequestService requestService) {
    return _firebaseFirestore.runTransaction((transaction) async {
      await _clientBoniticationService.updateBonification(
        client: requestService.clientCreator,
      );
      await _driverPaymentService.updatePayment(
        amount: requestService.tee,
        driver: requestService.driver!,
      );

      transaction.update(
        _firebaseFirestore.collection("services").doc(requestService.uuid),
        {
          "status": RequestServiceStatus.finished.toString(),
        },
      );
    });
  }
}

@Injectable(as: IMarkAsViewedRequestServiceService)
class FirebaseMarkAsViewedRequestServiceService
    implements IMarkAsViewedRequestServiceService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseMarkAsViewedRequestServiceService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;
  @override
  Future<void> markAsViewed(RequestService requestService, AppUser driver) {
    return _firebaseFirestore
        .collection("services")
        .doc(requestService.uuid)
        .update({
      "viewedBy": FieldValue.arrayUnion([driver.uuid])
    });
  }
}
