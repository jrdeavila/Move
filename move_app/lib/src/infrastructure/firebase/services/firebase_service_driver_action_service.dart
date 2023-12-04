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
}
